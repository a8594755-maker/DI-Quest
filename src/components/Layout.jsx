import { Outlet, NavLink, useLocation } from 'react-router-dom'
import { useState, useEffect, useCallback } from 'react'
import { Map, BarChart3, MessageCircle, Briefcase, Unlock, RotateCcw, Search } from 'lucide-react'
import { useQuest } from '../contexts/QuestContext'
import SearchModal from './SearchModal'
import ChatPanel from './ChatPanel'

function Layout() {
  const { levelInfo, devMode, dispatch, getDueReviewCount } = useQuest()
  const [searchOpen, setSearchOpen] = useState(false)
  const [chatOpen, setChatOpen] = useState(false)
  const [selectedText, setSelectedText] = useState('')
  const dueCount = getDueReviewCount()

  // Cmd+K / Ctrl+K 搜尋快捷鍵
  // Cmd+J / Ctrl+J 開啟小迪
  useEffect(() => {
    const handleKeyDown = (e) => {
      if ((e.metaKey || e.ctrlKey) && e.key === 'k') {
        e.preventDefault()
        setSearchOpen(prev => !prev)
      }
      if ((e.metaKey || e.ctrlKey) && e.key === 'j') {
        e.preventDefault()
        setChatOpen(prev => !prev)
      }
    }
    window.addEventListener('keydown', handleKeyDown)
    return () => window.removeEventListener('keydown', handleKeyDown)
  }, [])

  // 監聽文字選取 — 選取後顯示「問小迪」浮動按鈕
  const [selectionPopup, setSelectionPopup] = useState(null)

  useEffect(() => {
    const handleMouseUp = () => {
      const selection = window.getSelection()
      const text = selection?.toString().trim()
      if (text && text.length > 2) {
        const range = selection.getRangeAt(0)
        const rect = range.getBoundingClientRect()
        setSelectionPopup({
          text,
          x: rect.left + rect.width / 2,
          y: rect.top - 10,
        })
      } else {
        setSelectionPopup(null)
      }
    }

    const handleMouseDown = (e) => {
      // 如果點到的不是 popup 按鈕，就清除
      if (!e.target.closest('[data-selection-popup]')) {
        setSelectionPopup(null)
      }
    }

    document.addEventListener('mouseup', handleMouseUp)
    document.addEventListener('mousedown', handleMouseDown)
    return () => {
      document.removeEventListener('mouseup', handleMouseUp)
      document.removeEventListener('mousedown', handleMouseDown)
    }
  }, [])

  const handleAskAboutSelection = useCallback(() => {
    if (selectionPopup?.text) {
      setSelectedText(selectionPopup.text)
      setChatOpen(true)
      setSelectionPopup(null)
    }
  }, [selectionPopup])

  const location = useLocation()
  const isArena = location.pathname.includes('/case')
  // 講義 / 題目 / quest 詳情 → 側邊欄推開；主畫面 → 全螢幕覆蓋
  const isContentPage = location.pathname.includes('/case') || location.pathname.includes('/lesson') || location.pathname.includes('/quest/')

  return (
    <div className="h-screen flex flex-col overflow-hidden">
      {/* 導航欄 */}
      <nav className="bg-brand-dark border-b border-slate-700 px-6 py-4">
        <div className="max-w-7xl mx-auto flex items-center justify-between">
          <NavLink to="/di-quest" className="flex items-center gap-3">
            <div className="w-10 h-10 bg-gradient-to-br from-brand-primary to-brand-secondary rounded-lg flex items-center justify-center">
              <Briefcase className="w-5 h-5 text-white" />
            </div>
            <div>
              <h1 className="text-xl font-bold text-white">DI Quest</h1>
              <p className="text-xs text-slate-400">Case Study 面試練習</p>
            </div>
          </NavLink>

          <div className="flex items-center gap-4">
            <div className="flex items-center gap-2">
              <span className="text-brand-accent font-bold">Lv.{levelInfo.level}</span>
              <span className="text-slate-400 text-sm">{levelInfo.title}</span>
            </div>
            <div className="w-32 progress-bar">
              <div
                className="progress-fill"
                style={{ width: `${Math.round(levelInfo.progress * 100)}%` }}
              />
            </div>
            <span className="text-slate-500 text-xs">{levelInfo.currentXp} XP</span>
            {/* 搜尋按鈕 */}
            <button
              onClick={() => setSearchOpen(true)}
              className="ml-1 px-3 py-1 rounded text-xs bg-slate-800 text-slate-400 border border-slate-700 hover:text-slate-300 transition-colors flex items-center gap-1.5"
              title="搜尋 (⌘K)"
            >
              <Search className="w-3 h-3" />
              <span className="hidden sm:inline">⌘K</span>
            </button>
            {/* 開發者模式切換 */}
            <button
              onClick={() => dispatch({ type: 'TOGGLE_DEV_MODE' })}
              className={`ml-2 px-3 py-1 rounded text-xs font-mono transition-colors ${
                devMode
                  ? 'bg-amber-500/20 text-amber-400 border border-amber-500/50'
                  : 'bg-slate-800 text-slate-500 border border-slate-700 hover:text-slate-300'
              }`}
              title="開發者模式：解鎖全部關卡"
            >
              <Unlock className="w-3 h-3 inline mr-1" />
              {devMode ? 'DEV ON' : 'DEV'}
            </button>
          </div>
        </div>
      </nav>

      {/* 開發者模式提示條 */}
      {devMode && (
        <div className="bg-amber-500/10 border-b border-amber-500/30 px-4 py-1.5 text-center">
          <span className="text-amber-400 text-xs font-mono">🔓 開發者模式：全部關卡已解鎖</span>
        </div>
      )}

      {/* 內容 + 小迪面板 flex 排版 */}
      <div className="flex-1 flex min-h-0 overflow-hidden">
        <main className="flex-1 overflow-y-auto transition-all duration-300">
          <Outlet />
        </main>

        {/* 側邊欄模式：講義/題目頁推開內容 */}
        {isContentPage && (
          <ChatPanel
            isOpen={chatOpen}
            onClose={() => setChatOpen(false)}
            selectedText={selectedText}
            onClearSelection={() => setSelectedText('')}
            mode="sidebar"
          />
        )}
      </div>

      {/* 全螢幕覆蓋模式：主畫面（地圖/進度/複習） */}
      {!isContentPage && (
        <ChatPanel
          isOpen={chatOpen}
          onClose={() => setChatOpen(false)}
          selectedText={selectedText}
          onClearSelection={() => setSelectedText('')}
          mode="overlay"
        />
      )}

      {/* 選取文字後的浮動「問小迪」按鈕 */}
      {selectionPopup && (
        <button
          data-selection-popup
          onClick={handleAskAboutSelection}
          className="fixed z-[70] flex items-center gap-1.5 px-3 py-1.5 bg-brand-accent text-white text-xs font-medium rounded-full shadow-lg hover:bg-amber-500 transition-colors animate-fade-in"
          style={{
            left: `${selectionPopup.x}px`,
            top: `${selectionPopup.y}px`,
            transform: 'translate(-50%, -100%)',
          }}
        >
          <MessageCircle className="w-3 h-3" />
          問小迪
        </button>
      )}

      {/* 浮動導航 */}
      <div
        className={`fixed flex flex-col gap-3 z-50 transition-all duration-300 ${
          isArena ? 'bottom-3 scale-75 opacity-70 hover:opacity-100 hover:scale-100' : 'bottom-6'
        }`}
        style={{ right: chatOpen && isContentPage ? 'calc(380px + 1.5rem)' : isArena ? '0.75rem' : '1.5rem' }}
      >
        <NavLink
          to="/di-quest/map"
          className={({ isActive }) =>
            `w-12 h-12 rounded-full flex items-center justify-center shadow-lg transition-colors ${
              isActive ? 'bg-brand-primary text-white' : 'bg-slate-800 text-slate-400 hover:bg-slate-700'
            }`
          }
          title="關卡地圖"
        >
          <Map className="w-5 h-5" />
        </NavLink>
        <NavLink
          to="/di-quest/progress"
          className={({ isActive }) =>
            `w-12 h-12 rounded-full flex items-center justify-center shadow-lg transition-colors ${
              isActive ? 'bg-brand-secondary text-white' : 'bg-slate-800 text-slate-400 hover:bg-slate-700'
            }`
          }
          title="進度儀表板"
        >
          <BarChart3 className="w-5 h-5" />
        </NavLink>
        <NavLink
          to="/di-quest/review"
          className={({ isActive }) =>
            `w-12 h-12 rounded-full flex items-center justify-center shadow-lg transition-colors relative ${
              isActive ? 'bg-purple-500 text-white' : 'bg-slate-800 text-slate-400 hover:bg-slate-700'
            }`
          }
          title="複習佇列"
        >
          <RotateCcw className="w-5 h-5" />
          {dueCount > 0 && (
            <span className="absolute -top-1 -right-1 w-5 h-5 bg-red-500 rounded-full text-white text-[10px] flex items-center justify-center font-bold">
              {dueCount > 9 ? '9+' : dueCount}
            </span>
          )}
        </NavLink>
        <button
          onClick={() => setChatOpen(prev => !prev)}
          className={`w-12 h-12 rounded-full flex items-center justify-center shadow-lg transition-colors ${
            chatOpen ? 'bg-brand-accent text-white' : 'bg-slate-800 text-slate-400 hover:bg-slate-700'
          }`}
          title="問小迪 (⌘J)"
        >
          <MessageCircle className="w-5 h-5" />
        </button>
      </div>

      {/* 搜尋彈窗 */}
      <SearchModal isOpen={searchOpen} onClose={() => setSearchOpen(false)} />

    </div>
  )
}

export default Layout
