import SwiftUI

struct SearchView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var progressVM: QuestProgressViewModel
    @EnvironmentObject var authManager: AuthManager
    @ObservedObject private var lang = LanguageManager.shared

    @State private var query = ""
    @State private var searchIndex: [SearchItem] = []
    @FocusState private var isSearchFocused: Bool

    private var filteredResults: [SearchItemType: [SearchItem]] {
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else { return [:] }
        let q = query.lowercased()
        let matched = searchIndex.filter { item in
            item.title.lowercased().localizedCaseInsensitiveContains(q) ||
            item.subtitle.lowercased().localizedCaseInsensitiveContains(q)
        }
        var grouped: [SearchItemType: [SearchItem]] = [:]
        for item in matched.prefix(30) {
            grouped[item.type, default: []].append(item)
        }
        return grouped
    }

    var body: some View {
        NavigationStack {
            ZStack {
                DIQuestTheme.background.ignoresSafeArea()

                VStack(spacing: 0) {
                    // Search bar
                    HStack(spacing: 10) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 16))
                            .foregroundStyle(DIQuestTheme.textTertiary)

                        TextField(lang.string("search.placeholder"), text: $query)
                            .textFieldStyle(.plain)
                            .foregroundStyle(.white)
                            .focused($isSearchFocused)
                            .autocorrectionDisabled()

                        if !query.isEmpty {
                            Button { query = "" } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .font(.system(size: 16))
                                    .foregroundStyle(DIQuestTheme.textTertiary)
                            }
                        }
                    }
                    .padding(12)
                    .background(Color.white.opacity(0.08))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.horizontal)
                    .padding(.top, 8)

                    // Results
                    if query.trimmingCharacters(in: .whitespaces).isEmpty {
                        Spacer()
                        VStack(spacing: 12) {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 40))
                                .foregroundStyle(DIQuestTheme.textTertiary.opacity(0.5))
                            Text(lang.string("search.placeholder"))
                                .font(.system(size: 14))
                                .foregroundStyle(DIQuestTheme.textTertiary)
                        }
                        Spacer()
                    } else if filteredResults.isEmpty {
                        Spacer()
                        VStack(spacing: 12) {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 40))
                                .foregroundStyle(DIQuestTheme.textTertiary.opacity(0.5))
                            Text(lang.string("search.noResults"))
                                .font(.system(size: 14))
                                .foregroundStyle(DIQuestTheme.textTertiary)
                        }
                        Spacer()
                    } else {
                        resultsList
                    }
                }
            }
            .navigationTitle(lang.string("search.title"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(lang.string("action.done")) { dismiss() }
                        .foregroundStyle(DIQuestTheme.accent)
                }
            }
            .onAppear {
                searchIndex = buildSearchIndex()
                isSearchFocused = true
            }
        }
    }

    // MARK: - Results List

    private var resultsList: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 0) {
                ForEach(SearchItemType.allCases, id: \.self) { type in
                    if let items = filteredResults[type], !items.isEmpty {
                        sectionHeader(type)
                        ForEach(items) { item in
                            NavigationLink(destination: destination(for: item)) {
                                searchRow(item)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
            .padding(.top, 8)
        }
    }

    private func sectionHeader(_ type: SearchItemType) -> some View {
        HStack(spacing: 6) {
            Image(systemName: type.icon)
                .font(.system(size: 11))
            Text(type.label(lang))
                .font(.system(size: 12, weight: .semibold))
                .textCase(.uppercase)
            Text("(\(filteredResults[type]?.count ?? 0))")
                .font(.system(size: 11))
        }
        .foregroundStyle(DIQuestTheme.textTertiary)
        .padding(.horizontal)
        .padding(.top, 12)
        .padding(.bottom, 4)
    }

    private func searchRow(_ item: SearchItem) -> some View {
        HStack(spacing: 12) {
            Text(item.emoji)
                .font(.system(size: 22))
                .frame(width: 36)

            VStack(alignment: .leading, spacing: 2) {
                Text(item.title)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(.white)
                    .lineLimit(1)
                Text(item.subtitle)
                    .font(.system(size: 12))
                    .foregroundStyle(DIQuestTheme.textTertiary)
                    .lineLimit(1)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.system(size: 11))
                .foregroundStyle(DIQuestTheme.textTertiary)
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }

    // MARK: - Navigation

    @ViewBuilder
    private func destination(for item: SearchItem) -> some View {
        switch item.type {
        case .world:
            if let branch = BranchData.branchForWorld(item.worldId) {
                QuestMapView(branch: branch)
            }
        case .quest:
            if let world = WorldDataRegistry.world(id: item.worldId),
               let quest = world.quests.first(where: { $0.id == item.questId }) {
                QuestDetailView(quest: quest, worldId: item.worldId)
            }
        case .challenge:
            if let world = WorldDataRegistry.world(id: item.worldId),
               let quest = world.quests.first(where: { $0.id == item.questId }) {
                ChallengeFlowView(quest: quest, startIndex: item.challengeIndex ?? 0)
            }
        }
    }

    // MARK: - Build Index

    private func buildSearchIndex() -> [SearchItem] {
        var items: [SearchItem] = []
        for world in WorldDataRegistry.allWorlds {
            items.append(SearchItem(
                type: .world,
                emoji: world.emoji,
                title: world.name,
                subtitle: world.description,
                worldId: world.id,
                questId: nil,
                challengeIndex: nil
            ))
            for quest in world.quests {
                items.append(SearchItem(
                    type: .quest,
                    emoji: world.emoji,
                    title: quest.name,
                    subtitle: quest.description,
                    worldId: world.id,
                    questId: quest.id,
                    challengeIndex: nil
                ))
                for (ci, challenge) in quest.challenges.enumerated() {
                    items.append(SearchItem(
                        type: .challenge,
                        emoji: "🎯",
                        title: challenge.name,
                        subtitle: String(challenge.question.prefix(60)),
                        worldId: world.id,
                        questId: quest.id,
                        challengeIndex: ci
                    ))
                }
            }
        }
        return items
    }
}

// MARK: - Models

enum SearchItemType: CaseIterable {
    case world, quest, challenge

    var icon: String {
        switch self {
        case .world: return "map"
        case .quest: return "book"
        case .challenge: return "target"
        }
    }

    @MainActor func label(_ lang: LanguageManager) -> String {
        switch self {
        case .world: return lang.string("search.worlds")
        case .quest: return lang.string("search.quests")
        case .challenge: return lang.string("search.challenges")
        }
    }
}

struct SearchItem: Identifiable {
    let type: SearchItemType
    let emoji: String
    let title: String
    let subtitle: String
    let worldId: Int
    let questId: String?
    let challengeIndex: Int?

    var id: String { "\(type)-\(worldId)-\(questId ?? "")-\(challengeIndex ?? -1)" }
}
