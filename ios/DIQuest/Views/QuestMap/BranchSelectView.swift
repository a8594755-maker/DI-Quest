import SwiftUI

struct BranchSelectView: View {
    @EnvironmentObject var progressVM: QuestProgressViewModel
    @State private var showSettings = false
    @State private var showSearch = false

    private let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                DIQuestTheme.background.ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 20) {
                        // Level header
                        LevelBadgeView(levelInfo: progressVM.levelInfo)
                            .padding(.top, 8)

                        // Branch grid
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach(BranchData.allBranches) { branch in
                                NavigationLink(destination: QuestMapView(branch: branch)) {
                                    BranchCardView(branch: branch)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom, 32)
                }
            }
            .navigationTitle("DI Quest")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showSearch = true
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.white)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showSettings = true
                    } label: {
                        Image(systemName: "gearshape")
                            .foregroundStyle(.white)
                    }
                }
            }
            .sheet(isPresented: $showSettings) {
                SettingsView()
            }
            .fullScreenCover(isPresented: $showSearch) {
                SearchView()
            }
        }
    }
}

// MARK: - Branch Card

struct BranchCardView: View {
    let branch: Branch

    var body: some View {
        VStack(spacing: 12) {
            Text(branch.emoji)
                .font(.system(size: 40))

            Text(branch.localizedName)
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .lineLimit(2)

            Text("\(branch.worldIds.count) \(LanguageManager.shared.string("branch.worlds"))")
                .font(.caption)
                .foregroundStyle(DIQuestTheme.textTertiary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .padding(.horizontal, 8)
        .background(
            RoundedRectangle(cornerRadius: DIQuestTheme.cardCornerRadius)
                .fill(DIQuestTheme.cardBackground)
        )
        .overlay(
            RoundedRectangle(cornerRadius: DIQuestTheme.cardCornerRadius)
                .strokeBorder(
                    DIQuestTheme.branchGradient(for: branch.id),
                    lineWidth: 1
                )
        )
    }
}
