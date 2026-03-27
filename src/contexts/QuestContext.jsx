import { createContext, useContext, useReducer, useEffect } from 'react'
import { getLevelInfo, calculateChallengeXp } from '../utils/xpCalculator'

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
      const { questId, challengeId, score, code, usedHints, attempts } = action.payload
      const key = `${questId}-${challengeId}`
      const prev = state.challengeStatus[key]
      if (prev?.completed) return state // 已完成不重複加分

      const baseXp = action.payload.baseXp || 50
      const earnedXp = calculateChallengeXp(baseXp, { usedHints, attempts })

      return {
        ...state,
        totalXp: state.totalXp + earnedXp,
        challengeStatus: {
          ...state.challengeStatus,
          [key]: { completed: true, score, usedHints, attempts, code, earnedXp },
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

  const value = {
    ...state,
    levelInfo,
    dispatch,
    isQuestUnlocked,
    isWorldUnlocked,
    getQuestProgress,
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
