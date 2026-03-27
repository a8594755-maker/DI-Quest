import { describe, it, expect } from 'vitest'
import { getLevelInfo, calculateChallengeXp } from '../xpCalculator'

describe('getLevelInfo', () => {
  it('returns level 1 for 0 XP', () => {
    const info = getLevelInfo(0)
    expect(info.level).toBe(1)
    expect(info.title).toBe('Trainee Analyst')
  })

  it('returns correct level for mid-range XP', () => {
    const info = getLevelInfo(1500)
    expect(info.level).toBe(10)
    expect(info.title).toBe('Data Interpreter')
  })

  it('returns max level for high XP', () => {
    const info = getLevelInfo(10000)
    expect(info.level).toBe(30)
    expect(info.title).toBe('Chief Analytics Officer')
    expect(info.progress).toBe(1)
  })

  it('calculates progress correctly', () => {
    const info = getLevelInfo(150)
    expect(info.level).toBe(2)
    expect(info.progress).toBeGreaterThan(0)
    expect(info.progress).toBeLessThan(1)
  })
})

describe('calculateChallengeXp', () => {
  it('gives 1.5x bonus for perfect answer (no hints, first attempt)', () => {
    expect(calculateChallengeXp(100, { usedHints: 0, attempts: 1 })).toBe(150)
  })

  it('reduces XP when hints are used', () => {
    const xp = calculateChallengeXp(100, { usedHints: 2, attempts: 1 })
    expect(xp).toBe(60) // 100 - 2*20
  })

  it('never goes below 10 XP', () => {
    const xp = calculateChallengeXp(30, { usedHints: 5, attempts: 1 })
    expect(xp).toBe(10)
  })

  it('gives bonus for first attempt with no hints', () => {
    const xpPerfect = calculateChallengeXp(50, { usedHints: 0, attempts: 1 })
    const xpRetry = calculateChallengeXp(50, { usedHints: 0, attempts: 2 })
    expect(xpPerfect).toBeGreaterThan(xpRetry)
  })
})
