/**
 * DI Quest — Case Study 關卡資料（Index）
 * 各路線的世界資料拆分至 ./worlds/ 目錄
 */

import i18n from '../i18n'
import { businessAnalysisWorlds } from './worlds/businessAnalysis'
import { sqlWorlds } from './worlds/sql'
import { sqlWorldsEn } from './worlds/sql_en'
import { pythonWorlds } from './worlds/python'
import { pythonWorldsEn } from './worlds/python_en'
import { diProductWorlds } from './worlds/diProduct'
import { diProductWorldsEn } from './worlds/diProduct_en'
import { businessAnalysisWorldsEn } from './worlds/businessAnalysis_en'
import { businessAnalysisAdvancedWorlds } from './worlds/businessAnalysisAdvanced'
import { businessAnalysisAdvancedWorldsEn } from './worlds/businessAnalysisAdvanced_en'
import { businessAnalysisExtraWorlds } from './worlds/businessAnalysisExtra'
import { businessAnalysisExtraWorldsEn } from './worlds/businessAnalysisExtra_en'

function forLang(zh, en) {
  return i18n.language === 'en' ? en : zh
}

export function getWorlds() {
  return [
    ...forLang(businessAnalysisWorlds, businessAnalysisWorldsEn),
    ...forLang(sqlWorlds, sqlWorldsEn),
    ...forLang(pythonWorlds, pythonWorldsEn),
    ...forLang(diProductWorlds, diProductWorldsEn),
    ...forLang(businessAnalysisAdvancedWorlds, businessAnalysisAdvancedWorldsEn),
    ...forLang(businessAnalysisExtraWorlds, businessAnalysisExtraWorldsEn),
  ].sort((a, b) => a.id - b.id)
}

// Backwards-compatible static export — Proxy delegates all access to getWorlds()
export const WORLDS = new Proxy([], {
  get(target, prop) {
    const worlds = getWorlds()
    const value = worlds[prop]
    if (typeof value === 'function') return value.bind(worlds)
    return value
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
