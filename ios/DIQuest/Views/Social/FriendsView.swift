import SwiftUI

struct FriendsView: View {
    @EnvironmentObject var authManager: AuthManager
    @ObservedObject private var lang = LanguageManager.shared
    @State private var selectedTab = 0
    @State private var searchText = ""
    @State private var searchResults: [FriendProfile] = []
    @State private var friends: [FriendProfile] = []
    @State private var pendingRequests: [FriendRequest] = []
    @State private var leaderboard: [LeaderboardEntry] = []
    @State private var isSearching = false
    @State private var isLoading = true
    @State private var showCopiedToast = false
    @State private var inviteStatus: InviteStatus?
    @Environment(\.pendingInvite) private var pendingInvite

    private enum InviteStatus {
        case success(String)
        case error(String)
        case already
    }

    private var inviteURL: URL? {
        guard let userId = authManager.currentUserId else { return nil }
        return URL(string: "\(AppConfig.webBaseURL)/di-quest/friends?invite=\(userId)")
    }

    var body: some View {
        NavigationStack {
            ZStack {
                DIQuestTheme.background.ignoresSafeArea()

                VStack(spacing: 0) {
                    // Tab picker
                    Picker("", selection: $selectedTab) {
                        Text(lang.string("social.friends")).tag(0)
                        Text(lang.string("social.requests")).tag(1)
                        Text(lang.string("social.ranking")).tag(2)
                    }
                    .pickerStyle(.segmented)
                    .padding()

                    // Invite status banner
                    if let status = inviteStatus {
                        HStack(spacing: 8) {
                            switch status {
                            case .success(let msg):
                                Image(systemName: "checkmark.circle.fill").foregroundStyle(.green)
                                Text(msg).foregroundStyle(.green)
                            case .error(let msg):
                                Image(systemName: "xmark.circle.fill").foregroundStyle(.red)
                                Text(msg).foregroundStyle(.red)
                            case .already:
                                Image(systemName: "person.2.fill").foregroundStyle(.orange)
                                Text(lang.string("social.alreadyFriends")).foregroundStyle(.orange)
                            }
                        }
                        .font(.system(size: 13, weight: .medium))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.white.opacity(0.06))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding(.horizontal)
                        .transition(.opacity)
                    }

                    switch selectedTab {
                    case 0: friendsTab
                    case 1: requestsTab
                    case 2: leaderboardTab
                    default: EmptyView()
                    }
                }

                // Copied toast
                if showCopiedToast {
                    VStack {
                        Spacer()
                        Text(lang.string("social.linkCopied"))
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(DIQuestTheme.accent)
                            .clipShape(Capsule())
                            .padding(.bottom, 32)
                            .transition(.move(edge: .bottom).combined(with: .opacity))
                    }
                    .animation(.spring(), value: showCopiedToast)
                }
            }
            .navigationTitle(lang.string("tab.social"))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    if let url = inviteURL {
                        ShareLink(
                            item: url,
                            subject: Text("DI Quest"),
                            message: Text(lang.string("social.shareMessage"))
                        ) {
                            Image(systemName: "square.and.arrow.up")
                                .foregroundStyle(DIQuestTheme.accent)
                        }
                    }
                }
            }
            .task {
                await loadData()
                await handlePendingInvite()
            }
            .onChange(of: pendingInvite.wrappedValue) { _ in
                Task { await handlePendingInvite() }
            }
        }
    }

    // MARK: - Friends Tab

    private var friendsTab: some View {
        VStack(spacing: 0) {
            // Invite card
            inviteCard
                .padding(.horizontal)
                .padding(.bottom, 8)

            // Search bar
            HStack(spacing: 10) {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(DIQuestTheme.textTertiary)
                TextField(lang.string("social.searchPlaceholder"), text: $searchText)
                    .textFieldStyle(.plain)
                    .foregroundStyle(.white)
                    .onSubmit { Task { await searchUsers() } }
                if !searchText.isEmpty {
                    Button { searchText = ""; searchResults = [] } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(DIQuestTheme.textTertiary)
                    }
                }
            }
            .padding(12)
            .background(Color.white.opacity(0.08))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal)
            .padding(.bottom, 12)

            ScrollView {
                LazyVStack(spacing: 8) {
                    if !searchResults.isEmpty {
                        Section {
                            ForEach(searchResults) { user in
                                SearchResultRow(user: user, isFriend: friends.contains { $0.id == user.id }) {
                                    Task { await sendFriendRequest(to: user.id) }
                                }
                            }
                        } header: {
                            SectionHeader(text: lang.string("social.searchResults"))
                        }
                    }

                    if !friends.isEmpty {
                        Section {
                            ForEach(friends) { friend in
                                FriendRow(profile: friend)
                            }
                        } header: {
                            SectionHeader(text: "\(lang.string("social.myFriends")) (\(friends.count))")
                        }
                    } else if searchResults.isEmpty && !isLoading {
                        VStack(spacing: 12) {
                            Image(systemName: "person.2.slash")
                                .font(.system(size: 40))
                                .foregroundStyle(DIQuestTheme.textTertiary)
                            Text(lang.string("social.noFriends"))
                                .foregroundStyle(DIQuestTheme.textSecondary)
                            Text(lang.string("social.searchToAdd"))
                                .font(.caption)
                                .foregroundStyle(DIQuestTheme.textTertiary)
                        }
                        .padding(.top, 60)
                    }
                }
                .padding(.horizontal)
            }
        }
    }

    // MARK: - Requests Tab

    private var requestsTab: some View {
        ScrollView {
            LazyVStack(spacing: 8) {
                if pendingRequests.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "tray")
                            .font(.system(size: 40))
                            .foregroundStyle(DIQuestTheme.textTertiary)
                        Text(lang.string("social.noPending"))
                            .foregroundStyle(DIQuestTheme.textSecondary)
                    }
                    .padding(.top, 60)
                } else {
                    ForEach(pendingRequests) { req in
                        RequestRow(request: req, onAccept: {
                            Task { await acceptRequest(req) }
                        }, onDecline: {
                            Task { await declineRequest(req) }
                        })
                    }
                }
            }
            .padding(.horizontal)
        }
    }

    // MARK: - Leaderboard Tab

    private var leaderboardTab: some View {
        ScrollView {
            LazyVStack(spacing: 6) {
                if leaderboard.isEmpty && !isLoading {
                    VStack(spacing: 12) {
                        Image(systemName: "trophy")
                            .font(.system(size: 40))
                            .foregroundStyle(DIQuestTheme.textTertiary)
                        Text(lang.string("social.noRankings"))
                            .foregroundStyle(DIQuestTheme.textSecondary)
                    }
                    .padding(.top, 60)
                } else {
                    ForEach(leaderboard) { entry in
                        LeaderboardRow(entry: entry, isMe: entry.id == authManager.currentUserId)
                    }
                }
            }
            .padding()
        }
    }

    // MARK: - Invite Card

    private var inviteCard: some View {
        VStack(spacing: 10) {
            HStack(spacing: 12) {
                Image(systemName: "link.badge.plus")
                    .font(.system(size: 22))
                    .foregroundStyle(DIQuestTheme.accent)
                    .frame(width: 40, height: 40)
                    .background(DIQuestTheme.accent.opacity(0.15))
                    .clipShape(Circle())

                VStack(alignment: .leading, spacing: 2) {
                    Text(lang.string("social.inviteFriends"))
                        .font(.system(size: 15, weight: .bold))
                        .foregroundStyle(.white)
                    Text(lang.string("social.shareLink"))
                        .font(.system(size: 12))
                        .foregroundStyle(DIQuestTheme.textTertiary)
                }

                Spacer()
            }

            // Copy link button
            Button {
                guard let url = inviteURL else { return }
                UIPasteboard.general.string = url.absoluteString
                HapticService.trigger("success")
                withAnimation { showCopiedToast = true }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation { showCopiedToast = false }
                }
            } label: {
                HStack(spacing: 8) {
                    Image(systemName: "doc.on.doc")
                        .font(.system(size: 13))
                    Text(lang.string("social.copyLink"))
                        .font(.system(size: 14, weight: .semibold))
                }
                .foregroundStyle(DIQuestTheme.accent)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .background(DIQuestTheme.accent.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(DIQuestTheme.accent.opacity(0.3), lineWidth: 1)
                )
            }
        }
        .padding(14)
        .background(DIQuestTheme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .strokeBorder(DIQuestTheme.cardBorder)
        )
    }

    // MARK: - Invite Link Handling

    private func handlePendingInvite() async {
        guard let inviteUserId = pendingInvite.wrappedValue else { return }
        pendingInvite.wrappedValue = nil

        // Check if already friends
        if friends.contains(where: { $0.id == inviteUserId }) {
            inviteStatus = .already
        } else {
            do {
                try await sendFriendRequestThrowing(to: inviteUserId)
                inviteStatus = .success(lang.string("social.requestSent"))
                HapticService.trigger("success")
            } catch {
                let desc = error.localizedDescription
                if desc.contains("duplicate") || desc.contains("23505") {
                    inviteStatus = .error(lang.string("social.requestAlready"))
                } else {
                    inviteStatus = .error(lang.string("social.requestFailed"))
                }
            }
        }

        // Auto-dismiss after 4 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            inviteStatus = nil
        }
    }

    private func sendFriendRequestThrowing(to friendId: String) async throws {
        guard let userId = authManager.currentUserId, let token = authManager.accessToken else {
            throw URLError(.userAuthenticationRequired)
        }
        let body: [String: String] = ["user_id": userId, "friend_id": friendId, "status": "pending"]
        _ = try await supabasePost(path: "/rest/v1/friendships", body: body, token: token)
    }

    // MARK: - Data Loading

    private func loadData() async {
        isLoading = true
        defer { isLoading = false }
        await withTaskGroup(of: Void.self) { group in
            group.addTask { await loadFriends() }
            group.addTask { await loadPendingRequests() }
            group.addTask { await loadLeaderboard() }
        }
    }

    private func loadFriends() async {
        guard let userId = authManager.currentUserId, let token = authManager.accessToken else { return }
        do {
            let data = try await supabaseGet(
                path: "/rest/v1/friendships",
                query: [("or", "(user_id.eq.\(userId),friend_id.eq.\(userId))"), ("status", "eq.accepted"), ("select", "user_id,friend_id")],
                token: token
            )
            struct FRow: Codable { let user_id: String; let friend_id: String }
            let rows = try JSONDecoder().decode([FRow].self, from: data)
            let friendIds = rows.map { $0.user_id == userId ? $0.friend_id : $0.user_id }
            if !friendIds.isEmpty {
                let profiles = try await fetchProfiles(ids: friendIds, token: token)
                await MainActor.run { friends = profiles }
            }
        } catch { }
    }

    private func loadPendingRequests() async {
        guard let userId = authManager.currentUserId, let token = authManager.accessToken else { return }
        do {
            let data = try await supabaseGet(
                path: "/rest/v1/friendships",
                query: [("friend_id", "eq.\(userId)"), ("status", "eq.pending"), ("select", "id,user_id,created_at")],
                token: token
            )
            struct PRow: Codable { let id: String; let user_id: String; let created_at: String }
            let rows = try JSONDecoder().decode([PRow].self, from: data)
            if !rows.isEmpty {
                let profiles = try await fetchProfiles(ids: rows.map(\.user_id), token: token)
                let profileMap = Dictionary(uniqueKeysWithValues: profiles.map { ($0.id, $0) })
                await MainActor.run {
                    pendingRequests = rows.compactMap { row in
                        guard let p = profileMap[row.user_id] else { return nil }
                        return FriendRequest(id: row.id, fromUserId: row.user_id, username: p.username, avatarEmoji: p.avatarEmoji)
                    }
                }
            }
        } catch { }
    }

    private func loadLeaderboard() async {
        guard let token = authManager.accessToken else { return }
        do {
            let data = try await supabaseGet(
                path: "/rest/v1/weekly_xp_leaderboard",
                query: [("select", "user_id,username,weekly_xp,avatar_emoji"), ("order", "weekly_xp.desc"), ("limit", "50")],
                token: token
            )
            struct LRow: Codable { let user_id: String; let username: String?; let weekly_xp: Int; let avatar_emoji: String? }
            let rows = try JSONDecoder().decode([LRow].self, from: data)
            await MainActor.run {
                leaderboard = rows.enumerated().map { index, row in
                    LeaderboardEntry(id: row.user_id, username: row.username, displayName: nil, avatarUrl: nil, weeklyXp: row.weekly_xp, rank: index + 1)
                }
            }
        } catch { }
    }

    private func searchUsers() async {
        let q = searchText.trimmingCharacters(in: .whitespaces)
        guard !q.isEmpty, let token = authManager.accessToken else { return }
        isSearching = true
        defer { isSearching = false }
        do {
            let data = try await supabaseGet(
                path: "/rest/v1/profiles",
                query: [("username", "ilike.*\(q)*"), ("select", "id,username,avatar_emoji"), ("limit", "10")],
                token: token
            )
            let profiles = try JSONDecoder().decode([FriendProfile].self, from: data)
            await MainActor.run {
                searchResults = profiles.filter { $0.id != authManager.currentUserId }
            }
        } catch { }
    }

    private func sendFriendRequest(to friendId: String) async {
        guard let userId = authManager.currentUserId, let token = authManager.accessToken else { return }
        do {
            let body: [String: String] = ["user_id": userId, "friend_id": friendId, "status": "pending"]
            _ = try await supabasePost(path: "/rest/v1/friendships", body: body, token: token)
            HapticService.trigger("success")
        } catch { }
    }

    private func acceptRequest(_ req: FriendRequest) async {
        guard let token = authManager.accessToken else { return }
        do {
            _ = try await supabasePatch(
                path: "/rest/v1/friendships",
                query: [("id", "eq.\(req.id)")],
                body: ["status": "accepted"],
                token: token
            )
            await MainActor.run {
                pendingRequests.removeAll { $0.id == req.id }
            }
            await loadFriends()
            HapticService.trigger("success")
        } catch { }
    }

    private func declineRequest(_ req: FriendRequest) async {
        guard let token = authManager.accessToken else { return }
        do {
            _ = try await supabaseDelete(
                path: "/rest/v1/friendships",
                query: [("id", "eq.\(req.id)")],
                token: token
            )
            await MainActor.run {
                pendingRequests.removeAll { $0.id == req.id }
            }
        } catch { }
    }

    // MARK: - HTTP Helpers

    private func fetchProfiles(ids: [String], token: String) async throws -> [FriendProfile] {
        let idList = ids.map { "\"" + $0 + "\"" }.joined(separator: ",")
        let data = try await supabaseGet(
            path: "/rest/v1/profiles",
            query: [("id", "in.(\(idList))"), ("select", "id,username,avatar_emoji")],
            token: token
        )
        return try JSONDecoder().decode([FriendProfile].self, from: data)
    }

    private func supabaseGet(path: String, query: [(String, String)], token: String) async throws -> Data {
        var components = URLComponents(string: AppConfig.supabaseURL + path)!
        components.queryItems = query.map { URLQueryItem(name: $0.0, value: $0.1) }
        var request = URLRequest(url: components.url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(AppConfig.supabaseAnonKey, forHTTPHeaderField: "apikey")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }

    private func supabasePost(path: String, body: [String: String], token: String) async throws -> Data {
        var request = URLRequest(url: URL(string: AppConfig.supabaseURL + path)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(AppConfig.supabaseAnonKey, forHTTPHeaderField: "apikey")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("return=minimal", forHTTPHeaderField: "Prefer")
        request.httpBody = try JSONSerialization.data(withJSONObject: body)
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }

    private func supabasePatch(path: String, query: [(String, String)], body: [String: String], token: String) async throws -> Data {
        var components = URLComponents(string: AppConfig.supabaseURL + path)!
        components.queryItems = query.map { URLQueryItem(name: $0.0, value: $0.1) }
        var request = URLRequest(url: components.url!)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(AppConfig.supabaseAnonKey, forHTTPHeaderField: "apikey")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpBody = try JSONSerialization.data(withJSONObject: body)
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }

    private func supabaseDelete(path: String, query: [(String, String)], token: String) async throws -> Data {
        var components = URLComponents(string: AppConfig.supabaseURL + path)!
        components.queryItems = query.map { URLQueryItem(name: $0.0, value: $0.1) }
        var request = URLRequest(url: components.url!)
        request.httpMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(AppConfig.supabaseAnonKey, forHTTPHeaderField: "apikey")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }
}

// MARK: - Models

struct FriendProfile: Identifiable, Codable {
    let id: String
    let username: String?
    let avatar_emoji: String?

    var avatarEmoji: String { avatar_emoji ?? "🧑‍💼" }
    var displayName: String { username ?? "Anonymous" }
}

struct FriendRequest: Identifiable {
    let id: String
    let fromUserId: String
    let username: String?
    let avatarEmoji: String
}


// MARK: - Sub-Views

private struct SectionHeader: View {
    let text: String
    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(DIQuestTheme.textTertiary)
                .textCase(.uppercase)
            Spacer()
        }
        .padding(.top, 8)
    }
}

private struct FriendRow: View {
    let profile: FriendProfile
    var body: some View {
        HStack(spacing: 12) {
            Text(profile.avatarEmoji)
                .font(.system(size: 28))
                .frame(width: 44, height: 44)
                .background(Color.white.opacity(0.08))
                .clipShape(Circle())
            Text(profile.displayName)
                .font(.system(size: 15, weight: .medium))
                .foregroundStyle(.white)
            Spacer()
        }
        .padding(12)
        .background(DIQuestTheme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

private struct SearchResultRow: View {
    let user: FriendProfile
    let isFriend: Bool
    let onAdd: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            Text(user.avatarEmoji)
                .font(.system(size: 28))
                .frame(width: 44, height: 44)
                .background(Color.white.opacity(0.08))
                .clipShape(Circle())
            Text(user.displayName)
                .font(.system(size: 15, weight: .medium))
                .foregroundStyle(.white)
            Spacer()
            if isFriend {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(.green)
            } else {
                Button(action: onAdd) {
                    Image(systemName: "person.badge.plus")
                        .foregroundStyle(DIQuestTheme.accent)
                        .padding(8)
                        .background(DIQuestTheme.accent.opacity(0.15))
                        .clipShape(Circle())
                }
            }
        }
        .padding(12)
        .background(DIQuestTheme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

private struct RequestRow: View {
    let request: FriendRequest
    let onAccept: () -> Void
    let onDecline: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            Text(request.avatarEmoji)
                .font(.system(size: 28))
                .frame(width: 44, height: 44)
                .background(Color.white.opacity(0.08))
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 2) {
                Text(request.username ?? "Anonymous")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundStyle(.white)
                Text(LanguageManager.shared.string("social.wantsFriend"))
                    .font(.caption)
                    .foregroundStyle(DIQuestTheme.textTertiary)
            }
            Spacer()
            Button(action: onAccept) {
                Image(systemName: "checkmark")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(8)
                    .background(Color.green)
                    .clipShape(Circle())
            }
            Button(action: onDecline) {
                Image(systemName: "xmark")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(8)
                    .background(Color.red.opacity(0.7))
                    .clipShape(Circle())
            }
        }
        .padding(12)
        .background(DIQuestTheme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

private struct LeaderboardRow: View {
    let entry: LeaderboardEntry
    let isMe: Bool

    private var rankIcon: String {
        switch entry.rank {
        case 1: return "🥇"
        case 2: return "🥈"
        case 3: return "🥉"
        default: return ""
        }
    }

    var body: some View {
        HStack(spacing: 12) {
            if entry.rank <= 3 {
                Text(rankIcon).font(.system(size: 22)).frame(width: 32)
            } else {
                Text("#\(entry.rank)")
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundStyle(DIQuestTheme.textTertiary)
                    .frame(width: 32)
            }

            Text("🧑‍💼")
                .font(.system(size: 24))
                .frame(width: 36, height: 36)
                .background(Color.white.opacity(0.08))
                .clipShape(Circle())

            Text(entry.username ?? entry.displayName ?? "Anonymous")
                .font(.system(size: 15, weight: isMe ? .bold : .medium))
                .foregroundStyle(isMe ? DIQuestTheme.accent : .white)
                .lineLimit(1)

            Spacer()

            Text("\(entry.weeklyXp) XP")
                .font(.system(size: 14, weight: .bold, design: .rounded))
                .foregroundStyle(entry.rank <= 3 ? .yellow : DIQuestTheme.textSecondary)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .background(isMe ? DIQuestTheme.accent.opacity(0.1) : DIQuestTheme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(isMe ? DIQuestTheme.accent.opacity(0.4) : Color.clear, lineWidth: 1)
        )
    }
}
