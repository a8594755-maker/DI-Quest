import SwiftUI

@main
struct DIQuestApp: App {
    @StateObject private var networkMonitor = NetworkMonitor()

    var body: some Scene {
        WindowGroup {
            WebAppView()
                .environmentObject(networkMonitor)
                .preferredColorScheme(.dark)
        }
    }
}
