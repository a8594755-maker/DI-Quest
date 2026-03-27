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
import world15 from './world15'
import world16 from './world16'
import world17 from './world17'
import world18 from './world18'
import world19 from './world19'
import world20 from './world20'
import world21 from './world21'
import world22 from './world22'
import world23 from './world23'
import world24 from './world24'
import world25 from './world25'
import world26 from './world26'
import world4_en from './world4_en'
import world23_en from './world23_en'
import world24_en from './world24_en'
import world25_en from './world25_en'
import world26_en from './world26_en'
import world39 from './world39'
import world40 from './world40'
import world41 from './world41'

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
  15: world15,
  16: world16,
  17: world17,
  18: world18,
  19: world19,
  20: world20,
  21: world21,
  22: world22,
  23: world23,
  24: world24,
  25: world25,
  26: world26,
  39: world39,
  40: world40,
  41: world41,
}

import i18n from '../../i18n'

const lessonsEn = {
  4: world4_en,
  23: world23_en,
  24: world24_en,
  25: world25_en,
  26: world26_en,
}

export function getWorldLesson(worldId) {
  if (i18n.language === 'en' && lessonsEn[worldId]) {
    return lessonsEn[worldId]
  }
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
  // ── DI 進階學習區 ──
  '39-1': '39-1：CFR 是什麼 — 用 AI 練習談判',
  '39-2': '39-2：博弈樹與 Position Buckets',
  '39-3': '39-3：談判引擎完整流程',
  '39-4': '39-4：Digital Twin 模擬系統',
  '39-5': '39-5：模擬場景與反饋循環',
  '39-6': '39-6（Boss）：談判策略設計',
  '40-1': '40-1：為什麼模型會退化',
  '40-2': '40-2：Drift Detection 三指標',
  '40-3': '40-3：重新訓練觸發規則',
  '40-4': '40-4：Style Learning 回饋學習',
  '40-5': '40-5：閉環編排（9 步 Pipeline）',
  '40-6': '40-6（Boss）：模型退化診斷',
  '41-1': '41-1：Ralph Loop 自主代理',
  '41-2': '41-2：Model Routing 智慧路由',
  '41-3': '41-3：Signal Radar 異常偵測',
  '41-4': '41-4：瀏覽器 vs 伺服器執行',
  '41-5': '41-5：資料庫 Schema 與 RLS',
  '41-6': '41-6（Boss）：整合情境題',
  // ── Python 學習路線 ──
  '15-1': '15-1：變數與資料型態',
  '15-2': '15-2：Input/Output 與字串格式化',
  '15-3': '15-3：運算子與表達式',
  '15-4': '15-4：條件判斷 if/elif/else',
  '15-5': '15-5：條件判斷進階',
  '15-6': '15-6（Boss）：簡易計算器',
  '16-1': '16-1：for 迴圈與 range()',
  '16-2': '16-2：while 迴圈與流程控制',
  '16-3': '16-3：字串操作',
  '16-4': '16-4：List 與 Tuple',
  '16-5': '16-5：Dict 與 Set',
  '16-6': '16-6（Boss）：資料清洗小程式',
  '17-1': '17-1：函式基礎 def',
  '17-2': '17-2：參數進階',
  '17-3': '17-3：作用域與內建函式',
  '17-4': '17-4：錯誤類型與除錯',
  '17-5': '17-5：try/except 與防禦式程式',
  '17-6': '17-6（Boss）：資料驗證函式組',
  '18-1': '18-1：import 與標準函式庫',
  '18-2': '18-2：pip 與第三方套件',
  '18-3': '18-3：檔案讀寫 txt/csv',
  '18-4': '18-4：JSON 讀寫',
  '18-5': '18-5：OOP 基礎 class',
  '18-6': '18-6（Boss）：Config Reader',
  '19-1': '19-1：List Comprehension',
  '19-2': '19-2：可讀性與 PEP 8',
  '19-3': '19-3：Pandas 入門 DataFrame',
  '19-4': '19-4：資料篩選與排序',
  '19-5': '19-5：GroupBy 與聚合',
  '19-6': '19-6（Boss）：Pandas 銷售分析',
  '20-1': '20-1：JSON 與 API 概念',
  '20-2': '20-2：requests GET',
  '20-3': '20-3：POST 與認證',
  '20-4': '20-4：批次處理腳本',
  '20-5': '20-5：自動報表生成',
  '20-6': '20-6（Boss）：API 資料蒐集腳本',
  '21-1': '21-1：Python + SQLite',
  '21-2': '21-2：CRUD 操作',
  '21-3': '21-3：ORM 概念',
  '21-4': '21-4：Flask/FastAPI 入門',
  '21-5': '21-5：建立 RESTful API',
  '21-6': '21-6（Boss）：待辦事項 API',
  '22-1': '22-1：需求分析與規格',
  '22-2': '22-2：表單處理',
  '22-3': '22-3：Workflow 自動化',
  '22-4': '22-4：內部工具架構',
  '22-5': '22-5：部署與維護概念',
  '22-6': '22-6（Boss）：請假申請系統',
  // ── SQL 學習路線（進階）──
  '23-1': '23-1：資料庫與資料表基本概念',
  '23-2': '23-2：SELECT / FROM / WHERE 深入',
  '23-3': '23-3：排序與進階篩選',
  '23-4': '23-4：聚合函數深入',
  '23-5': '23-5：字串與日期處理',
  '23-6': '23-6（Boss）：基礎查詢綜合挑戰',
  '24-1': '24-1：多表連接進階',
  '24-2': '24-2：條件邏輯與 NULL 處理',
  '24-3': '24-3：子查詢',
  '24-4': '24-4：CTE 與多層查詢',
  '24-5': '24-5：資料清理與品質檢查',
  '24-6': '24-6（Boss）：資料整合分析',
  '25-1': '25-1：Window Functions 實戰',
  '25-2': '25-2：Funnel Analysis',
  '25-3': '25-3：Segmentation',
  '25-4': '25-4：Retention / Cohort Analysis',
  '25-5': '25-5：KPI 與 Dashboard Query Design',
  '25-6': '25-6（Boss）：產品分析 SQL Case',
  '26-1': '26-1：INSERT / UPDATE / DELETE',
  '26-2': '26-2：CREATE TABLE 與資料型態',
  '26-3': '26-3：CRUD 與應用程式資料流',
  '26-4': '26-4：SQL 與 Python 整合',
  '26-5': '26-5：權限、資料隔離與 Query Performance',
  '26-6': '26-6（Boss）：系統設計 SQL Case',
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
