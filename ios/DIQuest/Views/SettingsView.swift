import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var authManager: AuthManager
    @ObservedObject private var lang = LanguageManager.shared
    @StateObject private var cacheService = CacheService()
    @State private var biometricEnabled = UserDefaults.standard.bool(forKey: "biometricEnabled")
    @State private var showClearCacheAlert = false
    @State private var showSignOutAlert = false
    @State private var promoCode = ""
    @State private var promoStatus: PromoStatus?
    @State private var isRedeemingPromo = false

    private enum PromoStatus {
        case success(String)
        case error(String)
    }

    var body: some View {
        NavigationStack {
            List {
                // MARK: - Language
                Section {
                    HStack {
                        Label(lang.string("settings.language"), systemImage: "globe")
                        Spacer()
                        Picker("", selection: $lang.currentLanguage) {
                            ForEach(LanguageManager.Language.allCases, id: \.self) { language in
                                Text(language.displayName).tag(language)
                            }
                        }
                        .pickerStyle(.menu)
                        .tint(DIQuestTheme.accent)
                    }
                } header: {
                    Text(lang.string("settings.language"))
                } footer: {
                    Text(lang.string("settings.languageFooter"))
                }

                // MARK: - About
                Section {
                    HStack {
                        Label(lang.string("settings.version"), systemImage: "info.circle")
                        Spacer()
                        Text(AppConfig.appVersion)
                            .foregroundStyle(.secondary)
                    }
                    HStack {
                        Label("Build", systemImage: "hammer")
                        Spacer()
                        Text(AppConfig.buildNumber)
                            .foregroundStyle(.secondary)
                    }
                } header: {
                    Text(lang.string("settings.about"))
                }

                // MARK: - Security
                if BiometricAuthService.isAvailable {
                    Section {
                        Toggle(isOn: $biometricEnabled) {
                            Label(biometricLabel, systemImage: biometricIcon)
                        }
                        .onChange(of: biometricEnabled) { newValue in
                            UserDefaults.standard.set(newValue, forKey: "biometricEnabled")
                        }
                    } header: {
                        Text(lang.string("settings.security"))
                    } footer: {
                        Text(String(format: lang.string("settings.requireBiometric"), biometricLabel))
                    }
                }

                // MARK: - Storage
                Section {
                    HStack {
                        Label(lang.string("settings.cacheSize"), systemImage: "internaldrive")
                        Spacer()
                        Text(cacheService.cacheSize)
                            .foregroundStyle(.secondary)
                    }
                    Button(role: .destructive) {
                        showClearCacheAlert = true
                    } label: {
                        Label(lang.string("settings.clearCache"), systemImage: "trash")
                    }
                } header: {
                    Text(lang.string("settings.storage"))
                }

                // MARK: - Promo Code
                Section {
                    HStack(spacing: 10) {
                        TextField(lang.string("settings.enterPromoCode"), text: $promoCode)
                            .textInputAutocapitalization(.characters)
                            .autocorrectionDisabled()
                            .foregroundStyle(.primary)

                        Button {
                            Task { await redeemPromoCode() }
                        } label: {
                            if isRedeemingPromo {
                                ProgressView()
                                    .controlSize(.small)
                            } else {
                                Text(lang.string("settings.redeem"))
                                    .font(.system(size: 14, weight: .bold))
                            }
                        }
                        .disabled(promoCode.trimmingCharacters(in: .whitespaces).isEmpty || isRedeemingPromo)
                        .buttonStyle(.borderedProminent)
                        .tint(DIQuestTheme.accent)
                    }

                    if let status = promoStatus {
                        switch status {
                        case .success(let msg):
                            Label(msg, systemImage: "checkmark.circle.fill")
                                .font(.system(size: 13))
                                .foregroundStyle(.green)
                        case .error(let msg):
                            Label(msg, systemImage: "xmark.circle.fill")
                                .font(.system(size: 13))
                                .foregroundStyle(.red)
                        }
                    }
                } header: {
                    Text(lang.string("settings.promoCode"))
                } footer: {
                    Text(lang.string("settings.promoFooter"))
                }

                // MARK: - Account
                Section {
                    Button(role: .destructive) {
                        showSignOutAlert = true
                    } label: {
                        Label(lang.string("action.signOut"), systemImage: "rectangle.portrait.and.arrow.right")
                    }
                } header: {
                    Text(lang.string("settings.account"))
                }
            }
            .navigationTitle(lang.string("settings.title"))
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(lang.string("action.done")) { dismiss() }
                }
            }
            .alert(lang.string("settings.clearCacheConfirm"), isPresented: $showClearCacheAlert) {
                Button(lang.string("settings.cancel"), role: .cancel) {}
                Button(lang.string("settings.clearCache"), role: .destructive) {
                    Task { await cacheService.clearCache() }
                }
            } message: {
                Text(lang.string("settings.clearCacheMessage"))
            }
            .alert(lang.string("settings.signOutConfirm"), isPresented: $showSignOutAlert) {
                Button(lang.string("settings.cancel"), role: .cancel) {}
                Button(lang.string("action.signOut"), role: .destructive) {
                    authManager.signOut()
                    dismiss()
                }
            }
            .task {
                await cacheService.calculateCacheSize()
            }
        }
    }

    // MARK: - Promo Code Redemption

    private func redeemPromoCode() async {
        let code = promoCode.trimmingCharacters(in: .whitespaces).uppercased()
        guard !code.isEmpty else { return }

        // Ensure token is fresh
        await authManager.refreshTokenIfNeeded()

        guard let token = authManager.accessToken, let userId = authManager.currentUserId else {
            promoStatus = .error(lang.string("settings.loginFirst"))
            return
        }

        isRedeemingPromo = true
        promoStatus = nil
        defer { isRedeemingPromo = false }

        do {
            // 1. Look up promo code
            var components = URLComponents(string: AppConfig.supabaseURL + "/rest/v1/promo_codes")!
            components.queryItems = [
                URLQueryItem(name: "code", value: "eq.\(code)"),
                URLQueryItem(name: "active", value: "eq.true"),
                URLQueryItem(name: "select", value: "*"),
            ]
            var request = URLRequest(url: components.url!)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue(AppConfig.supabaseAnonKey, forHTTPHeaderField: "apikey")
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

            print("[PromoCode] URL: \(request.url?.absoluteString ?? "nil")")
            let (data, response) = try await URLSession.shared.data(for: request)
            let rawBody = String(data: data, encoding: .utf8) ?? "(empty)"
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
            print("[PromoCode] Response \(statusCode): \(rawBody)")

            if statusCode >= 400 {
                promoStatus = .error("\(lang.string("settings.serverError")) (\(statusCode))")
                return
            }

            struct PromoCode: Codable {
                let id: Int
                let code: String
                let role_grant: String
                let max_uses: Int?
                let current_uses: Int
            }

            let promos: [PromoCode]
            do {
                promos = try JSONDecoder().decode([PromoCode].self, from: data)
            } catch {
                print("[PromoCode] Decode error: \(error)")
                promoStatus = .error(lang.string("settings.parseError"))
                return
            }
            guard let promo = promos.first else {
                promoStatus = .error(lang.string("settings.invalidCode"))
                return
            }

            if let max = promo.max_uses, promo.current_uses >= max {
                promoStatus = .error(lang.string("settings.codeExpired"))
                return
            }

            // 2. Update user role in profiles
            var updateReq = URLRequest(url: URL(string: AppConfig.supabaseURL + "/rest/v1/profiles?id=eq.\(userId)")!)
            updateReq.httpMethod = "PATCH"
            updateReq.setValue("application/json", forHTTPHeaderField: "Content-Type")
            updateReq.setValue(AppConfig.supabaseAnonKey, forHTTPHeaderField: "apikey")
            updateReq.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            updateReq.setValue("return=minimal", forHTTPHeaderField: "Prefer")
            updateReq.httpBody = try JSONSerialization.data(withJSONObject: ["role": promo.role_grant])
            let (_, updateResp) = try await URLSession.shared.data(for: updateReq)
            guard let httpUpdateResp = updateResp as? HTTPURLResponse, (200...299).contains(httpUpdateResp.statusCode) else {
                let statusCode = (updateResp as? HTTPURLResponse)?.statusCode ?? 0
                promoStatus = .error("\(lang.string("settings.redeemFailed")) (\(statusCode))")
                return
            }

            // 3. Increment usage count
            var usageReq = URLRequest(url: URL(string: AppConfig.supabaseURL + "/rest/v1/promo_codes?id=eq.\(promo.id)")!)
            usageReq.httpMethod = "PATCH"
            usageReq.setValue("application/json", forHTTPHeaderField: "Content-Type")
            usageReq.setValue(AppConfig.supabaseAnonKey, forHTTPHeaderField: "apikey")
            usageReq.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            usageReq.setValue("return=minimal", forHTTPHeaderField: "Prefer")
            usageReq.httpBody = try JSONSerialization.data(withJSONObject: ["current_uses": promo.current_uses + 1])
            _ = try? await URLSession.shared.data(for: usageReq)

            HapticService.trigger("success")
            promoCode = ""
            authManager.isPremium = true
            promoStatus = .success(lang.isEnglish ? "Premium activated! All content unlocked." : "進階版已啟用！所有內容已解鎖。")
        } catch {
            print("[PromoCode] Error: \(error)")
            promoStatus = .error("\(lang.string("settings.error")): \(error.localizedDescription)")
        }
    }

    private var biometricLabel: String {
        switch BiometricAuthService.biometryType {
        case "faceID": return "Face ID"
        case "touchID": return "Touch ID"
        default: return LanguageManager.shared.string("settings.biometric")
        }
    }

    private var biometricIcon: String {
        switch BiometricAuthService.biometryType {
        case "faceID": return "faceid"
        case "touchID": return "touchid"
        default: return "lock.shield"
        }
    }
}
