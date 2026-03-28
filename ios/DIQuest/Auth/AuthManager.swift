import SwiftUI
import AuthenticationServices

@MainActor
final class AuthManager: ObservableObject {
    @Published var isAuthenticated = false
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var currentUserId: String?
    @Published var accessToken: String?
    @Published var isPremium = false

    private var authSession: ASWebAuthenticationSession?

    init() {
        restoreSession()
        if isAuthenticated {
            Task {
                await refreshTokenIfNeeded()
                await fetchProfile()
            }
        }
    }

    // MARK: - Email/Password Auth

    func signInWithEmail(email: String, password: String) {
        let lang = LanguageManager.shared
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = lang.string("auth.enterEmailPassword")
            return
        }
        isLoading = true
        errorMessage = nil

        Task {
            do {
                let body: [String: String] = ["email": email, "password": password]
                let response = try await supabaseAuthRequest(
                    endpoint: "/auth/v1/token?grant_type=password",
                    body: body
                )
                handleAuthResponse(response)
            } catch {
                self.errorMessage = "\(lang.string("auth.signInFailed")): \(error.localizedDescription)"
                self.isLoading = false
            }
        }
    }

    func signUpWithEmail(email: String, password: String) {
        let lang = LanguageManager.shared
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = lang.string("auth.enterEmailPassword")
            return
        }
        guard password.count >= 6 else {
            errorMessage = lang.string("auth.passwordMinLength")
            return
        }
        isLoading = true
        errorMessage = nil

        Task {
            do {
                let body: [String: String] = ["email": email, "password": password]
                let response = try await supabaseAuthRequest(
                    endpoint: "/auth/v1/signup",
                    body: body
                )
                // If the response has an access_token, auto-login succeeded
                if response["access_token"] as? String != nil {
                    handleAuthResponse(response)
                } else {
                    // Email confirmation required
                    self.isLoading = false
                    self.errorMessage = lang.string("auth.verificationSent")
                }
            } catch {
                self.errorMessage = "\(lang.string("auth.signUpFailed")): \(error.localizedDescription)"
                self.isLoading = false
            }
        }
    }

    private func supabaseAuthRequest(endpoint: String, body: [String: String]) async throws -> [String: Any] {
        guard let url = URL(string: "\(AppConfig.supabaseURL)\(endpoint)") else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(AppConfig.supabaseAnonKey, forHTTPHeaderField: "apikey")
        request.httpBody = try JSONSerialization.data(withJSONObject: body)

        let (data, httpResponse) = try await URLSession.shared.data(for: request)

        guard let response = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            throw URLError(.cannotParseResponse)
        }

        // Check for error in response
        if let statusCode = (httpResponse as? HTTPURLResponse)?.statusCode, statusCode >= 400 {
            let message = response["error_description"] as? String
                ?? response["msg"] as? String
                ?? LanguageManager.shared.string("auth.unknownError")
            throw NSError(domain: "AuthError", code: statusCode, userInfo: [NSLocalizedDescriptionKey: message])
        }

        return response
    }

    private func handleAuthResponse(_ response: [String: Any]) {
        if let token = response["access_token"] as? String,
           let refreshToken = response["refresh_token"] as? String {
            self.accessToken = token
            UserDefaults.standard.set(token, forKey: "accessToken")
            UserDefaults.standard.set(refreshToken, forKey: "refreshToken")

            if let userId = decodeJWTUserId(token) {
                self.currentUserId = userId
                UserDefaults.standard.set(userId, forKey: "userId")
            }

            self.isAuthenticated = true
        }
        self.isLoading = false
    }

    // MARK: - Password Reset

    func resetPassword(email: String) {
        let lang = LanguageManager.shared
        guard !email.isEmpty else {
            errorMessage = lang.string("auth.enterEmail")
            return
        }
        isLoading = true
        errorMessage = nil

        Task {
            do {
                guard let url = URL(string: "\(AppConfig.supabaseURL)/auth/v1/recover") else {
                    throw URLError(.badURL)
                }
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.setValue(AppConfig.supabaseAnonKey, forHTTPHeaderField: "apikey")
                request.httpBody = try JSONSerialization.data(withJSONObject: ["email": email])

                let (_, response) = try await URLSession.shared.data(for: request)
                if let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) {
                    self.errorMessage = "\(lang.string("auth.resetSent")) \(email)"
                } else {
                    self.errorMessage = lang.string("auth.resetFailed")
                }
            } catch {
                self.errorMessage = "\(lang.string("auth.sendFailed")): \(error.localizedDescription)"
            }
            self.isLoading = false
        }
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

    /// Check if JWT is expired and refresh using refresh_token if needed.
    func refreshTokenIfNeeded() async {
        guard let token = accessToken else { return }

        // Decode JWT exp claim
        let parts = token.split(separator: ".")
        if parts.count == 3 {
            var base64 = String(parts[1])
            while base64.count % 4 != 0 { base64.append("=") }
            if let data = Data(base64Encoded: base64),
               let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
               let exp = json["exp"] as? TimeInterval {
                // Still valid with 60s buffer
                if Date().timeIntervalSince1970 < exp - 60 {
                    return
                }
            }
        }

        // Token expired — refresh it
        guard let refreshToken = UserDefaults.standard.string(forKey: "refreshToken") else {
            print("[Auth] No refresh token, signing out")
            signOut()
            return
        }

        do {
            guard let url = URL(string: "\(AppConfig.supabaseURL)/auth/v1/token?grant_type=refresh_token") else { return }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue(AppConfig.supabaseAnonKey, forHTTPHeaderField: "apikey")
            request.httpBody = try JSONSerialization.data(withJSONObject: ["refresh_token": refreshToken])

            let (data, resp) = try await URLSession.shared.data(for: request)
            guard let httpResp = resp as? HTTPURLResponse, (200...299).contains(httpResp.statusCode) else {
                print("[Auth] Refresh failed: \((resp as? HTTPURLResponse)?.statusCode ?? 0)")
                signOut()
                return
            }

            if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                handleAuthResponse(json)
                print("[Auth] Token refreshed successfully")
            }
        } catch {
            print("[Auth] Refresh error: \(error)")
            signOut()
        }
    }

    /// Fetch user profile from Supabase to check premium status.
    func fetchProfile() async {
        guard let userId = currentUserId, let token = accessToken else { return }
        do {
            guard let url = URL(string: "\(AppConfig.supabaseURL)/rest/v1/profiles?id=eq.\(userId)&select=role") else { return }
            var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue(AppConfig.supabaseAnonKey, forHTTPHeaderField: "apikey")
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

            let (data, _) = try await URLSession.shared.data(for: request)
            if let profiles = try? JSONSerialization.jsonObject(with: data) as? [[String: Any]],
               let profile = profiles.first,
               let role = profile["role"] as? String {
                self.isPremium = (role == "premium" || role == "admin")
            }
        } catch {
            print("[Auth] fetchProfile error: \(error)")
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
