import SwiftUI

struct QuestRowView: View {
    let quest: Quest
    let worldId: Int
    @EnvironmentObject var progressVM: QuestProgressViewModel

    private var isCompleted: Bool {
        progressVM.isQuestCompleted(quest.id)
    }

    var body: some View {
        NavigationLink(destination: QuestDetailView(quest: quest, worldId: worldId)) {
            HStack(spacing: 12) {
                // Status icon
                ZStack {
                    Circle()
                        .fill(isCompleted ? DIQuestTheme.accent.opacity(0.2) : Color.white.opacity(0.05))
                        .frame(width: 36, height: 36)

                    if isCompleted {
                        Image(systemName: "checkmark")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundStyle(DIQuestTheme.accent)
                    } else if quest.isBoss {
                        Image(systemName: "star.fill")
                            .font(.system(size: 14))
                            .foregroundStyle(.yellow)
                    } else {
                        Text("\(quest.challenges.count)")
                            .font(.caption2.bold())
                            .foregroundStyle(DIQuestTheme.textTertiary)
                    }
                }

                VStack(alignment: .leading, spacing: 2) {
                    Text(quest.name)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(isCompleted ? DIQuestTheme.textSecondary : .white)
                        .lineLimit(1)

                    HStack(spacing: 8) {
                        Label("\(quest.xp) XP", systemImage: "bolt.fill")
                            .font(.caption2)
                            .foregroundStyle(DIQuestTheme.textTertiary)

                        if quest.isBoss {
                            Text("BOSS")
                                .font(.system(size: 9, weight: .bold))
                                .foregroundStyle(.yellow)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 2)
                                .background(.yellow.opacity(0.15))
                                .clipShape(Capsule())
                        }
                    }
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundStyle(DIQuestTheme.textTertiary)
            }
            .padding(.vertical, 10)
        }
        .buttonStyle(.plain)
    }
}
