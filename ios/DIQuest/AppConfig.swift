import Foundation

enum AppConfig {
    // MARK: - Supabase
    // Set these to your Supabase project values
    static let supabaseURL = "https://yqbnhiqmmnseefbxfcrq.supabase.co"
    static let supabaseAnonKey = "" // Set via Xcode build settings or Secrets

    // MARK: - OAuth
    static let oauthCallbackScheme = "com.diquest.app"
    static let oauthCallbackURL = "com.diquest.app://auth-callback"

    // MARK: - App Info
    static let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"
    static let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1"
}
