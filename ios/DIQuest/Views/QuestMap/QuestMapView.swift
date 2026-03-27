import SwiftUI

struct QuestMapView: View {
    let branch: Branch
    @EnvironmentObject var progressVM: QuestProgressViewModel
    @State private var expandedWorldId: Int?

    private var worlds: [World] {
        WorldDataRegistry.worlds(for: branch)
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
                            completedCount: progressVM.questCompletionCount(for: world)
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
        .navigationTitle(branch.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
