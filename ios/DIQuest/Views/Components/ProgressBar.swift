import SwiftUI

struct DIProgressBar: View {
    let progress: Double
    var tint: Color = DIQuestTheme.accent
    var height: CGFloat = 6

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(tint.opacity(0.2))

                Capsule()
                    .fill(tint)
                    .frame(width: max(0, geo.size.width * min(1, progress)))
            }
        }
        .frame(height: height)
    }
}
