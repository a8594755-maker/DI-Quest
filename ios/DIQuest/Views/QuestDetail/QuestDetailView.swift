import SwiftUI

struct QuestDetailView: View {
    let quest: Quest
    let worldId: Int
    @EnvironmentObject var progressVM: QuestProgressViewModel

    private var completedChallenges: Int {
        quest.challenges.filter {
            progressVM.isChallengeCompleted(questId: quest.id, challengeId: $0.id)
        }.count
    }

    var body: some View {
        ZStack {
            DIQuestTheme.background.ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {
                    // Quest info card
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
                            StatBadge(icon: "bolt.fill", value: "\(quest.xp)", label: "XP")
                            StatBadge(icon: "list.bullet", value: "\(quest.challenges.count)", label: "挑戰")
                            StatBadge(
                                icon: "checkmark.circle",
                                value: "\(completedChallenges)/\(quest.challenges.count)",
                                label: "完成"
                            )
                        }

                        // Progress bar
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

                    // Challenge list
                    VStack(spacing: 8) {
                        ForEach(quest.challenges) { challenge in
                            ChallengeRowView(
                                challenge: challenge,
                                questId: quest.id,
                                isCompleted: progressVM.isChallengeCompleted(
                                    questId: quest.id, challengeId: challenge.id
                                )
                            )
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("任務詳情")
        .navigationBarTitleDisplayMode(.inline)
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

private struct ChallengeRowView: View {
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
        case .multipleChoice: return "選擇題"
        case .openEnded: return "開放題"
        case .code: return "程式題"
        }
    }
}
