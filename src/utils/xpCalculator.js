// XP 與等級計算 — 純函式

const LEVELS = [
  { level: 1, title: 'Trainee Analyst', minXp: 0 },
  { level: 2, title: 'Trainee Analyst', minXp: 100 },
  { level: 3, title: 'Trainee Analyst', minXp: 200 },
  { level: 4, title: 'Trainee Analyst', minXp: 350 },
  { level: 5, title: 'Junior Analyst', minXp: 500 },
  { level: 6, title: 'Junior Analyst', minXp: 700 },
  { level: 7, title: 'Junior Analyst', minXp: 900 },
  { level: 8, title: 'Junior Analyst', minXp: 1100 },
  { level: 10, title: 'Data Interpreter', minXp: 1200 },
  { level: 12, title: 'Data Interpreter', minXp: 1600 },
  { level: 15, title: 'Business Analyst', minXp: 2000 },
  { level: 18, title: 'Business Analyst', minXp: 2500 },
  { level: 20, title: 'Product Analyst', minXp: 3000 },
  { level: 22, title: 'Product Analyst', minXp: 3500 },
  { level: 25, title: 'Senior Analyst', minXp: 4500 },
  { level: 28, title: 'Senior Analyst', minXp: 5200 },
  { level: 30, title: 'Chief Analytics Officer', minXp: 6000 },
]

export function getLevelInfo(totalXp) {
  let current = LEVELS[0]
  let next = LEVELS[1]
  for (let i = LEVELS.length - 1; i >= 0; i--) {
    if (totalXp >= LEVELS[i].minXp) {
      current = LEVELS[i]
      next = LEVELS[i + 1] || null
      break
    }
  }
  return {
    level: current.level,
    title: current.title,
    currentXp: totalXp,
    xpForNext: next ? next.minXp : current.minXp,
    progress: next ? (totalXp - current.minXp) / (next.minXp - current.minXp) : 1,
  }
}

export function calculateChallengeXp(baseXp, { usedHints = 0, attempts = 1 }) {
  let xp = baseXp
  if (usedHints === 0 && attempts === 1) xp = Math.floor(xp * 1.5)
  else if (usedHints > 0) xp = Math.max(10, xp - usedHints * 20)
  return xp
}
