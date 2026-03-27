import SwiftUI
import AuthenticationServices

@MainActor
final class AuthManager: ObservableObject {
    @Published var isAuthenticated = false
    @Published var isLoading = false
    @Published var currentUserId: String?
    @Published var accessToken: String?

    private var authSession: ASWebAuthenticationSession?

    init() {
        restoreSession()
    }

    // MARK: - OAuth Login

    func signInWithGoogle(presentationAnchor: ASPresentationAnchor) {
        startOAuth(provider: "google", anchor: presentationAnchor)
    }

    func signInWithApple(presentationAnchor: ASPresentationAnchor) {
        startOAuth(provider: "apple", anchor: presentationAnchor)
    }

    private func startOAuth(provider: String, anchor: ASPresentationAnchor) {
        guard let url = buildOAuthURL(provider: provider) else { return }
        isLoading = true

        let session = ASWebAuthenticationSession(
            url: url,
            callbackURLScheme: AppConfig.oauthCallbackScheme
        ) { [weak self] callbackURL, error in
            Task { @MainActor in
                guard let self else { return }
                self.isLoading = false

                if let callbackURL {
                    self.handleCallback(callbackURL)
                }
            }
        }

        class ContextProvider: NSObject, ASWebAuthenticationPresentationContextProviding {
            let anchor: ASPresentationAnchor
            init(anchor: ASPresentationAnchor) { self.anchor = anchor }
            func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor { anchor }
        }

        let provider = ContextProvider(anchor: anchor)
        session.presentationContextProvider = provider
        session.prefersEphemeralWebBrowserSession = false
        self.authSession = session
        // Keep provider alive
        objc_setAssociatedObject(session, "provider", provider, .OBJC_ASSOCIATION_RETAIN)
        session.start()
    }

    private func buildOAuthURL(provider: String) -> URL? {
        var components = URLComponents(string: "\(AppConfig.supabaseURL)/auth/v1/authorize")
        components?.queryItems = [
            URLQueryItem(name: "provider", value: provider),
            URLQueryItem(name: "redirect_to", value: AppConfig.oauthCallbackURL),
        ]
        return components?.url
    }

    private func handleCallback(_ url: URL) {
        // Extract tokens from fragment: #access_token=...&refresh_token=...
        let fragment = url.fragment ?? ""
        let params = fragment.split(separator: "&").reduce(into: [String: String]()) { dict, pair in
            let parts = pair.split(separator: "=", maxSplits: 1)
            if parts.count == 2 {
                dict[String(parts[0])] = String(parts[1])
            }
        }

        if let token = params["access_token"], let refreshToken = params["refresh_token"] {
            self.accessToken = token
            UserDefaults.standard.set(token, forKey: "accessToken")
            UserDefaults.standard.set(refreshToken, forKey: "refreshToken")

            // Decode user ID from JWT
            if let userId = decodeJWTUserId(token) {
                self.currentUserId = userId
                UserDefaults.standard.set(userId, forKey: "userId")
            }

            self.isAuthenticated = true
        }
    }

    // MARK: - Session

    private func restoreSession() {
        if let token = UserDefaults.standard.string(forKey: "accessToken"),
           let userId = UserDefaults.standard.string(forKey: "userId") {
            self.accessToken = token
            self.currentUserId = userId
            self.isAuthenticated = true
        }
    }

    func signOut() {
        accessToken = nil
        currentUserId = nil
        isAuthenticated = false
        UserDefaults.standard.removeObject(forKey: "accessToken")
        UserDefaults.standard.removeObject(forKey: "refreshToken")
        UserDefaults.standard.removeObject(forKey: "userId")
    }

    // MARK: - JWT Decode

    private func decodeJWTUserId(_ jwt: String) -> String? {
        let parts = jwt.split(separator: ".")
        guard parts.count == 3 else { return nil }
        var base64 = String(parts[1])
        // Pad base64
        while base64.count % 4 != 0 { base64.append("=") }
        guard let data = Data(base64Encoded: base64),
              let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
              let sub = json["sub"] as? String else { return nil }
        return sub
    }
}
