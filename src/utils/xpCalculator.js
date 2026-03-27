// XP 與等級計算 — 純函式

const LEVELS = [
  { level: 1, title: '菜鳥工程師', minXp: 0 },
  { level: 2, title: '菜鳥工程師', minXp: 100 },
  { level: 3, title: '菜鳥工程師', minXp: 200 },
  { level: 4, title: '菜鳥工程師', minXp: 350 },
  { level: 5, title: '初級開發者', minXp: 500 },
  { level: 6, title: '初級開發者', minXp: 700 },
  { level: 7, title: '初級開發者', minXp: 900 },
  { level: 8, title: '初級開發者', minXp: 1100 },
  { level: 10, title: '純函式戰士', minXp: 1200 },
  { level: 12, title: '純函式戰士', minXp: 1600 },
  { level: 15, title: 'SQL 探險家', minXp: 2000 },
  { level: 18, title: 'SQL 探險家', minXp: 2500 },
  { level: 20, title: 'React 騎士', minXp: 3000 },
  { level: 22, title: 'React 騎士', minXp: 3500 },
  { level: 25, title: 'Agent 術士', minXp: 4500 },
  { level: 28, title: 'Agent 術士', minXp: 5200 },
  { level: 30, title: '供應鏈大師', minXp: 6000 },
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
