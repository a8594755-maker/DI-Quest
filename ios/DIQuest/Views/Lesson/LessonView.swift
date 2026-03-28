import SwiftUI

struct LessonView: View {
    let worldId: Int
    let worldName: String
    @ObservedObject private var lang = LanguageManager.shared

    private var lessonContent: String? {
        WorldDataRegistry.lesson(for: worldId)
    }

    var body: some View {
        ZStack {
            DIQuestTheme.background.ignoresSafeArea()

            if let content = lessonContent {
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        MarkdownContentView(markdown: content)
                            .padding()
                    }
                }
            } else {
                VStack(spacing: 12) {
                    Image(systemName: "doc.text")
                        .font(.system(size: 48))
                        .foregroundStyle(DIQuestTheme.textTertiary)
                    Text(lang.string("lesson.notFound"))
                        .foregroundStyle(DIQuestTheme.textSecondary)
                }
            }
        }
        .navigationTitle(worldName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Markdown Renderer

private struct MarkdownContentView: View {
    let markdown: String

    var body: some View {
        let blocks = parseBlocks()
        VStack(alignment: .leading, spacing: 14) {
            ForEach(Array(blocks.enumerated()), id: \.offset) { _, block in
                renderBlock(block)
            }
        }
    }

    // MARK: - Block Types

    private enum Block {
        case heading(Int, String)
        case paragraph(String)
        case quote([String])        // array of lines
        case code(String)
        case bullet(String)
        case numbered(Int, String)
        case divider
        case table([String], [[String]])
    }

    // MARK: - Parser

    private func parseBlocks() -> [Block] {
        var blocks: [Block] = []
        let lines = markdown.components(separatedBy: "\n")
        var i = 0
        var num = 0

        while i < lines.count {
            let raw = lines[i]
            let t = raw.trimmingCharacters(in: .whitespaces)

            if t.isEmpty { i += 1; num = 0; continue }

            // Divider
            if t.hasPrefix("---") || t.hasPrefix("***") {
                blocks.append(.divider); i += 1; continue
            }

            // Headings
            var foundHeading = false
            for level in (1...6).reversed() {
                let prefix = String(repeating: "#", count: level) + " "
                if t.hasPrefix(prefix) {
                    blocks.append(.heading(level, String(t.dropFirst(prefix.count))))
                    i += 1; foundHeading = true; break
                }
            }
            if foundHeading { continue }

            // Code block
            if t.hasPrefix("```") {
                var code: [String] = []
                i += 1
                while i < lines.count && !lines[i].trimmingCharacters(in: .whitespaces).hasPrefix("```") {
                    code.append(lines[i]); i += 1
                }
                blocks.append(.code(code.joined(separator: "\n")))
                if i < lines.count { i += 1 }
                continue
            }

            // Table
            if t.contains("|") && i + 1 < lines.count && lines[i + 1].contains("---") {
                let hdrs = parsePipeLine(t)
                i += 2 // skip header + separator
                var rows: [[String]] = []
                while i < lines.count {
                    let rowLine = lines[i].trimmingCharacters(in: .whitespaces)
                    guard rowLine.contains("|") && !rowLine.isEmpty else { break }
                    rows.append(parsePipeLine(rowLine))
                    i += 1
                }
                blocks.append(.table(hdrs, rows)); continue
            }

            // Quote
            if t.hasPrefix(">") {
                var q: [String] = []
                while i < lines.count {
                    let l = lines[i].trimmingCharacters(in: .whitespaces)
                    if l.isEmpty { break }
                    guard l.hasPrefix(">") else { break }
                    q.append(String(l.dropFirst()).trimmingCharacters(in: .whitespaces))
                    i += 1
                }
                if !q.isEmpty { blocks.append(.quote(q)) }
                continue
            }

            // Ordered list
            if t.range(of: #"^\d+\.\s"#, options: .regularExpression) != nil {
                num += 1
                let text = t.replacingOccurrences(of: #"^\d+\.\s*"#, with: "", options: .regularExpression)
                blocks.append(.numbered(num, text)); i += 1; continue
            }

            // Bullet
            if t.hasPrefix("- ") || t.hasPrefix("* ") || t.hasPrefix("• ") {
                blocks.append(.bullet(String(t.dropFirst(2)))); i += 1; continue
            }

            // Paragraph (merge consecutive non-special lines)
            var para = [t]; i += 1
            while i < lines.count {
                let n = lines[i].trimmingCharacters(in: .whitespaces)
                if n.isEmpty || n.hasPrefix("#") || n.hasPrefix(">") || n.hasPrefix("```")
                    || n.hasPrefix("- ") || n.hasPrefix("* ") || n.contains("|")
                    || n.hasPrefix("---") || n.hasPrefix("***") { break }
                if n.range(of: #"^\d+\.\s"#, options: .regularExpression) != nil { break }
                para.append(n); i += 1
            }
            blocks.append(.paragraph(para.joined(separator: " ")))
        }

        return blocks
    }

    /// Parse a markdown table row: `| a | b | c |` → ["a", "b", "c"]
    private func parsePipeLine(_ line: String) -> [String] {
        let trimmed = line.trimmingCharacters(in: .whitespaces)
        // Remove leading/trailing pipes
        let inner: String
        if trimmed.hasPrefix("|") && trimmed.hasSuffix("|") {
            inner = String(trimmed.dropFirst().dropLast())
        } else if trimmed.hasPrefix("|") {
            inner = String(trimmed.dropFirst())
        } else if trimmed.hasSuffix("|") {
            inner = String(trimmed.dropLast())
        } else {
            inner = trimmed
        }
        return inner.split(separator: "|", omittingEmptySubsequences: false)
            .map { String($0).trimmingCharacters(in: .whitespaces) }
            .filter { !$0.isEmpty }
    }

    // MARK: - Block Rendering

    @ViewBuilder
    private func renderBlock(_ block: Block) -> some View {
        switch block {
        case .heading(let lv, let text):
            Text(renderInline(text, fontSize: lv == 1 ? 26 : lv == 2 ? 20 : lv == 3 ? 17 : 15, boldColor: .white))
                .font(lv == 1 ? .system(size: 26, weight: .bold, design: .rounded) :
                      lv == 2 ? .system(size: 20, weight: .bold, design: .rounded) :
                      lv == 3 ? .system(size: 17, weight: .semibold, design: .rounded) :
                        .system(size: 15, weight: .semibold))
                .foregroundStyle(.white)
                .padding(.top, lv <= 2 ? 16 : 8)

        case .paragraph(let text):
            Text(renderInline(text, fontSize: 15))
                .font(.system(size: 15))
                .fixedSize(horizontal: false, vertical: true)
                .lineSpacing(5)

        case .quote(let lines):
            quoteBlock(lines)

        case .code(let code):
            ScrollView(.horizontal, showsIndicators: false) {
                Text(code)
                    .font(.system(size: 12, design: .monospaced))
                    .foregroundStyle(.green.opacity(0.9))
                    .padding(12)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.black.opacity(0.4))
            .clipShape(RoundedRectangle(cornerRadius: 8))

        case .bullet(let text):
            HStack(alignment: .top, spacing: 8) {
                Text("•")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(DIQuestTheme.accent)
                    .frame(width: 16, alignment: .center)
                Text(renderInline(text, fontSize: 14))
                    .font(.system(size: 14))
                    .fixedSize(horizontal: false, vertical: true)
                    .lineSpacing(3)
            }

        case .numbered(let n, let text):
            HStack(alignment: .top, spacing: 8) {
                Text("\(n).")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(DIQuestTheme.accent)
                    .frame(width: 26, alignment: .trailing)
                Text(renderInline(text, fontSize: 14))
                    .font(.system(size: 14))
                    .fixedSize(horizontal: false, vertical: true)
                    .lineSpacing(3)
            }

        case .divider:
            Rectangle()
                .fill(Color.white.opacity(0.1))
                .frame(height: 1)
                .padding(.vertical, 6)

        case .table(let hdrs, let rows):
            tableBlock(headers: hdrs, rows: rows)
        }
    }

    // MARK: - Quote Block

    @ViewBuilder
    private func quoteBlock(_ lines: [String]) -> some View {
        HStack(alignment: .top, spacing: 0) {
            RoundedRectangle(cornerRadius: 1.5)
                .fill(DIQuestTheme.accent)
                .frame(width: 3)

            VStack(alignment: .leading, spacing: 4) {
                ForEach(Array(lines.enumerated()), id: \.offset) { _, line in
                    Text(renderInline(line, fontSize: 14, defaultColor: DIQuestTheme.accent.opacity(0.9), boldColor: DIQuestTheme.accent))
                        .font(.system(size: 14))
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .padding(.leading, 12)
        }
        .padding(.vertical, 6)
    }

    // MARK: - Table Block (Grid-based)

    @ViewBuilder
    private func tableBlock(headers: [String], rows: [[String]]) -> some View {
        let colCount = headers.count

        ScrollView(.horizontal, showsIndicators: false) {
            Grid(alignment: .topLeading, horizontalSpacing: 0, verticalSpacing: 0) {
                // Header row
                GridRow {
                    ForEach(Array(headers.enumerated()), id: \.offset) { _, h in
                        Text(renderInline(h, fontSize: 12, boldColor: DIQuestTheme.accent))
                            .font(.system(size: 12, weight: .bold))
                            .foregroundStyle(DIQuestTheme.accent)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 8)
                            .frame(minWidth: 90, alignment: .leading)
                    }
                }
                .background(DIQuestTheme.accent.opacity(0.12))

                // Separator
                GridRow {
                    ForEach(0..<colCount, id: \.self) { _ in
                        Rectangle()
                            .fill(DIQuestTheme.accent.opacity(0.2))
                            .frame(height: 1)
                    }
                }

                // Data rows
                ForEach(Array(rows.enumerated()), id: \.offset) { idx, row in
                    GridRow {
                        ForEach(0..<colCount, id: \.self) { col in
                            let cell = col < row.count ? row[col] : ""
                            Text(renderInline(cell, fontSize: 12))
                                .font(.system(size: 12))
                                .foregroundStyle(DIQuestTheme.textSecondary)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 7)
                                .frame(minWidth: 90, alignment: .leading)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                    .background(idx % 2 == 1 ? Color.white.opacity(0.03) : Color.clear)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color.white.opacity(0.08))
            )
        }
    }

    // MARK: - Inline Markdown Rendering

    /// Parses **bold**, *italic*, `code`, and plain text into an AttributedString.
    /// `fontSize` ensures bold/italic inherit the correct size from context.
    private func renderInline(
        _ text: String,
        fontSize: CGFloat,
        defaultColor: Color = DIQuestTheme.textSecondary,
        boldColor: Color = .white
    ) -> AttributedString {
        var result = AttributedString()
        let chars = Array(text)
        var i = 0

        while i < chars.count {
            // Bold: **text**
            if i + 1 < chars.count && chars[i] == "*" && chars[i + 1] == "*" {
                if let endIdx = findClosing(chars: chars, from: i + 2, marker: "**") {
                    let boldText = String(chars[(i + 2)..<endIdx])
                    var attr = AttributedString(boldText)
                    attr.font = .system(size: fontSize, weight: .bold)
                    attr.foregroundColor = boldColor
                    result += attr
                    i = endIdx + 2
                    continue
                }
            }

            // Italic: *text* (single asterisk, not double)
            if chars[i] == "*" && !(i + 1 < chars.count && chars[i + 1] == "*") {
                if let endIdx = findClosingSingle(chars: chars, from: i + 1, marker: "*") {
                    let italicText = String(chars[(i + 1)..<endIdx])
                    var attr = AttributedString(italicText)
                    attr.font = .system(size: fontSize).italic()
                    attr.foregroundColor = defaultColor
                    result += attr
                    i = endIdx + 1
                    continue
                }
            }

            // Inline code: `text`
            if chars[i] == "`" {
                if let endIdx = findClosingSingle(chars: chars, from: i + 1, marker: "`") {
                    let codeText = String(chars[(i + 1)..<endIdx])
                    var attr = AttributedString(codeText)
                    attr.font = .system(size: max(fontSize - 2, 10), design: .monospaced)
                    attr.foregroundColor = Color(red: 0.4, green: 0.85, blue: 0.55)
                    attr.backgroundColor = Color.white.opacity(0.06)
                    result += attr
                    i = endIdx + 1
                    continue
                }
            }

            // Plain text
            var plain = ""
            while i < chars.count {
                if chars[i] == "*" || chars[i] == "`" { break }
                plain.append(chars[i])
                i += 1
            }
            if !plain.isEmpty {
                var attr = AttributedString(plain)
                attr.foregroundColor = defaultColor
                result += attr
            }
        }

        return result
    }

    /// Find closing multi-char marker (e.g. "**") starting from `from`.
    private func findClosing(chars: [Character], from: Int, marker: String) -> Int? {
        let markerChars = Array(marker)
        var j = from
        while j + markerChars.count - 1 < chars.count {
            var match = true
            for k in 0..<markerChars.count {
                if chars[j + k] != markerChars[k] { match = false; break }
            }
            if match { return j }
            j += 1
        }
        return nil
    }

    /// Find closing single-char marker starting from `from`.
    private func findClosingSingle(chars: [Character], from: Int, marker: String) -> Int? {
        let m = Character(marker)
        var j = from
        while j < chars.count {
            if chars[j] == m { return j }
            j += 1
        }
        return nil
    }
}
