import { useState, useMemo, useEffect, useRef } from 'react'
import { useNavigate } from 'react-router-dom'
import { Search, X, Map, BookOpen, Target } from 'lucide-react'
import { useTranslation } from 'react-i18next'
import { WORLDS } from '../data/questData'

function fuzzyMatch(query, text) {
  if (!query || !text) return { match: false, score: 0 }
  const q = query.toLowerCase()
  const t = text.toLowerCase()
  if (t.includes(q)) return { match: true, score: 2 }
  let qi = 0
  for (let ti = 0; ti < t.length && qi < q.length; ti++) {
    if (t[ti] === q[qi]) qi++
  }
  return { match: qi === q.length, score: qi === q.length ? 1 : 0 }
}

function SearchModal({ isOpen, onClose }) {
  const { t, i18n } = useTranslation('common')
  const [query, setQuery] = useState('')
  const inputRef = useRef(null)
  const navigate = useNavigate()

  const searchIndex = useMemo(() => {
    const items = []
    WORLDS.forEach(w => {
      items.push({
        type: 'world',
        icon: w.emoji,
        title: w.name,
        desc: w.description,
        text: `${w.name} ${w.description}`,
        path: '/di-quest/map',
        worldId: w.id,
      })
      w.quests.forEach(q => {
        items.push({
          type: 'quest',
          icon: w.emoji,
          title: q.name,
          desc: `${w.name} — ${q.description}`,
          text: `${q.name} ${q.description} ${w.name}`,
          path: `/di-quest/quest/${w.id}/${q.id}`,
        })
        q.challenges.forEach(c => {
          items.push({
            type: 'challenge',
            icon: '🎯',
            title: c.name,
            desc: `${q.name} — ${c.scenario?.title || ''}`,
            text: `${c.name} ${c.question || ''} ${c.scenario?.title || ''} ${c.scenario?.narrative || ''}`,
            path: `/di-quest/case/${w.id}/${q.id}/${c.id}`,
          })
        })
      })
    })
    return items
  }, [i18n.language])

  const results = useMemo(() => {
    if (!query.trim()) return []
    return searchIndex
      .map(item => {
        const { match, score } = fuzzyMatch(query.trim(), item.text)
        return { ...item, match, score }
      })
      .filter(r => r.match)
      .sort((a, b) => b.score - a.score)
      .slice(0, 20)
  }, [query, searchIndex])

  const grouped = useMemo(() => {
    const groups = { world: [], quest: [], challenge: [] }
    results.forEach(r => {
      if (groups[r.type]) groups[r.type].push(r)
    })
    return groups
  }, [results])

  useEffect(() => {
    if (isOpen) {
      setQuery('')
      setTimeout(() => inputRef.current?.focus(), 50)
    }
  }, [isOpen])

  useEffect(() => {
    if (!isOpen) return
    const handleKey = (e) => {
      if (e.key === 'Escape') onClose()
    }
    window.addEventListener('keydown', handleKey)
    return () => window.removeEventListener('keydown', handleKey)
  }, [isOpen, onClose])

  const handleSelect = (path) => {
    navigate(path)
    onClose()
  }

  if (!isOpen) return null

  const typeLabels = {
    world: { label: 'Worlds', icon: Map },
    quest: { label: 'Quests', icon: BookOpen },
    challenge: { label: 'Challenges', icon: Target },
  }

  return (
    <div className="fixed inset-0 z-[60] flex justify-center pt-20" onClick={onClose}>
      <div className="absolute inset-0 bg-black/60 backdrop-blur-sm" />
      <div
        className="relative w-full max-w-2xl mx-4 h-fit max-h-[70vh] flex flex-col bg-slate-900 border border-slate-700 rounded-xl shadow-2xl overflow-hidden"
        onClick={(e) => e.stopPropagation()}
      >
        <div className="flex items-center gap-3 px-4 py-3 border-b border-slate-700">
          <Search className="w-5 h-5 text-slate-400 flex-shrink-0" />
          <input
            ref={inputRef}
            type="text"
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            placeholder={t('nav.searchPlaceholder')}
            className="flex-1 bg-transparent text-white text-base outline-none placeholder-slate-500"
          />
          <button onClick={onClose} className="text-slate-500 hover:text-white transition-colors">
            <X className="w-5 h-5" />
          </button>
        </div>

        <div className="flex-1 overflow-y-auto p-2">
          {query.trim() && results.length === 0 && (
            <p className="text-slate-500 text-sm text-center py-8">{t('nav.noResults')}</p>
          )}

          {!query.trim() && (
            <p className="text-slate-500 text-sm text-center py-8">
              {t('nav.searchHint')}
            </p>
          )}

          {Object.entries(grouped).map(([type, items]) => {
            if (items.length === 0) return null
            const { label, icon: Icon } = typeLabels[type]
            return (
              <div key={type} className="mb-3">
                <div className="flex items-center gap-2 px-3 py-1.5">
                  <Icon className="w-3.5 h-3.5 text-slate-500" />
                  <span className="text-slate-500 text-xs font-medium uppercase">{label}</span>
                  <span className="text-slate-600 text-xs">({items.length})</span>
                </div>
                {items.map((item, i) => (
                  <button
                    key={`${type}-${i}`}
                    onClick={() => handleSelect(item.path)}
                    className="w-full flex items-center gap-3 px-3 py-2.5 rounded-lg hover:bg-slate-800 transition-colors text-left"
                  >
                    <span className="text-lg flex-shrink-0">{item.icon}</span>
                    <div className="min-w-0 flex-1">
                      <p className="text-white text-sm truncate">{item.title}</p>
                      <p className="text-slate-500 text-xs truncate">{item.desc}</p>
                    </div>
                  </button>
                ))}
              </div>
            )
          })}
        </div>

        <div className="border-t border-slate-700 px-4 py-2 flex items-center gap-4">
          <span className="text-slate-600 text-xs">
            <kbd className="px-1.5 py-0.5 bg-slate-800 rounded text-slate-400 text-[10px]">ESC</kbd> {t('nav.close')}
          </span>
          <span className="text-slate-600 text-xs">
            <kbd className="px-1.5 py-0.5 bg-slate-800 rounded text-slate-400 text-[10px]">⌘K</kbd> {t('nav.openSearch')}
          </span>
        </div>
      </div>
    </div>
  )
}

export default SearchModal
