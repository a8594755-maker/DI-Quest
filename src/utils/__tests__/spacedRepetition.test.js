import { describe, it, expect } from 'vitest'
import {
  calculateNextReview,
  performanceToQuality,
  isDueForReview,
  getDueReviews,
} from '../spacedRepetition'

describe('calculateNextReview', () => {
  it('resets on poor quality (< 3)', () => {
    const result = calculateNextReview(2, 5, 2.5, 30)
    expect(result.nextRepetition).toBe(0)
    expect(result.nextInterval).toBe(1)
  })

  it('sets interval to 1 on first good review', () => {
    const result = calculateNextReview(4, 0, 2.5, 0)
    expect(result.nextRepetition).toBe(1)
    expect(result.nextInterval).toBe(1)
  })

  it('sets interval to 6 on second good review', () => {
    const result = calculateNextReview(4, 1, 2.5, 1)
    expect(result.nextRepetition).toBe(2)
    expect(result.nextInterval).toBe(6)
  })

  it('uses ease factor for subsequent reviews', () => {
    const result = calculateNextReview(4, 2, 2.5, 6)
    expect(result.nextRepetition).toBe(3)
    expect(result.nextInterval).toBe(15) // round(6 * 2.5)
  })

  it('ease factor never drops below 1.3', () => {
    const result = calculateNextReview(0, 3, 1.3, 10)
    expect(result.nextEaseFactor).toBeGreaterThanOrEqual(1.3)
  })
})

describe('performanceToQuality', () => {
  it('returns 5 for perfect performance', () => {
    expect(performanceToQuality({ score: 100, usedHints: 0, attempts: 1 })).toBe(5)
  })

  it('returns 1 for very low score', () => {
    expect(performanceToQuality({ score: 30, usedHints: 0, attempts: 1 })).toBe(1)
  })

  it('penalizes many hints', () => {
    expect(performanceToQuality({ score: 80, usedHints: 3, attempts: 1 })).toBe(2)
  })

  it('penalizes many attempts', () => {
    expect(performanceToQuality({ score: 80, usedHints: 0, attempts: 4 })).toBe(2)
  })
})

describe('isDueForReview', () => {
  it('returns false for null data', () => {
    expect(isDueForReview(null, '2026-03-27')).toBe(false)
  })

  it('returns true when due date is today or past', () => {
    expect(isDueForReview({ nextReviewDate: '2026-03-27' }, '2026-03-27')).toBe(true)
    expect(isDueForReview({ nextReviewDate: '2026-03-25' }, '2026-03-27')).toBe(true)
  })

  it('returns false when due date is in the future', () => {
    expect(isDueForReview({ nextReviewDate: '2026-03-30' }, '2026-03-27')).toBe(false)
  })
})

describe('getDueReviews', () => {
  it('returns only due items', () => {
    const schedule = {
      '1-1-1': { nextReviewDate: '2026-03-25' },
      '2-1-1': { nextReviewDate: '2026-03-30' },
      '3-2-1': { nextReviewDate: '2026-03-27' },
    }
    const due = getDueReviews(schedule, '2026-03-27')
    expect(due).toHaveLength(2)
    expect(due.map(d => d.key)).toContain('1-1-1')
    expect(due.map(d => d.key)).toContain('3-2-1')
  })

  it('parses quest and world IDs correctly', () => {
    const schedule = { '5-3-2': { nextReviewDate: '2026-03-20' } }
    const [item] = getDueReviews(schedule, '2026-03-27')
    expect(item.worldId).toBe('5')
    expect(item.questId).toBe('5-3')
    expect(item.challengeId).toBe('2')
  })
})
