import { useState, useRef, useEffect } from 'react'
import { Send, Bot, User, Sparkles, BookOpen, Code, HelpCircle, Map } from 'lucide-react'
import { motion, AnimatePresence } from 'framer-motion'
import { useQuest } from '../contexts/QuestContext'
import { WORLDS } from '../data/questData'
import { Link } from 'react-router-dom'
import { chatWithDeepSeek } from '../utils/deepseek'

// ── 知識庫：每個主題的解釋 ────────────────────────────────
const KNOWLEDGE = {
  '變數': {
    content: '在 JavaScript 中，變數就像是一個有名字的箱子，你可以把值放進去：\n\n• `let` — 可以改的變數（推薦）\n• `const` — 不能改的常數（更推薦）\n• `var` — 舊語法，有 scope 陷阱，不推薦\n\n```js\nconst name = "小迪";\nlet score = 0;\nscore = 100; // OK！\n// name = "大迪"; // 錯！const 不能改\n```',
    suggestions: ['什麼是 scope？', '什麼時候用 let vs const？', '回到地圖'],
  },
  '函式': {
    content: '函式是一段可以重複使用的程式碼：\n\n```js\n// 函式宣告\nfunction add(a, b) {\n  return a + b;\n}\n\n// 箭頭函式（更簡潔）\nconst add = (a, b) => a + b;\n```\n\n在 DI 專案中，`calculator.js` 裡面全是純函式 — 給相同輸入永遠得到相同輸出，不修改外部狀態。',
    suggestions: ['什麼是純函式？', '什麼是箭頭函式？', '回到地圖'],
  },
  '純函式': {
    content: '純函式有兩個特性：\n1. **相同輸入 → 相同輸出**（不依賴外部變數）\n2. **沒有副作用**（不修改外部狀態）\n\n```js\n// ✅ 純函式\nfunction add(a, b) { return a + b; }\n\n// ❌ 不純 — 依賴外部變數\nlet tax = 0.05;\nfunction total(price) { return price * (1 + tax); }\n\n// ❌ 不純 — 修改外部狀態\nlet count = 0;\nfunction inc() { count++; return count; }\n```\n\nDI 專案的 `calculator.js` 全是純函式，這讓測試變得超簡單！',
    suggestions: ['為什麼純函式重要？', '什麼是副作用？', '回到地圖'],
  },
  'scope': {
    content: 'Scope（作用域）決定了變數在哪裡可以被存取：\n\n• **Block scope** — `let`/`const` 只活在 `{}` 裡面\n• **Function scope** — `var` 活在整個函式裡\n• **Global scope** — 最外層宣告的全域變數\n\n```js\nif (true) {\n  let x = 1;\n  var y = 2;\n}\n// console.log(x); // 錯！x 在 block 外不存在\nconsole.log(y); // 2 — var 逃出了 block！\n```\n\n這就是為什麼我們不推薦 `var`。',
    suggestions: ['什麼是閉包？', '什麼是變數？', '回到地圖'],
  },
  'sql': {
    content: '在 DI 專案中，Supabase（基於 PostgreSQL）是我們的資料庫。基本 SQL 語法：\n\n```sql\n-- 查詢資料\nSELECT name, stock FROM products WHERE stock < 10;\n\n-- 排序\nSELECT * FROM orders ORDER BY created_at DESC;\n\n-- 聚合\nSELECT category, AVG(price) FROM products GROUP BY category;\n\n-- JOIN 關聯\nSELECT o.id, p.name\nFROM orders o\nJOIN products p ON o.product_id = p.id;\n```',
    suggestions: ['什麼是 JOIN？', '什麼是 GROUP BY？', '回到地圖'],
  },
  'async': {
    content: 'JavaScript 的非同步就像叫外賣 — 你不用站在門口等，可以先做別的事：\n\n```js\n// Promise\nfetch("/api/data")\n  .then(res => res.json())\n  .then(data => console.log(data));\n\n// async/await（更好讀）\nasync function getData() {\n  const res = await fetch("/api/data");\n  const data = await res.json();\n  return data;\n}\n```\n\nDI 專案的 `aiProxyService.js` 大量使用 async/await 來處理 API 呼叫。',
    suggestions: ['什麼是 Promise？', '什麼是 EventBus？', '回到地圖'],
  },
  'eventbus': {
    content: 'EventBus（事件匯流排）是發布/訂閱模式的實作：\n\n```js\n// 訂閱：我對「庫存變動」感興趣\nbus.on("inventory-change", (data) => {\n  console.log(`${data.product} 庫存變成 ${data.stock}`);\n});\n\n// 發布：庫存真的變了！\nbus.emit("inventory-change", { product: "螺絲", stock: 42 });\n```\n\n好處是：發送者和接收者不需要互相知道對方存在，降低耦合度。\n\nDI 專案中 `eventBus.js` 用它來串接不同模組。',
    suggestions: ['什麼是 Semaphore？', '什麼是 Circuit Breaker？', '回到地圖'],
  },
  'semaphore': {
    content: 'Semaphore（信號量）限制同時執行的任務數量：\n\n想像一間有 3 個座位的餐廳：\n- 前 3 位客人可以直接入座\n- 第 4 位客人必須等\n- 有人離開後，等待的人才能進去\n\n```js\nconst sem = new AsyncSemaphore(3);\nawait sem.acquire(); // 搶到座位\n// ... 做事 ...\nsem.release(); // 離開座位\n```\n\nDI 專案中用 Semaphore 限制同時發送的 AI API 請求數量，避免被限速。',
    suggestions: ['什麼是 async/await？', '什麼是 Circuit Breaker？', '回到地圖'],
  },
  'circuit breaker': {
    content: 'Circuit Breaker（熔斷器）保護系統不被連續錯誤壓垮：\n\n三個狀態：\n- **CLOSED**（正常）→ 請求正常通過\n- **OPEN**（熔斷）→ 連續失敗太多次，直接拒絕請求\n- **HALF_OPEN**（試探）→ 冷卻後讓一個請求通過測試\n\n就像家裡的電路跳閘 — 過載時自動斷電保護，等穩定了再手動合回去。\n\nDI 專案的 `aiProxyService.js` 用它保護 AI API 呼叫。',
    suggestions: ['什麼是 Semaphore？', '什麼是 ReAct 迴圈？', '回到地圖'],
  },
  'react迴圈': {
    content: 'ReAct（Reasoning + Acting）是 AI Agent 的核心模式：\n\n```\n迴圈：\n  1. 思考（Thought）— 分析目前狀況\n  2. 行動（Action）— 選擇並呼叫工具\n  3. 觀察（Observation）— 看工具回傳了什麼\n  → 回到 1，直到找到答案\n```\n\nDI 專案的 `chatAgentLoop.js` 就是這個模式的實作！\n\nAgent 不是「一次回答」，而是「多步推理」。',
    suggestions: ['什麼是 Agent？', '什麼是 async/await？', '回到地圖'],
  },
  'bom': {
    content: 'BOM（Bill of Materials，物料清單）是製造業的核心概念：\n\n一台車的 BOM：\n```\n車 (×1)\n├── 引擎 (×1)\n│   ├── 活塞 (×4)\n│   └── 火星塞 (×4)\n├── 輪胎 (×4)\n└── 座椅 (×5)\n```\n\n「BOM 展開」就是遞迴把這棵樹攤平，算出所有零件的需求量。\n\nDI 專案的 `bomCalculator.js` 中的 `explodeBOM()` 就是做這件事 — 它用遞迴 + 環路偵測來處理複雜的 BOM 結構。',
    suggestions: ['什麼是遞迴？', '什麼是安全庫存？', '回到地圖'],
  },
  '安全庫存': {
    content: '安全庫存是為了應對不確定性而額外儲備的庫存量：\n\n公式：**安全庫存 = Z × σ × √LT**\n\n• Z = 服務水準對應的 Z 分數（95% → 1.65，99% → 2.33）\n• σ = 需求的標準差（需求波動度）\n• LT = 前置時間（天數）\n\n例如：需求標準差 20，前置時間 7 天，95% 服務水準：\n→ 1.65 × 20 × √7 ≈ 87 個\n\nDI 專案中 `calculator.js` 的 `calculateDaysToStockout` 會用到安全庫存來判斷缺貨風險。',
    suggestions: ['什麼是 BOM？', '什麼是風險量化？', '回到地圖'],
  },
}

// ── 關鍵字匹配 ────────────────────────────────────────────
const KEYWORD_MAP = [
  { keywords: ['變數', 'let', 'const', 'var', 'variable'], topic: '變數' },
  { keywords: ['函式', 'function', '箭頭', 'arrow'], topic: '函式' },
  { keywords: ['純函式', 'pure function', '副作用'], topic: '純函式' },
  { keywords: ['scope', '作用域', '閉包'], topic: 'scope' },
  { keywords: ['sql', 'select', 'where', 'join', 'group by', '資料庫', '查詢'], topic: 'sql' },
  { keywords: ['async', 'await', 'promise', '非同步', '異步'], topic: 'async' },
  { keywords: ['eventbus', 'event bus', '事件', 'pub/sub', '發布訂閱'], topic: 'eventbus' },
  { keywords: ['semaphore', '信號量', '並發', '限流'], topic: 'semaphore' },
  { keywords: ['circuit breaker', '熔斷', '斷路'], topic: 'circuit breaker' },
  { keywords: ['react loop', 'react 迴圈', 'reasoning', 'agent 思考'], topic: 'react迴圈' },
  { keywords: ['bom', '物料', '展開', '零件'], topic: 'bom' },
  { keywords: ['安全庫存', 'safety stock', '服務水準'], topic: '安全庫存' },
]

function findTopic(input) {
  const lower = input.toLowerCase()
  for (const entry of KEYWORD_MAP) {
    for (const kw of entry.keywords) {
      if (lower.includes(kw)) return entry.topic
    }
  }
  return null
}

// ── 進度相關回答 ──────────────────────────────────────────
function getProgressResponse(questStatus, challengeStatus, totalXp, levelInfo) {
  const completedQuests = Object.values(questStatus).filter(q => q.completed).length
  const completedChallenges = Object.values(challengeStatus).filter(c => c.completed).length
  const totalQuests = WORLDS.reduce((sum, w) => sum + w.quests.length, 0)

  if (completedQuests === 0) {
    return {
      content: `你還沒完成任何關卡！建議從「World 1: JavaScript 基礎」開始。先閱讀講義，再去挑戰！\n\n第一關非常簡單 — 就是宣告一些變數。你可以的！💪`,
      suggestions: ['帶我去 World 1', '什麼是變數？', '有什麼建議？'],
    }
  }

  // 找到目前進行中的世界
  let currentWorld = null
  for (const world of WORLDS) {
    const worldCompleted = world.quests.every(q => questStatus[q.id]?.completed)
    if (!worldCompleted) { currentWorld = world; break }
  }

  const nextQuestName = currentWorld
    ? currentWorld.quests.find(q => !questStatus[q.id]?.completed)?.name || '全部完成'
    : '全部通關！'

  return {
    content: `你的冒險進度：\n\n• 等級：Lv.${levelInfo.level} ${levelInfo.title}\n• XP：${totalXp}\n• 完成關卡：${completedQuests}/${totalQuests}\n• 完成挑戰：${completedChallenges} 個\n\n目前在：${currentWorld ? `${currentWorld.emoji} ${currentWorld.name}` : '全部通關！🎉'}\n下一個挑戰：${nextQuestName}`,
    suggestions: currentWorld
      ? [`帶我去 ${currentWorld.name}`, '有什麼建議？', '回到地圖']
      : ['我好厲害！', '回到地圖'],
  }
}

// ── 建議回答 ──────────────────────────────────────────────
function getAdviceResponse(questStatus) {
  // 找到目前世界
  let currentWorldIndex = 0
  for (let i = 0; i < WORLDS.length; i++) {
    const allDone = WORLDS[i].quests.every(q => questStatus[q.id]?.completed)
    if (!allDone) { currentWorldIndex = i; break }
  }

  const world = WORLDS[currentWorldIndex]
  const tips = {
    1: '建議先花 10 分鐘讀完 World 1 的講義，了解變數、函式、條件式這些基礎。挑戰中的程式碼都是從真實的 DI 專案來的，不是虛構的範例！',
    2: 'World 2 的重點是「純函式」和「驗證」。記住：好的函式只做一件事，而且相同輸入永遠給相同輸出。BOM 遞迴 Boss 有點難 — 先搞懂基本遞迴再去挑戰。',
    3: 'SQL 的關鍵是理解「聲明式」思維 — 你告訴資料庫你「要什麼」，而不是「怎麼做」。先掌握 SELECT + WHERE，再學 JOIN 和 GROUP BY。',
    4: 'React 的核心就是：資料 → UI。把資料的變化想成「狀態機」，UI 只是狀態的映射。Context、useEffect 都是圍繞這個概念設計的。',
    5: 'Agent 模式的世界！async/await 是基礎中的基礎，EventBus 讓模組解耦，Semaphore 控制並發，Circuit Breaker 保護系統。一步步來！',
    6: '最後一個世界！這裡不只是寫程式，更要理解商業邏輯。安全庫存公式、風險量化、What-If 分析 — 都是業界每天在用的東西。',
  }

  return {
    content: `你現在在 ${world.emoji} ${world.name}。\n\n${tips[world.id]}`,
    suggestions: [`${world.name} 的講義在哪？`, '我卡在哪？', '回到地圖'],
  }
}

// ── 主元件 ────────────────────────────────────────────────
function NPCChat() {
  const { questStatus, challengeStatus, totalXp, levelInfo } = useQuest()
  const [messages, setMessages] = useState([
    {
      id: 1,
      role: 'assistant',
      content: '嗨！我是小迪 🤖，你的程式學習夥伴。\n\n我可以：\n• 解釋程式概念（變數、函式、SQL、async...）\n• 查看你的學習進度\n• 給你學習建議\n\n有什麼想問的？',
      suggestions: ['我的進度如何？', '有什麼建議？', '什麼是純函式？'],
    },
  ])
  const [input, setInput] = useState('')
  const [isTyping, setIsTyping] = useState(false)
  const messagesEndRef = useRef(null)

  const scrollToBottom = () => {
    messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' })
  }

  useEffect(() => {
    scrollToBottom()
  }, [messages])

  const generateResponse = (userInput) => {
    const lower = userInput.toLowerCase()

    // 1. 進度查詢
    if (lower.includes('進度') || lower.includes('等級') || lower.includes('xp') || lower.includes('做到哪')) {
      return getProgressResponse(questStatus, challengeStatus, totalXp, levelInfo)
    }

    // 2. 建議
    if (lower.includes('建議') || lower.includes('怎麼學') || lower.includes('下一步') || lower.includes('卡在')) {
      return getAdviceResponse(questStatus)
    }

    // 3. 導航
    if (lower.includes('回到地圖') || lower.includes('帶我去')) {
      return {
        content: '好的！點擊下方按鈕前往地圖，選擇你想去的世界。',
        suggestions: ['我的進度如何？', '有什麼建議？'],
        showMapLink: true,
      }
    }

    // 4. 講義位置
    if (lower.includes('講義') || lower.includes('教材') || lower.includes('在哪')) {
      return {
        content: '每個世界都有自己的講義！進入方式：\n\n1. 在地圖中展開任一世界\n2. 點擊最上方的「📖 閱讀講義」\n3. 或在關卡詳情頁點「開始閱讀」\n\n建議流程：**先讀講義 → 再做挑戰** 效果最好！',
        suggestions: ['帶我去地圖', '有什麼建議？', '我的進度如何？'],
      }
    }

    // 5. 卡關幫助
    if (lower.includes('卡關') || lower.includes('不會') || lower.includes('好難') || lower.includes('提示') || lower.includes('hint')) {
      return {
        content: '卡關很正常！這裡有幾個建議：\n\n1. **回去看講義** — 每個世界都有詳細教材\n2. **用提示系統** — 挑戰頁面右上角有「💡 提示」按鈕（最多 3 級提示）\n3. **看參考程式碼** — Boss 關卡會提供真實專案的程式碼供參考\n4. **問我概念** — 直接問我你不懂的概念\n\n別忘了：每個挑戰的程式碼都是從真實的 DI 專案來的，學會了就是實戰能力！',
        suggestions: ['解釋什麼是純函式', '解釋什麼是 BOM', '我的進度如何？'],
      }
    }

    // 6. 知識庫匹配
    const topic = findTopic(userInput)
    if (topic && KNOWLEDGE[topic]) {
      return KNOWLEDGE[topic]
    }

    // 7. 打招呼
    if (lower.match(/^(嗨|你好|hi|hello|hey|哈囉)/)) {
      return {
        content: `嗨！我是小迪，你目前是 Lv.${levelInfo.level} ${levelInfo.title}，共 ${totalXp} XP。有什麼我可以幫忙的嗎？`,
        suggestions: ['我的進度如何？', '有什麼建議？', '解釋什麼是 async'],
      }
    }

    // 8. 稱讚自己
    if (lower.includes('厲害') || lower.includes('太強') || lower.includes('awesome')) {
      return {
        content: `你確實很厲害！已經拿到 ${totalXp} XP 了！繼續加油，距離下一級還有 ${levelInfo.xpForNext - levelInfo.currentXp} XP。\n\n每一關都是真實的企業級程式碼，能通過這些挑戰絕對不簡單。`,
        suggestions: ['下一步做什麼？', '回到地圖'],
      }
    }

    // 9. 兜底 — 交給 DeepSeek AI
    return null
  }

  const handleSend = async (text) => {
    const messageText = text || input
    if (!messageText.trim()) return

    const userMessage = {
      id: messages.length + 1,
      role: 'user',
      content: messageText,
    }

    setMessages(prev => [...prev, userMessage])
    setInput('')
    setIsTyping(true)

    try {
      // 先嘗試本地規則匹配
      const localResponse = generateResponse(messageText)

      if (localResponse) {
        // 規則匹配成功，短暫延遲後顯示
        await new Promise(resolve => setTimeout(resolve, 500))
        setMessages(prev => [...prev, {
          id: prev.length + 1,
          role: 'assistant',
          content: localResponse.content,
          suggestions: localResponse.suggestions,
          showMapLink: localResponse.showMapLink,
        }])
      } else {
        // 規則沒匹配到，呼叫 DeepSeek API
        const aiMessages = [
          {
            role: 'system',
            content: `你是「小迪」，一個友善的程式學習夥伴（DI Quest 學習平台的 NPC）。
你的任務是用繁體中文幫助使用者學習程式設計，特別是 JavaScript、SQL、React、async 模式、以及供應鏈相關的程式邏輯。
回答要簡潔、有趣、鼓勵性質。如果問題涉及程式碼，用簡單的範例說明。
使用者目前等級：Lv.${levelInfo.level} ${levelInfo.title}，共 ${totalXp} XP。
請保持回答在 300 字以內。`,
          },
          // 帶入最近幾輪對話作為上下文
          ...messages.slice(-6).map(m => ({
            role: m.role === 'assistant' ? 'assistant' : 'user',
            content: m.content,
          })),
          { role: 'user', content: messageText },
        ]

        const aiReply = await chatWithDeepSeek(aiMessages)
        setMessages(prev => [...prev, {
          id: prev.length + 1,
          role: 'assistant',
          content: aiReply,
          suggestions: ['我的進度如何？', '有什麼建議？', '回到地圖'],
        }])
      }
    } catch (error) {
      console.error('DeepSeek API error:', error)
      setMessages(prev => [...prev, {
        id: prev.length + 1,
        role: 'assistant',
        content: '抱歉，我暫時無法連接 AI 服務 😅\n\n你可以試試問我特定的程式概念（如：什麼是純函式？什麼是 async？），或查看你的學習進度！',
        suggestions: ['什麼是純函式？', '我的進度如何？', '有什麼建議？'],
      }])
    } finally {
      setIsTyping(false)
    }
  }

  const handleSuggestion = (suggestion) => {
    handleSend(suggestion)
  }

  const quickActions = [
    { icon: BookOpen, label: '解釋概念', action: () => handleSend('解釋什麼是純函式') },
    { icon: Code, label: '我卡關了', action: () => handleSend('我卡關了怎麼辦') },
    { icon: HelpCircle, label: '學習建議', action: () => handleSend('有什麼建議？') },
    { icon: Map, label: '查看進度', action: () => handleSend('我的進度如何？') },
  ]

  return (
    <div className="h-[calc(100vh-73px)] flex flex-col max-w-4xl mx-auto">
      {/* 聊天訊息區 */}
      <div className="flex-1 overflow-y-auto p-6 space-y-4">
        <AnimatePresence>
          {messages.map((message) => (
            <motion.div
              key={message.id}
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -20 }}
              className={`flex gap-4 ${message.role === 'user' ? 'flex-row-reverse' : ''}`}
            >
              {/* 頭像 */}
              <div className={`w-10 h-10 rounded-full flex items-center justify-center flex-shrink-0 ${
                message.role === 'user'
                  ? 'bg-brand-primary/20'
                  : 'bg-brand-accent/20'
              }`}>
                {message.role === 'user' ? (
                  <User className="w-5 h-5 text-brand-primary" />
                ) : (
                  <Bot className="w-5 h-5 text-brand-accent" />
                )}
              </div>

              {/* 訊息內容 */}
              <div className={`max-w-[80%] ${message.role === 'user' ? 'text-right' : ''}`}>
                <div className={`inline-block px-4 py-3 rounded-2xl ${
                  message.role === 'user'
                    ? 'bg-brand-primary text-white'
                    : 'bg-slate-800 text-slate-200'
                }`}>
                  <p className="text-left whitespace-pre-wrap text-sm leading-relaxed">{message.content}</p>
                </div>

                {/* 地圖連結 */}
                {message.showMapLink && (
                  <div className="mt-2">
                    <Link
                      to="/di-quest/map"
                      className="inline-flex items-center gap-2 px-4 py-2 bg-brand-primary text-white rounded-lg text-sm hover:bg-blue-600 transition-colors"
                    >
                      <Map className="w-4 h-4" />
                      前往關卡地圖
                    </Link>
                  </div>
                )}

                {/* 建議按鈕 */}
                {message.suggestions && message.suggestions.length > 0 && (
                  <div className="flex flex-wrap gap-2 mt-3">
                    {message.suggestions.map((suggestion, index) => (
                      <button
                        key={index}
                        onClick={() => handleSuggestion(suggestion)}
                        className="px-3 py-1.5 bg-slate-800 hover:bg-slate-700 text-slate-300 text-sm rounded-full transition-colors border border-slate-700"
                      >
                        {suggestion}
                      </button>
                    ))}
                  </div>
                )}
              </div>
            </motion.div>
          ))}
        </AnimatePresence>

        {/* 輸入中指示器 */}
        {isTyping && (
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            className="flex gap-4"
          >
            <div className="w-10 h-10 rounded-full bg-brand-accent/20 flex items-center justify-center">
              <Bot className="w-5 h-5 text-brand-accent" />
            </div>
            <div className="bg-slate-800 px-4 py-3 rounded-2xl flex items-center gap-2">
              <span className="text-slate-400">小迪正在思考</span>
              <div className="flex gap-1">
                <motion.span
                  animate={{ opacity: [0, 1, 0] }}
                  transition={{ duration: 1, repeat: Infinity, delay: 0 }}
                  className="w-1.5 h-1.5 bg-brand-accent rounded-full"
                />
                <motion.span
                  animate={{ opacity: [0, 1, 0] }}
                  transition={{ duration: 1, repeat: Infinity, delay: 0.2 }}
                  className="w-1.5 h-1.5 bg-brand-accent rounded-full"
                />
                <motion.span
                  animate={{ opacity: [0, 1, 0] }}
                  transition={{ duration: 1, repeat: Infinity, delay: 0.4 }}
                  className="w-1.5 h-1.5 bg-brand-accent rounded-full"
                />
              </div>
            </div>
          </motion.div>
        )}

        <div ref={messagesEndRef} />
      </div>

      {/* 快捷動作區 */}
      <div className="px-6 py-3 border-t border-slate-800">
        <div className="flex gap-2 overflow-x-auto pb-2">
          {quickActions.map((action, index) => (
            <button
              key={index}
              onClick={action.action}
              className="flex items-center gap-2 px-4 py-2 bg-slate-800 hover:bg-slate-700 text-slate-300 rounded-full text-sm transition-colors whitespace-nowrap"
            >
              <action.icon className="w-4 h-4" />
              {action.label}
            </button>
          ))}
        </div>
      </div>

      {/* 輸入區 */}
      <div className="p-6 pt-0">
        <div className="flex gap-3">
          <div className="flex-1 relative">
            <input
              type="text"
              value={input}
              onChange={(e) => setInput(e.target.value)}
              onKeyDown={(e) => e.key === 'Enter' && handleSend()}
              placeholder="問小迪任何問題⋯（例如：什麼是純函式？）"
              className="w-full px-4 py-3 bg-slate-800 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:outline-none focus:border-brand-primary transition-colors"
            />
            <Sparkles className="absolute right-4 top-1/2 -translate-y-1/2 w-5 h-5 text-brand-accent" />
          </div>
          <button
            onClick={() => handleSend()}
            disabled={!input.trim() || isTyping}
            className="px-6 py-3 bg-brand-primary text-white rounded-xl hover:bg-blue-600 transition-colors disabled:opacity-50 disabled:cursor-not-allowed flex items-center gap-2"
          >
            <Send className="w-4 h-4" />
            發送
          </button>
        </div>
        <p className="text-xs text-slate-500 mt-2 text-center">
          小迪可以解釋程式概念、查看進度、給學習建議
        </p>
      </div>
    </div>
  )
}

export default NPCChat
