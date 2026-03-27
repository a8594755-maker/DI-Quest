import { Outlet, NavLink, useLocation } from 'react-router-dom'
import { Map, BarChart3, MessageCircle, Swords, Unlock } from 'lucide-react'
import { useQuest } from '../contexts/QuestContext'

function Layout() {
  const { levelInfo, devMode, dispatch } = useQuest()
  const location = useLocation()
  const isArena = location.pathname.includes('/arena')

  return (
    <div className="min-h-screen flex flex-col">
      {/* 導航欄 */}
      <nav className="bg-brand-dark border-b border-slate-700 px-6 py-4">
        <div className="max-w-7xl mx-auto flex items-center justify-between">
          <NavLink to="/di-quest" className="flex items-center gap-3">
            <div className="w-10 h-10 bg-gradient-to-br from-brand-primary to-brand-secondary rounded-lg flex items-center justify-center">
              <Swords className="w-5 h-5 text-white" />
            </div>
            <div>
              <h1 className="text-xl font-bold text-white">DI Quest</h1>
              <p className="text-xs text-slate-400">從你自己的專案學會寫程式</p>
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

      {/* 子路由內容 */}
      <main className="flex-1">
        <Outlet />
      </main>

      {/* 浮動導航 — CodeArena 時縮到角落避免擋住編輯器 */}
      <div className={`fixed flex flex-col gap-3 z-50 transition-all duration-300 ${
        isArena ? 'bottom-3 right-3 scale-75 opacity-70 hover:opacity-100 hover:scale-100' : 'bottom-6 right-6'
      }`}>
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
          to="/di-quest/chat"
          className={({ isActive }) =>
            `w-12 h-12 rounded-full flex items-center justify-center shadow-lg transition-colors ${
              isActive ? 'bg-brand-accent text-white' : 'bg-slate-800 text-slate-400 hover:bg-slate-700'
            }`
          }
          title="問小迪"
        >
          <MessageCircle className="w-5 h-5" />
        </NavLink>
      </div>
    </div>
  )
}

export default Layout
