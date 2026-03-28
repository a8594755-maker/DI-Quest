import { createContext, useContext, useReducer, useEffect, useMemo, useRef, useCallback, useState } from 'react'
import { getLevelInfo, calculateChallengeXp } from '../utils/xpCalculator'
import { calculateNextReview, performanceToQuality } from '../utils/spacedRepetition'
import { getBranchForWorld } from '../data/branches'
import { getWorld } from '../data/questData'
import { useAuth } from './AuthContext'
import { supabase } from '../utils/supabase'

const QuestContext = createContext(null)

const STORAGE_KEY = 'di-quest-progress'

const initialState = {
  totalXp: 0,
  questStatus: {},    // { "1-1": { completed: true, score: 85, attempts: 2 } }
  challengeStatus: {}, // { "1-1-1": { completed: true, score: 100, usedHints: 0, code: "..." } }
  achievements: [],
  streakDays: 0,
  longestStreak: 0,
  streakFreezes: 1,
  lastActiveDate: null,
  checkedInToday: false,
  devMode: false,
  // Learning Analytics
  analytics: {
    challengeTimings: {}, // { "1-1-1": { lastDurationMs, bestTimeMs, attemptDates[] } }
    dailyStats: {},       // { "2026-03-26": { challengesCompleted, xpEarned, timeSpentMs } }
  },
  // Spaced Repetition
  reviewSchedule: {},     // { "1-1-1": { nextReviewDate, interval, repetition, easeFactor, lastQuality } }
}

function loadState() {
  try {
    const saved = localStorage.getItem(STORAGE_KEY)
    if (saved) return { ...initialState, ...JSON.parse(saved) }
  } catch {}
  return initialState
}

function saveState(state) {
  try {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(state))
  } catch {}
}

function reducer(state, action) {
  switch (action.type) {
    case 'COMPLETE_CHALLENGE': {
      const { questId, challengeId, score, code, usedHints, attempts, isReview } = action.payload
      const key = `${questId}-${challengeId}`
      const prev = state.challengeStatus[key]
      if (prev?.completed && !isReview) return state // 已完成不重複加分

      const baseXp = action.payload.baseXp || 50
      const earnedXp = isReview ? 0 : calculateChallengeXp(baseXp, { usedHints, attempts })

      // 計算 spaced repetition schedule
      const quality = performanceToQuality({ score, usedHints, attempts })
      const prevReview = state.reviewSchedule[key] || { repetition: 0, easeFactor: 2.5, interval: 0 }
      const { nextInterval, nextRepetition, nextEaseFactor } = calculateNextReview(
        quality, prevReview.repetition, prevReview.easeFactor, prevReview.interval
      )
      const nextReviewDate = new Date(Date.now() + nextInterval * 86400000).toISOString().slice(0, 10)

      // 更新 dailyStats
      const today = new Date().toISOString().slice(0, 10)
      const todayStats = state.analytics.dailyStats[today] || { challengesCompleted: 0, xpEarned: 0, timeSpentMs: 0 }

      return {
        ...state,
        totalXp: state.totalXp + earnedXp,
        challengeStatus: {
          ...state.challengeStatus,
          [key]: isReview ? prev : { completed: true, score, usedHints, attempts, code, earnedXp },
        },
        reviewSchedule: {
          ...state.reviewSchedule,
          [key]: { nextReviewDate, interval: nextInterval, repetition: nextRepetition, easeFactor: nextEaseFactor, lastQuality: quality },
        },
        analytics: {
          ...state.analytics,
          dailyStats: {
            ...state.analytics.dailyStats,
            [today]: {
              ...todayStats,
              challengesCompleted: todayStats.challengesCompleted + (isReview ? 0 : 1),
              xpEarned: todayStats.xpEarned + earnedXp,
            },
          },
        },
      }
    }

    case 'COMPLETE_QUEST': {
      const { questId, score } = action.payload
      const prev = state.questStatus[questId]
      if (prev?.completed) return state

      return {
        ...state,
        totalXp: state.totalXp + (action.payload.bonusXp || 0),
        questStatus: {
          ...state.questStatus,
          [questId]: { completed: true, score, completedAt: new Date().toISOString() },
        },
      }
    }

    case 'UNLOCK_ACHIEVEMENT': {
      if (state.achievements.includes(action.payload)) return state
      return { ...state, achievements: [...state.achievements, action.payload] }
    }

    case 'UPDATE_STREAK': {
      const today = new Date().toISOString().slice(0, 10)
      if (state.lastActiveDate === today) return state
      const yesterday = new Date(Date.now() - 86400000).toISOString().slice(0, 10)
      let streakDays
      let streakFreezes = state.streakFreezes ?? 1
      if (state.lastActiveDate === yesterday) {
        streakDays = state.streakDays + 1
      } else if (state.lastActiveDate && state.lastActiveDate !== today) {
        // Missed a day — check for streak freeze
        if (streakFreezes > 0) {
          streakDays = state.streakDays // Keep streak
          streakFreezes = streakFreezes - 1
        } else {
          streakDays = 1 // Reset
        }
      } else {
        streakDays = 1
      }
      const longestStreak = Math.max(state.longestStreak || 0, streakDays)
      return { ...state, streakDays, longestStreak, streakFreezes, lastActiveDate: today }
    }

    case 'DAILY_CHECKIN': {
      // Prevent duplicate check-in XP
      if (state.checkedInToday) return state

      const today = new Date().toISOString().slice(0, 10)
      const bonus = action.payload?.bonusXp || 0
      const todayStats = state.analytics.dailyStats[today] || { challengesCompleted: 0, xpEarned: 0, timeSpentMs: 0 }
      return {
        ...state,
        totalXp: state.totalXp + bonus,
        checkedInToday: true,
        analytics: {
          ...state.analytics,
          dailyStats: {
            ...state.analytics.dailyStats,
            [today]: { ...todayStats, xpEarned: todayStats.xpEarned + bonus },
          },
        },
      }
    }

    case 'SYNC_FROM_CLOUD':
      return { ...initialState, ...action.payload, devMode: state.devMode }

    case 'TOGGLE_DEV_MODE':
      return { ...state, devMode: !state.devMode }

    case 'RECORD_CHALLENGE_TIMING': {
      const { questId, challengeId, durationMs } = action.payload
      const key = `${questId}-${challengeId}`
      const today = new Date().toISOString().slice(0, 10)
      const prev = state.analytics.challengeTimings[key] || { bestTimeMs: Infinity, attemptDates: [] }
      const todayStats = state.analytics.dailyStats[today] || { challengesCompleted: 0, xpEarned: 0, timeSpentMs: 0 }

      return {
        ...state,
        analytics: {
          ...state.analytics,
          challengeTimings: {
            ...state.analytics.challengeTimings,
            [key]: {
              lastDurationMs: durationMs,
              bestTimeMs: Math.min(prev.bestTimeMs === Infinity ? durationMs : prev.bestTimeMs, durationMs),
              attemptDates: [...prev.attemptDates.slice(-19), today],
            },
          },
          dailyStats: {
            ...state.analytics.dailyStats,
            [today]: {
              ...todayStats,
              timeSpentMs: todayStats.timeSpentMs + durationMs,
            },
          },
        },
      }
    }

    case 'RESET':
      return initialState

    default:
      return state
  }
}

export function QuestProvider({ children }) {
  const [state, dispatch] = useReducer(reducer, null, loadState)
  const { isAuthenticated, user, isGuest, profile } = useAuth()
  const saveTimerRef = useRef(null)
  const cloudLoadedRef = useRef(false)
  const [cloudSynced, setCloudSynced] = useState(false)

  // 持久化 — localStorage (always for backup)
  useEffect(() => { saveState(state) }, [state])

  // Supabase cloud sync (debounced 2s save)
  const saveToCloud = useCallback(async (stateToSave) => {
    if (!isAuthenticated || !user) return
    try {
      const { devMode, ...progressData } = stateToSave
      const { error: progressError } = await supabase.from('user_progress').upsert({
        user_id: user.id,
        progress_data: progressData,
        updated_at: new Date().toISOString(),
      })
      if (progressError) console.error('[QuestContext] progress sync error:', progressError)
      // Also sync profile XP and streak
      const { error: profileError } = await supabase.from('profiles').update({
        total_xp: stateToSave.totalXp,
        streak_days: stateToSave.streakDays,
        longest_streak: stateToSave.longestStreak || 0,
        last_active_date: stateToSave.lastActiveDate,
      }).eq('id', user.id)
      if (profileError) console.error('[QuestContext] profile sync error:', profileError)
    } catch (err) {
      console.error('[QuestContext] saveToCloud error:', err)
    }
  }, [isAuthenticated, user])

  useEffect(() => {
    if (!isAuthenticated) return
    if (saveTimerRef.current) clearTimeout(saveTimerRef.current)
    saveTimerRef.current = setTimeout(() => saveToCloud(state), 2000)
    return () => { if (saveTimerRef.current) clearTimeout(saveTimerRef.current) }
  }, [state, isAuthenticated, saveToCloud])

  // Mark cloud as synced for non-authenticated users
  useEffect(() => {
    if (!isAuthenticated) setCloudSynced(true)
  }, [isAuthenticated])

  // Load from cloud on first auth
  useEffect(() => {
    if (!isAuthenticated || !user || cloudLoadedRef.current) return
    cloudLoadedRef.current = true

    const loadFromCloud = async () => {
      try {
        const { data } = await supabase
          .from('user_progress')
          .select('progress_data')
          .eq('user_id', user.id)
          .single()

        // Always check if user already checked in today via daily_checkins table
        const today = new Date().toISOString().slice(0, 10)
        const { data: checkinData } = await supabase
          .from('daily_checkins')
          .select('id, xp_earned')
          .eq('user_id', user.id)
          .eq('checkin_date', today)
          .maybeSingle()

        if (data?.progress_data && Object.keys(data.progress_data).length > 0) {
          const payload = {
            ...data.progress_data,
            checkedInToday: !!checkinData, // Only trust daily_checkins table, not stale progress_data
          }
          dispatch({ type: 'SYNC_FROM_CLOUD', payload })
          // Recalculate streak after cloud overwrite (mount UPDATE_STREAK ran before cloud loaded)
          dispatch({ type: 'UPDATE_STREAK' })
        } else {
          // Cloud data empty — still sync checkin status, then save local to cloud
          if (checkinData) {
            dispatch({ type: 'SYNC_FROM_CLOUD', payload: { ...state, checkedInToday: true } })
          }
          dispatch({ type: 'UPDATE_STREAK' })
          await saveToCloud(state)
        }
      } catch (err) {
        console.error('[QuestContext] loadFromCloud error:', err)
      }
      setCloudSynced(true)
    }
    loadFromCloud()
  }, [isAuthenticated, user])

  // 每次打開更新 streak
  useEffect(() => { dispatch({ type: 'UPDATE_STREAK' }) }, [])

  // Reset checkedInToday at midnight
  useEffect(() => {
    const today = new Date().toISOString().slice(0, 10)
    if (state.lastActiveDate !== today && state.checkedInToday) {
      dispatch({ type: 'UPDATE_STREAK' })
    }
  }, [])

  const levelInfo = getLevelInfo(state.totalXp)

  const isPremium = profile?.role === 'premium' || profile?.role === 'admin'

  // 判斷關卡是否解鎖（Premium 用戶全部解鎖）
  // 解鎖邏輯基於 branch：每條路線的第一個 world 自動解鎖，路線間互不影響
  const isQuestUnlocked = (questId) => {
    if (state.devMode || isPremium) return true
    const [worldNum, questNum] = questId.split('-').map(Number)

    // 同一個 world 的前一關要完成
    if (questNum > 1) {
      const prevQuestId = `${worldNum}-${questNum - 1}`
      return !!state.questStatus[prevQuestId]?.completed
    }

    // 每個 world 的第一關：檢查是否為該 branch 的第一個 world
    const branch = getBranchForWorld(worldNum)
    if (!branch) return true
    const idx = branch.worldIds.indexOf(worldNum)
    if (idx === 0) return true // branch 內第一個 world 的第一關永遠解鎖

    // 否則需要前一個 world 的最後一個 quest 完成
    const prevWorldId = branch.worldIds[idx - 1]
    const prevWorld = getWorld(prevWorldId)
    if (!prevWorld || prevWorld.quests.length === 0) return true
    const lastQuest = prevWorld.quests[prevWorld.quests.length - 1]
    return !!state.questStatus[lastQuest.id]?.completed
  }

  const isWorldUnlocked = (worldId) => {
    if (state.devMode || isPremium) return true
    const branch = getBranchForWorld(worldId)
    if (!branch) return true
    const idx = branch.worldIds.indexOf(Number(worldId))
    if (idx === 0) return true // branch 內第一個 world 自動解鎖

    const prevWorldId = branch.worldIds[idx - 1]
    const prevWorld = getWorld(prevWorldId)
    if (!prevWorld || prevWorld.quests.length === 0) return true
    const lastQuest = prevWorld.quests[prevWorld.quests.length - 1]
    return !!state.questStatus[lastQuest.id]?.completed
  }

  // 計算一個 quest 內已完成的 challenge 數量
  const getQuestProgress = (questId, totalChallenges) => {
    let completed = 0
    for (let i = 1; i <= totalChallenges; i++) {
      if (state.challengeStatus[`${questId}-${i}`]?.completed) completed++
    }
    return completed
  }

  // 學習分析摘要
  const getAnalyticsSummary = useMemo(() => {
    const { dailyStats, challengeTimings } = state.analytics
    const days = Object.entries(dailyStats)
    const last7 = days.filter(([d]) => {
      const diff = (Date.now() - new Date(d).getTime()) / 86400000
      return diff <= 7
    })
    const totalTimeMs = last7.reduce((sum, [, s]) => sum + (s.timeSpentMs || 0), 0)
    const totalChallenges = last7.reduce((sum, [, s]) => sum + (s.challengesCompleted || 0), 0)
    const timingEntries = Object.values(challengeTimings)
    const avgTimeMs = timingEntries.length > 0
      ? timingEntries.reduce((sum, t) => sum + (t.lastDurationMs || 0), 0) / timingEntries.length
      : 0

    return {
      weeklyTimeMs: totalTimeMs,
      weeklyChallenges: totalChallenges,
      avgChallengeTimeMs: avgTimeMs,
      velocityPerDay: last7.length > 0 ? (totalChallenges / Math.max(last7.length, 1)).toFixed(1) : '0',
    }
  }, [state.analytics])

  // 到期複習數量
  const getDueReviewCount = () => {
    const today = new Date().toISOString().slice(0, 10)
    return Object.values(state.reviewSchedule).filter(r => r.nextReviewDate <= today).length
  }

  const value = {
    ...state,
    levelInfo,
    isPremium,
    cloudSynced,
    dispatch,
    isQuestUnlocked,
    isWorldUnlocked,
    getQuestProgress,
    getAnalyticsSummary,
    getDueReviewCount,
  }

  return (
    <QuestContext.Provider value={value}>
      {children}
    </QuestContext.Provider>
  )
}

export function useQuest() {
  const ctx = useContext(QuestContext)
  if (!ctx) throw new Error('useQuest must be used inside <QuestProvider>')
  return ctx
}
