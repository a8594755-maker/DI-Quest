import SwiftUI

@main
struct DIQuestApp: App {
    @StateObject private var networkMonitor = NetworkMonitor()
    @StateObject private var authManager = AuthManager()
    @Environment(\.scenePhase) private var scenePhase
    @State private var isLocked = false

    var body: some Scene {
        WindowGroup {
            ZStack {
                Group {
                    if authManager.isAuthenticated {
                        MainTabView()
                    } else {
                        LoginView()
                    }
                }
                .environmentObject(networkMonitor)
                .environmentObject(authManager)
                .preferredColorScheme(.dark)

                if isLocked {
                    BiometricLockView(isLocked: $isLocked)
                }
            }
            .onChange(of: scenePhase) { newPhase in
                if newPhase == .active && UserDefaults.standard.bool(forKey: "biometricEnabled") {
                    isLocked = true
                }
            }
        }
    }
}

// MARK: - Biometric Lock View

struct BiometricLockView: View {
    @Binding var isLocked: Bool

    var body: some View {
        ZStack {
            DIQuestTheme.background
                .ignoresSafeArea()

            VStack(spacing: 24) {
                Image(systemName: "lock.fill")
                    .font(.system(size: 48))
                    .foregroundStyle(DIQuestTheme.textTertiary)

                Text("DI Quest")
                    .font(.title2.bold())
                    .foregroundStyle(.white)

                Text("請驗證身分以繼續")
                    .font(.subheadline)
                    .foregroundStyle(DIQuestTheme.textTertiary)

                Button(action: { unlock() }) {
                    Label(unlockLabel, systemImage: unlockIcon)
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 32)
                        .padding(.vertical, 12)
                        .background(DIQuestTheme.accent)
                        .clipShape(Capsule())
                }
            }
        }
        .task { unlock() }
    }

    private func unlock() {
        Task {
            let success = await BiometricAuthService.authenticate(reason: "解鎖 DI Quest")
            if success {
                withAnimation(.easeOut(duration: 0.3)) {
                    isLocked = false
                }
            }
        }
    }

    private var unlockLabel: String {
        switch BiometricAuthService.biometryType {
        case "faceID": return "使用 Face ID 解鎖"
        case "touchID": return "使用 Touch ID 解鎖"
        default: return "解鎖"
        }
    }

    private var unlockIcon: String {
        switch BiometricAuthService.biometryType {
        case "faceID": return "faceid"
        case "touchID": return "touchid"
        default: return "lock.open"
        }
    }
}
