import world1 from './world1'
import world2 from './world2'
import world3 from './world3'
import world4 from './world4'
import world5 from './world5'
import world6 from './world6'

const lessons = {
  1: world1,
  2: world2,
  3: world3,
  4: world4,
  5: world5,
  6: world6,
}

export function getWorldLesson(worldId) {
  return lessons[worldId] || null
}

// 取得某個 quest 對應的講義章節標題（顯示用）
// 必須跟 world*.js 裡的 ## 標題完全一致
const QUEST_SECTION_MAP = {
  '1-1': 'Day 1：變數、函式、條件判斷',
  '1-2': 'Day 1：變數、函式、條件判斷',
  '1-3': 'Day 1：變數、函式、條件判斷',
  '1-4': 'Day 2：讀懂 calculator.js',
  '1-5': 'Day 3：自己動手寫',
  '1-6': 'Day 4：BOM 展開 + 遞迴',
  '2-1': '2-1：什麼是純函式（Pure Function）',
  '2-2': '2-2：輸入驗證（Input Validation）',
  '2-3': '2-3：邊界情況（Edge Cases）',
  '2-4': '2-4：函式組合（Function Composition）',
  '2-5': '2-5：自動化測試',
  '2-6': '2-6（Boss）：BOM 遞迴展開',
  '3-1': '3-1：SELECT — 從資料庫讀資料',
  '3-2': '3-2：WHERE + JOIN — 過濾與合併',
  '3-3': '3-3：GROUP BY + 聚合函式',
  '3-4': '3-4：INSERT + UPDATE — 寫入與修改',
  '3-5': '3-5：RPC 函式 + 子查詢',
  '3-6': '3-6（Boss）：即時查詢挑戰',
  '4-1': '4-1：JSX 基礎 — HTML + JavaScript',
  '4-2': '4-2：Props 與 State',
  '4-3': '4-3：useEffect — 副作用處理',
  '4-4': '4-4：Context — 全域狀態',
  '4-5': '4-5：條件渲染與列表',
  '4-6': '4-6（Boss）：從零寫一個 Dashboard Card',
  '5-1': '5-1：Async/Await — 非同步程式設計',
  '5-2': '5-2：Pub/Sub 模式 — EventBus',
  '5-3': '5-3：Semaphore — 並發控制',
  '5-4': '5-4：Circuit Breaker — 熔斷器',
  '5-5': '5-5：ReAct Loop — Agent 怎麼思考',
  '5-6': '5-6（Boss）：自己寫一個 Mini Agent',
  '6-1': '6-1：需求預測（Demand Forecasting）',
  '6-2': '6-2：安全庫存策略',
  '6-3': '6-3：BOM 成本分析',
  '6-4': '6-4：風險量化',
  '6-5': '6-5：場景模擬（What-If Analysis）',
  '6-6': '6-6（Boss）：完整商業簡報',
}

// 回傳顯示用的章節標題
export function getQuestSectionTitle(questId) {
  return QUEST_SECTION_MAP[questId] || null
}

// 回傳 slug（用於 anchor 跳轉）
export function getQuestSectionId(questId) {
  const title = QUEST_SECTION_MAP[questId]
  if (!title) return null
  return slugify(title)
}

function slugify(text) {
  return text
    .toLowerCase()
    .replace(/[^\w\u4e00-\u9fff\s-]/g, '')
    .replace(/\s+/g, '-')
    .replace(/-+/g, '-')
    .trim()
}
