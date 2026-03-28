import SwiftUI

struct QuestMapView: View {
    let branch: Branch
    @EnvironmentObject var progressVM: QuestProgressViewModel
    @EnvironmentObject var authManager: AuthManager
    @ObservedObject private var lang = LanguageManager.shared
    @State private var expandedWorldId: Int?

    private var worlds: [World] {
        let idSet = Set(branch.worldIds)
        return WorldDataRegistry.worlds(language: lang.currentLanguage)
            .filter { idSet.contains($0.id) }
    }

    var body: some View {
        ZStack {
            DIQuestTheme.background.ignoresSafeArea()

            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(worlds) { world in
                        WorldCardView(
                            world: world,
                            isExpanded: expandedWorldId == world.id,
                            progress: progressVM.worldProgress(for: world),
                            completedCount: progressVM.questCompletionCount(for: world),
                            isLocked: !progressVM.isWorldUnlocked(world.id, isPremium: authManager.isPremium)
                        ) {
                            withAnimation(.spring(response: 0.35, dampingFraction: 0.85)) {
                                expandedWorldId = expandedWorldId == world.id ? nil : world.id
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle(branch.localizedName)
        .navigationBarTitleDisplayMode(.inline)
    }
}
