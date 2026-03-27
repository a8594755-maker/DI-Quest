import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authManager: AuthManager

    var body: some View {
        ZStack {
            DIQuestTheme.background
                .ignoresSafeArea()

            VStack(spacing: 32) {
                Spacer()

                // Logo
                ZStack {
                    RoundedRectangle(cornerRadius: 24)
                        .fill(DIQuestTheme.accentGradient)
                        .frame(width: 100, height: 100)
                        .shadow(color: DIQuestTheme.accent.opacity(0.4), radius: 20)

                    Image(systemName: "briefcase.fill")
                        .font(.system(size: 44))
                        .foregroundStyle(.white)
                }

                VStack(spacing: 8) {
                    Text("DI Quest")
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)

                    Text("Business Case Practice")
                        .font(.subheadline)
                        .foregroundStyle(DIQuestTheme.textTertiary)
                }

                Spacer()

                // Sign In Buttons
                VStack(spacing: 12) {
                    SignInButton(
                        title: "使用 Google 登入",
                        icon: "g.circle.fill",
                        background: .white,
                        foreground: .black
                    ) {
                        if let anchor = presentationAnchor {
                            authManager.signInWithGoogle(presentationAnchor: anchor)
                        }
                    }

                    SignInButton(
                        title: "使用 Apple 登入",
                        icon: "apple.logo",
                        background: .white,
                        foreground: .black
                    ) {
                        if let anchor = presentationAnchor {
                            authManager.signInWithApple(presentationAnchor: anchor)
                        }
                    }
                }
                .padding(.horizontal, 32)

                if authManager.isLoading {
                    ProgressView()
                        .tint(.white)
                }

                Spacer()
                    .frame(height: 48)
            }
        }
    }

    private var presentationAnchor: ASPresentationAnchor? {
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first?.windows.first
    }
}

// MARK: - Sign In Button

private struct SignInButton: View {
    let title: String
    let icon: String
    let background: Color
    let foreground: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.title3)
                Text(title)
                    .font(.headline)
            }
            .foregroundStyle(foreground)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(background)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

import AuthenticationServices
