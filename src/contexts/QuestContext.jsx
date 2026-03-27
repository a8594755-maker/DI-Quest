import { createContext, useContext, useReducer, useEffect, useMemo } from 'react'
import { getLevelInfo, calculateChallengeXp } from '../utils/xpCalculator'
import { calculateNextReview, performanceToQuality } from '../utils/spacedRepetition'

const QuestContext = createContext(null)

const STORAGE_KEY = 'di-quest-progress'

const initialState = {
  totalXp: 0,
  questStatus: {},    // { "1-1": { completed: true, score: 85, attempts: 2 } }
  challengeStatus: {}, // { "1-1-1": { completed: true, score: 100, usedHints: 0, code: "..." } }
  achievements: [],
  streakDays: 0,
  lastActiveDate: null,
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
      const streakDays = state.lastActiveDate === yesterday ? state.streakDays + 1 : 1
      return { ...state, streakDays, lastActiveDate: today }
    }

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

  // 持久化
  useEffect(() => { saveState(state) }, [state])

  // 每次打開更新 streak
  useEffect(() => { dispatch({ type: 'UPDATE_STREAK' }) }, [])

  const levelInfo = getLevelInfo(state.totalXp)

  // 判斷關卡是否解鎖（開發者模式全部解鎖）
  const isQuestUnlocked = (questId) => {
    if (state.devMode) return true
    const [worldNum, questNum] = questId.split('-').map(Number)
    if (worldNum === 1 && questNum === 1) return true // 第一關永遠解鎖

    // 同一個 world 的前一關要完成
    if (questNum > 1) {
      const prevQuestId = `${worldNum}-${questNum - 1}`
      return !!state.questStatus[prevQuestId]?.completed
    }

    // 新 world 的第一關：前一個 world 的 boss 關要完成
    const prevBossId = `${worldNum - 1}-6`
    return !!state.questStatus[prevBossId]?.completed
  }

  const isWorldUnlocked = (worldId) => {
    if (state.devMode) return true
    if (worldId === 1) return true
    const prevBossId = `${worldId - 1}-6`
    return !!state.questStatus[prevBossId]?.completed
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
