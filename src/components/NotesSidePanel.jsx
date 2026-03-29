import { useState, useRef, useEffect } from 'react'
import { X, Plus, StickyNote, Pin, ChevronLeft, Trash2, Clock } from 'lucide-react'
import { motion, AnimatePresence } from 'framer-motion'
import { useLocation } from 'react-router-dom'
import { useTranslation } from 'react-i18next'
import { useNotes } from '../hooks/useNotes'
import { getWorld, getQuest } from '../data/questData'
import NoteEditor from './NoteEditor'

function usePageNoteContext(pathname) {
  const parts = pathname.split('/')
  if (parts.includes('case')) {
    const idx = parts.indexOf('case')
    const worldId = Number(parts[idx + 1])
    const questId = parts[idx + 2]
    const challengeId = parts[idx + 3]
    const challengeKey = challengeId ? `${questId}-${challengeId}` : null
    return { worldId, questId, challengeKey }
  }
  if (parts.includes('lesson')) {
    const worldId = Number(parts[parts.indexOf('lesson') + 1])
    return { worldId, questId: null, challengeKey: null }
  }
  if (parts.includes('quest')) {
    const idx = parts.indexOf('quest')
    const worldId = Number(parts[idx + 1])
    const questId = parts[idx + 2]
    return { worldId, questId, challengeKey: null }
  }
  return { worldId: null, questId: null, challengeKey: null }
}

function NotesSidePanel({ isOpen, onClose, mode = 'sidebar' }) {
  const { t, i18n } = useTranslation('notes')
  const location = useLocation()
  const ctx = usePageNoteContext(location.pathname)
  const { notes, createNote, updateNote, deleteNote, togglePin, getNotesForContext } = useNotes()
  const [activeNoteId, setActiveNoteId] = useState(null)
  const [quickText, setQuickText] = useState('')
  const isComposingRef = useRef(false)

  const contextNotes = ctx.worldId
    ? getNotesForContext(ctx.worldId, ctx.questId, ctx.challengeKey)
    : notes.slice(0, 10)

  const activeNote = activeNoteId ? notes.find(n => n.id === activeNoteId) : null

  const contextLabel = (() => {
    if (ctx.challengeKey) {
      const quest = getQuest(ctx.questId)
      return quest ? `${quest.name} #${ctx.challengeKey.split('-')[2]}` : ctx.challengeKey
    }
    if (ctx.questId) {
      const quest = getQuest(ctx.questId)
      return quest?.name || ctx.questId
    }
    if (ctx.worldId) {
      const world = getWorld(ctx.worldId)
      return world ? `${world.emoji || ''} ${world.name}` : ''
    }
    return t('allNotes')
  })()

  const handleQuickAdd = () => {
    if (!quickText.trim()) return
    const note = createNote({
      content: quickText.trim(),
      worldId: ctx.worldId,
      questId: ctx.questId,
      challengeKey: ctx.challengeKey,
    })
    setQuickText('')
  }

  const handleNewFullNote = () => {
    const note = createNote({
      worldId: ctx.worldId,
      questId: ctx.questId,
      challengeKey: ctx.challengeKey,
    })
    setActiveNoteId(note.id)
  }

  const handleDelete = (noteId) => {
    if (window.confirm(t('deleteConfirm'))) {
      deleteNote(noteId)
      if (activeNoteId === noteId) setActiveNoteId(null)
    }
  }

  const formatTime = (ts) => {
    const diff = Date.now() - ts
    const mins = Math.floor(diff / 60000)
    if (mins < 1) return 'just now'
    if (mins < 60) return `${mins}m`
    const hours = Math.floor(mins / 60)
    if (hours < 24) return `${hours}h`
    return new Date(ts).toLocaleDateString(i18n.language === 'en' ? 'en-US' : 'zh-TW', { month: 'short', day: 'numeric' })
  }

  if (!isOpen) return null

  const panelContent = (
    <>
      {/* Header */}
      <div className="flex items-center justify-between px-3 py-2.5 border-b border-slate-700">
        {activeNote ? (
          <div className="flex items-center gap-2">
            <button
              onClick={() => setActiveNoteId(null)}
              className="p-1 text-slate-400 hover:text-white transition-colors cursor-pointer"
            >
              <ChevronLeft className="w-4 h-4" />
            </button>
            <span className="text-white text-sm font-medium truncate">
              {activeNote.title || t('untitled')}
            </span>
          </div>
        ) : (
          <div className="flex items-center gap-2 min-w-0">
            <div className="w-7 h-7 rounded-full bg-amber-500/20 flex items-center justify-center flex-shrink-0">
              <StickyNote className="w-4 h-4 text-amber-400" />
            </div>
            <div className="min-w-0">
              <span className="text-white text-sm font-medium">{t('title')}</span>
              {contextLabel && (
                <p className="text-slate-500 text-[10px] leading-tight truncate">{contextLabel}</p>
              )}
            </div>
          </div>
        )}
        <div className="flex items-center gap-0.5 flex-shrink-0">
          {!activeNote && (
            <button
              onClick={handleNewFullNote}
              className="p-1.5 text-slate-500 hover:text-white transition-colors rounded cursor-pointer"
              title={t('newNote')}
            >
              <Plus className="w-4 h-4" />
            </button>
          )}
          <button
            onClick={onClose}
            className="p-1.5 text-slate-500 hover:text-white transition-colors rounded cursor-pointer"
          >
            <X className="w-4 h-4" />
          </button>
        </div>
      </div>

      {activeNote ? (
        <NoteEditor
          note={activeNote}
          onUpdate={updateNote}
          onDelete={handleDelete}
          onBack={() => setActiveNoteId(null)}
          onTogglePin={togglePin}
          compact
        />
      ) : (
        <>
          {/* Notes list */}
          <div className="flex-1 overflow-y-auto">
            {contextNotes.length === 0 ? (
              <div className="text-center py-12">
                <StickyNote className="w-8 h-8 text-slate-600 mx-auto mb-2" />
                <p className="text-slate-500 text-sm">{t('emptyContext')}</p>
              </div>
            ) : (
              <div className="py-1">
                <AnimatePresence>
                  {contextNotes.map(note => (
                    <motion.button
                      key={note.id}
                      initial={{ opacity: 0, y: 5 }}
                      animate={{ opacity: 1, y: 0 }}
                      exit={{ opacity: 0 }}
                      onClick={() => setActiveNoteId(note.id)}
                      className="w-full flex items-start gap-3 px-3 py-2.5 text-left hover:bg-slate-800 transition-colors group cursor-pointer"
                    >
                      <div className="min-w-0 flex-1">
                        <div className="flex items-center gap-1.5">
                          {note.pinned && <Pin className="w-3 h-3 text-amber-400 flex-shrink-0" />}
                          <p className="text-white text-sm truncate">
                            {note.title || note.content?.slice(0, 40) || t('untitled')}
                          </p>
                        </div>
                        {note.content && (
                          <p className="text-slate-500 text-[11px] truncate mt-0.5">
                            {note.content.replace(/[#*_`\-\[\]]/g, '').slice(0, 60)}
                          </p>
                        )}
                        <p className="text-slate-600 text-[10px] mt-0.5 flex items-center gap-1">
                          <Clock className="w-2.5 h-2.5" />
                          {formatTime(note.updatedAt)}
                        </p>
                      </div>
                      <button
                        onClick={(e) => { e.stopPropagation(); handleDelete(note.id) }}
                        className="p-1 text-slate-600 hover:text-red-400 opacity-0 group-hover:opacity-100 transition-all flex-shrink-0 cursor-pointer"
                      >
                        <Trash2 className="w-3.5 h-3.5" />
                      </button>
                    </motion.button>
                  ))}
                </AnimatePresence>
              </div>
            )}
          </div>

          {/* Quick add */}
          <div className="px-3 pb-3">
            <div className="flex gap-2 items-end">
              <textarea
                rows={1}
                value={quickText}
                onChange={(e) => {
                  setQuickText(e.target.value)
                  e.target.style.height = 'auto'
                  e.target.style.height = Math.min(e.target.scrollHeight, 80) + 'px'
                }}
                onCompositionStart={() => { isComposingRef.current = true }}
                onCompositionEnd={() => { isComposingRef.current = false }}
                onKeyDown={(e) => {
                  if (e.key === 'Enter' && !e.shiftKey && !isComposingRef.current) {
                    e.preventDefault()
                    handleQuickAdd()
                  }
                }}
                placeholder={t('quickNote')}
                className="flex-1 px-3 py-2.5 bg-slate-800 border border-slate-700 rounded-lg text-white text-sm placeholder-slate-500 focus:outline-none focus:border-amber-500/50 transition-colors resize-none overflow-y-auto"
                style={{ maxHeight: '80px' }}
              />
              <button
                onClick={handleQuickAdd}
                disabled={!quickText.trim()}
                className="px-3 py-2.5 bg-amber-500/20 text-amber-400 rounded-lg hover:bg-amber-500/30 transition-colors disabled:opacity-50 cursor-pointer"
              >
                <Plus className="w-4 h-4" />
              </button>
            </div>
          </div>
        </>
      )}
    </>
  )

  if (mode === 'overlay') {
    return (
      <div className="fixed inset-0 z-[55] flex items-center justify-center" onClick={onClose}>
        <div className="absolute inset-0 bg-black/50 backdrop-blur-sm" />
        <div
          className="relative w-full max-w-lg mx-4 h-[80vh] flex flex-col bg-slate-900 border border-slate-700 rounded-2xl shadow-2xl overflow-hidden"
          onClick={(e) => e.stopPropagation()}
        >
          {panelContent}
        </div>
      </div>
    )
  }

  return (
    <>
      <div className="fixed inset-0 bg-black/50 backdrop-blur-sm z-[54] md:hidden" onClick={onClose} />
      <div className="fixed inset-y-0 right-0 z-[55] w-full max-w-[380px] md:relative md:inset-auto md:z-auto flex flex-col bg-slate-900 border-l border-slate-700 flex-shrink-0 md:w-[380px] min-h-0 overflow-hidden">
        {panelContent}
      </div>
    </>
  )
}

export default NotesSidePanel
