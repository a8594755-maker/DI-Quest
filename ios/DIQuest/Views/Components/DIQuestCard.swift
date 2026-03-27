import SwiftUI

struct DIQuestCard<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .padding()
            .background(DIQuestTheme.cardBackground)
            .clipShape(RoundedRectangle(cornerRadius: DIQuestTheme.cardCornerRadius))
            .overlay(
                RoundedRectangle(cornerRadius: DIQuestTheme.cardCornerRadius)
                    .strokeBorder(DIQuestTheme.cardBorder)
            )
    }
}
