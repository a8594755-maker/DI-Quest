import { Outlet, NavLink, useLocation, useNavigate } from 'react-router-dom'
import { useState, useEffect, useCallback } from 'react'
import { Map, BarChart3, MessageCircle, Briefcase, RotateCcw, Search, Users, LogOut, LogIn, ChevronDown, Settings } from 'lucide-react'
import { useTranslation } from 'react-i18next'
import { useQuest } from '../contexts/QuestContext'
import { useAuth } from '../contexts/AuthContext'
import SearchModal from './SearchModal'
import ChatPanel from './ChatPanel'
import LanguageSwitcher from './LanguageSwitcher'
import StreakFlame from './StreakFlame'
import DailyCheckinModal from './DailyCheckinModal'
import ProfileSetupModal from './ProfileSetupModal'
import UserAvatar from './UserAvatar'

function Layout() {
  const { t } = useTranslation(['common', 'auth', 'social'])
  const { levelInfo, getDueReviewCount, streakDays, checkedInToday } = useQuest()
  const { isAuthenticated, isGuest, profile, signOut, needsProfileSetup } = useAuth()
  const navigate = useNavigate()
  const [searchOpen, setSearchOpen] = useState(false)
  const [chatOpen, setChatOpen] = useState(false)
  const [selectedText, setSelectedText] = useState('')
  const [profileMenuOpen, setProfileMenuOpen] = useState(false)
  const [checkinModalOpen, setCheckinModalOpen] = useState(false)
  const [profileSetupOpen, setProfileSetupOpen] = useState(false)
  const dueCount = getDueReviewCount()

  // Show profile setup modal for Google users without username
  useEffect(() => {
    if (isAuthenticated && needsProfileSetup) {
      setProfileSetupOpen(true)
    }
  }, [isAuthenticated, needsProfileSetup])

  // Show checkin modal on first visit if not checked in today
  useEffect(() => {
    if (!checkedInToday && !needsProfileSetup) {
      const timer = setTimeout(() => setCheckinModalOpen(true), 800)
      return () => clearTimeout(timer)
    }
  }, [needsProfileSetup])

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

  // 監聯文字選取 — 選取後顯示「問小迪」浮動按鈕
  const [selectionPopup, setSelectionPopup] = useState(null)

  useEffect(() => {
    const handleMouseUp = () => {
      const path = window.location.pathname
      if (!path.includes('/lesson/') && !path.includes('/case/')) return

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
  const isContentPage = location.pathname.includes('/case') || location.pathname.includes('/lesson') || location.pathname.includes('/quest/')

  return (
    <div className="h-screen flex flex-col overflow-hidden">
      {/* 導航欄 */}
      <nav className="bg-brand-dark border-b border-slate-700 px-3 sm:px-6 py-3 sm:py-4" role="navigation" aria-label={t('nav.mainNav', 'Main navigation')}>
        <div className="max-w-7xl mx-auto flex items-center justify-between">
          <NavLink to="/di-quest" className="flex items-center gap-2 sm:gap-3" aria-label="DI Quest Home">
            <div className="w-8 h-8 sm:w-10 sm:h-10 bg-gradient-to-br from-brand-primary to-brand-secondary rounded-lg flex items-center justify-center">
              <Briefcase className="w-4 h-4 sm:w-5 sm:h-5 text-white" />
            </div>
            <div>
              <h1 className="text-base sm:text-xl font-bold text-white">DI Quest</h1>
              <p className="text-[10px] sm:text-xs text-slate-400 hidden sm:block">{t('nav.subtitle')}</p>
            </div>
          </NavLink>

          <div className="flex items-center gap-2 sm:gap-4">
            <div className="hidden md:flex items-center gap-2">
              <span className="text-brand-accent font-bold">Lv.{levelInfo.level}</span>
              <span className="text-slate-300 text-sm">{levelInfo.title}</span>
            </div>
            <span className="text-brand-accent font-bold text-sm md:hidden">Lv.{levelInfo.level}</span>
            <div className="w-20 sm:w-32 progress-bar hidden sm:block" role="progressbar" aria-valuenow={Math.round(levelInfo.progress * 100)} aria-valuemin={0} aria-valuemax={100} aria-label={`Level progress: ${Math.round(levelInfo.progress * 100)}%`}>
              <div
                className="progress-fill"
                style={{ width: `${Math.round(levelInfo.progress * 100)}%` }}
              />
            </div>
            <span className="text-slate-400 text-xs hidden md:inline">{levelInfo.currentXp} XP</span>
            {/* Streak flame */}
            <button
              onClick={() => setCheckinModalOpen(true)}
              className="flex items-center"
              aria-label={t('social:checkin.title')}
            >
              <StreakFlame streakDays={streakDays} size="sm" />
            </button>
            {/* 搜尋按鈕 */}
            <button
              onClick={() => setSearchOpen(true)}
              className="ml-1 px-2 sm:px-3 py-1 rounded text-xs bg-slate-800 text-slate-400 border border-slate-700 hover:text-slate-200 hover:bg-slate-700 transition-colors flex items-center gap-1.5"
              aria-label={`${t('nav.search')} (⌘K)`}
            >
              <Search className="w-3 h-3" />
              <span className="hidden sm:inline">⌘K</span>
            </button>
            {/* 語言切換 */}
            <LanguageSwitcher />
            {/* User profile menu */}
            <div className="relative">
              <button
                onClick={() => setProfileMenuOpen(!profileMenuOpen)}
                className="flex items-center gap-1.5 ml-1 sm:ml-2 px-1.5 py-1 rounded-lg hover:bg-slate-800 transition-colors"
              >
                {isAuthenticated && profile ? (
                  <UserAvatar username={profile.username} displayName={profile.display_name} avatarUrl={profile.avatar_url} size="sm" />
                ) : (
                  <div className="w-8 h-8 rounded-full bg-slate-700 flex items-center justify-center text-slate-400">
                    <Users className="w-4 h-4" />
                  </div>
                )}
                <ChevronDown className="w-3 h-3 text-slate-500 hidden sm:block" />
              </button>
              {profileMenuOpen && (
                <>
                  <div className="fixed inset-0 z-40" onClick={() => setProfileMenuOpen(false)} />
                  <div className="absolute right-0 top-full mt-2 w-48 bg-slate-800 border border-slate-700 rounded-xl shadow-xl z-50 py-2">
                    {isAuthenticated && profile && (
                      <div className="px-4 py-2 border-b border-slate-700">
                        <p className="text-white text-sm font-medium truncate">{profile.display_name || profile.username}</p>
                        <p className="text-slate-400 text-xs truncate">@{profile.username}</p>
                      </div>
                    )}
                    {isGuest && (
                      <div className="px-4 py-2 border-b border-slate-700">
                        <p className="text-slate-400 text-sm">{t('auth:profile.guest')}</p>
                      </div>
                    )}
                    {isAuthenticated && (
                      <button
                        onClick={() => { setProfileMenuOpen(false); setProfileSetupOpen(true) }}
                        className="w-full px-4 py-2 text-left text-sm text-slate-300 hover:bg-slate-700 flex items-center gap-2"
                      >
                        <Settings className="w-4 h-4" />
                        {t('auth:profile.editProfile', 'Edit Profile')}
                      </button>
                    )}
                    <button
                      onClick={() => { setProfileMenuOpen(false); navigate('/di-quest/friends') }}
                      className="w-full px-4 py-2 text-left text-sm text-slate-300 hover:bg-slate-700 flex items-center gap-2"
                    >
                      <Users className="w-4 h-4" />
                      {t('auth:profile.friends')}
                    </button>
                    {isAuthenticated ? (
                      <button
                        onClick={() => { setProfileMenuOpen(false); signOut(); navigate('/di-quest/login') }}
                        className="w-full px-4 py-2 text-left text-sm text-red-400 hover:bg-slate-700 flex items-center gap-2"
                      >
                        <LogOut className="w-4 h-4" />
                        {t('auth:profile.signOut')}
                      </button>
                    ) : (
                      <button
                        onClick={() => { setProfileMenuOpen(false); navigate('/di-quest/login') }}
                        className="w-full px-4 py-2 text-left text-sm text-brand-primary hover:bg-slate-700 flex items-center gap-2"
                      >
                        <LogIn className="w-4 h-4" />
                        {t('auth:profile.signIn')}
                      </button>
                    )}
                  </div>
                </>
              )}
            </div>
          </div>
        </div>
      </nav>

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
          aria-label={t('float.askXiaoDi')}
        >
          <MessageCircle className="w-3 h-3" />
          {t('float.askXiaoDi')}
        </button>
      )}

      {/* 浮動導航 */}
      <nav
        className={`fixed flex flex-col gap-2 sm:gap-3 z-50 transition-all duration-300 ${
          isArena ? 'bottom-3 scale-75 opacity-70 hover:opacity-100 hover:scale-100' : 'bottom-4 sm:bottom-6'
        }`}
        style={{ right: chatOpen && isContentPage ? 'max(1rem, calc(min(380px, 100vw) + 1.5rem))' : isArena ? '0.75rem' : '1rem' }}
        aria-label={t('float.navLabel', 'Quick navigation')}
      >
        <NavLink
          to="/di-quest/map"
          className={({ isActive }) =>
            `w-10 h-10 sm:w-12 sm:h-12 rounded-full flex items-center justify-center shadow-lg transition-all hover:shadow-xl ${
              isActive ? 'bg-brand-primary text-white' : 'bg-slate-800 text-slate-300 hover:bg-slate-700'
            }`
          }
          aria-label={t('float.questMap')}
        >
          <Map className="w-4 h-4 sm:w-5 sm:h-5" />
        </NavLink>
        <NavLink
          to="/di-quest/progress"
          className={({ isActive }) =>
            `w-10 h-10 sm:w-12 sm:h-12 rounded-full flex items-center justify-center shadow-lg transition-all hover:shadow-xl ${
              isActive ? 'bg-brand-secondary text-white' : 'bg-slate-800 text-slate-300 hover:bg-slate-700'
            }`
          }
          aria-label={t('float.progressDashboard')}
        >
          <BarChart3 className="w-4 h-4 sm:w-5 sm:h-5" />
        </NavLink>
        <NavLink
          to="/di-quest/review"
          className={({ isActive }) =>
            `w-10 h-10 sm:w-12 sm:h-12 rounded-full flex items-center justify-center shadow-lg transition-all hover:shadow-xl relative ${
              isActive ? 'bg-purple-500 text-white' : 'bg-slate-800 text-slate-300 hover:bg-slate-700'
            }`
          }
          aria-label={`${t('float.reviewQueue')}${dueCount > 0 ? ` (${dueCount})` : ''}`}
        >
          <RotateCcw className="w-4 h-4 sm:w-5 sm:h-5" />
          {dueCount > 0 && (
            <span className="absolute -top-1 -right-1 w-5 h-5 bg-red-500 rounded-full text-white text-[10px] flex items-center justify-center font-bold" aria-hidden="true">
              {dueCount > 9 ? '9+' : dueCount}
            </span>
          )}
        </NavLink>
        <NavLink
          to="/di-quest/friends"
          className={({ isActive }) =>
            `w-10 h-10 sm:w-12 sm:h-12 rounded-full flex items-center justify-center shadow-lg transition-all hover:shadow-xl ${
              isActive ? 'bg-cyan-500 text-white' : 'bg-slate-800 text-slate-300 hover:bg-slate-700'
            }`
          }
          aria-label={t('social:friends.title')}
        >
          <Users className="w-4 h-4 sm:w-5 sm:h-5" />
        </NavLink>
        <button
          onClick={() => setChatOpen(prev => !prev)}
          className={`w-10 h-10 sm:w-12 sm:h-12 rounded-full flex items-center justify-center shadow-lg transition-all hover:shadow-xl ${
            chatOpen ? 'bg-brand-accent text-white' : 'bg-slate-800 text-slate-300 hover:bg-slate-700'
          }`}
          aria-label={`${t('float.askXiaoDi')} (⌘J)`}
          aria-expanded={chatOpen}
        >
          <MessageCircle className="w-4 h-4 sm:w-5 sm:h-5" />
        </button>
      </nav>

      {/* 搜尋彈窗 */}
      <SearchModal isOpen={searchOpen} onClose={() => setSearchOpen(false)} />

      {/* 個人資料設定彈窗 */}
      <ProfileSetupModal isOpen={profileSetupOpen} onClose={() => setProfileSetupOpen(false)} />

      {/* 每日簽到彈窗 */}
      <DailyCheckinModal isOpen={checkinModalOpen} onClose={() => setCheckinModalOpen(false)} />

    </div>
  )
}

export default Layout
