import { BarChart, Bar, LineChart, Line, PieChart, Pie, Cell, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer } from 'recharts'

const COLORS = ['#3b82f6', '#10b981', '#f59e0b', '#ef4444', '#8b5cf6', '#ec4899']

/**
 * SimpleChart — Recharts wrapper for case study scenarios
 * Props:
 *   config: { type: 'bar'|'line'|'pie', xKey, yKeys, data }
 *   height: number (default 300)
 */
function SimpleChart({ config, height = 300 }) {
  if (!config || !config.data || config.data.length === 0) return null

  const { type, xKey, yKeys = [], data } = config

  const commonProps = {
    data,
    margin: { top: 5, right: 20, left: 0, bottom: 5 },
  }

  const tooltipStyle = {
    contentStyle: {
      backgroundColor: '#1e293b',
      border: '1px solid #334155',
      borderRadius: '8px',
      color: '#e2e8f0',
      fontSize: '12px',
    },
  }

  if (type === 'pie') {
    const dataKey = yKeys[0] || 'value'
    return (
      <div className="w-full rounded-lg border border-slate-700 p-4 bg-slate-900/50">
        <ResponsiveContainer width="100%" height={height}>
          <PieChart>
            <Pie
              data={data}
              dataKey={dataKey}
              nameKey={xKey || 'name'}
              cx="50%"
              cy="50%"
              outerRadius={80}
              label={({ name, percent }) => `${name} ${(percent * 100).toFixed(0)}%`}
            >
              {data.map((_, i) => (
                <Cell key={i} fill={COLORS[i % COLORS.length]} />
              ))}
            </Pie>
            <Tooltip {...tooltipStyle} />
            <Legend />
          </PieChart>
        </ResponsiveContainer>
      </div>
    )
  }

  if (type === 'line') {
    return (
      <div className="w-full rounded-lg border border-slate-700 p-4 bg-slate-900/50">
        <ResponsiveContainer width="100%" height={height}>
          <LineChart {...commonProps}>
            <CartesianGrid strokeDasharray="3 3" stroke="#334155" />
            <XAxis dataKey={xKey} tick={{ fill: '#94a3b8', fontSize: 12 }} />
            <YAxis tick={{ fill: '#94a3b8', fontSize: 12 }} />
            <Tooltip {...tooltipStyle} />
            <Legend />
            {yKeys.map((key, i) => (
              <Line
                key={key}
                type="monotone"
                dataKey={key}
                stroke={COLORS[i % COLORS.length]}
                strokeWidth={2}
                dot={{ r: 4 }}
                activeDot={{ r: 6 }}
              />
            ))}
          </LineChart>
        </ResponsiveContainer>
      </div>
    )
  }

  // Default: bar chart
  return (
    <div className="w-full rounded-lg border border-slate-700 p-4 bg-slate-900/50">
      <ResponsiveContainer width="100%" height={height}>
        <BarChart {...commonProps}>
          <CartesianGrid strokeDasharray="3 3" stroke="#334155" />
          <XAxis dataKey={xKey} tick={{ fill: '#94a3b8', fontSize: 12 }} />
          <YAxis tick={{ fill: '#94a3b8', fontSize: 12 }} />
          <Tooltip {...tooltipStyle} />
          <Legend />
          {yKeys.map((key, i) => (
            <Bar key={key} dataKey={key} fill={COLORS[i % COLORS.length]} radius={[4, 4, 0, 0]} />
          ))}
        </BarChart>
      </ResponsiveContainer>
    </div>
  )
}

export default SimpleChart
