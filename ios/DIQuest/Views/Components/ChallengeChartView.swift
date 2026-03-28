import SwiftUI
import Charts

struct ChallengeChartView: View {
    let data: [[String: String]]

    private var labelColumn: String? {
        guard let firstRow = data.first else { return nil }
        let sorted = firstRow.keys.sorted()
        return sorted.first { col in !numericColumns.contains(col) }
    }

    private var numericColumns: [String] {
        guard let firstRow = data.first else { return [] }
        return firstRow.keys.sorted().filter { key in
            let values = data.compactMap { $0[key] }
            let numericCount = values.filter { parseNumber($0) != nil }.count
            return numericCount > values.count / 2 && numericCount > 0
        }
    }

    private var canShowChart: Bool {
        !numericColumns.isEmpty && labelColumn != nil && data.count >= 2 && data.count <= 20
    }

    var body: some View {
        if canShowChart {
            let label = labelColumn!
            let cols = Array(numericColumns.prefix(3)) // max 3 series

            VStack(alignment: .leading, spacing: 8) {
                Chart {
                    ForEach(Array(data.enumerated()), id: \.offset) { index, row in
                        let xLabel = row[label] ?? "Row \(index)"
                        ForEach(cols, id: \.self) { col in
                            let value = parseNumber(row[col] ?? "0") ?? 0
                            BarMark(
                                x: .value("Label", xLabel),
                                y: .value(formatHeader(col), value)
                            )
                            .foregroundStyle(by: .value("Series", formatHeader(col)))
                            .cornerRadius(3)
                        }
                    }
                }
                .chartForegroundStyleScale(range: chartColors(cols.count))
                .chartLegend(cols.count > 1 ? .visible : .hidden)
                .chartXAxis {
                    AxisMarks { _ in
                        AxisValueLabel()
                            .foregroundStyle(DIQuestTheme.textTertiary)
                            .font(.system(size: 9))
                    }
                }
                .chartYAxis {
                    AxisMarks { _ in
                        AxisValueLabel()
                            .foregroundStyle(DIQuestTheme.textTertiary)
                            .font(.system(size: 10))
                        AxisGridLine(stroke: StrokeStyle(lineWidth: 0.5))
                            .foregroundStyle(Color.white.opacity(0.06))
                    }
                }
                .frame(height: 180)
            }
            .padding(12)
            .background(Color.white.opacity(0.03))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(DIQuestTheme.cardBorder)
            )
        }
    }

    private func parseNumber(_ str: String) -> Double? {
        let cleaned = str
            .replacingOccurrences(of: ",", with: "")
            .replacingOccurrences(of: "%", with: "")
            .replacingOccurrences(of: "$", with: "")
            .trimmingCharacters(in: .whitespaces)
        return Double(cleaned)
    }

    private func formatHeader(_ key: String) -> String {
        key.replacingOccurrences(of: "_", with: " ")
            .split(separator: " ")
            .map { $0.prefix(1).uppercased() + $0.dropFirst() }
            .joined(separator: " ")
    }

    private func chartColors(_ count: Int) -> [Color] {
        let palette: [Color] = [DIQuestTheme.accent, .cyan, .orange, .green, .purple]
        return Array(palette.prefix(max(count, 1)))
    }
}
