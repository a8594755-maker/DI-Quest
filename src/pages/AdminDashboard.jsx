import { useState } from 'react'
import { motion } from 'framer-motion'
import { Users, Activity, TrendingUp, Zap, RefreshCw, Clock, Trophy, Flame, Target, ChevronDown, ChevronUp } from 'lucide-react'
import { useAdminData } from '../hooks/useAdminData'
import UserAvatar from '../components/UserAvatar'

function StatCard({ icon: Icon, label, value, color, delay = 0 }) {
  return (
    <motion.div
      initial={{ opacity: 0, y: 20 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ delay }}
      className="card p-4 sm:p-5"
    >
      <div className="flex items-center gap-3">
        <div className={`w-10 h-10 rounded-xl ${color} flex items-center justify-center`}>
          <Icon className="w-5 h-5 text-white" />
        </div>
        <div>
          <p className="text-slate-400 text-xs">{label}</p>
          <p className="text-white text-xl font-bold">{value}</p>
        </div>
      </div>
    </motion.div>
  )
}

function BarChart({ data, color = 'bg-brand-primary', unit = '' }) {
  if (!data || data.length === 0) return <p className="text-slate-500 text-sm">No data</p>
  const max = Math.max(...data.map(d => d.value), 1)
  return (
    <div className="space-y-1.5">
      {data.map((item, i) => (
        <div key={i} className="flex items-center gap-3">
          <span className="text-slate-400 text-xs w-12 text-right flex-shrink-0">{item.label}</span>
          <div className="flex-1 bg-slate-800 rounded-full h-4 overflow-hidden">
            <div
              className={`${color} h-full rounded-full transition-all duration-500`}
              style={{ width: `${Math.max((item.value / max) * 100, 2)}%` }}
            />
          </div>
          <span className="text-slate-300 text-xs w-10 flex-shrink-0">{item.value}{unit}</span>
        </div>
      ))}
    </div>
  )
}

function AdminDashboard() {
  const { metrics, userSummaries, recentCheckins, loading, error, refresh } = useAdminData()
  const [sortField, setSortField] = useState('total_xp')
  const [sortAsc, setSortAsc] = useState(false)
  const [expandedUser, setExpandedUser] = useState(null)

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-[60vh]">
        <div className="flex flex-col items-center gap-4">
          <div className="w-10 h-10 border-2 border-brand-primary border-t-transparent rounded-full animate-spin" />
          <p className="text-slate-400 text-sm">Loading admin data...</p>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="max-w-5xl mx-auto p-6">
        <div className="card p-6 text-center">
          <p className="text-red-400 mb-4">Error: {error}</p>
          <button onClick={refresh} className="btn-primary px-4 py-2">Retry</button>
        </div>
      </div>
    )
  }

  const handleSort = (field) => {
    if (sortField === field) {
      setSortAsc(!sortAsc)
    } else {
      setSortField(field)
      setSortAsc(false)
    }
  }

  const sortedUsers = [...userSummaries].sort((a, b) => {
    const av = a[sortField] ?? 0
    const bv = b[sortField] ?? 0
    return sortAsc ? av - bv : bv - av
  })

  const SortIcon = ({ field }) => {
    if (sortField !== field) return null
    return sortAsc ? <ChevronUp className="w-3 h-3 inline ml-0.5" /> : <ChevronDown className="w-3 h-3 inline ml-0.5" />
  }

  const roleBadge = (role) => {
    if (role === 'admin') return <span className="px-1.5 py-0.5 rounded text-[10px] bg-red-500/20 text-red-400 font-medium">Admin</span>
    if (role === 'premium') return <span className="px-1.5 py-0.5 rounded text-[10px] bg-amber-500/20 text-amber-400 font-medium">Premium</span>
    return null
  }

  return (
    <div className="max-w-6xl mx-auto p-4 sm:p-6">
      {/* Header */}
      <div className="flex items-center justify-between mb-6">
        <div>
          <h2 className="text-2xl sm:text-3xl font-bold text-white mb-1">Admin Dashboard</h2>
          <p className="text-slate-400 text-sm">Monitor all users and platform activity</p>
        </div>
        <button
          onClick={refresh}
          className="p-2 rounded-lg bg-slate-800 hover:bg-slate-700 transition-colors"
          title="Refresh"
        >
          <RefreshCw className="w-5 h-5 text-slate-300" />
        </button>
      </div>

      {/* Overview Stats */}
      <div className="grid grid-cols-2 sm:grid-cols-4 gap-3 sm:gap-4 mb-6">
        <StatCard icon={Users} label="Total Users" value={metrics.totalUsers} color="bg-blue-500" delay={0} />
        <StatCard icon={Activity} label="Active Today" value={metrics.activeToday} color="bg-emerald-500" delay={0.05} />
        <StatCard icon={TrendingUp} label="Active This Week" value={metrics.activeThisWeek} color="bg-purple-500" delay={0.1} />
        <StatCard icon={Zap} label="API Calls (All)" value={metrics.totalApiCalls} color="bg-amber-500" delay={0.15} />
      </div>

      {/* DAU Trend + API Usage Charts */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-4 mb-6">
        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.2 }} className="card p-5">
          <h4 className="text-white font-medium mb-4 flex items-center gap-2">
            <Activity className="w-4 h-4 text-brand-primary" />
            Daily Active Users (30 days)
          </h4>
          <BarChart data={metrics.dauTrend} color="bg-brand-primary" />
        </motion.div>

        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.25 }} className="card p-5">
          <h4 className="text-white font-medium mb-4 flex items-center gap-2">
            <Zap className="w-4 h-4 text-brand-accent" />
            API Usage (14 days)
          </h4>
          <BarChart data={metrics.apiTrend} color="bg-brand-accent" />
        </motion.div>
      </div>

      {/* User Table */}
      <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.3 }} className="card p-5 mb-6">
        <h4 className="text-white font-medium mb-4 flex items-center gap-2">
          <Users className="w-4 h-4 text-brand-primary" />
          All Users ({userSummaries.length})
        </h4>

        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead>
              <tr className="text-slate-400 text-xs border-b border-slate-700">
                <th className="text-left py-2 px-2">User</th>
                <th className="text-right py-2 px-2 cursor-pointer hover:text-slate-200" onClick={() => handleSort('total_xp')}>
                  XP <SortIcon field="total_xp" />
                </th>
                <th className="text-right py-2 px-2 cursor-pointer hover:text-slate-200 hidden sm:table-cell" onClick={() => handleSort('streak_days')}>
                  Streak <SortIcon field="streak_days" />
                </th>
                <th className="text-right py-2 px-2 cursor-pointer hover:text-slate-200 hidden sm:table-cell" onClick={() => handleSort('longest_streak')}>
                  Best <SortIcon field="longest_streak" />
                </th>
                <th className="text-right py-2 px-2 cursor-pointer hover:text-slate-200 hidden md:table-cell" onClick={() => handleSort('challengesCompleted')}>
                  Challenges <SortIcon field="challengesCompleted" />
                </th>
                <th className="text-right py-2 px-2 cursor-pointer hover:text-slate-200 hidden md:table-cell" onClick={() => handleSort('questsCompleted')}>
                  Quests <SortIcon field="questsCompleted" />
                </th>
                <th className="text-right py-2 px-2 cursor-pointer hover:text-slate-200 hidden lg:table-cell" onClick={() => handleSort('totalCheckins')}>
                  Check-ins <SortIcon field="totalCheckins" />
                </th>
                <th className="text-right py-2 px-2 hidden lg:table-cell">Last Active</th>
              </tr>
            </thead>
            <tbody>
              {sortedUsers.map((user) => (
                <tr
                  key={user.id}
                  className="border-b border-slate-800 hover:bg-slate-800/50 cursor-pointer transition-colors"
                  onClick={() => setExpandedUser(expandedUser === user.id ? null : user.id)}
                >
                  <td className="py-2.5 px-2">
                    <div className="flex items-center gap-2">
                      <UserAvatar username={user.username} displayName={user.display_name} avatarUrl={user.avatar_url} size="sm" />
                      <div className="min-w-0">
                        <div className="text-white text-sm truncate flex items-center gap-1.5">
                          {user.display_name || user.username}
                          {roleBadge(user.role)}
                        </div>
                        <div className="text-slate-500 text-xs truncate">@{user.username}</div>
                      </div>
                    </div>
                  </td>
                  <td className="text-right py-2 px-2 text-brand-accent font-medium">{user.total_xp || 0}</td>
                  <td className="text-right py-2 px-2 text-slate-300 hidden sm:table-cell">
                    {user.streak_days || 0}
                    {user.streak_days >= 3 && <Flame className="w-3 h-3 inline ml-1 text-orange-400" />}
                  </td>
                  <td className="text-right py-2 px-2 text-slate-400 hidden sm:table-cell">{user.longest_streak || 0}</td>
                  <td className="text-right py-2 px-2 text-slate-300 hidden md:table-cell">{user.challengesCompleted}</td>
                  <td className="text-right py-2 px-2 text-slate-300 hidden md:table-cell">{user.questsCompleted}</td>
                  <td className="text-right py-2 px-2 text-slate-400 hidden lg:table-cell">{user.totalCheckins}</td>
                  <td className="text-right py-2 px-2 text-slate-500 text-xs hidden lg:table-cell">{user.last_active_date || '-'}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </motion.div>

      {/* Bottom: Top API Users + Recent Checkins */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-4">
        {/* Top API Consumers */}
        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.35 }} className="card p-5">
          <h4 className="text-white font-medium mb-4 flex items-center gap-2">
            <Target className="w-4 h-4 text-brand-accent" />
            Top API Users (7 days)
          </h4>
          {metrics.topApiUsers.length === 0 ? (
            <p className="text-slate-500 text-sm">No API usage</p>
          ) : (
            <div className="space-y-2">
              {metrics.topApiUsers.map((u, i) => (
                <div key={u.userId} className="flex items-center justify-between">
                  <div className="flex items-center gap-2">
                    <span className="text-slate-500 text-xs w-5">{i + 1}.</span>
                    <span className="text-slate-300 text-sm">{u.name}</span>
                  </div>
                  <span className="text-brand-accent text-sm font-medium">{u.count} calls</span>
                </div>
              ))}
            </div>
          )}
        </motion.div>

        {/* Recent Check-ins */}
        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.4 }} className="card p-5">
          <h4 className="text-white font-medium mb-4 flex items-center gap-2">
            <Clock className="w-4 h-4 text-brand-secondary" />
            Recent Check-ins
          </h4>
          {recentCheckins.length === 0 ? (
            <p className="text-slate-500 text-sm">No check-ins yet</p>
          ) : (
            <div className="space-y-2">
              {recentCheckins.map((c) => (
                <div key={c.id} className="flex items-center justify-between">
                  <div className="flex items-center gap-2">
                    <UserAvatar username={c.displayName} displayName={c.displayName} avatarUrl={c.avatarUrl} size="sm" />
                    <div>
                      <span className="text-slate-300 text-sm">{c.displayName}</span>
                      <span className="text-slate-500 text-xs ml-2">{c.checkin_date}</span>
                    </div>
                  </div>
                  <span className="text-brand-accent text-xs font-medium">+{c.xp_earned || 0} XP</span>
                </div>
              ))}
            </div>
          )}
        </motion.div>
      </div>
    </div>
  )
}

export default AdminDashboard
