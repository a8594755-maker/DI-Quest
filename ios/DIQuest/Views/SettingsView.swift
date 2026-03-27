import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var cacheService = CacheService()
    @State private var biometricEnabled = UserDefaults.standard.bool(forKey: "biometricEnabled")
    @State private var showClearCacheAlert = false

    var body: some View {
        NavigationStack {
            List {
                // MARK: - About
                Section {
                    HStack {
                        Label("版本", systemImage: "info.circle")
                        Spacer()
                        Text(AppConfig.appVersion)
                            .foregroundStyle(.secondary)
                    }
                    HStack {
                        Label("Build", systemImage: "hammer")
                        Spacer()
                        Text(Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1")
                            .foregroundStyle(.secondary)
                    }
                } header: {
                    Text("關於")
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
                        Text("安全性")
                    } footer: {
                        Text("開啟 App 時需要\(biometricLabel)驗證")
                    }
                }

                // MARK: - Storage
                Section {
                    HStack {
                        Label("快取大小", systemImage: "internaldrive")
                        Spacer()
                        Text(cacheService.cacheSize)
                            .foregroundStyle(.secondary)
                    }
                    Button(role: .destructive) {
                        showClearCacheAlert = true
                    } label: {
                        Label("清除快取", systemImage: "trash")
                    }
                } header: {
                    Text("儲存空間")
                } footer: {
                    Text("清除快取後需要網路連線重新載入資料")
                }
            }
            .navigationTitle("設定")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("完成") { dismiss() }
                }
            }
            .alert("確定要清除快取？", isPresented: $showClearCacheAlert) {
                Button("取消", role: .cancel) {}
                Button("清除", role: .destructive) {
                    Task { await cacheService.clearCache() }
                }
            } message: {
                Text("這會清除所有離線快取資料")
            }
            .task {
                await cacheService.calculateCacheSize()
            }
        }
    }

    private var biometricLabel: String {
        switch BiometricAuthService.biometryType {
        case "faceID": return "Face ID"
        case "touchID": return "Touch ID"
        default: return "生物辨識"
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
