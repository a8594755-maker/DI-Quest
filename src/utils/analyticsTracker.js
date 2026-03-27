// 計時工具 — 追蹤每題作答時間
const challengeTimers = new Map()

export function startChallenge(questId, challengeId) {
  const key = `${questId}-${challengeId}`
  challengeTimers.set(key, Date.now())
}

export function endChallenge(questId, challengeId) {
  const key = `${questId}-${challengeId}`
  const start = challengeTimers.get(key)
  if (!start) return 0
  const duration = Date.now() - start
  challengeTimers.delete(key)
  return duration
}
