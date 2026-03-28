import SwiftUI

struct ReviewQueueView: View {
    @EnvironmentObject var progressVM: QuestProgressViewModel
    @ObservedObject private var lang = LanguageManager.shared
    @State private var dueItems: [ReviewItem] = []
    @State private var isLoaded = false

    var body: some View {
        NavigationStack {
            ZStack {
                DIQuestTheme.background.ignoresSafeArea()

                if !isLoaded {
                    ProgressView()
                        .tint(DIQuestTheme.accent)
                } else if dueItems.isEmpty {
                    emptyState
                } else {
                    reviewList
                }
            }
            .navigationTitle(lang.string("tab.review"))
            .onAppear { loadDueItems() }
        }
    }

    // MARK: - Empty State

    private var emptyState: some View {
        VStack(spacing: 16) {
            Image(systemName: "checkmark.seal.fill")
                .font(.system(size: 56))
                .foregroundStyle(DIQuestTheme.accent)

            Text(lang.string("review.allCaughtUp"))
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(.white)

            Text(lang.string("review.noDue"))
                .font(.system(size: 14))
                .foregroundStyle(DIQuestTheme.textSecondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)

            // Stats
            HStack(spacing: 24) {
                ReviewStatBubble(
                    icon: "brain.head.profile",
                    value: "\(progressVM.progress.reviewSchedule.count)",
                    label: lang.string("review.inSystem")
                )
                ReviewStatBubble(
                    icon: "calendar.badge.clock",
                    value: nextReviewText(),
                    label: lang.string("review.nextReview")
                )
            }
            .padding(.top, 12)
        }
    }

    // MARK: - Review List

    private var reviewList: some View {
        ScrollView {
            VStack(spacing: 12) {
                // Header
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("\(dueItems.count) \(lang.string("review.dueForReview"))")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.white)
                        Text(lang.string("review.tapToReview"))
                            .font(.caption)
                            .foregroundStyle(DIQuestTheme.textTertiary)
                    }
                    Spacer()
                    Image(systemName: "brain.head.profile")
                        .font(.system(size: 24))
                        .foregroundStyle(DIQuestTheme.accent)
                }
                .padding()
                .background(DIQuestTheme.cardBackground)
                .clipShape(RoundedRectangle(cornerRadius: 14))

                // Items
                ForEach(dueItems) { item in
                    NavigationLink {
                        if let challenge = item.challenge, let quest = item.quest {
                            ChallengePlayView(
                                challenge: challenge,
                                questId: quest.id,
                                questXp: quest.xp,
                                allChallenges: [challenge],
                                onNext: nil,
                                isReviewMode: true
                            )
                        }
                    } label: {
                        ReviewItemRow(item: item)
                    }
                }
            }
            .padding()
        }
    }

    // MARK: - Data

    private func loadDueItems() {
        let today = dateString(Date())
        let dueReviews = SpacedRepetition.getDueReviews(from: progressVM.progress.reviewSchedule, today: today)
        let worlds = WorldDataRegistry.allWorlds

        dueItems = dueReviews.compactMap { review in
            // Find the challenge in world data
            for world in worlds {
                for quest in world.quests {
                    if quest.id == review.questId {
                        if let challenge = quest.challenges.first(where: { $0.id == Int(review.challengeId) }) {
                            return ReviewItem(
                                id: review.key,
                                worldName: world.name,
                                questName: quest.name,
                                challengeName: challenge.name,
                                difficulty: challenge.difficulty,
                                schedule: review.schedule,
                                quest: quest,
                                challenge: challenge
                            )
                        }
                    }
                }
            }
            return nil
        }
        isLoaded = true
    }

    private func nextReviewText() -> String {
        let schedules = progressVM.progress.reviewSchedule.values
        guard let earliest = schedules.min(by: { $0.nextReviewDate < $1.nextReviewDate }) else {
            return lang.string("review.none")
        }
        let today = dateString(Date())
        if earliest.nextReviewDate <= today {
            return lang.string("review.now")
        }
        // Calculate days until
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let nextDate = formatter.date(from: earliest.nextReviewDate) {
            let days = Calendar.current.dateComponents([.day], from: Date(), to: nextDate).day ?? 0
            return "\(days)\(lang.string("review.days"))"
        }
        return earliest.nextReviewDate
    }

    private func dateString(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
}

// MARK: - Review Item Model

struct ReviewItem: Identifiable {
    let id: String
    let worldName: String
    let questName: String
    let challengeName: String
    let difficulty: Challenge.Difficulty
    let schedule: ReviewSchedule
    let quest: Quest?
    let challenge: Challenge?
}

// MARK: - Sub-Views

private struct ReviewStatBubble: View {
    let icon: String
    let value: String
    let label: String

    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundStyle(DIQuestTheme.accent)
            Text(value)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
            Text(label)
                .font(.system(size: 11))
                .foregroundStyle(DIQuestTheme.textTertiary)
        }
        .frame(width: 100)
        .padding(.vertical, 14)
        .background(DIQuestTheme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

private struct ReviewItemRow: View {
    let item: ReviewItem

    private var difficultyColor: Color {
        switch item.difficulty {
        case .easy: return .green
        case .medium: return .orange
        case .hard: return .red
        }
    }

    var body: some View {
        HStack(spacing: 12) {
            // Difficulty indicator
            Circle()
                .fill(difficultyColor)
                .frame(width: 10, height: 10)

            VStack(alignment: .leading, spacing: 4) {
                Text(item.challengeName)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundStyle(.white)
                    .lineLimit(1)
                Text("\(item.worldName) · \(item.questName)")
                    .font(.system(size: 12))
                    .foregroundStyle(DIQuestTheme.textTertiary)
                    .lineLimit(1)
            }

            Spacer()

            // Repetition count
            VStack(spacing: 2) {
                Text("\(item.schedule.repetition)")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .foregroundStyle(DIQuestTheme.accent)
                Text("reps")
                    .font(.system(size: 10))
                    .foregroundStyle(DIQuestTheme.textTertiary)
            }

            Image(systemName: "chevron.right")
                .font(.system(size: 12))
                .foregroundStyle(DIQuestTheme.textTertiary)
        }
        .padding(14)
        .background(DIQuestTheme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(DIQuestTheme.cardBorder)
        )
    }
}
