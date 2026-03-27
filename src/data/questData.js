/**
 * DI Quest — Case Study 關卡資料（Index）
 * 各路線的世界資料拆分至 ./worlds/ 目錄
 */

import { businessAnalysisWorlds } from './worlds/businessAnalysis'
import { sqlWorlds } from './worlds/sql'
import { pythonWorlds } from './worlds/python'
import { diProductWorlds } from './worlds/diProduct'

export const WORLDS = [
  ...businessAnalysisWorlds,
  ...sqlWorlds,
  ...pythonWorlds,
  ...diProductWorlds,
].sort((a, b) => a.id - b.id)

// ── Helper Functions ─────────────────────────────────────────

export function getWorld(worldId) {
  return WORLDS.find(w => w.id === Number(worldId)) || null
}

export function getQuest(questId) {
  for (const world of WORLDS) {
    const quest = world.quests.find(q => q.id === questId)
    if (quest) return quest
  }
  return null
}

export function getChallenge(questId, challengeId) {
  const quest = getQuest(questId)
  if (!quest) return null
  return quest.challenges?.find(c => c.id === Number(challengeId)) || null
}
