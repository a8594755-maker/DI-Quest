import SwiftUI

struct ChallengePlayView: View {
    let challenge: Challenge
    let questId: String
    let questXp: Int
    let allChallenges: [Challenge]
    let onNext: (() -> Void)?
    var isReviewMode: Bool = false

    @EnvironmentObject var progressVM: QuestProgressViewModel
    @Environment(\.dismiss) private var dismiss

    @State private var selectedOptionId: String?
    @State private var hasSubmitted = false
    @State private var showHints = false
    @State private var hintsRevealed = 0
    @State private var attempts = 0
    @State private var codeInput: String = ""
    @State private var showExpectedOutput = false
    @State private var showSchema = false
    @State private var codeIsCorrect = false
    // Open-ended states
    @State private var openEndedAnswer: String = ""
    @State private var isEvaluating = false
    @State private var aiEvaluationResult: String?
    @State private var openEndedScore: Int?

    private var isCorrect: Bool {
        if challenge.type == .code {
            return codeIsCorrect
        }
        if challenge.type == .openEnded {
            return (openEndedScore ?? 0) >= 60
        }
        return selectedOptionId == challenge.correctAnswer
    }

    private var isAlreadyCompleted: Bool {
        progressVM.isChallengeCompleted(questId: questId, challengeId: challenge.id)
    }

    var body: some View {
        ZStack {
            DIQuestTheme.background.ignoresSafeArea()

            ScrollView {

                VStack(alignment: .leading, spacing: 20) {
                    // Header: challenge number and difficulty
                    headerSection

                    // Scenario (if present)
                    if let scenario = challenge.scenario {
                        scenarioSection(scenario)
                    }

                    // Question
                    Text(challenge.question)
                        .font(.system(size: 17, weight: .medium))
                        .foregroundStyle(.white)
                        .fixedSize(horizontal: false, vertical: true)

                    // Options (multiple choice)
                    if let options = challenge.options {
                        optionsSection(options)
                    }

                    // Code editor (for code challenges)
                    if challenge.type == .code {
                        codeEditorSection
                    }

                    // Open-ended text input
                    if challenge.type == .openEnded {
                        openEndedSection
                    }

                    // Hints
                    if !challenge.hints.isEmpty && !hasSubmitted {
                        hintsSection
                    }

                    // Result + Explanation (after submit)
                    if hasSubmitted {
                        resultSection
                    }

                    // Action button
                    actionButton

                    Spacer().frame(height: 40)
                }
                .padding()
            }
            .scrollDismissesKeyboard(.interactively)
        }
        .navigationTitle("\(LanguageManager.shared.string("challenge.title")) \(challengeIndex + 1)/\(allChallenges.count)")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            if challenge.type == .code && codeInput.isEmpty {
                codeInput = challenge.starterCode ?? ""
            }
        }
    }

    // MARK: - Header

    private var headerSection: some View {
        HStack {
            // Difficulty badge
            Text(challenge.difficulty.rawValue.capitalized)
                .font(.system(size: 11, weight: .bold))
                .foregroundStyle(difficultyColor)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(difficultyColor.opacity(0.15))
                .clipShape(Capsule())

            // Type badge
            Text(challengeTypeLabel)
                .font(.system(size: 11, weight: .bold))
                .foregroundStyle(DIQuestTheme.textTertiary)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.white.opacity(0.06))
                .clipShape(Capsule())

            Spacer()

            if isAlreadyCompleted {
                Label(LanguageManager.shared.string("challenge.alreadyCompleted"), systemImage: "checkmark.circle.fill")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(DIQuestTheme.accent)
            }
        }
    }

    // MARK: - Scenario

    @ViewBuilder
    private func scenarioSection(_ scenario: Challenge.Scenario) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(scenario.title)
                .font(.system(size: 15, weight: .bold))
                .foregroundStyle(DIQuestTheme.accent)

            Text(scenario.narrative)
                .font(.system(size: 14))
                .foregroundStyle(DIQuestTheme.textSecondary)
                .fixedSize(horizontal: false, vertical: true)

            // Data table
            if let data = scenario.data, !data.isEmpty {
                if let caption = scenario.dataCaption {
                    Text(caption)
                        .font(.caption)
                        .foregroundStyle(DIQuestTheme.textTertiary)
                }

                dataTable(data)

                // Auto-generated chart from data
                ChallengeChartView(data: data)
            }
        }
        .padding()
        .background(DIQuestTheme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(DIQuestTheme.accent.opacity(0.3))
        )
    }

    @ViewBuilder
    private func dataTable(_ data: [[String: String]]) -> some View {
        if let keys = data.first?.keys.sorted() {
            ScrollView(.horizontal, showsIndicators: false) {
                VStack(spacing: 0) {
                    // Header row
                    HStack(spacing: 0) {
                        ForEach(keys, id: \.self) { key in
                            Text(key)
                                .font(.system(size: 11, weight: .bold))
                                .foregroundStyle(DIQuestTheme.accent)
                                .frame(minWidth: 80, alignment: .leading)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 6)
                        }
                    }
                    .background(DIQuestTheme.accent.opacity(0.1))

                    // Data rows
                    ForEach(Array(data.enumerated()), id: \.offset) { index, row in
                        HStack(spacing: 0) {
                            ForEach(keys, id: \.self) { key in
                                Text(row[key] ?? "-")
                                    .font(.system(size: 11))
                                    .foregroundStyle(DIQuestTheme.textSecondary)
                                    .frame(minWidth: 80, alignment: .leading)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 5)
                            }
                        }
                        .background(index % 2 == 0 ? Color.clear : Color.white.opacity(0.02))
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(Color.white.opacity(0.08))
                )
            }
        }
    }

    // MARK: - Options

    @ViewBuilder
    private func optionsSection(_ options: [Challenge.Option]) -> some View {
        VStack(spacing: 10) {
            ForEach(options) { option in
                Button {
                    guard !hasSubmitted else { return }
                    HapticService.trigger("selection")
                    selectedOptionId = option.id
                } label: {
                    optionRow(option)
                }
                .buttonStyle(.plain)
                .disabled(hasSubmitted)
            }
        }
    }

    @ViewBuilder
    private func optionRow(_ option: Challenge.Option) -> some View {
        let isSelected = selectedOptionId == option.id
        let isAnswer = option.id == challenge.correctAnswer
        let borderColor: Color = {
            if !hasSubmitted {
                return isSelected ? DIQuestTheme.accent : Color.white.opacity(0.1)
            }
            if isAnswer { return .green }
            if isSelected && !isAnswer { return .red }
            return Color.white.opacity(0.06)
        }()
        let bgColor: Color = {
            if !hasSubmitted {
                return isSelected ? DIQuestTheme.accent.opacity(0.12) : Color.white.opacity(0.04)
            }
            if isAnswer { return Color.green.opacity(0.1) }
            if isSelected && !isAnswer { return Color.red.opacity(0.1) }
            return Color.white.opacity(0.02)
        }()

        HStack(alignment: .top, spacing: 10) {
            // Radio indicator
            ZStack {
                Circle()
                    .stroke(borderColor, lineWidth: 2)
                    .frame(width: 22, height: 22)
                if isSelected || (hasSubmitted && isAnswer) {
                    Circle()
                        .fill(borderColor)
                        .frame(width: 12, height: 12)
                }
            }
            .padding(.top, 1)

            VStack(alignment: .leading, spacing: 6) {
                Text(option.text)
                    .font(.system(size: 15))
                    .foregroundStyle(hasSubmitted && !isAnswer && !isSelected ? DIQuestTheme.textTertiary : .white)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.leading)

                // Show explanation after submission
                if hasSubmitted && (isSelected || isAnswer) {
                    Text(option.explanation)
                        .font(.system(size: 13))
                        .foregroundStyle(isAnswer ? Color.green.opacity(0.8) : Color.red.opacity(0.8))
                        .fixedSize(horizontal: false, vertical: true)
                }
            }

            Spacer(minLength: 0)
        }
        .padding(14)
        .frame(maxWidth: .infinity, minHeight: 52, alignment: .leading)
        .background(bgColor)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(borderColor, lineWidth: 1.5)
        )
    }

    // MARK: - Hints

    private var hintsSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Button {
                withAnimation(.easeInOut(duration: 0.25)) {
                    showHints.toggle()
                }
            } label: {
                HStack {
                    Image(systemName: "lightbulb.fill")
                        .foregroundStyle(.yellow)
                    Text("\(LanguageManager.shared.string("challenge.hint")) (\(challenge.hints.count))")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(.yellow)
                    Spacer()
                    Image(systemName: showHints ? "chevron.up" : "chevron.down")
                        .font(.caption)
                        .foregroundStyle(.yellow.opacity(0.6))
                }
            }

            if showHints {
                ForEach(0..<challenge.hints.count, id: \.self) { index in
                    if index < hintsRevealed {
                        HStack(alignment: .top, spacing: 8) {
                            Text("\(index + 1).")
                                .font(.system(size: 13, weight: .bold))
                                .foregroundStyle(.yellow.opacity(0.7))
                            Text(challenge.hints[index])
                                .font(.system(size: 13))
                                .foregroundStyle(DIQuestTheme.textSecondary)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .transition(.opacity.combined(with: .move(edge: .top)))
                    }
                }

                if hintsRevealed < challenge.hints.count {
                    Button {
                        withAnimation {
                            hintsRevealed += 1
                        }
                    } label: {
                        Text(LanguageManager.shared.string("challenge.showNextHint"))
                            .font(.system(size: 13, weight: .medium))
                            .foregroundStyle(.yellow.opacity(0.8))
                    }
                }
            }
        }
        .padding()
        .background(Color.yellow.opacity(0.06))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(Color.yellow.opacity(0.2))
        )
    }

    // MARK: - Code Editor Section

    private var codeLanguage: String {
        if let starter = challenge.starterCode,
           starter.contains("def ") || starter.contains("import ") || starter.contains("class ") {
            return "Python"
        }
        return "SQL"
    }

    private var codeEditorSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Schema section (for SQL challenges with sampleSchema)
            if let schema = challenge.sampleSchema, !schema.isEmpty {
                VStack(alignment: .leading, spacing: 8) {
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            showSchema.toggle()
                        }
                    } label: {
                        HStack(spacing: 6) {
                            Image(systemName: "tablecells")
                                .font(.system(size: 13))
                            Text(LanguageManager.shared.string("code.schema"))
                                .font(.system(size: 13, weight: .medium))
                            Spacer()
                            Image(systemName: showSchema ? "chevron.up" : "chevron.down")
                                .font(.caption)
                        }
                        .foregroundStyle(DIQuestTheme.accent)
                    }

                    if showSchema {
                        ScrollView(.horizontal, showsIndicators: false) {
                            Text(schema.trimmingCharacters(in: .whitespacesAndNewlines))
                                .font(.system(size: 12, design: .monospaced))
                                .foregroundStyle(DIQuestTheme.textSecondary)
                                .padding(10)
                        }
                        .background(Color(red: 0.08, green: 0.08, blue: 0.12))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .transition(.opacity)
                    }
                }
                .padding()
                .background(DIQuestTheme.cardBackground)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .strokeBorder(DIQuestTheme.accent.opacity(0.2))
                )
            }

            CodeEditorView(
                code: $codeInput,
                isDisabled: hasSubmitted,
                language: codeLanguage,
                starterCode: challenge.starterCode ?? ""
            )

            // Expected output toggle
            if let data = challenge.scenario?.data, !data.isEmpty {
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        showExpectedOutput.toggle()
                    }
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: showExpectedOutput ? "eye.slash" : "table")
                            .font(.system(size: 13))
                        Text(LanguageManager.shared.string("code.expectedOutput"))
                            .font(.system(size: 13, weight: .medium))
                    }
                    .foregroundStyle(DIQuestTheme.accent)
                }

                if showExpectedOutput {
                    dataTable(data)
                        .transition(.opacity)
                }
            }
        }
    }

    // MARK: - Result

    @ViewBuilder
    private var resultSection: some View {
        if challenge.type == .code {
            codeResultSection
        } else if challenge.type == .openEnded {
            openEndedResultSection
        } else {
            mcqResultSection
        }
    }

    private var codeResultSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: codeIsCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .font(.title3)
                Text(codeIsCorrect ? LanguageManager.shared.string("challenge.correct") : LanguageManager.shared.string("challenge.wrong"))
                    .font(.system(size: 17, weight: .bold))
            }
            .foregroundStyle(codeIsCorrect ? .green : .red)

            // Expected query (reference answer code)
            if let expected = challenge.expectedQuery, !expected.isEmpty {
                VStack(alignment: .leading, spacing: 6) {
                    Text(LanguageManager.shared.string("code.referenceAnswer"))
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(DIQuestTheme.textTertiary)

                    ScrollView(.horizontal, showsIndicators: false) {
                        Text(expected.trimmingCharacters(in: .whitespacesAndNewlines))
                            .font(.system(size: 13, design: .monospaced))
                            .foregroundStyle(Color(red: 0.6, green: 0.9, blue: 0.5))
                            .padding(10)
                    }
                    .background(Color(red: 0.08, green: 0.08, blue: 0.12))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }

            // Explanation
            Text(challenge.explanation)
                .font(.system(size: 14))
                .foregroundStyle(DIQuestTheme.textSecondary)
                .fixedSize(horizontal: false, vertical: true)

            // Framework tip
            if let tip = challenge.frameworkTip {
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "brain.head.profile")
                        .foregroundStyle(DIQuestTheme.accent)
                    Text(tip)
                        .font(.system(size: 13))
                        .foregroundStyle(DIQuestTheme.accent.opacity(0.9))
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(12)
                .background(DIQuestTheme.accent.opacity(0.08))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding()
        .background(DIQuestTheme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder((codeIsCorrect ? Color.green : Color.red).opacity(0.3))
        )
    }

    private var mcqResultSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Correct / Wrong banner
            HStack {
                Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .font(.title3)
                Text(isCorrect ? LanguageManager.shared.string("challenge.correct") : LanguageManager.shared.string("challenge.wrong"))
                    .font(.system(size: 17, weight: .bold))
            }
            .foregroundStyle(isCorrect ? .green : .red)

            // Explanation
            Text(challenge.explanation)
                .font(.system(size: 14))
                .foregroundStyle(DIQuestTheme.textSecondary)
                .fixedSize(horizontal: false, vertical: true)

            // Framework tip
            if let tip = challenge.frameworkTip {
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "brain.head.profile")
                        .foregroundStyle(DIQuestTheme.accent)
                    Text(tip)
                        .font(.system(size: 13))
                        .foregroundStyle(DIQuestTheme.accent.opacity(0.9))
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(12)
                .background(DIQuestTheme.accent.opacity(0.08))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding()
        .background(DIQuestTheme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder((isCorrect ? Color.green : Color.red).opacity(0.3))
        )
    }

    // MARK: - Open-Ended Result

    private var openEndedResultSection: some View {
        let passed = (openEndedScore ?? 0) >= 60
        return VStack(alignment: .leading, spacing: 12) {
            // Score banner
            HStack {
                Image(systemName: passed ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .font(.title3)
                Text(passed
                    ? LanguageManager.shared.string("openEnded.passed")
                    : LanguageManager.shared.string("openEnded.failed"))
                    .font(.system(size: 17, weight: .bold))
                Spacer()
                Text("\(LanguageManager.shared.string("openEnded.score")): \(openEndedScore ?? 0)/100")
                    .font(.system(size: 15, weight: .bold, design: .rounded))
            }
            .foregroundStyle(passed ? .green : .red)

            // Score bar
            ProgressView(value: Double(openEndedScore ?? 0) / 100.0)
                .tint(passed ? .green : .red)

            // AI evaluation text (markdown-like rendering)
            if let result = aiEvaluationResult {
                Text(result)
                    .font(.system(size: 14))
                    .foregroundStyle(DIQuestTheme.textSecondary)
                    .fixedSize(horizontal: false, vertical: true)
            }

            // Explanation
            if !challenge.explanation.isEmpty {
                Text(challenge.explanation)
                    .font(.system(size: 14))
                    .foregroundStyle(DIQuestTheme.textSecondary)
                    .fixedSize(horizontal: false, vertical: true)
            }

            // Framework tip
            if let tip = challenge.frameworkTip {
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "brain.head.profile")
                        .foregroundStyle(DIQuestTheme.accent)
                    Text(tip)
                        .font(.system(size: 13))
                        .foregroundStyle(DIQuestTheme.accent.opacity(0.9))
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(12)
                .background(DIQuestTheme.accent.opacity(0.08))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }

            // Retry button if failed
            if !passed {
                Button {
                    hasSubmitted = false
                    aiEvaluationResult = nil
                    openEndedScore = nil
                } label: {
                    HStack {
                        Image(systemName: "arrow.counterclockwise")
                        Text(LanguageManager.shared.string("openEnded.retry"))
                    }
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(DIQuestTheme.accent)
                }
            }
        }
        .padding()
        .background(DIQuestTheme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder((passed ? Color.green : Color.red).opacity(0.3))
        )
    }

    // MARK: - Action Button

    @ViewBuilder
    private var actionButton: some View {
        if isAlreadyCompleted && !hasSubmitted && !isReviewMode {
            // Already completed — show next/done without allowing re-submission
            Button {
                if let onNext {
                    onNext()
                } else {
                    dismiss()
                }
            } label: {
                Text(hasNextChallenge ? LanguageManager.shared.string("action.next") : LanguageManager.shared.string("action.done"))
                    .font(.system(size: 17, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(DIQuestTheme.accentGradient)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
            }
        } else if !hasSubmitted {
            Button {
                submit()
            } label: {
                HStack(spacing: 8) {
                    if isEvaluating {
                        ProgressView()
                            .tint(.white)
                    }
                    Text(isEvaluating
                        ? LanguageManager.shared.string("openEnded.evaluating")
                        : (challenge.type == .openEnded
                            ? LanguageManager.shared.string("openEnded.submit")
                            : LanguageManager.shared.string("action.submit")))
                }
                    .font(.system(size: 17, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(
                        canSubmit
                            ? AnyShapeStyle(DIQuestTheme.accentGradient)
                            : AnyShapeStyle(Color.white.opacity(0.1))
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 14))
            }
            .disabled(!canSubmit || isEvaluating)
        } else {
            Button {
                if let onNext {
                    onNext()
                } else {
                    dismiss()
                }
            } label: {
                Text(hasNextChallenge ? LanguageManager.shared.string("action.next") : LanguageManager.shared.string("action.done"))
                    .font(.system(size: 17, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(DIQuestTheme.accentGradient)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
            }
        }
    }

    // MARK: - Logic

    private func submit() {
        attempts += 1

        if challenge.type == .openEnded {
            // Open-ended: submit to AI for evaluation
            isEvaluating = true
            Task {
                await evaluateOpenEnded()
            }
            return
        }

        hasSubmitted = true

        if challenge.type == .code {
            // Validate code against expected query
            codeIsCorrect = validateCode(userCode: codeInput, expectedCode: challenge.expectedQuery)
            let score = codeIsCorrect ? 100 : 0
            HapticService.trigger(codeIsCorrect ? "success" : "error")
            if !isAlreadyCompleted || isReviewMode {
                progressVM.completeChallenge(
                    questId: questId,
                    challengeId: challenge.id,
                    score: score,
                    baseXp: questXp / max(1, allChallenges.count),
                    usedHints: hintsRevealed,
                    attempts: attempts,
                    isReview: isReviewMode
                )
            }
        } else {
            let score = isCorrect ? 100 : 0
            HapticService.trigger(isCorrect ? "success" : "error")

            if !isAlreadyCompleted || isReviewMode {
                progressVM.completeChallenge(
                    questId: questId,
                    challengeId: challenge.id,
                    score: score,
                    baseXp: questXp / max(1, allChallenges.count),
                    usedHints: hintsRevealed,
                    attempts: attempts,
                    isReview: isReviewMode
                )
            }
        }
    }

    /// Normalize and compare user code against expected code
    private func validateCode(userCode: String, expectedCode: String?) -> Bool {
        guard let expected = expectedCode, !expected.isEmpty else {
            // No expected code to validate against — cannot auto-validate
            return false
        }
        let normalizedUser = normalizeCode(userCode)
        let normalizedExpected = normalizeCode(expected)

        // Exact match after normalization
        if normalizedUser == normalizedExpected { return true }

        // Check if all key tokens from expected appear in user code (order-independent)
        let expectedTokens = Set(normalizedExpected.split(separator: " ").map(String.init))
        let userTokens = Set(normalizedUser.split(separator: " ").map(String.init))
        let matchedTokens = expectedTokens.intersection(userTokens)
        let matchRatio = Double(matchedTokens.count) / Double(max(1, expectedTokens.count))

        // Require at least 80% keyword match
        return matchRatio >= 0.8
    }

    /// Normalize code for comparison: lowercase, collapse whitespace, trim, remove trailing semicolons
    private func normalizeCode(_ code: String) -> String {
        var result = code
            .lowercased()
            .replacingOccurrences(of: "\\s+", with: " ", options: .regularExpression)
            .trimmingCharacters(in: .whitespacesAndNewlines)
        // Remove trailing semicolons
        while result.hasSuffix(";") {
            result = String(result.dropLast()).trimmingCharacters(in: .whitespaces)
        }
        return result
    }

    // MARK: - Open-Ended Section

    private var openEndedSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            TextEditor(text: $openEndedAnswer)
                .font(.system(size: 15))
                .foregroundStyle(.white)
                .scrollContentBackground(.hidden)
                .frame(minHeight: 200)
                .padding(12)
                .background(Color(red: 0.08, green: 0.08, blue: 0.12))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .strokeBorder(Color.white.opacity(0.1))
                )
                .disabled(hasSubmitted || isEvaluating)
                .overlay(alignment: .topLeading) {
                    if openEndedAnswer.isEmpty {
                        Text(LanguageManager.shared.string("openEnded.placeholder"))
                            .font(.system(size: 15))
                            .foregroundStyle(DIQuestTheme.textTertiary)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 20)
                            .allowsHitTesting(false)
                    }
                }

            // Character count
            HStack {
                let charCount = openEndedAnswer.trimmingCharacters(in: .whitespacesAndNewlines).count
                Text("\(charCount)")
                    .font(.system(size: 12, design: .monospaced))
                    .foregroundStyle(charCount >= 20 ? DIQuestTheme.accent : DIQuestTheme.textTertiary)
                if charCount < 20 {
                    Text(LanguageManager.shared.string("openEnded.minChars"))
                        .font(.system(size: 12))
                        .foregroundStyle(DIQuestTheme.textTertiary)
                }
                Spacer()
            }

            if isEvaluating {
                HStack(spacing: 8) {
                    ProgressView()
                        .tint(DIQuestTheme.accent)
                    Text(LanguageManager.shared.string("openEnded.evaluating"))
                        .font(.system(size: 14))
                        .foregroundStyle(DIQuestTheme.textSecondary)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
            }
        }
    }

    // MARK: - Open-Ended AI Evaluation

    @MainActor
    private func evaluateOpenEnded() async {
        let lang = LanguageManager.shared
        let isEn = lang.isEnglish

        let responseFormat = isEn ? """
        ## Score: [0-100]

        ## Strengths
        - [Specific strength 1]
        - [Specific strength 2]

        ## Suggestions for Improvement
        - [Specific suggestion 1]
        - [Specific suggestion 2]

        ## Reference Direction
        [Briefly describe what a more complete answer should include]
        """ : """
        ## 分數：[0-100]

        ## 優點
        - [具體的優點 1]
        - [具體的優點 2]

        ## 改進建議
        - [具體的改進建議 1]
        - [具體的改進建議 2]

        ## 參考方向
        [簡短說明一個更完整的回答應該包含什麼]
        """

        let langStr = isEn ? "English" : "Traditional Chinese"
        let criteriaText = (challenge.evaluationCriteria ?? []).enumerated()
            .map { "\($0.offset + 1). \($0.element)" }
            .joined(separator: "\n")

        let systemPrompt = """
        You are an interview evaluator for Product Analyst / Business Analyst / Business Engineer roles in the tech industry.

        You will evaluate a candidate's case study answer. Be constructive but honest.
        Reply in \(langStr).

        SCENARIO:
        \(challenge.scenario?.title ?? "N/A")
        \(challenge.scenario?.narrative ?? "")

        QUESTION:
        \(challenge.question)

        EVALUATION CRITERIA:
        \(criteriaText.isEmpty ? "General quality, depth, and structure" : criteriaText)

        \(challenge.sampleAnswer != nil ? "REFERENCE ANSWER:\n\(challenge.sampleAnswer!)" : "")

        \(responseFormat)
        """

        let messages: [[String: String]] = [
            ["role": "system", "content": systemPrompt],
            ["role": "user", "content": openEndedAnswer]
        ]

        do {
            let result = try await callDeepSeekForEvaluation(messages: messages)
            aiEvaluationResult = result

            // Parse score from AI response
            let scorePattern = isEn ? "(?:Score)[：:]\\s*(\\d+)" : "(?:分數|Score)[：:]\\s*(\\d+)"
            if let regex = try? NSRegularExpression(pattern: scorePattern, options: .caseInsensitive),
               let match = regex.firstMatch(in: result, range: NSRange(result.startIndex..., in: result)),
               let scoreRange = Range(match.range(at: 1), in: result),
               let score = Int(result[scoreRange]) {
                openEndedScore = min(100, max(0, score))
            } else {
                openEndedScore = 0
            }

            let passed = (openEndedScore ?? 0) >= 60
            HapticService.trigger(passed ? "success" : "error")

            hasSubmitted = true
            isEvaluating = false

            if passed && (!isAlreadyCompleted || isReviewMode) {
                progressVM.completeChallenge(
                    questId: questId,
                    challengeId: challenge.id,
                    score: openEndedScore ?? 0,
                    baseXp: questXp / max(1, allChallenges.count),
                    usedHints: hintsRevealed,
                    attempts: attempts,
                    isReview: isReviewMode
                )
            }
        } catch {
            isEvaluating = false
            aiEvaluationResult = lang.string("chat.error")
            openEndedScore = 0
            hasSubmitted = true
        }
    }

    private func callDeepSeekForEvaluation(messages: [[String: String]]) async throws -> String {
        guard let url = URL(string: "\(AppConfig.supabaseURL)/functions/v1/deepseek-chat") else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(AppConfig.supabaseAnonKey, forHTTPHeaderField: "apikey")

        let body: [String: Any] = [
            "messages": messages,
            "model": "deepseek-chat"
        ]
        request.httpBody = try JSONSerialization.data(withJSONObject: body)

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }

        guard let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
              let choices = json["choices"] as? [[String: Any]],
              let firstChoice = choices.first,
              let message = firstChoice["message"] as? [String: Any],
              let content = message["content"] as? String else {
            throw URLError(.cannotParseResponse)
        }

        return content
    }

    // MARK: - Helpers

    private var challengeIndex: Int {
        allChallenges.firstIndex(where: { $0.id == challenge.id }) ?? 0
    }

    private var canSubmit: Bool {
        if challenge.type == .code {
            return !codeInput.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        }
        if challenge.type == .openEnded {
            return openEndedAnswer.trimmingCharacters(in: .whitespacesAndNewlines).count >= 20 && !isEvaluating
        }
        return selectedOptionId != nil
    }

    private var hasNextChallenge: Bool {
        challengeIndex < allChallenges.count - 1
    }

    private var difficultyColor: Color {
        switch challenge.difficulty {
        case .easy: return .green
        case .medium: return .orange
        case .hard: return .red
        }
    }

    private var challengeTypeLabel: String {
        switch challenge.type {
        case .multipleChoice: return LanguageManager.shared.string("challenge.multipleChoice")
        case .openEnded: return LanguageManager.shared.string("challenge.openEnded")
        case .code: return LanguageManager.shared.string("challenge.code")
        }
    }
}
