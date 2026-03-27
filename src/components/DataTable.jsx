/**
 * DataTable — 渲染 case study 情境中的表格數據
 */
function DataTable({ data, highlightRows = [], caption }) {
  if (!data || data.length === 0) return null

  const columns = Object.keys(data[0])

  const formatValue = (val) => {
    if (val === null || val === undefined) return '—'
    if (typeof val === 'number') {
      if (Number.isInteger(val) && Math.abs(val) >= 1000) {
        return val.toLocaleString()
      }
      if (!Number.isInteger(val)) {
        return val % 1 === 0 ? val.toLocaleString() : val.toLocaleString(undefined, { maximumFractionDigits: 2 })
      }
      return val.toString()
    }
    return String(val)
  }

  const formatHeader = (key) => {
    return key
      .replace(/_/g, ' ')
      .replace(/\b\w/g, c => c.toUpperCase())
  }

  return (
    <div className="overflow-x-auto rounded-lg border border-slate-700">
      {caption && (
        <div className="px-4 py-2 bg-slate-800/50 text-slate-400 text-sm font-medium border-b border-slate-700">
          {caption}
        </div>
      )}
      <table className="w-full text-sm">
        <thead>
          <tr className="bg-slate-800">
            {columns.map(col => (
              <th key={col} className="px-4 py-2.5 text-left text-slate-300 font-medium whitespace-nowrap">
                {formatHeader(col)}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {data.map((row, i) => (
            <tr
              key={i}
              className={`border-t border-slate-700/50 transition-colors ${
                highlightRows.includes(i)
                  ? 'bg-brand-primary/10 border-brand-primary/30'
                  : i % 2 === 0 ? 'bg-slate-900/30' : 'bg-slate-900/10'
              }`}
            >
              {columns.map(col => (
                <td key={col} className="px-4 py-2 text-slate-300 whitespace-nowrap">
                  {formatValue(row[col])}
                </td>
              ))}
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  )
}

export default DataTable
