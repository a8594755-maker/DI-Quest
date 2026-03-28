import SwiftUI
import Charts

// MARK: - Container

struct AnalyticsChartsSection: View {
    let dailyStats: [String: UserProgress.DailyStats]
    let challengeTimings: [String: UserProgress.ChallengeTiming]
    @ObservedObject private var lang = LanguageManager.shared

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Image(systemName: "chart.bar.xaxis")
                    .foregroundStyle(DIQuestTheme.accent)
                Text(lang.string("analytics.title"))
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(.white)
                Spacer()
            }

            DailyActivityChart(dailyStats: dailyStats)
            XpTrendChart(dailyStats: dailyStats)
            TimePerWorldChart(challengeTimings: challengeTimings)
        }
    }
}

// MARK: - Daily Activity Chart

struct DailyActivityChart: View {
    let dailyStats: [String: UserProgress.DailyStats]
    @ObservedObject private var lang = LanguageManager.shared

    private var data: [DayPoint] {
        last14Days { $0.challengesCompleted }
    }

    var body: some View {
        chartCard(title: lang.string("analytics.dailyActivity")) {
            if data.allSatisfy({ $0.value == 0 }) {
                emptyState
            } else {
                Chart(data) { item in
                    BarMark(
                        x: .value("Date", item.date, unit: .day),
                        y: .value("Count", item.value)
                    )
                    .foregroundStyle(DIQuestTheme.accent.gradient)
                    .cornerRadius(4)
                }
                .chartXAxis {
                    AxisMarks(values: .stride(by: .day, count: 3)) { _ in
                        AxisValueLabel(format: .dateTime.month(.abbreviated).day())
                            .foregroundStyle(DIQuestTheme.textTertiary)
                    }
                }
                .chartYAxis {
                    AxisMarks { _ in
                        AxisValueLabel()
                            .foregroundStyle(DIQuestTheme.textTertiary)
                        AxisGridLine(stroke: StrokeStyle(lineWidth: 0.5))
                            .foregroundStyle(Color.white.opacity(0.06))
                    }
                }
                .frame(height: 160)
            }
        }
    }

    private func last14Days(value: (UserProgress.DailyStats) -> Int) -> [DayPoint] {
        let cal = Calendar.current
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd"
        return (0..<14).reversed().map { i in
            let date = cal.date(byAdding: .day, value: -i, to: Date())!
            let key = fmt.string(from: date)
            let val = dailyStats[key].map(value) ?? 0
            return DayPoint(date: cal.startOfDay(for: date), value: val)
        }
    }
}

// MARK: - XP Trend Chart

struct XpTrendChart: View {
    let dailyStats: [String: UserProgress.DailyStats]
    @ObservedObject private var lang = LanguageManager.shared

    private var data: [DayPoint] {
        let cal = Calendar.current
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd"
        return (0..<14).reversed().map { i in
            let date = cal.date(byAdding: .day, value: -i, to: Date())!
            let key = fmt.string(from: date)
            let val = dailyStats[key]?.xpEarned ?? 0
            return DayPoint(date: cal.startOfDay(for: date), value: val)
        }
    }

    var body: some View {
        chartCard(title: lang.string("analytics.xpTrend")) {
            if data.allSatisfy({ $0.value == 0 }) {
                emptyState
            } else {
                Chart(data) { item in
                    LineMark(
                        x: .value("Date", item.date, unit: .day),
                        y: .value("XP", item.value)
                    )
                    .foregroundStyle(Color.cyan)
                    .interpolationMethod(.catmullRom)
                    .lineStyle(StrokeStyle(lineWidth: 2))

                    AreaMark(
                        x: .value("Date", item.date, unit: .day),
                        y: .value("XP", item.value)
                    )
                    .foregroundStyle(
                        .linearGradient(
                            colors: [Color.cyan.opacity(0.3), Color.cyan.opacity(0)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .interpolationMethod(.catmullRom)

                    PointMark(
                        x: .value("Date", item.date, unit: .day),
                        y: .value("XP", item.value)
                    )
                    .foregroundStyle(Color.cyan)
                    .symbolSize(item.value > 0 ? 20 : 0)
                }
                .chartXAxis {
                    AxisMarks(values: .stride(by: .day, count: 3)) { _ in
                        AxisValueLabel(format: .dateTime.month(.abbreviated).day())
                            .foregroundStyle(DIQuestTheme.textTertiary)
                    }
                }
                .chartYAxis {
                    AxisMarks { _ in
                        AxisValueLabel()
                            .foregroundStyle(DIQuestTheme.textTertiary)
                        AxisGridLine(stroke: StrokeStyle(lineWidth: 0.5))
                            .foregroundStyle(Color.white.opacity(0.06))
                    }
                }
                .frame(height: 160)
            }
        }
    }
}

// MARK: - Time Per World Chart

struct TimePerWorldChart: View {
    let challengeTimings: [String: UserProgress.ChallengeTiming]
    @ObservedObject private var lang = LanguageManager.shared

    private var worldAverages: [WorldTime] {
        var grouped: [String: (total: Int, count: Int)] = [:]
        for (key, timing) in challengeTimings {
            guard let durationMs = timing.lastDurationMs, durationMs > 0 else { continue }
            let parts = key.split(separator: "-")
            guard let worldId = parts.first.flatMap({ Int($0) }) else { continue }
            let name = "World \(worldId)"
            let existing = grouped[name] ?? (0, 0)
            grouped[name] = (existing.total + durationMs, existing.count + 1)
        }
        return grouped.map { WorldTime(name: $0.key, avgSeconds: Double($0.value.total) / Double($0.value.count) / 1000) }
            .sorted { $0.avgSeconds > $1.avgSeconds }
            .prefix(8)
            .reversed()
            .map { $0 }
    }

    var body: some View {
        chartCard(title: lang.string("analytics.avgTime")) {
            if worldAverages.isEmpty {
                emptyState
            } else {
                Chart(worldAverages) { item in
                    BarMark(
                        x: .value("Time", item.avgSeconds),
                        y: .value("World", item.name)
                    )
                    .foregroundStyle(Color.orange.gradient)
                    .cornerRadius(4)
                    .annotation(position: .trailing) {
                        Text("\(Int(item.avgSeconds))\(lang.string("analytics.seconds"))")
                            .font(.system(size: 10))
                            .foregroundStyle(DIQuestTheme.textTertiary)
                    }
                }
                .chartXAxis(.hidden)
                .chartYAxis {
                    AxisMarks { _ in
                        AxisValueLabel()
                            .foregroundStyle(DIQuestTheme.textTertiary)
                            .font(.system(size: 11))
                    }
                }
                .frame(height: CGFloat(worldAverages.count) * 36)
            }
        }
    }
}

// MARK: - Shared

private struct DayPoint: Identifiable {
    let date: Date
    let value: Int
    var id: Date { date }
}

private struct WorldTime: Identifiable {
    let name: String
    let avgSeconds: Double
    var id: String { name }
}

private func chartCard<Content: View>(title: String, @ViewBuilder content: () -> Content) -> some View {
    VStack(alignment: .leading, spacing: 8) {
        Text(title)
            .font(.system(size: 14, weight: .semibold))
            .foregroundStyle(.white)

        content()
    }
    .padding()
    .background(DIQuestTheme.cardBackground)
    .clipShape(RoundedRectangle(cornerRadius: DIQuestTheme.cardCornerRadius))
    .overlay(
        RoundedRectangle(cornerRadius: DIQuestTheme.cardCornerRadius)
            .strokeBorder(DIQuestTheme.cardBorder)
    )
}

@MainActor
private var emptyState: some View {
    Text(LanguageManager.shared.string("analytics.noData"))
        .font(.system(size: 13))
        .foregroundStyle(DIQuestTheme.textTertiary)
        .frame(maxWidth: .infinity, minHeight: 80)
}
