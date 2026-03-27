import world1 from './world1'
import world2 from './world2'
import world3 from './world3'
import world4 from './world4'
import world5 from './world5'
import world6 from './world6'
import world7 from './world7'
import world8 from './world8'
import world9 from './world9'
import world10 from './world10'
import world11 from './world11'
import world12 from './world12'
import world13 from './world13'
import world14 from './world14'

const lessons = {
  1: world1,
  2: world2,
  3: world3,
  4: world4,
  5: world5,
  6: world6,
  7: world7,
  8: world8,
  9: world9,
  10: world10,
  11: world11,
  12: world12,
  13: world13,
  14: world14,
}

export function getWorldLesson(worldId) {
  return lessons[worldId] || null
}

// 取得某個 quest 對應的教材章節標題（顯示用）
const QUEST_SECTION_MAP = {
  '1-1': '1-1：問題分類 — Business / Product / System',
  '1-2': '1-2：拆解問題的步驟',
  '1-3': '1-3：資訊不足時怎麼辦',
  '1-4': '1-4：問題的影響分析',
  '1-5': '1-5：結構化思考練習',
  '1-6': '1-6（Boss）：完整 Case 拆解',
  '2-1': '2-1：KPI 基礎概念',
  '2-2': '2-2：Product & User Metrics',
  '2-3': '2-3：Business & Operations Metrics',
  '2-4': '2-4：Success Metrics 怎麼定',
  '2-5': '2-5：不同角色看不同指標',
  '2-6': '2-6（Boss）：綜合指標分析',
  '3-1': '3-1：Trend Analysis',
  '3-2': '3-2：Funnel Analysis',
  '3-3': '3-3：Segmentation',
  '3-4': '3-4：Cohort Analysis',
  '3-5': '3-5：Root Cause Thinking',
  '3-6': '3-6（Boss）：完整數據調查',
  '4-1': '4-1：SQL 查詢思維',
  '4-2': '4-2：Event Data vs Transactional Data',
  '4-3': '4-3：JOIN 與 Aggregation',
  '4-4': '4-4：Window Functions',
  '4-5': '4-5：Source of Truth',
  '4-6': '4-6（Boss）：資料分析設計',
  '5-1': '5-1：User Journey Mapping',
  '5-2': '5-2：Feature 成功評估',
  '5-3': '5-3：Adoption 問題診斷',
  '5-4': '5-4：Usage vs Value',
  '5-5': '5-5：Discoverability vs Usability vs Value',
  '5-6': '5-6（Boss）：產品分析 Case',
  '6-1': '6-1：Process Mapping',
  '6-2': '6-2：找 Bottleneck',
  '6-3': '6-3：Automation 決策',
  '6-4': '6-4：Permissions & Audit',
  '6-5': '6-5：Exception Handling',
  '6-6': '6-6（Boss）：流程改善 Case',
  '7-1': '7-1：Hypothesis 設計',
  '7-2': '7-2：A/B Test 基礎',
  '7-3': '7-3：Metric 選擇與 Guardrail',
  '7-4': '7-4：Sample Bias',
  '7-5': '7-5：Correlation vs Causation',
  '7-6': '7-6（Boss）：實驗設計 Case',
  '8-1': '8-1：KPI 掉了怎麼查',
  '8-2': '8-2：Feature 成功嗎',
  '8-3': '8-3：流程怎麼改',
  '8-4': '8-4：Dashboard 設計',
  '8-5': '8-5：User Segmentation',
  '8-6': '8-6（Boss）：完整模擬面試',
  // ── Decision-Intelligence 學習區 ──
  '9-1': '9-1：產品定位 — 不是 Chatbot',
  '9-2': '9-2：核心工作流程（Golden Path）',
  '9-3': '9-3：功能模組總覽',
  '9-4': '9-4：Digital Worker 概念',
  '9-5': '9-5：使用者旅程與路由收斂',
  '9-6': '9-6（Boss）：產品 Pitch',
  '10-1': '10-1：四層架構概覽',
  '10-2': '10-2：Frontend 服務層',
  '10-3': '10-3：Supabase 層',
  '10-4': '10-4：ML API 入口',
  '10-5': '10-5：請求流向追蹤',
  '10-6': '10-6（Boss）：畫出架構',
  '11-1': '11-1：部署拓撲',
  '11-2': '11-2：Dockerfile 解析',
  '11-3': '11-3：環境變數與 Secrets',
  '11-4': '11-4：健康檢查機制',
  '11-5': '11-5：啟動與驗證流程',
  '11-6': '11-6（Boss）：部署計畫',
  '12-1': '12-1：測試金字塔',
  '12-2': '12-2：回歸測試套件',
  '12-3': '12-3：Release Gate 機制',
  '12-4': '12-4：E2E 與 Smoke Tests',
  '12-5': '12-5：Guardrail 檢查',
  '12-6': '12-6（Boss）：品質報告',
  '13-1': '13-1：JWT 認證機制',
  '13-2': '13-2：多租戶與角色控制',
  '13-3': '13-3：Rate Limiting',
  '13-4': '13-4：非同步作業系統',
  '13-5': '13-5：Telemetry 與 SSE',
  '13-6': '13-6（Boss）：API 安全架構審查',
  '14-1': '14-1：Frontend-Only 部分啟動',
  '14-2': '14-2：SAP Adapter 邊界',
  '14-3': '14-3：Optional ML 足跡',
  '14-4': '14-4：文件閱讀路線',
  '14-5': '14-5：操作邊界總覽',
  '14-6': '14-6（Boss）：限制溝通',
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
