import Foundation

@MainActor
final class SupabaseDataService: ObservableObject {
    private let baseURL: String
    private let anonKey: String
    private weak var authManager: AuthManager?

    init(authManager: AuthManager) {
        self.baseURL = AppConfig.supabaseURL
        self.anonKey = AppConfig.supabaseAnonKey
        self.authManager = authManager
    }

    // MARK: - Profile

    func fetchProfile() async throws -> UserProfile? {
        guard let userId = authManager?.currentUserId else { return nil }
        let data = try await request(
            path: "/rest/v1/profiles",
            query: [("id", "eq.\(userId)"), ("select", "*")]
        )
        let profiles = try JSONDecoder().decode([UserProfile].self, from: data)
        return profiles.first
    }

    func updateProfile(_ profile: UserProfile) async throws {
        guard let userId = authManager?.currentUserId else { return }
        let body = try JSONEncoder().encode(profile)
        _ = try await request(
            path: "/rest/v1/profiles",
            query: [("id", "eq.\(userId)")],
            method: "PATCH",
            body: body
        )
    }

    // MARK: - Progress

    func fetchProgress() async throws -> UserProgress? {
        guard let userId = authManager?.currentUserId else { return nil }
        let data = try await request(
            path: "/rest/v1/user_progress",
            query: [("user_id", "eq.\(userId)"), ("select", "progress")]
        )

        struct Row: Codable {
            let progress: UserProgress
        }

        let rows = try JSONDecoder().decode([Row].self, from: data)
        return rows.first?.progress
    }

    func saveProgress(_ progress: UserProgress) async throws {
        guard let userId = authManager?.currentUserId else { return }

        struct Payload: Codable {
            let user_id: String
            let progress: UserProgress
        }

        let payload = Payload(user_id: userId, progress: progress)
        let body = try JSONEncoder().encode(payload)
        _ = try await request(
            path: "/rest/v1/user_progress",
            query: [("on_conflict", "user_id")],
            method: "POST",
            body: body,
            extraHeaders: [("Prefer", "resolution=merge-duplicates")]
        )
    }

    // MARK: - HTTP

    private func request(
        path: String,
        query: [(String, String)] = [],
        method: String = "GET",
        body: Data? = nil,
        extraHeaders: [(String, String)] = []
    ) async throws -> Data {
        var components = URLComponents(string: baseURL + path)!
        if !query.isEmpty {
            components.queryItems = query.map { URLQueryItem(name: $0.0, value: $0.1) }
        }

        var request = URLRequest(url: components.url!)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(anonKey, forHTTPHeaderField: "apikey")

        if let token = authManager?.accessToken {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

        for (key, value) in extraHeaders {
            request.setValue(value, forHTTPHeaderField: key)
        }

        if let body {
            request.httpBody = body
        }

        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw SupabaseError.requestFailed
        }
        return data
    }
}

enum SupabaseError: LocalizedError {
    case requestFailed

    var errorDescription: String? {
        switch self {
        case .requestFailed: return "伺服器請求失敗"
        }
    }
}
