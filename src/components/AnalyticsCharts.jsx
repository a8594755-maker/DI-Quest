import { useMemo } from 'react'

function BarChart({ data, labelKey, valueKey, maxValue, color = 'bg-brand-primary', unit = '' }) {
  if (!data || data.length === 0) {
    return <p className="text-slate-500 text-sm">尚無資料</p>
  }
  const max = maxValue || Math.max(...data.map(d => d[valueKey]), 1)

  return (
    <div className="space-y-2">
      {data.map((item, i) => (
        <div key={i} className="flex items-center gap-3">
          <span className="text-slate-400 text-xs w-16 text-right flex-shrink-0">{item[labelKey]}</span>
          <div className="flex-1 bg-slate-800 rounded-full h-5 overflow-hidden">
            <div
              className={`${color} h-full rounded-full transition-all duration-500`}
              style={{ width: `${Math.max((item[valueKey] / max) * 100, 2)}%` }}
            />
          </div>
          <span className="text-slate-300 text-xs w-12 flex-shrink-0">
            {item[valueKey]}{unit}
          </span>
        </div>
      ))}
    </div>
  )
}

export function DailyActivityChart({ dailyStats }) {
  const data = useMemo(() => {
    const days = []
    for (let i = 13; i >= 0; i--) {
      const d = new Date(Date.now() - i * 86400000)
      const key = d.toISOString().slice(0, 10)
      const label = `${d.getMonth() + 1}/${d.getDate()}`
      days.push({
        label,
        value: dailyStats[key]?.challengesCompleted || 0,
      })
    }
    return days
  }, [dailyStats])

  return (
    <div className="card p-5">
      <h4 className="text-white font-medium mb-4">每日完成題數（近 14 天）</h4>
      <BarChart data={data} labelKey="label" valueKey="value" color="bg-brand-primary" unit=" 題" />
    </div>
  )
}

export function XpTrendChart({ dailyStats }) {
  const data = useMemo(() => {
    const days = []
    for (let i = 13; i >= 0; i--) {
      const d = new Date(Date.now() - i * 86400000)
      const key = d.toISOString().slice(0, 10)
      const label = `${d.getMonth() + 1}/${d.getDate()}`
      days.push({
        label,
        value: dailyStats[key]?.xpEarned || 0,
      })
    }
    return days
  }, [dailyStats])

  return (
    <div className="card p-5">
      <h4 className="text-white font-medium mb-4">每日 XP 趨勢（近 14 天）</h4>
      <BarChart data={data} labelKey="label" valueKey="value" color="bg-brand-secondary" unit=" XP" />
    </div>
  )
}

export function TimePerChallengeChart({ challengeTimings }) {
  const data = useMemo(() => {
    // 按 world 分組計算平均時間
    const worldTimes = {}
    Object.entries(challengeTimings).forEach(([key, timing]) => {
      const worldId = key.split('-')[0]
      if (!worldTimes[worldId]) worldTimes[worldId] = { total: 0, count: 0 }
      worldTimes[worldId].total += timing.lastDurationMs || 0
      worldTimes[worldId].count += 1
    })
    return Object.entries(worldTimes).map(([worldId, { total, count }]) => ({
      label: `World ${worldId}`,
      value: Math.round(total / count / 1000),
    }))
  }, [challengeTimings])

  return (
    <div className="card p-5">
      <h4 className="text-white font-medium mb-4">平均答題時間（秒）</h4>
      <BarChart data={data} labelKey="label" valueKey="value" color="bg-brand-accent" unit="s" />
    </div>
  )
}
