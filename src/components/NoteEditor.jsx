import { useState, useRef, useEffect, useCallback } from 'react'
import { Bold, Italic, List, Heading2, Eye, Pencil, ArrowLeft, Trash2, Pin, PinOff } from 'lucide-react'
import { motion } from 'framer-motion'
import ReactMarkdown from 'react-markdown'
import remarkGfm from 'remark-gfm'
import { useTranslation } from 'react-i18next'

function NoteEditor({ note, onUpdate, onDelete, onBack, onTogglePin, compact = false }) {
  const { t } = useTranslation('notes')
  const [mode, setMode] = useState('edit')
  const [title, setTitle] = useState(note?.title || '')
  const [content, setContent] = useState(note?.content || '')
  const textareaRef = useRef(null)
  const saveTimerRef = useRef(null)

  // Sync state when note prop changes
  useEffect(() => {
    if (note) {
      setTitle(note.title || '')
      setContent(note.content || '')
    }
  }, [note?.id])

  const debouncedSave = useCallback((newTitle, newContent) => {
    if (saveTimerRef.current) clearTimeout(saveTimerRef.current)
    saveTimerRef.current = setTimeout(() => {
      onUpdate(note.id, { title: newTitle, content: newContent })
    }, 500)
  }, [note?.id, onUpdate])

  useEffect(() => {
    return () => {
      if (saveTimerRef.current) clearTimeout(saveTimerRef.current)
    }
  }, [])

  const handleTitleChange = (e) => {
    const newTitle = e.target.value
    setTitle(newTitle)
    debouncedSave(newTitle, content)
  }

  const handleContentChange = (e) => {
    const newContent = e.target.value
    setContent(newContent)
    debouncedSave(title, newContent)
  }

  const insertMarkdown = (prefix, suffix = '') => {
    const textarea = textareaRef.current
    if (!textarea) return
    const start = textarea.selectionStart
    const end = textarea.selectionEnd
    const selected = content.substring(start, end)
    const before = content.substring(0, start)
    const after = content.substring(end)

    const newContent = `${before}${prefix}${selected}${suffix}${after}`
    setContent(newContent)
    debouncedSave(title, newContent)

    // Restore cursor position after the inserted text
    requestAnimationFrame(() => {
      textarea.focus()
      const newPos = start + prefix.length + selected.length + suffix.length
      textarea.setSelectionRange(
        start + prefix.length,
        start + prefix.length + selected.length
      )
    })
  }

  const handleDeleteClick = () => {
    if (window.confirm(t('deleteConfirm'))) {
      onDelete(note.id)
      if (onBack) onBack()
    }
  }

  if (!note) return null

  return (
    <div className={`flex flex-col h-full ${compact ? '' : 'bg-brand-dark'}`}>
      {/* Header */}
      <div className="flex items-center justify-between px-3 py-2 border-b border-slate-700">
        <div className="flex items-center gap-2 min-w-0">
          {onBack && (
            <button
              onClick={onBack}
              className="p-1 text-slate-400 hover:text-white transition-colors cursor-pointer"
              aria-label={t('backToList')}
            >
              <ArrowLeft className="w-4 h-4" />
            </button>
          )}
          <div className="flex items-center gap-1 bg-slate-800 rounded-lg p-0.5">
            <button
              onClick={() => setMode('edit')}
              className={`px-2.5 py-1 text-xs rounded-md transition-colors cursor-pointer ${
                mode === 'edit' ? 'bg-slate-700 text-white' : 'text-slate-400 hover:text-slate-200'
              }`}
            >
              <Pencil className="w-3 h-3 inline mr-1" />
              {t('edit')}
            </button>
            <button
              onClick={() => setMode('preview')}
              className={`px-2.5 py-1 text-xs rounded-md transition-colors cursor-pointer ${
                mode === 'preview' ? 'bg-slate-700 text-white' : 'text-slate-400 hover:text-slate-200'
              }`}
            >
              <Eye className="w-3 h-3 inline mr-1" />
              {t('preview')}
            </button>
          </div>
        </div>
        <div className="flex items-center gap-1">
          {onTogglePin && (
            <button
              onClick={() => onTogglePin(note.id)}
              className={`p-1.5 rounded transition-colors cursor-pointer ${
                note.pinned ? 'text-amber-400 hover:text-amber-300' : 'text-slate-500 hover:text-slate-300'
              }`}
              title={note.pinned ? t('unpin') : t('pin')}
            >
              {note.pinned ? <PinOff className="w-4 h-4" /> : <Pin className="w-4 h-4" />}
            </button>
          )}
          <button
            onClick={handleDeleteClick}
            className="p-1.5 text-slate-500 hover:text-red-400 transition-colors cursor-pointer"
            title={t('deleteNote')}
          >
            <Trash2 className="w-4 h-4" />
          </button>
        </div>
      </div>

      {mode === 'edit' ? (
        <div className="flex-1 flex flex-col min-h-0">
          {/* Title */}
          <input
            type="text"
            value={title}
            onChange={handleTitleChange}
            placeholder={t('titlePlaceholder')}
            className="px-4 py-2.5 bg-transparent text-white text-base font-medium placeholder-slate-600 focus:outline-none border-b border-slate-800"
          />

          {/* Toolbar */}
          <div className="flex items-center gap-0.5 px-3 py-1.5 border-b border-slate-800">
            <ToolbarBtn
              icon={<Bold className="w-3.5 h-3.5" />}
              title={t('bold')}
              onClick={() => insertMarkdown('**', '**')}
            />
            <ToolbarBtn
              icon={<Italic className="w-3.5 h-3.5" />}
              title={t('italic')}
              onClick={() => insertMarkdown('*', '*')}
            />
            <ToolbarBtn
              icon={<Heading2 className="w-3.5 h-3.5" />}
              title={t('heading')}
              onClick={() => insertMarkdown('## ')}
            />
            <ToolbarBtn
              icon={<List className="w-3.5 h-3.5" />}
              title={t('bulletList')}
              onClick={() => insertMarkdown('- ')}
            />
          </div>

          {/* Textarea */}
          <textarea
            ref={textareaRef}
            value={content}
            onChange={handleContentChange}
            placeholder={t('contentPlaceholder')}
            className="flex-1 px-4 py-3 bg-transparent text-slate-200 text-sm leading-relaxed placeholder-slate-600 focus:outline-none resize-none overflow-y-auto"
          />
        </div>
      ) : (
        <div className="flex-1 overflow-y-auto px-4 py-3">
          {title && (
            <h2 className="text-white text-lg font-semibold mb-3">{title}</h2>
          )}
          {content ? (
            <div className="prose prose-invert prose-sm max-w-none prose-p:my-2 prose-li:my-0.5 prose-headings:my-3 prose-hr:my-3 prose-ul:my-2 prose-ol:my-2">
              <ReactMarkdown remarkPlugins={[remarkGfm]}>{content}</ReactMarkdown>
            </div>
          ) : (
            <p className="text-slate-500 text-sm italic">{t('contentPlaceholder')}</p>
          )}
        </div>
      )}
    </div>
  )
}

function ToolbarBtn({ icon, title, onClick }) {
  return (
    <button
      onClick={onClick}
      className="p-1.5 text-slate-500 hover:text-white hover:bg-slate-700 rounded transition-colors cursor-pointer"
      title={title}
    >
      {icon}
    </button>
  )
}

export default NoteEditor
