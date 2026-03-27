import SwiftUI

struct WorldCardView: View {
    let world: World
    let isExpanded: Bool
    let progress: Double
    let completedCount: Int
    let onTap: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            // Header
            Button(action: onTap) {
                HStack(spacing: 12) {
                    Text(world.emoji)
                        .font(.system(size: 32))

                    VStack(alignment: .leading, spacing: 4) {
                        Text(world.name)
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(.white)

                        Text(world.description)
                            .font(.caption)
                            .foregroundStyle(DIQuestTheme.textSecondary)
                            .lineLimit(2)
                    }

                    Spacer()

                    VStack(spacing: 4) {
                        Text("\(completedCount)/\(world.quests.count)")
                            .font(.caption.bold())
                            .foregroundStyle(DIQuestTheme.accent)

                        Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                            .font(.caption)
                            .foregroundStyle(DIQuestTheme.textTertiary)
                    }
                }
                .padding()
            }
            .buttonStyle(.plain)

            // Progress bar
            GeometryReader { geo in
                Rectangle()
                    .fill(DIQuestTheme.accent.opacity(0.3))
                    .frame(height: 3)
                    .overlay(alignment: .leading) {
                        Rectangle()
                            .fill(DIQuestTheme.accent)
                            .frame(width: geo.size.width * progress, height: 3)
                    }
            }
            .frame(height: 3)

            // Expanded quest list
            if isExpanded {
                VStack(spacing: 0) {
                    ForEach(world.quests) { quest in
                        QuestRowView(quest: quest, worldId: world.id)
                        if quest.id != world.quests.last?.id {
                            Divider()
                                .background(DIQuestTheme.cardBorder)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 12)
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .background(DIQuestTheme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: DIQuestTheme.cardCornerRadius))
        .overlay(
            RoundedRectangle(cornerRadius: DIQuestTheme.cardCornerRadius)
                .strokeBorder(DIQuestTheme.cardBorder)
        )
    }
}
