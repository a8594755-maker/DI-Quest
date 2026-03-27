import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var authManager: AuthManager
    @StateObject private var progressVM = QuestProgressViewModel()
    @State private var showSettings = false

    var body: some View {
        TabView {
            BranchSelectView()
                .tabItem {
                    Label("探索", systemImage: "map")
                }

            ProgressPlaceholderView()
                .tabItem {
                    Label("進度", systemImage: "chart.bar")
                }

            NPCPlaceholderView()
                .tabItem {
                    Label("小迪", systemImage: "bubble.left.and.bubble.right")
                }

            SocialPlaceholderView()
                .tabItem {
                    Label("社群", systemImage: "person.2")
                }

            ReviewPlaceholderView()
                .tabItem {
                    Label("複習", systemImage: "arrow.counterclockwise")
                }
        }
        .environmentObject(progressVM)
        .tint(DIQuestTheme.accent)
        .sheet(isPresented: $showSettings) {
            SettingsView()
        }
        .task {
            let dataService = SupabaseDataService(authManager: authManager)
            progressVM.configure(dataService: dataService)
            await progressVM.loadProgress()
            progressVM.updateStreak()
        }
    }
}

// MARK: - Placeholder Views (Phase 2/3)

private struct ProgressPlaceholderView: View {
    @EnvironmentObject var progressVM: QuestProgressViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                DIQuestTheme.background.ignoresSafeArea()
                VStack(spacing: 16) {
                    LevelBadgeView(levelInfo: progressVM.levelInfo)
                    Text("儀表板開發中...")
                        .foregroundStyle(DIQuestTheme.textSecondary)
                }
            }
            .navigationTitle("進度")
        }
    }
}

private struct NPCPlaceholderView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                DIQuestTheme.background.ignoresSafeArea()
                VStack(spacing: 12) {
                    Text("🤖")
                        .font(.system(size: 60))
                    Text("小迪 AI 助手")
                        .font(DIQuestTheme.headlineFont)
                        .foregroundStyle(.white)
                    Text("即將推出")
                        .foregroundStyle(DIQuestTheme.textSecondary)
                }
            }
            .navigationTitle("小迪")
        }
    }
}

private struct SocialPlaceholderView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                DIQuestTheme.background.ignoresSafeArea()
                VStack(spacing: 12) {
                    Image(systemName: "person.2.fill")
                        .font(.system(size: 48))
                        .foregroundStyle(DIQuestTheme.textTertiary)
                    Text("社群功能即將推出")
                        .foregroundStyle(DIQuestTheme.textSecondary)
                }
            }
            .navigationTitle("社群")
        }
    }
}

private struct ReviewPlaceholderView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                DIQuestTheme.background.ignoresSafeArea()
                VStack(spacing: 12) {
                    Image(systemName: "arrow.counterclockwise.circle")
                        .font(.system(size: 48))
                        .foregroundStyle(DIQuestTheme.textTertiary)
                    Text("複習系統即將推出")
                        .foregroundStyle(DIQuestTheme.textSecondary)
                }
            }
            .navigationTitle("複習")
        }
    }
}

// MARK: - Level Badge

struct LevelBadgeView: View {
    let levelInfo: LevelInfo

    var body: some View {
        VStack(spacing: 8) {
            Text("Lv.\(levelInfo.level)")
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .foregroundStyle(.white)

            Text(levelInfo.title)
                .font(DIQuestTheme.captionFont)
                .foregroundStyle(DIQuestTheme.accent)

            ProgressView(value: levelInfo.progress)
                .tint(DIQuestTheme.accent)
                .frame(width: 160)

            Text("\(levelInfo.currentXp) / \(levelInfo.xpForNext) XP")
                .font(.caption2)
                .foregroundStyle(DIQuestTheme.textTertiary)
        }
        .padding()
        .background(DIQuestTheme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: DIQuestTheme.cardCornerRadius))
        .overlay(
            RoundedRectangle(cornerRadius: DIQuestTheme.cardCornerRadius)
                .strokeBorder(DIQuestTheme.cardBorder)
        )
    }
}
