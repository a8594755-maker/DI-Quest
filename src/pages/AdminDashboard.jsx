import { useState, useMemo, useCallback } from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import { Users, Activity, TrendingUp, Zap, RefreshCw, Clock, Trophy, Flame, Target, ChevronDown, ChevronUp, ArrowLeft, Calendar, BarChart3, BookOpen, X, Crown, ShieldBan, ShieldCheck, ChevronLeft, ChevronRight } from 'lucide-react'
import { useAdminData } from '../hooks/useAdminData'
import { BRANCHES } from '../data/branches'
import { WORLDS } from '../data/questData'
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

// ========================
// Check-in Calendar for User Detail
// ========================
function CheckinCalendar({ checkinDates }) {
  const [monthOffset, setMonthOffset] = useState(0)

  const dateSet = useMemo(() => new Set(checkinDates), [checkinDates])

  const { year, month, weeks, label } = useMemo(() => {
    const now = new Date()
    const target = new Date(now.getFullYear(), now.getMonth() + monthOffset, 1)
    const y = target.getFullYear()
    const m = target.getMonth()
    const label = target.toLocaleDateString('en-US', { year: 'numeric', month: 'long' })

    // First day of month and total days
    const firstDay = new Date(y, m, 1).getDay() // 0=Sun
    const daysInMonth = new Date(y, m + 1, 0).getDate()
    const today = new Date().toISOString().slice(0, 10)

    // Build weeks grid
    const weeks = []
    let week = new Array(firstDay).fill(null) // pad start

    for (let d = 1; d <= daysInMonth; d++) {
      const dateStr = `${y}-${String(m + 1).padStart(2, '0')}-${String(d).padStart(2, '0')}`
      week.push({ day: d, date: dateStr, isCheckedIn: dateSet.has(dateStr), isToday: dateStr === today })
      if (week.length === 7) {
        weeks.push(week)
        week = []
      }
    }
    if (week.length > 0) {
      while (week.length < 7) week.push(null)
      weeks.push(week)
    }

    return { year: y, month: m, weeks, label }
  }, [monthOffset, dateSet])

  const monthCheckins = useMemo(() => {
    const prefix = `${year}-${String(month + 1).padStart(2, '0')}`
    return checkinDates.filter(d => d.startsWith(prefix)).length
  }, [checkinDates, year, month])

  return (
    <div>
      {/* Month nav */}
      <div className="flex items-center justify-between mb-3">
        <button onClick={() => setMonthOffset(prev => prev - 1)} className="p-1 rounded hover:bg-slate-700 transition-colors">
          <ChevronLeft className="w-4 h-4 text-slate-400" />
        </button>
        <span className="text-slate-300 text-sm font-medium">{label}</span>
        <button
          onClick={() => setMonthOffset(prev => Math.min(prev + 1, 0))}
          disabled={monthOffset >= 0}
          className="p-1 rounded hover:bg-slate-700 transition-colors disabled:opacity-30"
        >
          <ChevronRight className="w-4 h-4 text-slate-400" />
        </button>
      </div>

      {/* Day headers */}
      <div className="grid grid-cols-7 gap-1 mb-1">
        {['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'].map(d => (
          <div key={d} className="text-center text-[10px] text-slate-500 py-0.5">{d}</div>
        ))}
      </div>

      {/* Calendar grid */}
      <div className="space-y-1">
        {weeks.map((week, wi) => (
          <div key={wi} className="grid grid-cols-7 gap-1">
            {week.map((cell, ci) => (
              <div
                key={ci}
                className={`aspect-square rounded-md flex items-center justify-center text-xs transition-colors ${
                  !cell
                    ? ''
                    : cell.isCheckedIn
                      ? 'bg-emerald-500/25 text-emerald-400 font-medium'
                      : cell.isToday
                        ? 'bg-slate-700 text-white ring-1 ring-brand-primary'
                        : 'bg-slate-800/30 text-slate-600'
                }`}
                title={cell?.date}
              >
                {cell?.day}
              </div>
            ))}
          </div>
        ))}
      </div>

      {/* Month summary */}
      <p className="text-slate-500 text-xs text-center mt-2">
        {monthCheckins} check-in{monthCheckins !== 1 ? 's' : ''} this month
      </p>
    </div>
  )
}

// ========================
// User Detail Panel
// ========================
function UserDetailPanel({ userId, getUserDetail, updateUserRole, toggleApiBlock, onClose }) {
  const { profile, progress, checkins, apiUsage } = getUserDetail(userId)
  const [actionLoading, setActionLoading] = useState(null) // 'role' | 'block'

  const questStatus = progress?.questStatus || {}
  const challengeStatus = progress?.challengeStatus || {}
  const analytics = progress?.analytics || { dailyStats: {}, challengeTimings: {} }
  const reviewSchedule = progress?.reviewSchedule || {}

  // Daily activity (last 14 days)
  const dailyActivity = useMemo(() => {
    const days = []
    for (let i = 13; i >= 0; i--) {
      const d = new Date(Date.now() - i * 86400000)
      const key = d.toISOString().slice(0, 10)
      const stats = analytics.dailyStats[key]
      days.push({
        label: `${d.getMonth() + 1}/${d.getDate()}`,
        value: stats?.challengesCompleted || 0,
      })
    }
    return days
  }, [analytics.dailyStats])

  // XP trend (last 14 days)
  const xpTrend = useMemo(() => {
    const days = []
    for (let i = 13; i >= 0; i--) {
      const d = new Date(Date.now() - i * 86400000)
      const key = d.toISOString().slice(0, 10)
      const stats = analytics.dailyStats[key]
      days.push({
        label: `${d.getMonth() + 1}/${d.getDate()}`,
        value: stats?.xpEarned || 0,
      })
    }
    return days
  }, [analytics.dailyStats])

  if (!profile) return null

  const totalChallenges = Object.values(challengeStatus).filter(c => c.completed).length
  const totalQuests = Object.values(questStatus).filter(q => q.completed).length
  const totalReviewDue = Object.values(reviewSchedule).filter(r => r.nextReviewDate <= new Date().toISOString().slice(0, 10)).length

  // Branch progress
  const branchProgress = BRANCHES.map(branch => {
    const worlds = WORLDS.filter(w => branch.worldIds.includes(w.id))
    const worldDetails = worlds.map(w => {
      const completed = w.quests.filter(q => questStatus[q.id]?.completed).length
      return { id: w.id, name: `${w.emoji} ${w.name}`, completed, total: w.quests.length }
    })
    const totalCompleted = worldDetails.reduce((s, w) => s + w.completed, 0)
    const totalAll = worldDetails.reduce((s, w) => s + w.total, 0)
    return { ...branch, worldDetails, totalCompleted, totalAll }
  })

  // Checkin history
  const checkinDates = checkins.map(c => c.checkin_date).sort().reverse()

  // API usage for this user
  const totalApiCalls = apiUsage.reduce((s, u) => s + (u.call_count || 0), 0)

  // API usage per day (last 14 days)
  const apiPerDay = (() => {
    const map = {}
    for (let i = 13; i >= 0; i--) {
      const d = new Date(Date.now() - i * 86400000)
      map[d.toISOString().slice(0, 10)] = 0
    }
    apiUsage.forEach(u => {
      if (map[u.usage_date] !== undefined) map[u.usage_date] += u.call_count || 0
    })
    return Object.entries(map).map(([date, count]) => {
      const d = new Date(date)
      return { label: `${d.getMonth() + 1}/${d.getDate()}`, value: count }
    })
  })()

  const handleRoleChange = async (newRole) => {
    setActionLoading('role')
    try { await updateUserRole(userId, newRole) } catch (err) { console.error(err) }
    setActionLoading(null)
  }

  const handleToggleBlock = async () => {
    setActionLoading('block')
    try { await toggleApiBlock(userId, !profile.api_blocked) } catch (err) { console.error(err) }
    setActionLoading(null)
  }

  // Recently completed challenges
  const recentChallenges = Object.entries(challengeStatus)
    .filter(([, v]) => v.completed)
    .map(([key, v]) => ({ key, ...v }))
    .sort((a, b) => (b.earnedXp || 0) - (a.earnedXp || 0))
    .slice(0, 10)

  const roleBadge = (role) => {
    if (role === 'admin') return <span className="px-2 py-0.5 rounded text-xs bg-red-500/20 text-red-400 font-medium">Admin</span>
    if (role === 'premium') return <span className="px-2 py-0.5 rounded text-xs bg-amber-500/20 text-amber-400 font-medium">Premium</span>
    return <span className="px-2 py-0.5 rounded text-xs bg-slate-500/20 text-slate-400 font-medium">Free</span>
  }

  return (
    <motion.div
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      exit={{ opacity: 0 }}
      className="fixed inset-0 z-[60] bg-black/60 backdrop-blur-sm overflow-y-auto"
      onClick={onClose}
    >
      <motion.div
        initial={{ opacity: 0, x: 100 }}
        animate={{ opacity: 1, x: 0 }}
        exit={{ opacity: 0, x: 100 }}
        transition={{ type: 'spring', damping: 25 }}
        className="ml-auto w-full max-w-2xl min-h-screen bg-slate-900 border-l border-slate-700 p-6 overflow-y-auto"
        onClick={(e) => e.stopPropagation()}
      >
        {/* Header */}
        <div className="flex items-center gap-3 mb-6">
          <button onClick={onClose} className="p-2 rounded-lg hover:bg-slate-800 transition-colors">
            <ArrowLeft className="w-5 h-5 text-slate-400" />
          </button>
          <UserAvatar username={profile.username} displayName={profile.display_name} avatarUrl={profile.avatar_url} size="lg" />
          <div className="flex-1 min-w-0">
            <div className="flex items-center gap-2">
              <h3 className="text-xl font-bold text-white truncate">{profile.display_name || profile.username}</h3>
              {roleBadge(profile.role)}
            </div>
            <p className="text-slate-400 text-sm">@{profile.username}</p>
            <p className="text-slate-500 text-xs">Joined {profile.created_at?.slice(0, 10)}</p>
          </div>
          <button onClick={onClose} className="p-2 rounded-lg hover:bg-slate-800 transition-colors">
            <X className="w-5 h-5 text-slate-400" />
          </button>
        </div>

        {/* Quick Stats */}
        <div className="grid grid-cols-2 sm:grid-cols-4 gap-3 mb-6">
          <div className="card p-3 text-center">
            <Zap className="w-4 h-4 text-brand-accent mx-auto mb-1" />
            <p className="text-white font-bold">{profile.total_xp || 0}</p>
            <p className="text-slate-500 text-xs">Total XP</p>
          </div>
          <div className="card p-3 text-center">
            <Flame className="w-4 h-4 text-orange-400 mx-auto mb-1" />
            <p className="text-white font-bold">{profile.streak_days || 0} / {profile.longest_streak || 0}</p>
            <p className="text-slate-500 text-xs">Streak / Best</p>
          </div>
          <div className="card p-3 text-center">
            <Target className="w-4 h-4 text-brand-primary mx-auto mb-1" />
            <p className="text-white font-bold">{totalChallenges}</p>
            <p className="text-slate-500 text-xs">Challenges</p>
          </div>
          <div className="card p-3 text-center">
            <Trophy className="w-4 h-4 text-brand-secondary mx-auto mb-1" />
            <p className="text-white font-bold">{totalQuests}</p>
            <p className="text-slate-500 text-xs">Quests</p>
          </div>
        </div>

        {/* Extra Info Row */}
        <div className="grid grid-cols-3 gap-3 mb-6">
          <div className="card p-3 text-center">
            <p className="text-white font-bold text-sm">{checkinDates.length}</p>
            <p className="text-slate-500 text-xs">Check-ins</p>
          </div>
          <div className="card p-3 text-center">
            <p className="text-white font-bold text-sm">{totalApiCalls}</p>
            <p className="text-slate-500 text-xs">API Calls</p>
          </div>
          <div className="card p-3 text-center">
            <p className="text-white font-bold text-sm">{totalReviewDue}</p>
            <p className="text-slate-500 text-xs">Reviews Due</p>
          </div>
        </div>

        {/* Admin Actions */}
        {profile.role !== 'admin' && (
          <div className="card p-4 mb-4">
            <h4 className="text-white font-medium mb-3 text-sm">Admin Actions</h4>
            <div className="flex flex-wrap gap-2">
              {/* Role toggle */}
              {profile.role !== 'premium' ? (
                <button
                  onClick={() => handleRoleChange('premium')}
                  disabled={actionLoading === 'role'}
                  className="flex items-center gap-1.5 px-3 py-1.5 bg-amber-500/20 text-amber-400 rounded-lg text-xs font-medium hover:bg-amber-500/30 transition-colors disabled:opacity-50"
                >
                  <Crown className="w-3.5 h-3.5" />
                  {actionLoading === 'role' ? '...' : 'Grant Premium'}
                </button>
              ) : (
                <button
                  onClick={() => handleRoleChange('user')}
                  disabled={actionLoading === 'role'}
                  className="flex items-center gap-1.5 px-3 py-1.5 bg-slate-500/20 text-slate-400 rounded-lg text-xs font-medium hover:bg-slate-500/30 transition-colors disabled:opacity-50"
                >
                  <Crown className="w-3.5 h-3.5" />
                  {actionLoading === 'role' ? '...' : 'Revoke Premium'}
                </button>
              )}
              {/* API block toggle */}
              <button
                onClick={handleToggleBlock}
                disabled={actionLoading === 'block'}
                className={`flex items-center gap-1.5 px-3 py-1.5 rounded-lg text-xs font-medium transition-colors disabled:opacity-50 ${
                  profile.api_blocked
                    ? 'bg-emerald-500/20 text-emerald-400 hover:bg-emerald-500/30'
                    : 'bg-red-500/20 text-red-400 hover:bg-red-500/30'
                }`}
              >
                {profile.api_blocked ? <ShieldCheck className="w-3.5 h-3.5" /> : <ShieldBan className="w-3.5 h-3.5" />}
                {actionLoading === 'block' ? '...' : profile.api_blocked ? 'Unblock API' : 'Block API'}
              </button>
            </div>
            {profile.api_blocked && (
              <p className="text-red-400/70 text-xs mt-2">This user is currently blocked from using the AI API.</p>
            )}
          </div>
        )}

        {/* API Usage Chart */}
        <div className="card p-4 mb-4">
          <h4 className="text-white font-medium mb-3 flex items-center gap-2 text-sm">
            <Zap className="w-4 h-4 text-amber-400" />
            API Usage (14 days) — {totalApiCalls} total
          </h4>
          <BarChart data={apiPerDay} color="bg-amber-500" unit=" calls" />
        </div>

        {/* Daily Activity Chart */}
        <div className="card p-4 mb-4">
          <h4 className="text-white font-medium mb-3 flex items-center gap-2 text-sm">
            <BarChart3 className="w-4 h-4 text-brand-primary" />
            Daily Activity (14 days)
          </h4>
          <BarChart data={dailyActivity} color="bg-brand-primary" unit=" done" />
        </div>

        {/* XP Trend */}
        <div className="card p-4 mb-4">
          <h4 className="text-white font-medium mb-3 flex items-center gap-2 text-sm">
            <Zap className="w-4 h-4 text-brand-accent" />
            XP Earned (14 days)
          </h4>
          <BarChart data={xpTrend} color="bg-brand-accent" unit=" XP" />
        </div>

        {/* Branch Progress */}
        <div className="card p-4 mb-4">
          <h4 className="text-white font-medium mb-3 flex items-center gap-2 text-sm">
            <BookOpen className="w-4 h-4 text-brand-secondary" />
            Progress by Branch
          </h4>
          <div className="space-y-4">
            {branchProgress.filter(b => b.totalAll > 0).map(branch => (
              <div key={branch.id}>
                <div className="flex items-center justify-between mb-1.5">
                  <span className="text-slate-300 text-sm">{branch.emoji} {branch.name}</span>
                  <span className="text-slate-400 text-xs">{branch.totalCompleted}/{branch.totalAll} quests</span>
                </div>
                <div className="progress-bar h-2 mb-2">
                  <div
                    className="h-full bg-brand-primary rounded-full transition-all"
                    style={{ width: `${branch.totalAll > 0 ? (branch.totalCompleted / branch.totalAll) * 100 : 0}%` }}
                  />
                </div>
                {/* Per-world breakdown */}
                <div className="ml-4 space-y-1">
                  {branch.worldDetails.filter(w => w.completed > 0).map(w => (
                    <div key={w.id} className="flex items-center justify-between">
                      <span className="text-slate-500 text-xs truncate flex-1">{w.name}</span>
                      <span className="text-slate-400 text-xs ml-2">{w.completed}/{w.total}</span>
                    </div>
                  ))}
                  {branch.worldDetails.every(w => w.completed === 0) && (
                    <p className="text-slate-600 text-xs">Not started</p>
                  )}
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* Recent Completed Challenges */}
        {recentChallenges.length > 0 && (
          <div className="card p-4 mb-4">
            <h4 className="text-white font-medium mb-3 flex items-center gap-2 text-sm">
              <Target className="w-4 h-4 text-brand-primary" />
              Top Challenges (by XP)
            </h4>
            <div className="space-y-1.5">
              {recentChallenges.map(c => (
                <div key={c.key} className="flex items-center justify-between">
                  <span className="text-slate-400 text-xs font-mono">{c.key}</span>
                  <div className="flex items-center gap-3">
                    <span className="text-slate-500 text-xs">
                      {c.attempts || 1} attempt{(c.attempts || 1) > 1 ? 's' : ''} · {c.usedHints || 0} hints
                    </span>
                    <span className="text-brand-accent text-xs font-medium">+{c.earnedXp || 0} XP</span>
                  </div>
                </div>
              ))}
            </div>
          </div>
        )}

        {/* Check-in History Calendar */}
        <div className="card p-4 mb-4">
          <h4 className="text-white font-medium mb-3 flex items-center gap-2 text-sm">
            <Calendar className="w-4 h-4 text-brand-secondary" />
            Check-in History ({checkinDates.length} total)
          </h4>
          {checkinDates.length === 0 ? (
            <p className="text-slate-500 text-sm">No check-ins</p>
          ) : (
            <CheckinCalendar checkinDates={checkinDates} />
          )}
        </div>

        {/* Last Active */}
        <div className="text-center text-slate-500 text-xs pb-6">
          Last active: {profile.last_active_date || 'Never'} · Streak freezes: {profile.streak_freezes ?? 0}
        </div>
      </motion.div>
    </motion.div>
  )
}

// ========================
// Main Dashboard
// ========================
function AdminDashboard() {
  const { metrics, userSummaries, recentCheckins, getUserDetail, updateUserRole, toggleApiBlock, loading, error, refresh } = useAdminData()
  const [sortField, setSortField] = useState('total_xp')
  const [sortAsc, setSortAsc] = useState(false)
  const [selectedUserId, setSelectedUserId] = useState(null)

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

  const renderSortIcon = (field) => {
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
                  XP {renderSortIcon("total_xp")}
                </th>
                <th className="text-right py-2 px-2 cursor-pointer hover:text-slate-200 hidden sm:table-cell" onClick={() => handleSort('streak_days')}>
                  Streak {renderSortIcon("streak_days")}
                </th>
                <th className="text-right py-2 px-2 cursor-pointer hover:text-slate-200 hidden sm:table-cell" onClick={() => handleSort('longest_streak')}>
                  Best {renderSortIcon("longest_streak")}
                </th>
                <th className="text-right py-2 px-2 cursor-pointer hover:text-slate-200 hidden md:table-cell" onClick={() => handleSort('challengesCompleted')}>
                  Challenges {renderSortIcon("challengesCompleted")}
                </th>
                <th className="text-right py-2 px-2 cursor-pointer hover:text-slate-200 hidden md:table-cell" onClick={() => handleSort('questsCompleted')}>
                  Quests {renderSortIcon("questsCompleted")}
                </th>
                <th className="text-right py-2 px-2 cursor-pointer hover:text-slate-200 hidden lg:table-cell" onClick={() => handleSort('totalCheckins')}>
                  Check-ins {renderSortIcon("totalCheckins")}
                </th>
                <th className="text-right py-2 px-2 hidden lg:table-cell">Last Active</th>
              </tr>
            </thead>
            <tbody>
              {sortedUsers.map((user) => (
                <tr
                  key={user.id}
                  className="border-b border-slate-800 hover:bg-slate-800/50 cursor-pointer transition-colors"
                  onClick={() => setSelectedUserId(user.id)}
                >
                  <td className="py-2.5 px-2">
                    <div className="flex items-center gap-2">
                      <UserAvatar username={user.username} displayName={user.display_name} avatarUrl={user.avatar_url} size="sm" />
                      <div className="min-w-0">
                        <div className="text-white text-sm truncate flex items-center gap-1.5">
                          {user.display_name || user.username}
                          {roleBadge(user.role)}
                          {user.api_blocked && <span className="px-1.5 py-0.5 rounded text-[10px] bg-red-500/20 text-red-400 font-medium">Blocked</span>}
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

      {/* User Detail Slide-over Panel */}
      <AnimatePresence>
        {selectedUserId && (
          <UserDetailPanel
            userId={selectedUserId}
            getUserDetail={getUserDetail}
            updateUserRole={updateUserRole}
            toggleApiBlock={toggleApiBlock}
            onClose={() => setSelectedUserId(null)}
          />
        )}
      </AnimatePresence>
    </div>
  )
}

export default AdminDashboard
