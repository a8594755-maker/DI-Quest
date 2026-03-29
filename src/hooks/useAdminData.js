import { useState, useEffect, useMemo, useCallback } from 'react'
import { supabase } from '../utils/supabase'
import { getEasternToday } from '../utils/localDate'

export function useAdminData() {
  const [allProfiles, setAllProfiles] = useState([])
  const [allCheckins, setAllCheckins] = useState([])
  const [allProgress, setAllProgress] = useState([])
  const [allApiUsage, setAllApiUsage] = useState([])
  const [allVisitorLogs, setAllVisitorLogs] = useState([])
  const [allChatSessions, setAllChatSessions] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)

  const fetchAll = useCallback(async () => {
    setLoading(true)
    setError(null)
    try {
      const [profilesRes, checkinsRes, progressRes, apiRes, visitorRes, chatRes] = await Promise.all([
        supabase.from('profiles').select('*').order('created_at', { ascending: false }),
        supabase.from('daily_checkins').select('*').order('checkin_date', { ascending: false }).limit(1000),
        supabase.from('user_progress').select('*'),
        supabase.from('api_usage').select('*').order('usage_date', { ascending: false }).limit(500),
        supabase.from('visitor_logs').select('*').order('visited_at', { ascending: false }).limit(1000),
        supabase.from('chat_sessions').select('id,user_id,title,messages,updated_at').order('updated_at', { ascending: false }).limit(200),
      ])

      if (profilesRes.error) throw profilesRes.error
      setAllProfiles(profilesRes.data || [])
      setAllCheckins(checkinsRes.data || [])
      setAllProgress(progressRes.data || [])
      setAllApiUsage(apiRes.data || [])
      setAllVisitorLogs(visitorRes.data || [])
      setAllChatSessions(chatRes.data || [])
    } catch (err) {
      setError(err.message)
    } finally {
      setLoading(false)
    }
  }, [])

  useEffect(() => { fetchAll() }, [fetchAll])

  const metrics = useMemo(() => {
    const today = getEasternToday()
    const weekAgo = new Date(Date.now() - 7 * 86400000).toISOString().slice(0, 10)

    const totalUsers = allProfiles.length
    const activeToday = allProfiles.filter(p => p.last_active_date === today).length
    const activeThisWeek = allProfiles.filter(p => p.last_active_date >= weekAgo).length
    const avgStreak = totalUsers > 0 ? Math.round(allProfiles.reduce((s, p) => s + (p.streak_days || 0), 0) / totalUsers * 10) / 10 : 0
    const totalApiCalls = allApiUsage.reduce((s, u) => s + (u.call_count || 0), 0)

    // DAU trend (last 30 days)
    const dauMap = {}
    for (let i = 29; i >= 0; i--) {
      const d = new Date(Date.now() - i * 86400000)
      dauMap[d.toISOString().slice(0, 10)] = new Set()
    }
    allCheckins.forEach(c => {
      if (dauMap[c.checkin_date]) dauMap[c.checkin_date].add(c.user_id)
    })
    const dauTrend = Object.entries(dauMap).map(([date, users]) => {
      const d = new Date(date)
      return { label: `${d.getMonth() + 1}/${d.getDate()}`, value: users.size, date }
    })

    // API usage trend (last 14 days)
    const apiMap = {}
    for (let i = 13; i >= 0; i--) {
      const d = new Date(Date.now() - i * 86400000)
      apiMap[d.toISOString().slice(0, 10)] = 0
    }
    allApiUsage.forEach(u => {
      if (apiMap[u.usage_date] !== undefined) apiMap[u.usage_date] += u.call_count || 0
    })
    const apiTrend = Object.entries(apiMap).map(([date, count]) => {
      const d = new Date(date)
      return { label: `${d.getMonth() + 1}/${d.getDate()}`, value: count, date }
    })

    // Top API consumers (last 7 days)
    const apiByUser = {}
    allApiUsage.filter(u => u.usage_date >= weekAgo).forEach(u => {
      apiByUser[u.user_id] = (apiByUser[u.user_id] || 0) + (u.call_count || 0)
    })
    const topApiUsers = Object.entries(apiByUser)
      .map(([userId, count]) => {
        const profile = allProfiles.find(p => p.id === userId)
        return { userId, count, name: profile?.display_name || profile?.username || userId.slice(0, 8) }
      })
      .sort((a, b) => b.count - a.count)
      .slice(0, 10)

    // Visitor stats
    const totalVisits = allVisitorLogs.length
    const guestVisits = allVisitorLogs.filter(v => v.is_guest).length
    const todayVisits = allVisitorLogs.filter(v => v.visited_at?.slice(0, 10) === today).length
    const uniqueIps = new Set(allVisitorLogs.map(v => v.ip_address).filter(Boolean)).size

    // Visitor trend (last 14 days)
    const visitorMap = {}
    for (let i = 13; i >= 0; i--) {
      const d = new Date(Date.now() - i * 86400000)
      visitorMap[d.toISOString().slice(0, 10)] = { total: 0, guest: 0 }
    }
    allVisitorLogs.forEach(v => {
      const date = v.visited_at?.slice(0, 10)
      if (visitorMap[date]) {
        visitorMap[date].total++
        if (v.is_guest) visitorMap[date].guest++
      }
    })
    const visitorTrend = Object.entries(visitorMap).map(([date, counts]) => {
      const d = new Date(date)
      return { label: `${d.getMonth() + 1}/${d.getDate()}`, value: counts.total, guest: counts.guest, date }
    })

    // Recent visitors (last 20)
    const recentVisitors = allVisitorLogs.slice(0, 30).map(v => {
      const profile = v.user_id ? allProfiles.find(p => p.id === v.user_id) : null
      return {
        ...v,
        displayName: profile?.display_name || profile?.username || (v.is_guest ? 'Guest' : 'Unknown'),
      }
    })

    // ── Retention funnel ──
    const progressMap = {}
    allProgress.forEach(p => { progressMap[p.user_id] = p.progress_data })

    const signedUp = allProfiles.length
    const didFirstChallenge = allProfiles.filter(p => {
      const prog = progressMap[p.id]
      return prog?.challengeStatus && Object.values(prog.challengeStatus).some(c => c.completed)
    }).length
    const didFirstCheckin = new Set(allCheckins.map(c => c.user_id)).size
    const sevenDayRetention = allProfiles.filter(p => {
      const created = new Date(p.created_at)
      const daysSinceCreation = (Date.now() - created.getTime()) / 86400000
      if (daysSinceCreation < 7) return false // too new
      const sevenDaysAfter = new Date(created.getTime() + 7 * 86400000).toISOString().slice(0, 10)
      return p.last_active_date >= sevenDaysAfter
    }).length
    const retentionEligible = allProfiles.filter(p => (Date.now() - new Date(p.created_at).getTime()) / 86400000 >= 7).length
    const retentionFunnel = { signedUp, didFirstChallenge, didFirstCheckin, sevenDayRetention, retentionEligible }

    // ── Content analytics ──
    const questCompletions = {} // questId -> count
    const challengeTimings = {} // challengeKey -> { totalMs, count }
    allProgress.forEach(p => {
      const prog = p.progress_data || {}
      if (prog.questStatus) {
        Object.entries(prog.questStatus).forEach(([qId, v]) => {
          if (v.completed) questCompletions[qId] = (questCompletions[qId] || 0) + 1
        })
      }
      if (prog.analytics?.challengeTimings) {
        Object.entries(prog.analytics.challengeTimings).forEach(([key, t]) => {
          if (!challengeTimings[key]) challengeTimings[key] = { totalMs: 0, count: 0 }
          challengeTimings[key].totalMs += t.lastDurationMs || 0
          challengeTimings[key].count += 1
        })
      }
    })
    const contentAnalytics = { questCompletions, challengeTimings, totalUsersWithProgress: Object.keys(progressMap).length }

    return { totalUsers, activeToday, activeThisWeek, avgStreak, totalApiCalls, dauTrend, apiTrend, topApiUsers, totalVisits, guestVisits, todayVisits, uniqueIps, visitorTrend, recentVisitors, retentionFunnel, contentAnalytics }
  }, [allProfiles, allCheckins, allApiUsage, allVisitorLogs, allProgress])

  // Per-user summary
  const userSummaries = useMemo(() => {
    const progressMap = {}
    allProgress.forEach(p => { progressMap[p.user_id] = p.progress_data })

    return allProfiles.map(profile => {
      const progress = progressMap[profile.id]
      let challengesCompleted = 0
      let questsCompleted = 0
      if (progress) {
        if (progress.challengeStatus) {
          challengesCompleted = Object.values(progress.challengeStatus).filter(c => c.completed).length
        }
        if (progress.questStatus) {
          questsCompleted = Object.values(progress.questStatus).filter(q => q.completed).length
        }
      }
      const userCheckins = allCheckins.filter(c => c.user_id === profile.id)
      const totalCheckins = userCheckins.length

      return {
        ...profile,
        challengesCompleted,
        questsCompleted,
        totalCheckins,
      }
    }).sort((a, b) => (b.total_xp || 0) - (a.total_xp || 0))
  }, [allProfiles, allProgress, allCheckins])

  // Recent checkins feed
  const recentCheckins = useMemo(() => {
    return allCheckins.slice(0, 20).map(c => {
      const profile = allProfiles.find(p => p.id === c.user_id)
      return {
        ...c,
        displayName: profile?.display_name || profile?.username || 'Unknown',
        avatarUrl: profile?.avatar_url,
      }
    })
  }, [allCheckins, allProfiles])

  // Admin actions
  const updateUserRole = useCallback(async (userId, newRole) => {
    const { error } = await supabase
      .from('profiles')
      .update({ role: newRole })
      .eq('id', userId)
    if (error) throw error
    setAllProfiles(prev => prev.map(p => p.id === userId ? { ...p, role: newRole } : p))
  }, [])

  const updateUserGroup = useCallback(async (userId, group) => {
    const { error } = await supabase
      .from('profiles')
      .update({ user_group: group || null })
      .eq('id', userId)
    if (error) throw error
    setAllProfiles(prev => prev.map(p => p.id === userId ? { ...p, user_group: group || null } : p))
  }, [])

  const updateAdminNotes = useCallback(async (userId, notes) => {
    const { error } = await supabase
      .from('profiles')
      .update({ admin_notes: notes || null })
      .eq('id', userId)
    if (error) throw error
    setAllProfiles(prev => prev.map(p => p.id === userId ? { ...p, admin_notes: notes || null } : p))
  }, [])

  const toggleApiBlock = useCallback(async (userId, blocked) => {
    const { error } = await supabase
      .from('profiles')
      .update({ api_blocked: blocked })
      .eq('id', userId)
    if (error) throw error
    setAllProfiles(prev => prev.map(p => p.id === userId ? { ...p, api_blocked: blocked } : p))
  }, [])

  // Get full detail for a specific user
  const getUserDetail = useCallback((userId) => {
    const profile = allProfiles.find(p => p.id === userId)
    const progress = allProgress.find(p => p.user_id === userId)?.progress_data || {}
    const checkins = allCheckins.filter(c => c.user_id === userId)
    const apiUsage = allApiUsage.filter(u => u.user_id === userId)
    const chatSessions = allChatSessions.filter(c => c.user_id === userId)
    return { profile, progress, checkins, apiUsage, chatSessions }
  }, [allProfiles, allProgress, allCheckins, allApiUsage, allChatSessions])

  return { metrics, userSummaries, recentCheckins, allChatSessions, getUserDetail, updateUserRole, updateUserGroup, updateAdminNotes, toggleApiBlock, loading, error, refresh: fetchAll }
}
