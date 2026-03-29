// SM-2 Spaced Repetition Algorithm

export function calculateNextReview(quality, repetition, easeFactor, interval) {
  let nextEaseFactor = easeFactor + (0.1 - (5 - quality) * (0.08 + (5 - quality) * 0.02))
  nextEaseFactor = Math.max(1.3, nextEaseFactor)

  let nextInterval
  let nextRepetition

  if (quality < 3) {
    // 答得不好，重置
    nextRepetition = 0
    nextInterval = 1
  } else {
    nextRepetition = repetition + 1
    if (repetition === 0) {
      nextInterval = 1
    } else if (repetition === 1) {
      nextInterval = 6
    } else {
      nextInterval = Math.round(interval * nextEaseFactor)
    }
  }

  return { nextInterval, nextRepetition, nextEaseFactor }
}

export function performanceToQuality({ score, usedHints, attempts }) {
  // 將表現轉換為 0-5 的品質分數
  if (score < 50) return 1
  if (attempts > 3) return 2
  if (usedHints >= 3) return 2
  if (usedHints >= 2) return 3
  if (usedHints >= 1 || attempts > 1) return 3
  if (score >= 100 && usedHints === 0 && attempts <= 1) return 5
  return 4
}

export function isDueForReview(reviewData, today) {
  if (!reviewData || !reviewData.nextReviewDate) return false
  return reviewData.nextReviewDate <= today
}

export function getDueReviews(reviewSchedule, today) {
  return Object.entries(reviewSchedule)
    .filter(([, data]) => isDueForReview(data, today))
    .map(([key, data]) => {
      const parts = key.split('-')
      return {
        key,
        questId: `${parts[0]}-${parts[1]}`,
        challengeId: parts[2],
        worldId: parts[0],
        ...data,
      }
    })
}

// Weighted random selection for review sessions
export function selectReviewQuestions(reviewSchedule, challengeStatus, today, count = 10) {
  const allEntries = Object.entries(reviewSchedule).map(([key, data]) => {
    const parts = key.split('-')
    const daysOverdue = Math.max(0, Math.floor((new Date(today).getTime() - new Date(data.nextReviewDate).getTime()) / 86400000))
    const isDue = data.nextReviewDate <= today

    // Weight calculation — higher = more likely to be picked
    let weight = 1.0
    weight += (2.5 - (data.easeFactor || 2.5)) * 2    // low ease → high weight
    if (isDue) weight += Math.min(daysOverdue, 30) * 0.1 // overdue bonus
    weight += (5 - (data.lastQuality || 4)) * 0.5        // low quality → high weight
    const status = challengeStatus[key]
    if (status?.score != null && status.score < 70) weight += 1.0 // low score bonus
    if (isDue) weight += 2.0 // due items get a strong boost

    return {
      key,
      questId: `${parts[0]}-${parts[1]}`,
      challengeId: parts[2],
      worldId: parts[0],
      weight: Math.max(0.1, weight),
      isDue,
      ...data,
    }
  })

  // Only pick from completed challenges
  const pool = allEntries.filter(e => challengeStatus[e.key]?.completed)
  if (pool.length === 0) return []

  // Weighted random sample without replacement
  const selected = []
  const remaining = [...pool]
  const target = Math.min(count, remaining.length)

  for (let i = 0; i < target; i++) {
    const totalWeight = remaining.reduce((sum, e) => sum + e.weight, 0)
    let rand = Math.random() * totalWeight
    let picked = remaining.length - 1
    for (let j = 0; j < remaining.length; j++) {
      rand -= remaining[j].weight
      if (rand <= 0) { picked = j; break }
    }
    selected.push(remaining[picked])
    remaining.splice(picked, 1)
  }

  return selected
}
