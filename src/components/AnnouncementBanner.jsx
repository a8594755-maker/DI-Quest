import { useState, useEffect } from 'react'
import { X, Info, AlertTriangle, Sparkles, Calendar } from 'lucide-react'
import { supabase } from '../utils/supabase'

const ICONS = {
  info: Info,
  warning: AlertTriangle,
  update: Sparkles,
  event: Calendar,
}

const COLORS = {
  info: 'bg-blue-500/10 border-blue-500/30 text-blue-300',
  warning: 'bg-amber-500/10 border-amber-500/30 text-amber-300',
  update: 'bg-emerald-500/10 border-emerald-500/30 text-emerald-300',
  event: 'bg-purple-500/10 border-purple-500/30 text-purple-300',
}

export default function AnnouncementBanner() {
  const [announcements, setAnnouncements] = useState([])
  const [dismissed, setDismissed] = useState(() => {
    try { return JSON.parse(sessionStorage.getItem('di-quest-dismissed-announcements') || '[]') } catch { return [] }
  })

  useEffect(() => {
    const fetch = async () => {
      const { data } = await supabase
        .from('announcements')
        .select('*')
        .eq('is_active', true)
        .order('created_at', { ascending: false })
        .limit(5)
      if (data) {
        const now = new Date().toISOString()
        setAnnouncements(data.filter(a => !a.expires_at || a.expires_at > now))
      }
    }
    fetch()
  }, [])

  const dismiss = (id) => {
    const updated = [...dismissed, id]
    setDismissed(updated)
    sessionStorage.setItem('di-quest-dismissed-announcements', JSON.stringify(updated))
  }

  const visible = announcements.filter(a => !dismissed.includes(a.id))
  if (visible.length === 0) return null

  return (
    <div className="space-y-2 mb-4">
      {visible.map(a => {
        const Icon = ICONS[a.type] || Info
        const color = COLORS[a.type] || COLORS.info
        return (
          <div key={a.id} className={`flex items-start gap-3 px-4 py-3 rounded-xl border ${color}`}>
            <Icon className="w-4 h-4 flex-shrink-0 mt-0.5" />
            <div className="flex-1 min-w-0">
              <p className="text-sm font-medium">{a.title}</p>
              {a.content && <p className="text-xs opacity-80 mt-0.5">{a.content}</p>}
            </div>
            <button onClick={() => dismiss(a.id)} className="p-0.5 opacity-50 hover:opacity-100 transition-opacity flex-shrink-0">
              <X className="w-3.5 h-3.5" />
            </button>
          </div>
        )
      })}
    </div>
  )
}
