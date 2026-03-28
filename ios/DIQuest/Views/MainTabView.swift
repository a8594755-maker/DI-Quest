import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var authManager: AuthManager
    @StateObject private var progressVM = QuestProgressViewModel()
    @ObservedObject private var lang = LanguageManager.shared

    @State private var showAutoCheckin = false

    var body: some View {
        TabView {
            BranchSelectView()
                .tabItem {
                    Label(lang.string("tab.explore"), systemImage: "map")
                }

            ProgressDashboardView()
                .tabItem {
                    Label(lang.string("tab.progress"), systemImage: "chart.bar")
                }

            ChatView()
                .tabItem {
                    Label(lang.string("tab.chat"), systemImage: "bubble.left.and.bubble.right")
                }

            FriendsView()
                .tabItem {
                    Label(lang.string("tab.social"), systemImage: "person.2")
                }

            ReviewQueueView()
                .tabItem {
                    Label(lang.string("tab.review"), systemImage: "arrow.counterclockwise")
                }
                .badge(progressVM.dueReviewCount > 0 ? progressVM.dueReviewCount : 0)
        }
        .environmentObject(progressVM)
        .tint(DIQuestTheme.accent)
        .task {
            let dataService = SupabaseDataService(authManager: authManager)
            progressVM.configure(dataService: dataService)
            await progressVM.loadProgress()
            progressVM.updateStreak()
            // Auto-show daily check-in if not checked in today (matches web behavior)
            if !progressVM.progress.checkedInToday {
                showAutoCheckin = true
            }
        }
        .sheet(isPresented: $showAutoCheckin) {
            CheckinModalView(progressVM: progressVM)
        }
    }
}

// MARK: - Progress Dashboard

private struct ProgressDashboardView: View {
    @EnvironmentObject var progressVM: QuestProgressViewModel
    @EnvironmentObject var authManager: AuthManager
    @ObservedObject private var lang = LanguageManager.shared
    @State private var showCheckinModal = false

    private var totalCompletedQuests: Int {
        progressVM.progress.questStatus.values.filter { $0.completed }.count
    }

    private var totalCompletedChallenges: Int {
        progressVM.progress.challengeStatus.values.filter { $0.completed }.count
    }

    private var achievements: [Achievement] {
        AchievementDefinitions.all(progress: progressVM.progress)
    }

    private var unlockedCount: Int {
        achievements.filter(\.isUnlocked).count
    }

    var body: some View {
        NavigationStack {
            ZStack {
                DIQuestTheme.background.ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 20) {
                        // Premium badge
                        if authManager.isPremium {
                            HStack(spacing: 8) {
                                Image(systemName: "crown.fill")
                                    .foregroundStyle(.yellow)
                                Text("Premium")
                                    .font(.system(size: 14, weight: .bold))
                                    .foregroundStyle(.yellow)
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                            .background(Color.yellow.opacity(0.1))
                            .clipShape(Capsule())
                            .overlay(Capsule().strokeBorder(Color.yellow.opacity(0.3)))
                        }

                        // Level card
                        LevelBadgeView(levelInfo: progressVM.levelInfo)

                        // Stats grid
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                            StatCard(
                                icon: "flame.fill",
                                iconColor: .orange,
                                value: "\(progressVM.progress.streakDays)",
                                label: lang.string("progress.streak")
                            )
                            StatCard(
                                icon: "trophy.fill",
                                iconColor: .yellow,
                                value: "\(progressVM.progress.longestStreak)",
                                label: lang.string("progress.longestStreak")
                            )
                            StatCard(
                                icon: "flag.fill",
                                iconColor: DIQuestTheme.accent,
                                value: "\(totalCompletedQuests)",
                                label: lang.string("progress.questsDone")
                            )
                            StatCard(
                                icon: "checkmark.circle.fill",
                                iconColor: .green,
                                value: "\(totalCompletedChallenges)",
                                label: lang.string("progress.challengesDone")
                            )
                        }
                        .padding(.horizontal)

                        // Daily check-in
                        if !progressVM.progress.checkedInToday {
                            Button {
                                showCheckinModal = true
                            } label: {
                                HStack {
                                    Image(systemName: "gift.fill")
                                        .foregroundStyle(.yellow)
                                    Text(lang.string("progress.dailyCheckin"))
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundStyle(.white)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 14)
                                .background(DIQuestTheme.accentGradient)
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                            }
                            .padding(.horizontal)
                        } else {
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundStyle(.green)
                                Text(lang.string("progress.checkedIn"))
                                    .foregroundStyle(DIQuestTheme.textSecondary)
                            }
                            .font(.system(size: 14, weight: .medium))
                        }

                        // Branch Progress
                        branchProgressSection

                        // Achievements
                        achievementsSection

                        // Streak Calendar
                        StreakCalendarView(dailyStats: progressVM.progress.analytics.dailyStats)
                            .padding(.horizontal)

                        // Recent Activity
                        recentActivitySection

                        // Analytics Charts
                        AnalyticsChartsSection(
                            dailyStats: progressVM.progress.analytics.dailyStats,
                            challengeTimings: progressVM.progress.analytics.challengeTimings
                        )
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle(lang.string("progress.title"))
            .sheet(isPresented: $showCheckinModal) {
                CheckinModalView(progressVM: progressVM)
            }
        }
    }

    // MARK: - Branch Progress

    private var branchProgressSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(lang.string("progress.branchProgress"))
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(.white)
                .padding(.horizontal)

            ForEach(BranchData.allBranches, id: \.id) { branch in
                let worlds = WorldDataRegistry.worlds(for: branch)
                let completedQuests = worlds.flatMap(\.quests).filter { progressVM.isQuestCompleted($0.id) }.count
                let totalQuests = worlds.flatMap(\.quests).count
                let progress = totalQuests > 0 ? Double(completedQuests) / Double(totalQuests) : 0

                HStack(spacing: 12) {
                    Text(branch.emoji)
                        .font(.system(size: 20))
                        .frame(width: 32)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(branch.localizedName)
                            .font(.system(size: 14, weight: .medium))
                            .foregroundStyle(.white)
                            .lineLimit(1)
                        ProgressView(value: progress)
                            .tint(DIQuestTheme.accent)
                    }

                    Text("\(completedQuests)/\(totalQuests)")
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        .foregroundStyle(DIQuestTheme.textTertiary)
                        .frame(width: 44, alignment: .trailing)
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical, 12)
        .background(DIQuestTheme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: DIQuestTheme.cardCornerRadius))
        .overlay(
            RoundedRectangle(cornerRadius: DIQuestTheme.cardCornerRadius)
                .strokeBorder(DIQuestTheme.cardBorder)
        )
        .padding(.horizontal)
    }

    // MARK: - Achievements

    private var achievementsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(lang.string("progress.achievements"))
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.white)
                Spacer()
                Text("\(unlockedCount)/\(achievements.count)")
                    .font(.system(size: 13, weight: .bold, design: .rounded))
                    .foregroundStyle(DIQuestTheme.accent)
            }
            .padding(.horizontal)

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                ForEach(achievements) { ach in
                    VStack(spacing: 6) {
                        Image(systemName: ach.icon)
                            .font(.system(size: 22))
                            .foregroundStyle(ach.isUnlocked ? .yellow : DIQuestTheme.textTertiary)
                            .frame(width: 44, height: 44)
                            .background(ach.isUnlocked ? Color.yellow.opacity(0.15) : Color.white.opacity(0.04))
                            .clipShape(Circle())

                        Text(ach.localizedName(lang))
                            .font(.system(size: 10, weight: .medium))
                            .foregroundStyle(ach.isUnlocked ? .white : DIQuestTheme.textTertiary)
                            .lineLimit(1)
                    }
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical, 12)
        .background(DIQuestTheme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: DIQuestTheme.cardCornerRadius))
        .overlay(
            RoundedRectangle(cornerRadius: DIQuestTheme.cardCornerRadius)
                .strokeBorder(DIQuestTheme.cardBorder)
        )
        .padding(.horizontal)
    }

    // MARK: - Recent Activity

    private var recentActivitySection: some View {
        let stats = progressVM.progress.analytics.dailyStats
        let sortedDays = stats.keys.sorted().suffix(7)

        return VStack(alignment: .leading, spacing: 12) {
            Text(lang.string("progress.last7Days"))
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(.white)
                .padding(.horizontal)

            if sortedDays.isEmpty {
                Text(lang.string("progress.noActivity"))
                    .font(.system(size: 13))
                    .foregroundStyle(DIQuestTheme.textTertiary)
                    .padding(.horizontal)
            } else {
                // Simple bar chart
                HStack(alignment: .bottom, spacing: 8) {
                    ForEach(Array(sortedDays), id: \.self) { day in
                        let dayStats = stats[day]!
                        let maxXp = max(1, stats.values.map(\.xpEarned).max() ?? 1)
                        let height = max(4, CGFloat(dayStats.xpEarned) / CGFloat(maxXp) * 60)

                        VStack(spacing: 4) {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(DIQuestTheme.accent)
                                .frame(width: 28, height: height)

                            Text(String(day.suffix(2)))
                                .font(.system(size: 10))
                                .foregroundStyle(DIQuestTheme.textTertiary)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
            }
        }
        .padding(.vertical, 12)
        .background(DIQuestTheme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: DIQuestTheme.cardCornerRadius))
        .overlay(
            RoundedRectangle(cornerRadius: DIQuestTheme.cardCornerRadius)
                .strokeBorder(DIQuestTheme.cardBorder)
        )
        .padding(.horizontal)
    }
}

// MARK: - Stat Card

private struct StatCard: View {
    let icon: String
    let iconColor: Color
    let value: String
    let label: String

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundStyle(iconColor)

            Text(value)
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .foregroundStyle(.white)

            Text(label)
                .font(.system(size: 12, weight: .medium))
                .foregroundStyle(DIQuestTheme.textTertiary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(DIQuestTheme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: DIQuestTheme.cardCornerRadius))
        .overlay(
            RoundedRectangle(cornerRadius: DIQuestTheme.cardCornerRadius)
                .strokeBorder(DIQuestTheme.cardBorder)
        )
    }
}

// MARK: - Check-in Modal

struct CheckinModalView: View {
    @ObservedObject var progressVM: QuestProgressViewModel
    @ObservedObject private var lang = LanguageManager.shared
    @Environment(\.dismiss) private var dismiss
    @State private var claimed = false
    @State private var animateReward = false

    private var bonusXp: Int {
        QuestProgressViewModel.checkinBonusXp(streakDays: progressVM.progress.streakDays)
    }

    // Daily XP goal (matches web dailyGoal = 50)
    private let dailyGoal = 50
    private var todayXpEarned: Int {
        let today = {
            let f = DateFormatter()
            f.dateFormat = "yyyy-MM-dd"
            return f.string(from: Date())
        }()
        return progressVM.progress.analytics.dailyStats[today]?.xpEarned ?? 0
    }

    var body: some View {
        ZStack {
            DIQuestTheme.background.ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {
                    Spacer().frame(height: 20)

                    // Gift icon with animation
                    Image(systemName: claimed ? "checkmark.circle.fill" : "flame.fill")
                        .font(.system(size: 64))
                        .foregroundStyle(claimed ? .green : .orange)
                        .scaleEffect(animateReward ? 1.2 : 1.0)
                        .animation(.spring(response: 0.4, dampingFraction: 0.5), value: animateReward)

                    Text(claimed
                        ? lang.string("progress.checkinComplete")
                        : lang.string("progress.dailyCheckinTitle"))
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(.white)

                    if claimed {
                        Text("+\(bonusXp) XP")
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .foregroundStyle(DIQuestTheme.accent)
                            .transition(.scale.combined(with: .opacity))
                    } else {
                        Text(lang.string("progress.claimReward"))
                            .font(.system(size: 16))
                            .foregroundStyle(DIQuestTheme.textSecondary)
                    }

                    // Streak info
                    HStack(spacing: 24) {
                        VStack(spacing: 4) {
                            Text("\(progressVM.progress.streakDays)")
                                .font(.system(size: 32, weight: .bold, design: .rounded))
                                .foregroundStyle(.orange)
                            Text(lang.string("progress.dayStreak"))
                                .font(.system(size: 12))
                                .foregroundStyle(DIQuestTheme.textTertiary)
                        }
                        VStack(spacing: 4) {
                            Text("\(progressVM.progress.longestStreak)")
                                .font(.system(size: 32, weight: .bold, design: .rounded))
                                .foregroundStyle(.yellow)
                            Text(lang.string("progress.bestStreak"))
                                .font(.system(size: 12))
                                .foregroundStyle(DIQuestTheme.textTertiary)
                        }
                    }

                    // Daily XP Goal (matches web DailyCheckinModal)
                    VStack(spacing: 8) {
                        HStack {
                            Text(lang.string("progress.dailyGoal"))
                                .font(.system(size: 14))
                                .foregroundStyle(DIQuestTheme.textSecondary)
                            Spacer()
                            Text("\(todayXpEarned)/\(dailyGoal) XP")
                                .font(.system(size: 14, weight: .bold, design: .rounded))
                                .foregroundStyle(DIQuestTheme.accent)
                        }
                        ProgressView(value: min(1.0, Double(todayXpEarned) / Double(dailyGoal)))
                            .tint(DIQuestTheme.accent)
                        Text(todayXpEarned >= dailyGoal
                            ? lang.string("progress.dailyGoalDone")
                            : lang.string("progress.dailyGoalRemaining"))
                            .font(.system(size: 12))
                            .foregroundStyle(DIQuestTheme.textTertiary)
                    }
                    .padding()
                    .background(DIQuestTheme.cardBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.horizontal, 24)

                    // Check-in button or done
                    if !claimed {
                        Button {
                            progressVM.dailyCheckin(bonusXp: bonusXp)
                            HapticService.trigger("success")
                            withAnimation(.spring()) {
                                claimed = true
                                animateReward = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                animateReward = false
                            }
                        } label: {
                            Text("\(lang.string("progress.claimXp")) (+\(bonusXp) XP)")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(DIQuestTheme.accentGradient)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                        }
                        .padding(.horizontal, 32)
                    } else {
                        Button {
                            dismiss()
                        } label: {
                            Text(lang.string("action.done"))
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(DIQuestTheme.accentGradient)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                        }
                        .padding(.horizontal, 32)
                    }

                    // Streak freeze info (matches web DailyCheckinModal)
                    VStack(spacing: 4) {
                        Divider().overlay(DIQuestTheme.cardBorder)
                        let freezes = progressVM.progress.streakFreezes
                        HStack(spacing: 6) {
                            Image(systemName: "snowflake")
                                .font(.system(size: 12))
                                .foregroundStyle(freezes > 0 ? .cyan : DIQuestTheme.textTertiary)
                            Text(freezes > 0
                                ? lang.string("progress.streakFreezeAvailable")
                                : lang.string("progress.streakFreezeNone"))
                                .font(.system(size: 12))
                                .foregroundStyle(DIQuestTheme.textTertiary)
                        }
                    }
                    .padding(.horizontal, 24)

                    Spacer().frame(height: 20)
                }
            }
        }
        .presentationDetents([.medium, .large])
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
