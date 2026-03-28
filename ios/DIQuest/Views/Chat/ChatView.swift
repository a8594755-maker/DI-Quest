import SwiftUI

struct ChatView: View {
    @StateObject private var viewModel = ChatViewModel()
    @EnvironmentObject var authManager: AuthManager
    @EnvironmentObject var progressVM: QuestProgressViewModel
    @ObservedObject private var lang = LanguageManager.shared
    @FocusState private var isInputFocused: Bool
    @State private var showSessionList = false

    var body: some View {
        NavigationStack {
            ZStack {
                DIQuestTheme.background.ignoresSafeArea()

                VStack(spacing: 0) {
                    // Messages
                    ScrollViewReader { proxy in
                        ScrollView {
                            LazyVStack(spacing: 12) {
                                ForEach(viewModel.messages) { message in
                                    ChatBubble(message: message)
                                        .id(message.id)
                                }

                                if viewModel.isLoading {
                                    TypingIndicator()
                                        .id("typing")
                                }
                            }
                            .padding()
                        }
                        .onChange(of: viewModel.messages.count) { _ in
                            withAnimation {
                                if viewModel.isLoading {
                                    proxy.scrollTo("typing", anchor: .bottom)
                                } else if let lastId = viewModel.messages.last?.id {
                                    proxy.scrollTo(lastId, anchor: .bottom)
                                }
                            }
                        }
                    }

                    // Quick actions
                    if viewModel.messages.count <= 1 {
                        quickActions
                    }

                    // Input bar
                    inputBar
                }
            }
            .navigationTitle(lang.string("chat.title"))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showSessionList = true
                    } label: {
                        Image(systemName: "clock.arrow.circlepath")
                            .foregroundStyle(DIQuestTheme.textSecondary)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 8) {
                        // Rate limit / Premium badge
                        if viewModel.isPremium {
                            HStack(spacing: 4) {
                                Image(systemName: "crown.fill")
                                    .font(.system(size: 10))
                                Text("Premium")
                                    .font(.system(size: 10, weight: .bold))
                            }
                            .foregroundStyle(.yellow)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 3)
                            .background(Color.yellow.opacity(0.1))
                            .clipShape(Capsule())
                        } else {
                            Text("\(viewModel.remainingCalls)/\(ChatViewModel.dailyLimit)")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundStyle(viewModel.remainingCalls <= 5 ? .red : DIQuestTheme.textTertiary)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 3)
                                .background(Color.white.opacity(0.06))
                                .clipShape(Capsule())
                        }

                        Button {
                            viewModel.startNewSession(lang: lang)
                        } label: {
                            Image(systemName: "square.and.pencil")
                                .foregroundStyle(DIQuestTheme.accent)
                        }
                    }
                }
            }
            .sheet(isPresented: $showSessionList) {
                ChatSessionListView(viewModel: viewModel)
            }
            .onAppear {
                if viewModel.messages.isEmpty {
                    viewModel.addGreeting(lang: lang)
                }
                viewModel.configure(authManager: authManager, progressVM: progressVM)
            }
        }
    }

    // MARK: - Quick Actions

    private var quickActions: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                QuickActionButton(
                    title: lang.string("chat.explainConcept"),
                    icon: "lightbulb.fill"
                ) {
                    viewModel.sendMessage(lang.string("chat.explainConceptMsg"), lang: lang)
                }
                QuickActionButton(
                    title: lang.string("chat.imStuck"),
                    icon: "questionmark.circle.fill"
                ) {
                    viewModel.sendMessage(lang.string("chat.imStuckMsg"), lang: lang)
                }
                QuickActionButton(
                    title: lang.string("chat.interviewTips"),
                    icon: "person.fill.questionmark"
                ) {
                    viewModel.sendMessage(lang.string("chat.interviewTipsMsg"), lang: lang)
                }
                QuickActionButton(
                    title: lang.string("chat.myProgress"),
                    icon: "chart.bar.fill"
                ) {
                    viewModel.sendMessage(lang.string("chat.myProgressMsg"), lang: lang)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 8)
        }
    }

    // MARK: - Input Bar

    private var inputBar: some View {
        HStack(spacing: 12) {
            TextField(lang.string("chat.placeholder"), text: $viewModel.inputText, axis: .vertical)
                .textFieldStyle(.plain)
                .foregroundStyle(.white)
                .lineLimit(1...4)
                .focused($isInputFocused)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(Color.white.opacity(0.08))
                .clipShape(RoundedRectangle(cornerRadius: 20))

            Button {
                isInputFocused = false
                viewModel.sendMessage(viewModel.inputText, lang: lang)
            } label: {
                Image(systemName: "arrow.up.circle.fill")
                    .font(.system(size: 32))
                    .foregroundStyle(viewModel.inputText.trimmingCharacters(in: .whitespaces).isEmpty
                        ? DIQuestTheme.textTertiary : DIQuestTheme.accent)
            }
            .disabled(viewModel.inputText.trimmingCharacters(in: .whitespaces).isEmpty || viewModel.isLoading)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(DIQuestTheme.background)
    }
}

// MARK: - Chat Bubble with Markdown

private struct ChatBubble: View {
    let message: ChatMessage

    var body: some View {
        HStack {
            if message.role == .user { Spacer(minLength: 60) }

            VStack(alignment: message.role == .user ? .trailing : .leading, spacing: 4) {
                if message.role == .assistant {
                    HStack(spacing: 6) {
                        Image(systemName: "sparkles")
                            .font(.system(size: 12))
                            .foregroundStyle(DIQuestTheme.accent)
                        Text(LanguageManager.shared.string("chat.botName"))
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundStyle(DIQuestTheme.accent)
                    }
                }

                if message.role == .assistant {
                    SimpleMarkdownText(text: message.content)
                        .padding(12)
                        .background(Color.white.opacity(0.06))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                } else {
                    Text(message.content)
                        .font(.system(size: 15))
                        .foregroundStyle(.white)
                        .padding(12)
                        .background(DIQuestTheme.accentGradient)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .fixedSize(horizontal: false, vertical: true)
                }
            }

            if message.role == .assistant { Spacer(minLength: 60) }
        }
    }
}

// MARK: - Simple Markdown Text (for chat)

private struct SimpleMarkdownText: View {
    let text: String

    var body: some View {
        let parts = parseMarkdown(text)
        VStack(alignment: .leading, spacing: 4) {
            ForEach(Array(parts.enumerated()), id: \.offset) { _, part in
                renderPart(part)
            }
        }
        .fixedSize(horizontal: false, vertical: true)
    }

    private enum Part {
        case text(String)
        case bold(String)
        case heading(String)
        case bullet(String)
        case numbered(Int, String)
    }

    private func parseMarkdown(_ input: String) -> [Part] {
        var parts: [Part] = []
        let lines = input.components(separatedBy: "\n")
        var num = 0
        for line in lines {
            let t = line.trimmingCharacters(in: .whitespaces)
            if t.isEmpty { num = 0; continue }
            if t.hasPrefix("### ") || t.hasPrefix("## ") || t.hasPrefix("# ") {
                let content = t.replacingOccurrences(of: "^#{1,3}\\s+", with: "", options: .regularExpression)
                parts.append(.heading(content))
            } else if t.hasPrefix("- ") || t.hasPrefix("* ") || t.hasPrefix("• ") {
                parts.append(.bullet(String(t.dropFirst(2))))
            } else if t.range(of: #"^\d+\.\s"#, options: .regularExpression) != nil {
                num += 1
                let content = t.replacingOccurrences(of: #"^\d+\.\s*"#, with: "", options: .regularExpression)
                parts.append(.numbered(num, content))
            } else {
                parts.append(.text(t))
            }
        }
        return parts
    }

    @ViewBuilder
    private func renderPart(_ part: Part) -> some View {
        switch part {
        case .heading(let t):
            Text(renderInline(t))
                .font(.system(size: 14, weight: .bold))
                .foregroundStyle(.white)
        case .text(let t):
            Text(renderInline(t))
                .font(.system(size: 14))
                .foregroundStyle(DIQuestTheme.textSecondary)
        case .bold(let t):
            Text(t)
                .font(.system(size: 14, weight: .bold))
                .foregroundStyle(.white)
        case .bullet(let t):
            HStack(alignment: .top, spacing: 6) {
                Text("•").font(.system(size: 14, weight: .bold)).foregroundStyle(DIQuestTheme.accent).frame(width: 14)
                Text(renderInline(t)).font(.system(size: 14)).foregroundStyle(DIQuestTheme.textSecondary)
            }
        case .numbered(let n, let t):
            HStack(alignment: .top, spacing: 6) {
                Text("\(n).").font(.system(size: 14, weight: .bold)).foregroundStyle(DIQuestTheme.accent).frame(width: 20, alignment: .trailing)
                Text(renderInline(t)).font(.system(size: 14)).foregroundStyle(DIQuestTheme.textSecondary)
            }
        }
    }

    private func renderInline(_ text: String) -> AttributedString {
        var result = AttributedString()
        let pattern = #"\*\*(.+?)\*\*"#
        var remaining = text

        while let range = remaining.range(of: pattern, options: .regularExpression) {
            let before = String(remaining[remaining.startIndex..<range.lowerBound])
            if !before.isEmpty {
                var attr = AttributedString(before)
                attr.foregroundColor = DIQuestTheme.textSecondaryColor
                result += attr
            }
            let match = String(remaining[range])
            let boldText = match.replacingOccurrences(of: "**", with: "")
            var bold = AttributedString(boldText)
            bold.font = .system(size: 14, weight: .bold)
            bold.foregroundColor = .white
            result += bold
            remaining = String(remaining[range.upperBound...])
        }
        if !remaining.isEmpty {
            var attr = AttributedString(remaining)
            attr.foregroundColor = DIQuestTheme.textSecondaryColor
            result += attr
        }
        return result
    }
}

// MARK: - Chat Session List

struct ChatSessionListView: View {
    @ObservedObject var viewModel: ChatViewModel
    @ObservedObject private var lang = LanguageManager.shared
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                DIQuestTheme.background.ignoresSafeArea()

                if viewModel.sessions.isEmpty {
                    VStack(spacing: 12) {
                        Image(systemName: "bubble.left.and.bubble.right")
                            .font(.system(size: 48))
                            .foregroundStyle(DIQuestTheme.textTertiary)
                        Text(lang.string("chat.noChatHistory"))
                            .foregroundStyle(DIQuestTheme.textSecondary)
                    }
                } else {
                    List {
                        ForEach(viewModel.sessions) { session in
                            Button {
                                viewModel.loadSession(session)
                                dismiss()
                            } label: {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(session.title.isEmpty ? lang.string("chat.newChat") : session.title)
                                        .font(.system(size: 15, weight: .medium))
                                        .foregroundStyle(session.id == viewModel.currentSessionId ? DIQuestTheme.accent : .white)
                                        .lineLimit(1)
                                    Text(session.updatedAt, style: .relative)
                                        .font(.caption)
                                        .foregroundStyle(DIQuestTheme.textTertiary)
                                }
                            }
                            .listRowBackground(DIQuestTheme.cardBackground)
                        }
                        .onDelete { indexSet in
                            for i in indexSet {
                                viewModel.deleteSession(viewModel.sessions[i])
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle(lang.string("chat.chatHistory"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(lang.string("action.done")) { dismiss() }
                }
            }
        }
    }
}

// MARK: - Typing Indicator

private struct TypingIndicator: View {
    @State private var dotIndex = 0
    let timer = Timer.publish(every: 0.4, on: .main, in: .common).autoconnect()

    var body: some View {
        HStack {
            HStack(spacing: 4) {
                ForEach(0..<3, id: \.self) { i in
                    Circle()
                        .fill(DIQuestTheme.accent.opacity(i == dotIndex ? 1 : 0.3))
                        .frame(width: 8, height: 8)
                }
            }
            .padding(12)
            .background(Color.white.opacity(0.06))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            Spacer()
        }
        .onReceive(timer) { _ in
            dotIndex = (dotIndex + 1) % 3
        }
    }
}

// MARK: - Quick Action Button

private struct QuickActionButton: View {
    let title: String
    let icon: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.system(size: 12))
                Text(title)
                    .font(.system(size: 13, weight: .medium))
            }
            .foregroundStyle(DIQuestTheme.accent)
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(DIQuestTheme.accent.opacity(0.1))
            .clipShape(Capsule())
            .overlay(Capsule().strokeBorder(DIQuestTheme.accent.opacity(0.3), lineWidth: 1))
        }
    }
}
