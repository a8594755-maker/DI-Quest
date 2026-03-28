import SwiftUI

struct WorldCardView: View {
    let world: World
    let isExpanded: Bool
    let progress: Double
    let completedCount: Int
    let isLocked: Bool
    let onTap: () -> Void

    @EnvironmentObject var progressVM: QuestProgressViewModel
    @EnvironmentObject var authManager: AuthManager

    var body: some View {
        VStack(spacing: 0) {
            // Header
            Button(action: onTap) {
                HStack(spacing: 12) {
                    ZStack {
                        Text(world.emoji)
                            .font(.system(size: 32))
                        if isLocked {
                            Image(systemName: "lock.fill")
                                .font(.system(size: 14))
                                .foregroundStyle(.white)
                                .padding(4)
                                .background(Color.black.opacity(0.6))
                                .clipShape(Circle())
                                .offset(x: 12, y: 12)
                        }
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        Text(world.name)
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(isLocked ? DIQuestTheme.textTertiary : .white)

                        Text(world.description)
                            .font(.caption)
                            .foregroundStyle(isLocked ? DIQuestTheme.textTertiary.opacity(0.6) : DIQuestTheme.textSecondary)
                            .lineLimit(2)
                    }

                    Spacer()

                    VStack(spacing: 4) {
                        if isLocked {
                            Image(systemName: "lock.fill")
                                .font(.caption)
                                .foregroundStyle(DIQuestTheme.textTertiary)
                        } else {
                            Text("\(completedCount)/\(world.quests.count)")
                                .font(.caption.bold())
                                .foregroundStyle(DIQuestTheme.accent)
                        }

                        Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                            .font(.caption)
                            .foregroundStyle(DIQuestTheme.textTertiary)
                    }
                }
                .padding()
            }
            .buttonStyle(.plain)

            // Progress bar
            if !isLocked {
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
            }

            // Expanded quest list
            if isExpanded && !isLocked {
                VStack(spacing: 0) {
                    // Read Lesson button
                    if WorldDataRegistry.lesson(for: world.id) != nil {
                        NavigationLink(
                            destination: LessonView(worldId: world.id, worldName: world.name)
                        ) {
                            HStack(spacing: 8) {
                                Image(systemName: "book.fill")
                                    .font(.system(size: 14))
                                Text(LanguageManager.shared.string("action.readLesson"))
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .foregroundStyle(DIQuestTheme.accent)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(DIQuestTheme.accent.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .strokeBorder(DIQuestTheme.accent.opacity(0.3), lineWidth: 1)
                            )
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                    }

                    ForEach(world.quests) { quest in
                        let questLocked = !progressVM.isQuestUnlocked(quest.id, in: world, isPremium: authManager.isPremium)
                        QuestRowView(quest: quest, worldId: world.id, isLocked: questLocked)
                        if quest.id != world.quests.last?.id {
                            Divider()
                                .background(DIQuestTheme.cardBorder)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 12)
                .transition(.opacity.combined(with: .move(edge: .top)))
            } else if isExpanded && isLocked {
                // Locked message
                VStack(spacing: 8) {
                    Image(systemName: "lock.fill")
                        .font(.system(size: 20))
                        .foregroundStyle(DIQuestTheme.textTertiary)
                    Text(LanguageManager.shared.isEnglish
                        ? "Complete the previous world to unlock"
                        : "完成前一個世界即可解鎖")
                        .font(.system(size: 13))
                        .foregroundStyle(DIQuestTheme.textTertiary)
                        .multilineTextAlignment(.center)
                }
                .padding(.vertical, 20)
                .transition(.opacity)
            }
        }
        .background(DIQuestTheme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: DIQuestTheme.cardCornerRadius))
        .overlay(
            RoundedRectangle(cornerRadius: DIQuestTheme.cardCornerRadius)
                .strokeBorder(isLocked ? Color.white.opacity(0.04) : DIQuestTheme.cardBorder)
        )
        .opacity(isLocked ? 0.6 : 1.0)
    }
}
