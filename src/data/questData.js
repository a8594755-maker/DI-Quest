/**
 * DI Quest — Case Study 關卡資料（Index）
 * 各路線的世界資料拆分至 ./worlds/ 目錄
 */

import i18n from '../i18n'
import { businessAnalysisWorlds } from './worlds/businessAnalysis'
import { sqlWorlds } from './worlds/sql'
import { sqlWorldsEn } from './worlds/sql_en'
import { pythonWorlds } from './worlds/python'
import { diProductWorlds } from './worlds/diProduct'

function getSqlWorldsForLang() {
  return i18n.language === 'en' ? sqlWorldsEn : sqlWorlds
}

export function getWorlds() {
  return [
    ...businessAnalysisWorlds,
    ...getSqlWorldsForLang(),
    ...pythonWorlds,
    ...diProductWorlds,
  ].sort((a, b) => a.id - b.id)
}

// Backwards-compatible static export (used by components that don't need reactivity)
export const WORLDS = new Proxy([], {
  get(target, prop) {
    const worlds = getWorlds()
    if (prop === Symbol.iterator) return worlds[Symbol.iterator].bind(worlds)
    return worlds[prop]
  },
})

// ── Helper Functions ─────────────────────────────────────────

export function getWorld(worldId) {
  return getWorlds().find(w => w.id === Number(worldId)) || null
}

export function getQuest(questId) {
  for (const world of getWorlds()) {
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
