import { useMemo } from 'react'
import { useTranslation } from 'react-i18next'

/** Format a Date as YYYY-MM-DD in local timezone (avoids UTC shift from toISOString) */
function toLocalDateStr(date) {
  return `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, '0')}-${String(date.getDate()).padStart(2, '0')}`
}

function StreakCalendar({ checkinDates = [], mode = 'week' }) {
  const { t } = useTranslation('social')

  const days = useMemo(() => {
    const count = mode === 'week' ? 7 : 30
    const result = []
    const today = new Date()
    today.setHours(0, 0, 0, 0)

    const dateSet = new Set(checkinDates.map(d => {
      const date = new Date(d + 'T00:00:00')
      return toLocalDateStr(date)
    }))

    for (let i = count - 1; i >= 0; i--) {
      const date = new Date(today)
      date.setDate(date.getDate() - i)
      const dateStr = toLocalDateStr(date)
      const isToday = i === 0
      const isCheckedIn = dateSet.has(dateStr)
      const dayOfWeek = date.getDay()

      result.push({
        date: dateStr,
        dayNum: date.getDate(),
        dayName: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'][dayOfWeek],
        isToday,
        isCheckedIn,
      })
    }
    return result
  }, [checkinDates, mode])

  if (mode === 'week') {
    return (
      <div className="flex items-center gap-1.5 sm:gap-2">
        {days.map((day) => (
          <div key={day.date} className="flex flex-col items-center gap-1">
            <span className="text-[10px] text-slate-500">{day.dayName}</span>
            <div
              className={`w-8 h-8 sm:w-9 sm:h-9 rounded-full flex items-center justify-center text-xs font-medium transition-colors ${
                day.isCheckedIn
                  ? 'bg-emerald-500/20 text-emerald-400 border border-emerald-500/40'
                  : day.isToday
                    ? 'bg-slate-700 text-white border border-slate-600'
                    : 'bg-slate-800/50 text-slate-500 border border-slate-700/50'
              }`}
            >
              {day.dayNum}
            </div>
          </div>
        ))}
      </div>
    )
  }

  // Month view: 5 rows x 6 columns grid
  return (
    <div className="space-y-2">
      <div className="grid grid-cols-7 gap-1.5">
        {['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'].map((d) => (
          <div key={d} className="text-center text-[10px] text-slate-500 py-1">{d}</div>
        ))}
        {days.map((day) => (
          <div
            key={day.date}
            className={`aspect-square rounded-lg flex items-center justify-center text-xs font-medium transition-colors ${
              day.isCheckedIn
                ? 'bg-emerald-500/20 text-emerald-400'
                : day.isToday
                  ? 'bg-slate-700 text-white ring-1 ring-brand-primary'
                  : 'bg-slate-800/30 text-slate-600'
            }`}
            title={day.date}
          >
            {day.dayNum}
          </div>
        ))}
      </div>
    </div>
  )
}

export default StreakCalendar
