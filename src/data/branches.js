/**
 * DI Quest — 學習路線（Branch）定義
 */

export const BRANCHES = [
  {
    id: 'business-analysis',
    name: '商業分析路線',
    emoji: '🎯',
    description: '從問題拆解到完整商業 Case Study 面試準備',
    color: 'from-blue-500 to-indigo-500',
    worldIds: [1, 2, 3, 5, 6, 7, 8, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 42],
  },
  {
    id: 'sql',
    name: 'SQL 路線',
    emoji: '🗄️',
    description: 'SQL 查詢思維與實戰練習',
    color: 'from-emerald-500 to-teal-500',
    worldIds: [4, 23, 24, 25, 26],
  },
  {
    id: 'python',
    name: 'Python 路線',
    emoji: '🐍',
    description: 'Python 基礎、Pandas 數據處理、面試題',
    color: 'from-yellow-500 to-orange-500',
    worldIds: [15, 16, 17, 18, 19, 20, 21, 22],
  },
  {
    id: 'di-product',
    name: 'DI 產品知識路線',
    emoji: '🏢',
    description: 'Decision Intelligence 產品架構、部署、品質與邊界',
    color: 'from-purple-500 to-pink-500',
    worldIds: [9, 10, 11, 12, 13, 14, 39, 40, 41],
    premiumOnly: true,
  },
  {
    id: 'professional-english',
    name: '職場英文路線',
    emoji: '🌐',
    description: '從專案介紹到面試對答，練出職場即戰力英文',
    color: 'from-sky-500 to-teal-500',
    worldIds: [48, 49, 50, 51, 52, 53],
    zhOnly: true,
  },
  {
    id: 'supply-chain',
    name: '供應鏈管理路線',
    emoji: '🔗',
    description: '從供應鏈全貌到風險永續，掌握 Supply Chain + Data + IT 的核心競爭力',
    color: 'from-teal-500 to-emerald-500',
    worldIds: [54, 55, 56, 57, 58, 59, 60, 61],
  },
]

import i18n from '../i18n'

export function getVisibleBranches() {
  if (i18n.language === 'en') {
    return BRANCHES.filter(b => !b.zhOnly)
  }
  return BRANCHES
}

export function getBranch(branchId) {
  return BRANCHES.find(b => b.id === branchId) || null
}

export function getBranchForWorld(worldId) {
  return BRANCHES.find(b => b.worldIds.includes(Number(worldId))) || null
}
