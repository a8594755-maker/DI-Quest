import SwiftUI

struct StreakCalendarView: View {
    let dailyStats: [String: UserProgress.DailyStats]
    @ObservedObject private var lang = LanguageManager.shared
    @State private var displayedMonth: Date = Date()

    private let calendar = Calendar.current
    private let weekdaySymbols = ["S", "M", "T", "W", "T", "F", "S"]

    private var activeDates: Set<String> {
        Set(dailyStats.filter { $0.value.challengesCompleted > 0 }.keys)
    }

    private var todayString: String {
        dateString(Date())
    }

    private var monthLabel: String {
        let fmt = DateFormatter()
        fmt.locale = lang.isEnglish ? Locale(identifier: "en") : Locale(identifier: "zh-TW")
        fmt.dateFormat = lang.isEnglish ? "MMMM yyyy" : "yyyy年M月"
        return fmt.string(from: displayedMonth)
    }

    private var daysInGrid: [DayCell] {
        let comps = calendar.dateComponents([.year, .month], from: displayedMonth)
        guard let firstOfMonth = calendar.date(from: comps),
              let range = calendar.range(of: .day, in: .month, for: firstOfMonth) else {
            return []
        }
        let firstWeekday = calendar.component(.weekday, from: firstOfMonth) // 1=Sun
        let leadingBlanks = firstWeekday - 1

        var cells: [DayCell] = []
        // Leading blanks
        for _ in 0..<leadingBlanks {
            cells.append(DayCell(day: 0, dateStr: "", isToday: false, isActive: false, isFuture: true))
        }
        // Days of month
        let today = Date()
        for day in range {
            var dayComps = comps
            dayComps.day = day
            if let date = calendar.date(from: dayComps) {
                let ds = dateString(date)
                let isToday = ds == todayString
                let isFuture = date > today && !isToday
                let isActive = activeDates.contains(ds)
                let count = dailyStats[ds]?.challengesCompleted ?? 0
                cells.append(DayCell(day: day, dateStr: ds, isToday: isToday, isActive: isActive, isFuture: isFuture, count: count))
            }
        }
        return cells
    }

    var body: some View {
        VStack(spacing: 12) {
            // Header
            HStack {
                Text(lang.string("calendar.title"))
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.white)
                Spacer()
            }

            // Month navigation
            HStack {
                Button { shiftMonth(-1) } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(DIQuestTheme.textTertiary)
                }
                Spacer()
                Text(monthLabel)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(.white)
                Spacer()
                Button { shiftMonth(1) } label: {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(DIQuestTheme.textTertiary)
                }
            }

            // Weekday header
            let columns = Array(repeating: GridItem(.flexible(), spacing: 4), count: 7)
            LazyVGrid(columns: columns, spacing: 4) {
                ForEach(weekdaySymbols, id: \.self) { sym in
                    Text(sym)
                        .font(.system(size: 11, weight: .medium))
                        .foregroundStyle(DIQuestTheme.textTertiary)
                        .frame(height: 20)
                }

                ForEach(Array(daysInGrid.enumerated()), id: \.offset) { _, cell in
                    dayCellView(cell)
                }
            }
        }
        .padding()
        .background(DIQuestTheme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: DIQuestTheme.cardCornerRadius))
        .overlay(
            RoundedRectangle(cornerRadius: DIQuestTheme.cardCornerRadius)
                .strokeBorder(DIQuestTheme.cardBorder)
        )
    }

    @ViewBuilder
    private func dayCellView(_ cell: DayCell) -> some View {
        if cell.day == 0 {
            Color.clear.frame(height: 32)
        } else {
            ZStack {
                if cell.isActive {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.green.opacity(intensity(cell.count)))
                } else if cell.isToday {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.white.opacity(0.06))
                }

                Text("\(cell.day)")
                    .font(.system(size: 12, weight: cell.isToday ? .bold : .regular))
                    .foregroundStyle(
                        cell.isActive ? .white :
                        cell.isFuture ? DIQuestTheme.textTertiary.opacity(0.3) :
                        cell.isToday ? .white :
                        DIQuestTheme.textTertiary
                    )
            }
            .frame(height: 32)
            .overlay(
                cell.isToday ?
                    RoundedRectangle(cornerRadius: 6)
                        .strokeBorder(DIQuestTheme.accent, lineWidth: 1.5)
                    : nil
            )
        }
    }

    private func intensity(_ count: Int) -> Double {
        switch count {
        case 0: return 0
        case 1: return 0.25
        case 2...3: return 0.45
        case 4...6: return 0.65
        default: return 0.85
        }
    }

    private func shiftMonth(_ delta: Int) {
        if let newDate = calendar.date(byAdding: .month, value: delta, to: displayedMonth) {
            withAnimation(.easeInOut(duration: 0.2)) {
                displayedMonth = newDate
            }
        }
    }

    private func dateString(_ date: Date) -> String {
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd"
        return fmt.string(from: date)
    }
}

private struct DayCell {
    let day: Int
    let dateStr: String
    let isToday: Bool
    let isActive: Bool
    let isFuture: Bool
    var count: Int = 0
}
