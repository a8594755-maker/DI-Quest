import SwiftUI

struct QuestDetailView: View {
    let quest: Quest
    let worldId: Int
    @EnvironmentObject var progressVM: QuestProgressViewModel
    @Environment(\.dismiss) private var dismiss

    @State private var currentChallengeIndex: Int?
    @State private var showQuestComplete = false

    private var completedChallenges: Int {
        quest.challenges.filter {
            progressVM.isChallengeCompleted(questId: quest.id, challengeId: $0.id)
        }.count
    }

    private var allCompleted: Bool {
        completedChallenges == quest.challenges.count && !quest.challenges.isEmpty
    }

    private var firstIncompleteChallengeIndex: Int? {
        quest.challenges.firstIndex { !progressVM.isChallengeCompleted(questId: quest.id, challengeId: $0.id) }
    }

    var body: some View {
        ZStack {
            DIQuestTheme.background.ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {
                    // Quest info card
                    questInfoCard

                    // Start / Continue button
                    if !allCompleted {
                        startButton
                    }

                    // Challenge list
                    VStack(spacing: 8) {
                        ForEach(Array(quest.challenges.enumerated()), id: \.element.id) { index, challenge in
                            NavigationLink(
                                destination: challengePlayDestination(for: index)
                            ) {
                                ChallengeRowContent(
                                    challenge: challenge,
                                    questId: quest.id,
                                    isCompleted: progressVM.isChallengeCompleted(
                                        questId: quest.id, challengeId: challenge.id
                                    )
                                )
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding()
            }

            // Quest complete overlay
            if showQuestComplete {
                QuestCompleteView(
                    quest: quest,
                    earnedXp: quest.xp
                ) {
                    showQuestComplete = false
                    dismiss()
                }
                .transition(.opacity)
            }
        }
        .navigationTitle(LanguageManager.shared.string("quest.detail"))
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: completedChallenges) { newCount in
            if newCount == quest.challenges.count && !quest.challenges.isEmpty {
                // All challenges done — mark quest complete
                progressVM.completeQuest(questId: quest.id, score: 100, bonusXp: quest.xp)
                withAnimation(.easeInOut(duration: 0.3)) {
                    showQuestComplete = true
                }
            }
        }
    }

    // MARK: - Quest Info Card

    private var questInfoCard: some View {
        VStack(spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(quest.name)
                        .font(DIQuestTheme.headlineFont)
                        .foregroundStyle(.white)

                    Text(quest.description)
                        .font(.subheadline)
                        .foregroundStyle(DIQuestTheme.textSecondary)
                }
                Spacer()
            }

            HStack(spacing: 16) {
                StatBadge(icon: "bolt.fill", value: "\(quest.xp)", label: LanguageManager.shared.string("quest.xp"))
                StatBadge(icon: "list.bullet", value: "\(quest.challenges.count)", label: LanguageManager.shared.string("quest.challenges"))
                StatBadge(
                    icon: "checkmark.circle",
                    value: "\(completedChallenges)/\(quest.challenges.count)",
                    label: LanguageManager.shared.string("quest.completed")
                )
            }

            let questProgress = quest.challenges.isEmpty ? 0 :
                Double(completedChallenges) / Double(quest.challenges.count)
            ProgressView(value: questProgress)
                .tint(DIQuestTheme.accent)
        }
        .padding()
        .background(DIQuestTheme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: DIQuestTheme.cardCornerRadius))
        .overlay(
            RoundedRectangle(cornerRadius: DIQuestTheme.cardCornerRadius)
                .strokeBorder(DIQuestTheme.cardBorder)
        )
    }

    // MARK: - Start Button

    private var startButton: some View {
        NavigationLink(
            destination: challengePlayDestination(for: firstIncompleteChallengeIndex ?? 0)
        ) {
            HStack {
                Image(systemName: completedChallenges > 0 ? "arrow.right.circle.fill" : "play.circle.fill")
                Text(completedChallenges > 0 ? LanguageManager.shared.string("action.continueChallenge") : LanguageManager.shared.string("action.startChallenge"))
                    .fontWeight(.bold)
            }
            .font(.system(size: 17))
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(DIQuestTheme.accentGradient)
            .clipShape(RoundedRectangle(cornerRadius: 14))
        }
    }

    // MARK: - Challenge Destination

    @ViewBuilder
    private func challengePlayDestination(for index: Int) -> some View {
        ChallengeFlowView(
            quest: quest,
            startIndex: index
        )
    }
}

// MARK: - Challenge Flow (sequential navigation)

struct ChallengeFlowView: View {
    let quest: Quest
    let startIndex: Int
    @EnvironmentObject var progressVM: QuestProgressViewModel
    @Environment(\.dismiss) private var dismiss

    @State private var currentIndex: Int

    init(quest: Quest, startIndex: Int) {
        self.quest = quest
        self.startIndex = startIndex
        self._currentIndex = State(initialValue: startIndex)
    }

    var body: some View {
        if currentIndex < quest.challenges.count {
            ChallengePlayView(
                challenge: quest.challenges[currentIndex],
                questId: quest.id,
                questXp: quest.xp,
                allChallenges: quest.challenges,
                onNext: {
                    if currentIndex < quest.challenges.count - 1 {
                        currentIndex += 1
                    } else {
                        dismiss()
                    }
                }
            )
            .id(currentIndex) // Force recreation when index changes
        }
    }
}

// MARK: - Stat Badge

private struct StatBadge: View {
    let icon: String
    let value: String
    let label: String

    var body: some View {
        VStack(spacing: 4) {
            HStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.caption2)
                Text(value)
                    .font(.system(size: 16, weight: .bold, design: .rounded))
            }
            .foregroundStyle(.white)

            Text(label)
                .font(.caption2)
                .foregroundStyle(DIQuestTheme.textTertiary)
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Challenge Row

private struct ChallengeRowContent: View {
    let challenge: Challenge
    let questId: String
    let isCompleted: Bool

    private var typeIcon: String {
        switch challenge.type {
        case .multipleChoice: return "list.bullet.circle"
        case .openEnded: return "text.bubble"
        case .code: return "chevron.left.forwardslash.chevron.right"
        }
    }

    private var difficultyColor: Color {
        switch challenge.difficulty {
        case .easy: return .green
        case .medium: return .orange
        case .hard: return .red
        }
    }

    var body: some View {
        HStack(spacing: 12) {
            // Status
            ZStack {
                Circle()
                    .fill(isCompleted ? DIQuestTheme.accent.opacity(0.2) : Color.white.opacity(0.05))
                    .frame(width: 40, height: 40)

                if isCompleted {
                    Image(systemName: "checkmark")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(DIQuestTheme.accent)
                } else {
                    Image(systemName: typeIcon)
                        .font(.system(size: 16))
                        .foregroundStyle(DIQuestTheme.textTertiary)
                }
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(challenge.name)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(isCompleted ? DIQuestTheme.textSecondary : .white)

                HStack(spacing: 8) {
                    Text(challenge.difficulty.rawValue.capitalized)
                        .font(.system(size: 10, weight: .bold))
                        .foregroundStyle(difficultyColor)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(difficultyColor.opacity(0.15))
                        .clipShape(Capsule())

                    Text(challengeTypeLabel)
                        .font(.caption2)
                        .foregroundStyle(DIQuestTheme.textTertiary)
                }
            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundStyle(DIQuestTheme.textTertiary)
        }
        .padding(12)
        .background(DIQuestTheme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: DIQuestTheme.smallCornerRadius))
        .overlay(
            RoundedRectangle(cornerRadius: DIQuestTheme.smallCornerRadius)
                .strokeBorder(DIQuestTheme.cardBorder)
        )
    }

    private var challengeTypeLabel: String {
        switch challenge.type {
        case .multipleChoice: return LanguageManager.shared.string("challenge.multipleChoice")
        case .openEnded: return LanguageManager.shared.string("challenge.openEnded")
        case .code: return LanguageManager.shared.string("challenge.code")
        }
    }
}
