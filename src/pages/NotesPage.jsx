import { useState, useMemo } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import { Plus, Search, Pin, StickyNote, Clock } from 'lucide-react'
import { motion, AnimatePresence } from 'framer-motion'
import { useTranslation } from 'react-i18next'
import { useNotes } from '../hooks/useNotes'
import { getWorld, getQuest } from '../data/questData'
import NoteEditor from '../components/NoteEditor'

function NotesPage() {
  const { t, i18n } = useTranslation('notes')
  const { noteId } = useParams()
  const navigate = useNavigate()
  const { notes, createNote, updateNote, deleteNote, togglePin } = useNotes()
  const [search, setSearch] = useState('')
  const [filterWorld, setFilterWorld] = useState(null)

  const filteredNotes = useMemo(() => {
    let result = notes
    if (filterWorld !== null) {
      result = result.filter(n => n.worldId === filterWorld)
    }
    if (search.trim()) {
      const q = search.toLowerCase()
      result = result.filter(n =>
        (n.title || '').toLowerCase().includes(q) ||
        (n.content || '').toLowerCase().includes(q)
      )
    }
    return result
  }, [notes, search, filterWorld])

  // Get unique worlds from notes for filter
  const worldOptions = useMemo(() => {
    const worldIds = [...new Set(notes.filter(n => n.worldId).map(n => n.worldId))]
    return worldIds.map(id => {
      const w = getWorld(id)
      return { id, name: w ? `${w.emoji || ''} ${w.name}` : `World ${id}` }
    })
  }, [notes, i18n.language])

  const activeNote = noteId ? notes.find(n => n.id === noteId) : null

  const handleNewNote = () => {
    const note = createNote()
    navigate(`/di-quest/notes/${note.id}`)
  }

  const handleDelete = (id) => {
    deleteNote(id)
    navigate('/di-quest/notes')
  }

  const formatDate = (ts) => {
    const d = new Date(ts)
    const now = Date.now()
    const diff = now - ts
    const mins = Math.floor(diff / 60000)
    if (mins < 1) return t('lastEdited') + ': just now'
    if (mins < 60) return `${mins}m ago`
    const hours = Math.floor(mins / 60)
    if (hours < 24) return `${hours}h ago`
    return d.toLocaleDateString(i18n.language === 'en' ? 'en-US' : 'zh-TW', { month: 'short', day: 'numeric' })
  }

  const getContextLabel = (note) => {
    if (note.challengeKey) {
      const parts = note.challengeKey.split('-')
      const quest = getQuest(parts.slice(0, 2).join('-'))
      return quest ? `${quest.name} #${parts[2]}` : note.challengeKey
    }
    if (note.questId) {
      const quest = getQuest(note.questId)
      return quest ? quest.name : note.questId
    }
    if (note.worldId) {
      const world = getWorld(note.worldId)
      return world ? `${world.emoji || ''} ${world.name}` : `World ${note.worldId}`
    }
    return null
  }

  // Editor view
  if (noteId && activeNote) {
    return (
      <div className="max-w-4xl mx-auto h-full flex flex-col">
        <NoteEditor
          note={activeNote}
          onUpdate={updateNote}
          onDelete={handleDelete}
          onBack={() => navigate('/di-quest/notes')}
          onTogglePin={togglePin}
        />
      </div>
    )
  }

  // List view
  return (
    <div className="max-w-4xl mx-auto px-4 py-6">
      {/* Header */}
      <div className="flex items-center justify-between mb-6">
        <div className="flex items-center gap-3">
          <div className="w-10 h-10 rounded-xl bg-amber-500/20 flex items-center justify-center">
            <StickyNote className="w-5 h-5 text-amber-400" />
          </div>
          <div>
            <h1 className="text-xl font-bold text-white">{t('title')}</h1>
            <p className="text-slate-400 text-xs">{t('noteCount', { count: notes.length })}</p>
          </div>
        </div>
        <button
          onClick={handleNewNote}
          className="flex items-center gap-2 px-4 py-2 bg-brand-primary hover:bg-blue-600 text-white text-sm font-medium rounded-lg transition-colors cursor-pointer"
        >
          <Plus className="w-4 h-4" />
          {t('newNote')}
        </button>
      </div>

      {/* Search & Filter */}
      <div className="flex items-center gap-3 mb-4">
        <div className="flex-1 relative">
          <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-500" />
          <input
            type="text"
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            placeholder={t('searchPlaceholder')}
            className="w-full pl-9 pr-3 py-2 bg-slate-800 border border-slate-700 rounded-lg text-white text-sm placeholder-slate-500 focus:outline-none focus:border-brand-primary transition-colors"
          />
        </div>
        {worldOptions.length > 0 && (
          <select
            value={filterWorld ?? ''}
            onChange={(e) => setFilterWorld(e.target.value ? Number(e.target.value) : null)}
            className="px-3 py-2 bg-slate-800 border border-slate-700 rounded-lg text-sm text-slate-300 focus:outline-none focus:border-brand-primary transition-colors cursor-pointer"
          >
            <option value="">{t('allNotes')}</option>
            {worldOptions.map(w => (
              <option key={w.id} value={w.id}>{w.name}</option>
            ))}
          </select>
        )}
      </div>

      {/* Notes Grid */}
      {filteredNotes.length === 0 ? (
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          className="text-center py-16"
        >
          <div className="w-16 h-16 mx-auto mb-4 rounded-2xl bg-slate-800 flex items-center justify-center">
            <StickyNote className="w-8 h-8 text-slate-600" />
          </div>
          <p className="text-slate-400 text-sm">{search ? t('emptyContext') : t('empty')}</p>
          {!search && (
            <button
              onClick={handleNewNote}
              className="mt-4 px-4 py-2 bg-slate-800 hover:bg-slate-700 text-slate-300 text-sm rounded-lg transition-colors cursor-pointer"
            >
              <Plus className="w-4 h-4 inline mr-1" />
              {t('newNote')}
            </button>
          )}
        </motion.div>
      ) : (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3">
          <AnimatePresence mode="popLayout">
            {filteredNotes.map((note) => {
              const contextLabel = getContextLabel(note)
              const displayTitle = note.title || t('untitled')
              const preview = note.content
                ? note.content.replace(/[#*_`\-\[\]]/g, '').slice(0, 120)
                : ''

              return (
                <motion.button
                  key={note.id}
                  layout
                  initial={{ opacity: 0, scale: 0.95 }}
                  animate={{ opacity: 1, scale: 1 }}
                  exit={{ opacity: 0, scale: 0.95 }}
                  onClick={() => navigate(`/di-quest/notes/${note.id}`)}
                  className="text-left p-4 bg-slate-800/70 hover:bg-slate-800 border border-slate-700/50 hover:border-slate-600 rounded-xl transition-all group cursor-pointer"
                >
                  <div className="flex items-start justify-between gap-2 mb-2">
                    <h3 className="text-white text-sm font-medium truncate flex-1">
                      {displayTitle}
                    </h3>
                    {note.pinned && (
                      <Pin className="w-3.5 h-3.5 text-amber-400 flex-shrink-0 mt-0.5" />
                    )}
                  </div>

                  {preview && (
                    <p className="text-slate-400 text-xs leading-relaxed line-clamp-3 mb-3">
                      {preview}
                    </p>
                  )}

                  <div className="flex items-center justify-between">
                    <div className="flex items-center gap-1.5">
                      <Clock className="w-3 h-3 text-slate-600" />
                      <span className="text-slate-500 text-[11px]">{formatDate(note.updatedAt)}</span>
                    </div>
                    {contextLabel && (
                      <span className="px-2 py-0.5 bg-slate-700/50 text-slate-400 text-[10px] rounded-full truncate max-w-[140px]">
                        {contextLabel}
                      </span>
                    )}
                  </div>
                </motion.button>
              )
            })}
          </AnimatePresence>
        </div>
      )}
    </div>
  )
}

export default NotesPage
