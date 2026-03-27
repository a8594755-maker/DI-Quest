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
