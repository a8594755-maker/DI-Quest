import { describe, it, expect } from 'vitest'
import { BRANCHES, getBranch, getBranchForWorld } from '../branches'

describe('branches', () => {
  it('has 5 learning tracks', () => {
    expect(BRANCHES).toHaveLength(5)
  })

  it('each branch has required fields', () => {
    for (const branch of BRANCHES) {
      expect(branch).toHaveProperty('id')
      expect(branch).toHaveProperty('name')
      expect(branch).toHaveProperty('worldIds')
      expect(branch.worldIds.length).toBeGreaterThan(0)
    }
  })

  it('getBranch returns correct branch by ID', () => {
    const ba = getBranch('business-analysis')
    expect(ba).not.toBeNull()
    expect(ba.worldIds).toContain(1)
  })

  it('getBranch returns null for unknown ID', () => {
    expect(getBranch('nonexistent')).toBeNull()
  })

  it('getBranchForWorld maps world to correct branch', () => {
    expect(getBranchForWorld(1).id).toBe('business-analysis')
    expect(getBranchForWorld(4).id).toBe('sql')
    expect(getBranchForWorld(15).id).toBe('python')
    expect(getBranchForWorld(9).id).toBe('di-product')
    expect(getBranchForWorld(48).id).toBe('professional-english')
  })

  it('no world ID appears in multiple branches', () => {
    const seen = new Set()
    for (const branch of BRANCHES) {
      for (const wid of branch.worldIds) {
        expect(seen.has(wid)).toBe(false)
        seen.add(wid)
      }
    }
  })
})
