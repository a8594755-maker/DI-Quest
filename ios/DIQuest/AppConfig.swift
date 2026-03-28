import Foundation

enum AppConfig {
    // MARK: - Supabase
    // Set these to your Supabase project values
    static let supabaseURL = "https://lsjltfkiqxrmffcercmj.supabase.co"
    static let supabaseAnonKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxzamx0ZmtpcXhybWZmY2VyY21qIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzQ1NTg0MDIsImV4cCI6MjA5MDEzNDQwMn0.04N2_MUZWt0MMecQcparMUh1TF_kfiu-fC_1iJtHats"

    // MARK: - OAuth
    static let oauthCallbackScheme = "com.diquest.app"
    static let oauthCallbackURL = "com.diquest.app://auth-callback"

    // MARK: - Web
    static let webBaseURL = "https://di-quest.netlify.app"

    // MARK: - App Info
    static let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"
    static let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1"
}
