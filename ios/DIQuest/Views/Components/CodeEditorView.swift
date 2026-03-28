import SwiftUI

struct CodeEditorView: View {
    @Binding var code: String
    let isDisabled: Bool
    var language: String = "SQL"
    var starterCode: String = ""
    @ObservedObject private var lang = LanguageManager.shared

    private static let sqlKeywords: Set<String> = [
        "SELECT", "FROM", "WHERE", "JOIN", "LEFT", "RIGHT", "INNER", "OUTER",
        "ON", "AND", "OR", "NOT", "IN", "LIKE", "BETWEEN", "IS", "NULL",
        "GROUP", "BY", "ORDER", "ASC", "DESC", "HAVING", "LIMIT", "OFFSET",
        "INSERT", "INTO", "VALUES", "UPDATE", "SET", "DELETE", "CREATE",
        "TABLE", "DROP", "ALTER", "INDEX", "AS", "DISTINCT", "COUNT",
        "SUM", "AVG", "MIN", "MAX", "CASE", "WHEN", "THEN", "ELSE", "END",
        "UNION", "ALL", "EXISTS", "WITH", "OVER", "PARTITION", "ROW_NUMBER",
        "RANK", "DENSE_RANK", "COALESCE", "CAST", "NULLIF", "TOP", "FETCH",
        "NEXT", "ROWS", "ONLY", "CROSS", "FULL", "NATURAL", "USING",
        "PRIMARY", "KEY", "FOREIGN", "REFERENCES", "CONSTRAINT", "CHECK",
        "DEFAULT", "UNIQUE", "IF", "REPLACE", "VIEW", "TRIGGER", "PROCEDURE",
        "FUNCTION", "RETURN", "RETURNS", "BEGIN", "DECLARE", "CURSOR", "OPEN",
        "CLOSE", "TRUE", "FALSE"
    ]

    private var lines: [String] {
        let result = code.components(separatedBy: "\n")
        return result.isEmpty ? [""] : result
    }

    var body: some View {
        VStack(spacing: 0) {
            // Toolbar
            HStack(spacing: 8) {
                Image(systemName: "chevron.left.forwardslash.chevron.right")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundStyle(DIQuestTheme.accent)
                Text(language)
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                    .foregroundStyle(DIQuestTheme.accent)

                Spacer()

                Text("\(lines.count) \(lang.string("code.lines"))")
                    .font(.system(size: 11, design: .monospaced))
                    .foregroundStyle(DIQuestTheme.textTertiary)

                if !isDisabled {
                    Button {
                        code = starterCode
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundStyle(DIQuestTheme.textTertiary)
                    }
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color.white.opacity(0.04))

            Divider().background(Color.white.opacity(0.1))

            // Editor
            HStack(alignment: .top, spacing: 0) {
                // Line numbers
                VStack(alignment: .trailing, spacing: 0) {
                    ForEach(1...max(1, lines.count), id: \.self) { num in
                        Text("\(num)")
                            .font(.system(size: 13, design: .monospaced))
                            .foregroundStyle(DIQuestTheme.textTertiary.opacity(0.5))
                            .frame(height: 20)
                    }
                }
                .frame(width: 32)
                .padding(.top, 10)
                .padding(.trailing, 4)

                Divider()
                    .frame(width: 1)
                    .background(Color.white.opacity(0.06))

                // Code input
                ZStack(alignment: .topLeading) {
                    // Placeholder
                    if code.isEmpty {
                        Text(lang.string("code.placeholder"))
                            .font(.system(size: 13, design: .monospaced))
                            .foregroundStyle(DIQuestTheme.textTertiary.opacity(0.5))
                            .padding(.top, 10)
                            .padding(.leading, 8)
                    }

                    // Highlighted preview (behind editor)
                    Text(highlightedSQL(code))
                        .font(.system(size: 13, design: .monospaced))
                        .lineSpacing(0)
                        .padding(.top, 10)
                        .padding(.leading, 8)
                        .frame(maxWidth: .infinity, alignment: .topLeading)

                    // Transparent TextEditor for input
                    TextEditor(text: $code)
                        .font(.system(size: 13, design: .monospaced))
                        .foregroundColor(.clear)
                        .scrollContentBackground(.hidden)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .disabled(isDisabled)
                        .padding(.leading, 4)
                        .padding(.top, 2)
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                                Button(lang.string("action.done")) {
                                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                }
                                .fontWeight(.semibold)
                            }
                        }
                }
            }
            .frame(minHeight: 160)
        }
        .background(Color(red: 0.08, green: 0.08, blue: 0.12))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(DIQuestTheme.accent.opacity(0.3), lineWidth: 1)
        )
    }

    // MARK: - Syntax Highlighting

    private func highlightedSQL(_ text: String) -> AttributedString {
        var result = AttributedString()
        let tokens = tokenize(text)
        for token in tokens {
            var attr = AttributedString(token.text)
            attr.font = .system(size: 13, design: .monospaced)
            switch token.type {
            case .keyword:
                attr.foregroundColor = UIColor(Color(red: 0.4, green: 0.6, blue: 1.0))
            case .string:
                attr.foregroundColor = UIColor(Color(red: 0.6, green: 0.9, blue: 0.5))
            case .number:
                attr.foregroundColor = UIColor(Color.orange)
            case .comment:
                attr.foregroundColor = UIColor(DIQuestTheme.textTertiary)
            case .plain:
                attr.foregroundColor = UIColor(.white)
            }
            result.append(attr)
        }
        return result
    }

    private func tokenize(_ text: String) -> [SQLToken] {
        var tokens: [SQLToken] = []
        var current = ""
        var inString = false
        var stringChar: Character = "'"
        var inLineComment = false
        let chars = Array(text)
        var i = 0

        while i < chars.count {
            let ch = chars[i]

            // Line comment
            if !inString && ch == "-" && i + 1 < chars.count && chars[i + 1] == "-" {
                if !current.isEmpty { tokens.append(classifyWord(current)); current = "" }
                var comment = ""
                while i < chars.count && chars[i] != "\n" {
                    comment.append(chars[i])
                    i += 1
                }
                tokens.append(SQLToken(text: comment, type: .comment))
                continue
            }

            // String literals
            if !inString && (ch == "'" || ch == "\"") {
                if !current.isEmpty { tokens.append(classifyWord(current)); current = "" }
                inString = true
                stringChar = ch
                var str = String(ch)
                i += 1
                while i < chars.count {
                    str.append(chars[i])
                    if chars[i] == stringChar { i += 1; break }
                    i += 1
                }
                tokens.append(SQLToken(text: str, type: .string))
                inString = false
                continue
            }

            // Word boundaries
            if ch.isWhitespace || "(),;.*+=<>!".contains(ch) {
                if !current.isEmpty { tokens.append(classifyWord(current)); current = "" }
                tokens.append(SQLToken(text: String(ch), type: .plain))
                i += 1
                continue
            }

            current.append(ch)
            i += 1
        }
        if !current.isEmpty { tokens.append(classifyWord(current)) }
        return tokens
    }

    private func classifyWord(_ word: String) -> SQLToken {
        if Self.sqlKeywords.contains(word.uppercased()) {
            return SQLToken(text: word, type: .keyword)
        }
        if Double(word) != nil {
            return SQLToken(text: word, type: .number)
        }
        return SQLToken(text: word, type: .plain)
    }
}

private struct SQLToken {
    let text: String
    let type: TokenType

    enum TokenType {
        case keyword, string, number, comment, plain
    }
}
