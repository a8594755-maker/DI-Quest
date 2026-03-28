import SwiftUI

struct QuestCompleteView: View {
    let quest: Quest
    let earnedXp: Int
    let onDismiss: () -> Void

    @State private var showContent = false
    @State private var starScale: CGFloat = 0.3

    var body: some View {
        ZStack {
            DIQuestTheme.background.ignoresSafeArea()

            // Background celebration glow
            Circle()
                .fill(DIQuestTheme.accent.opacity(0.12))
                .frame(width: 300, height: 300)
                .blur(radius: 80)
                .scaleEffect(showContent ? 1.2 : 0.5)

            VStack(spacing: 28) {
                Spacer()

                // Star badge
                ZStack {
                    Circle()
                        .fill(DIQuestTheme.accent.opacity(0.15))
                        .frame(width: 140, height: 140)

                    Image(systemName: quest.isBoss ? "star.circle.fill" : "checkmark.circle.fill")
                        .font(.system(size: 72, weight: .medium))
                        .foregroundStyle(DIQuestTheme.accentGradient)
                        .scaleEffect(starScale)
                }

                VStack(spacing: 10) {
                    Text(LanguageManager.shared.string("quest.complete"))
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)

                    Text(quest.name)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundStyle(DIQuestTheme.textSecondary)
                        .multilineTextAlignment(.center)
                }
                .opacity(showContent ? 1 : 0)
                .offset(y: showContent ? 0 : 20)

                // XP earned
                HStack(spacing: 6) {
                    Image(systemName: "bolt.fill")
                        .foregroundStyle(.yellow)
                    Text("+\(earnedXp) XP")
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .foregroundStyle(.yellow)
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                .background(.yellow.opacity(0.1))
                .clipShape(Capsule())
                .opacity(showContent ? 1 : 0)

                Spacer()

                // Continue button
                Button(action: onDismiss) {
                    Text(LanguageManager.shared.string("quest.continue"))
                        .font(.system(size: 17, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(DIQuestTheme.accentGradient)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }
                .padding(.horizontal, 36)
                .opacity(showContent ? 1 : 0)

                Spacer().frame(height: 40)
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.6)) {
                starScale = 1.0
            }
            withAnimation(.easeOut(duration: 0.6).delay(0.3)) {
                showContent = true
            }
            HapticService.trigger("success")
        }
    }
}
