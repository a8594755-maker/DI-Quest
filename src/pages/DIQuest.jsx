import { Outlet } from 'react-router-dom'

/**
 * DI Quest 主頁面
 * 作為子路由的佈局容器
 */
function DIQuest() {
  return (
    <div className="min-h-[calc(100vh-73px)]">
      <Outlet />
    </div>
  )
}

export default DIQuest
