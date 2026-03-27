import SwiftUI

enum DIQuestTheme {
    // MARK: - Colors

    static let background = Color(red: 0.06, green: 0.09, blue: 0.16)
    static let cardBackground = Color(white: 1, opacity: 0.06)
    static let cardBorder = Color(white: 1, opacity: 0.1)
    static let accent = Color(hex: "6366f1")
    static let accentSecondary = Color(hex: "8b5cf6")
    static let textPrimary = Color.white
    static let textSecondary = Color.white.opacity(0.7)
    static let textTertiary = Color.white.opacity(0.5)

    // MARK: - Gradients

    static let accentGradient = LinearGradient(
        colors: [Color(hex: "6366f1"), Color(hex: "8b5cf6")],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let backgroundGradient = LinearGradient(
        colors: [
            Color(red: 0.06, green: 0.09, blue: 0.16),
            Color(red: 0.08, green: 0.12, blue: 0.22),
        ],
        startPoint: .top,
        endPoint: .bottom
    )

    // MARK: - Branch Gradients

    static func branchGradient(for branchId: String) -> LinearGradient {
        switch branchId {
        case "business-analysis":
            return LinearGradient(colors: [Color(hex: "3b82f6"), Color(hex: "6366f1")], startPoint: .topLeading, endPoint: .bottomTrailing)
        case "sql":
            return LinearGradient(colors: [Color(hex: "10b981"), Color(hex: "14b8a6")], startPoint: .topLeading, endPoint: .bottomTrailing)
        case "python":
            return LinearGradient(colors: [Color(hex: "eab308"), Color(hex: "f97316")], startPoint: .topLeading, endPoint: .bottomTrailing)
        case "di-product":
            return LinearGradient(colors: [Color(hex: "a855f7"), Color(hex: "ec4899")], startPoint: .topLeading, endPoint: .bottomTrailing)
        case "professional-english":
            return LinearGradient(colors: [Color(hex: "0ea5e9"), Color(hex: "14b8a6")], startPoint: .topLeading, endPoint: .bottomTrailing)
        case "supply-chain":
            return LinearGradient(colors: [Color(hex: "14b8a6"), Color(hex: "10b981")], startPoint: .topLeading, endPoint: .bottomTrailing)
        default:
            return accentGradient
        }
    }

    // MARK: - Typography

    static let titleFont = Font.system(size: 28, weight: .bold, design: .rounded)
    static let headlineFont = Font.system(size: 20, weight: .semibold, design: .rounded)
    static let bodyFont = Font.system(size: 16, weight: .regular)
    static let captionFont = Font.system(size: 13, weight: .medium)

    // MARK: - Spacing

    static let cardCornerRadius: CGFloat = 16
    static let smallCornerRadius: CGFloat = 10
    static let padding: CGFloat = 16
}
