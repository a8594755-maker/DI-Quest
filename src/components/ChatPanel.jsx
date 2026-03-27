import { useState, useRef, useEffect, useCallback } from 'react'
import { Send, Bot, User, X, Plus, Clock, ChevronLeft, Trash2 } from 'lucide-react'
import { motion, AnimatePresence } from 'framer-motion'
import ReactMarkdown from 'react-markdown'
import remarkGfm from 'remark-gfm'
import { useLocation } from 'react-router-dom'
import { useQuest } from '../contexts/QuestContext'
import { WORLDS, getWorld, getQuest, getChallenge } from '../data/questData'
import { getWorldLesson } from '../data/lessons'
import { chatWithDeepSeek } from '../utils/deepseek'

// ── localStorage 聊天紀錄 ───────────────────────────────────
const CHAT_STORAGE_KEY = 'di-quest-chat-history'

function loadChatHistory() {
  try {
    const raw = localStorage.getItem(CHAT_STORAGE_KEY)
    return raw ? JSON.parse(raw) : []
  } catch { return [] }
}

function saveChatHistory(sessions) {
  try {
    // 只保留最近 30 筆
    localStorage.setItem(CHAT_STORAGE_KEY, JSON.stringify(sessions.slice(0, 30)))
  } catch {}
}

function generateTitle(messages) {
  const firstUser = messages.find(m => m.role === 'user')
  if (!firstUser) return '新對話'
  const text = firstUser.content.slice(0, 40)
  return text.length < firstUser.content.length ? text + '...' : text
}

function getRelativeDate(ts) {
  const diff = Date.now() - ts
  const mins = Math.floor(diff / 60000)
  if (mins < 1) return '剛剛'
  if (mins < 60) return `${mins} 分鐘前`
  const hours = Math.floor(mins / 60)
  if (hours < 24) return `${hours} 小時前`
  const days = Math.floor(hours / 24)
  if (days < 7) return `${days} 天前`
  return new Date(ts).toLocaleDateString('zh-TW', { month: 'short', day: 'numeric' })
}

// ── 知識庫 ──────────────────────────────────────────────────
const KNOWLEDGE = {
  'kpi': { content: 'KPI（Key Performance Indicator）是衡量業務表現的關鍵指標：\n\n面試中常見概念：\n• **Leading Indicator** — 預測未來的指標\n• **Lagging Indicator** — 結果指標\n• **Guardrail Metric** — 確保改善一個指標時不傷害其他面向\n\n面試技巧：提到 KPI 時永遠要說清楚「對誰而言」和「為什麼這個指標重要」。' },
  'funnel': { content: 'Funnel Analysis（漏斗分析）是拆解使用者旅程的核心方法：\n\n典型電商漏斗：\n瀏覽 → 加入購物車 → 開始結帳 → 完成付款\n\n分析重點：\n1. 找到最大的 drop-off\n2. 按 segment 切開看\n3. 看趨勢變化' },
  'segmentation': { content: 'Segmentation（分群）把使用者按特徵分組分析：\n\n常見切分維度：行為、人口統計、來源、時間\n\n為什麼重要？總體數據可能隱藏真相。例：整體 retention 持平，但新用戶 retention 大幅下降，只是被老用戶稀釋了。' },
  'retention': { content: 'Retention（留存率）衡量用戶是否持續回來使用產品：\n\n• D1 / D7 / D30 — 第 1/7/30 天還有多少人回來\n• 如果 retention curve 趨於平穩，代表有核心用戶\n• 如果一路往下掉到 0，代表沒有 product-market fit' },
  'cohort': { content: 'Cohort Analysis（世代分析）把用戶按「加入時間」分組追蹤：\n\n例：1月 cohort D7=40%, 2月=35%, 3月=28%\n→ 新用戶留存在惡化！但整體 DAU 可能因用戶基數增長看起來正常。' },
  'sql': { content: '面試中的 SQL 思維：\n\n回答架構：\n1. 需要哪些 table？\n2. 怎麼 JOIN？\n3. 怎麼 filter（WHERE）？\n4. 怎麼 aggregate（GROUP BY）？' },
  'ab testing': { content: 'A/B Testing 基本架構：\n1. 假設：改變 X 會讓 Y 提升\n2. 對照組 vs 實驗組：隨機分配\n3. 衡量指標：primary + guardrail metrics\n4. 樣本量和時間' },
}

const KEYWORD_MAP = [
  { keywords: ['kpi', '指標', 'leading', 'lagging', 'guardrail', 'north star', 'metric', '衡量'], topic: 'kpi' },
  { keywords: ['funnel', '漏斗', 'drop-off', 'conversion', '轉換率'], topic: 'funnel' },
  { keywords: ['segmentation', '分群', '分段', 'segment'], topic: 'segmentation' },
  { keywords: ['retention', '留存', '回訪', '流失'], topic: 'retention' },
  { keywords: ['cohort', '世代'], topic: 'cohort' },
  { keywords: ['sql', 'join', 'group by', '查詢', 'query'], topic: 'sql' },
  { keywords: ['a/b test', 'ab test', '實驗', 'experiment'], topic: 'ab testing' },
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

// ── 取得頁面上下文 ──────────────────────────────────────────
function getPageContext(pathname) {
  const parts = pathname.split('/')
  if (parts.includes('lesson')) {
    const worldId = parts[parts.indexOf('lesson') + 1]
    const world = getWorld(worldId)
    return { type: 'lesson', worldId, world, description: `正在閱讀 ${world?.emoji || ''} ${world?.name || `World ${worldId}`} 的講義` }
  }
  if (parts.includes('case')) {
    const idx = parts.indexOf('case')
    const worldId = parts[idx + 1]
    const questId = parts[idx + 2]
    const challengeId = parts[idx + 3]
    const world = getWorld(worldId)
    const quest = getQuest(questId)
    const challenge = getChallenge(questId, challengeId)
    return { type: 'challenge', worldId, questId, challengeId, world, quest, challenge, description: `正在做 ${world?.emoji || ''} ${quest?.name || ''} — ${challenge?.name || ''}` }
  }
  if (parts.includes('quest')) {
    const idx = parts.indexOf('quest')
    const worldId = parts[idx + 1]
    const questId = parts[idx + 2]
    const world = getWorld(worldId)
    const quest = getQuest(questId)
    return { type: 'quest-detail', worldId, questId, world, quest, description: `正在查看 ${quest?.name || ''}` }
  }
  if (parts.includes('map')) return { type: 'map', description: '正在關卡地圖' }
  if (parts.includes('progress')) return { type: 'progress', description: '正在進度儀表板' }
  if (parts.includes('review')) return { type: 'review', description: '正在複習佇列' }
  return { type: 'other', description: '' }
}

// ── 主元件 ──────────────────────────────────────────────────
function ChatPanel({ isOpen, onClose, selectedText, onClearSelection, mode = 'sidebar' }) {
  const { questStatus, challengeStatus, totalXp, levelInfo } = useQuest()
  const location = useLocation()

  // 歷史對話（過濾掉沒有使用者訊息的空 session）
  const [chatSessions, setChatSessions] = useState(() => {
    const all = loadChatHistory()
    const valid = all.filter(s => s.messages?.some(m => m.role === 'user'))
    if (valid.length !== all.length) saveChatHistory(valid)
    return valid
  })
  const [activeSessionId, setActiveSessionId] = useState(null)
  const [showHistory, setShowHistory] = useState(false)

  // 當前對話
  const [messages, setMessages] = useState([])
  const [input, setInput] = useState('')
  const [isTyping, setIsTyping] = useState(false)
  const messagesEndRef = useRef(null)
  const inputRef = useRef(null)
  const isComposingRef = useRef(false)

  const pageContext = getPageContext(location.pathname)

  // 開啟面板時：顯示歡迎訊息（不建立 session，等使用者發訊息才存）
  useEffect(() => {
    if (isOpen && !activeSessionId) {
      const welcomeMsg = {
        id: 1,
        role: 'assistant',
        content: `嗨！我是小迪 🤖\n\n我知道你${pageContext.description || '在學習'}。\n\n你可以：\n• 選取頁面上的文字，問我相關問題\n• 直接問分析概念\n• 問我當前題目或講義的內容\n\n有什麼想問的？`,
      }
      setMessages([welcomeMsg])
      setShowHistory(false)
    }
  }, [isOpen])

  // 選取文字時 focus 輸入框（文字顯示為引用區塊，不塞進 input）
  useEffect(() => {
    if (selectedText && isOpen) {
      setShowHistory(false)
      inputRef.current?.focus()
    }
  }, [selectedText])

  const scrollToBottom = () => {
    messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' })
  }
  useEffect(() => { scrollToBottom() }, [messages])

  // 持久化：有使用者訊息後才存到 localStorage
  useEffect(() => {
    const hasUserMsg = messages.some(m => m.role === 'user')
    if (!hasUserMsg) return

    if (!activeSessionId) {
      // 第一次發訊息 → 建立新 session
      const newId = Date.now().toString()
      setActiveSessionId(newId)
      const newSession = {
        id: newId,
        title: generateTitle(messages),
        messages,
        createdAt: Date.now(),
        updatedAt: Date.now(),
      }
      setChatSessions(prev => {
        const updated = [newSession, ...prev]
        saveChatHistory(updated)
        return updated
      })
    } else {
      // 更新既有 session
      setChatSessions(prev => {
        const updated = prev.map(s =>
          s.id === activeSessionId
            ? { ...s, messages, title: generateTitle(messages), updatedAt: Date.now() }
            : s
        )
        saveChatHistory(updated)
        return updated
      })
    }
  }, [messages])

  function startNewChat() {
    const welcomeMsg = {
      id: 1,
      role: 'assistant',
      content: `嗨！我是小迪 🤖\n\n我知道你${pageContext.description || '在學習'}。\n\n你可以：\n• 選取頁面上的文字，問我相關問題\n• 直接問分析概念\n• 問我當前題目或講義的內容\n\n有什麼想問的？`,
    }
    setActiveSessionId(null)
    setMessages([welcomeMsg])
    setShowHistory(false)
  }

  function switchToSession(session) {
    setActiveSessionId(session.id)
    setMessages(session.messages)
    setShowHistory(false)
  }

  function deleteSession(sessionId, e) {
    e.stopPropagation()
    setChatSessions(prev => {
      const updated = prev.filter(s => s.id !== sessionId)
      saveChatHistory(updated)
      return updated
    })
    if (activeSessionId === sessionId) {
      setActiveSessionId(null)
      setMessages([])
    }
  }

  const buildSystemPrompt = useCallback(() => {
    let prompt = `你是「小迪」，DI Quest 面試練習平台的 AI 教練。用繁體中文回答。
你的任務是幫助使用者準備商業 Case Study 面試（PM、BA、Product Analyst 等角色）。
回答要簡潔有架構，用真實商業情境舉例。保持在 300 字以內。

使用者目前等級：Lv.${levelInfo.level} ${levelInfo.title}，共 ${totalXp} XP。`

    // 取得當前頁面對應的講義內容
    const worldId = pageContext.worldId
    const lessonContent = worldId ? getWorldLesson(Number(worldId)) : null

    if (pageContext.type === 'lesson') {
      prompt += `\n\n使用者正在閱讀 ${pageContext.world?.name || ''} 的講義。
根據以下講義內容回答使用者的問題。引用講義中的具體概念、框架、範例來回答。

===== 講義內容 =====
${lessonContent || '（無講義資料）'}
===== 講義結束 =====`
    } else if (pageContext.type === 'challenge') {
      const c = pageContext.challenge
      prompt += `\n\n使用者正在做題：
世界：${pageContext.world?.name || ''}
關卡：${pageContext.quest?.name || ''}
題目：${c?.name || ''}
題型：${c?.type || ''}
難度：${c?.difficulty || ''}
情境：${c?.scenario?.title || ''} — ${c?.scenario?.narrative || ''}
問題：${c?.question || c?.prompt || ''}
選項：${c?.options?.map(o => `${o.id}. ${o.text}`).join('\n') || ''}

不要直接給答案！引導使用者思考，給提示和思路方向。如果使用者明確要求解答或已經回答完，才可以詳細解釋。

以下是這個世界的完整講義，用來提供背景知識和理論依據：

===== 講義內容 =====
${lessonContent || '（無講義資料）'}
===== 講義結束 =====`
    } else if (pageContext.type === 'quest-detail') {
      prompt += `\n\n使用者正在查看關卡 ${pageContext.quest?.name || ''} 的詳情。

以下是這個世界的講義，可供參考：

===== 講義內容 =====
${lessonContent || '（無講義資料）'}
===== 講義結束 =====`
    }

    return prompt
  }, [levelInfo, totalXp, pageContext])

  const generateLocalResponse = (userInput) => {
    const lower = userInput.toLowerCase()
    if (lower.includes('進度') || lower.includes('等級') || lower.includes('xp')) {
      const completedQuests = Object.values(questStatus).filter(q => q.completed).length
      const completedChallenges = Object.values(challengeStatus).filter(c => c.completed).length
      return `你的進度：Lv.${levelInfo.level} ${levelInfo.title}，${totalXp} XP\n完成關卡：${completedQuests}，完成挑戰：${completedChallenges}`
    }
    const topic = findTopic(userInput)
    if (topic && KNOWLEDGE[topic]) return KNOWLEDGE[topic].content
    return null
  }

  const handleSend = async (text) => {
    const messageText = text || input
    if (!messageText.trim()) return

    // 如果有選取文字，附加為上下文（送給 AI 時帶入，顯示時只顯示使用者的問題）
    const contextPrefix = selectedText ? `關於「${selectedText.slice(0, 200)}」，` : ''
    const displayText = messageText
    const fullText = contextPrefix + messageText

    const userMsg = { id: Date.now(), role: 'user', content: displayText }
    setMessages(prev => [...prev, userMsg])
    setInput('')
    if (onClearSelection) onClearSelection()
    setIsTyping(true)

    try {
      const localReply = generateLocalResponse(fullText)
      if (localReply) {
        await new Promise(r => setTimeout(r, 400))
        setMessages(prev => [...prev, { id: Date.now() + 1, role: 'assistant', content: localReply }])
      } else {
        const aiMessages = [
          { role: 'system', content: buildSystemPrompt() },
          ...messages.slice(-8).map(m => ({ role: m.role, content: m.content })),
          { role: 'user', content: fullText },
        ]
        const aiReply = await chatWithDeepSeek(aiMessages)
        setMessages(prev => [...prev, { id: Date.now() + 1, role: 'assistant', content: aiReply }])
      }
    } catch (err) {
      console.error('Chat error:', err)
      setMessages(prev => [...prev, {
        id: Date.now() + 1, role: 'assistant',
        content: '抱歉，AI 服務暫時無法連接。你可以問我特定概念（如：什麼是 funnel？什麼是 cohort？）',
      }])
    } finally {
      setIsTyping(false)
    }
  }

  if (!isOpen) return null

  const isOverlay = mode === 'overlay'

  // ── 共用面板內容 ──
  const panelContent = (
    <>
      {/* 標題列 */}
      <div className="flex items-center justify-between px-3 py-2.5 border-b border-slate-700">
        {showHistory ? (
          <div className="flex items-center gap-2">
            <button onClick={() => setShowHistory(false)} className="p-1 text-slate-400 hover:text-white transition-colors">
              <ChevronLeft className="w-4 h-4" />
            </button>
            <span className="text-white text-sm font-medium">歷史對話</span>
          </div>
        ) : (
          <div className="flex items-center gap-2 min-w-0">
            <div className="w-7 h-7 rounded-full bg-brand-accent/20 flex items-center justify-center flex-shrink-0">
              <Bot className="w-4 h-4 text-brand-accent" />
            </div>
            <div className="min-w-0">
              <span className="text-white text-sm font-medium">小迪</span>
              {pageContext.description && (
                <p className="text-slate-500 text-[10px] leading-tight truncate">{pageContext.description}</p>
              )}
            </div>
          </div>
        )}
        <div className="flex items-center gap-0.5 flex-shrink-0">
          {!showHistory && (
            <>
              <button onClick={() => setShowHistory(true)} className="p-1.5 text-slate-500 hover:text-white transition-colors rounded" title="歷史對話">
                <Clock className="w-4 h-4" />
              </button>
              <button onClick={startNewChat} className="p-1.5 text-slate-500 hover:text-white transition-colors rounded" title="新對話">
                <Plus className="w-4 h-4" />
              </button>
            </>
          )}
          <button onClick={onClose} className="p-1.5 text-slate-500 hover:text-white transition-colors rounded" title="關閉">
            <X className="w-4 h-4" />
          </button>
        </div>
      </div>

      {showHistory ? (
        /* ── 歷史對話列表 ── */
        <div className="flex-1 overflow-y-auto">
          {chatSessions.length === 0 ? (
            <p className="text-slate-500 text-sm text-center py-12">還沒有歷史對話</p>
          ) : (
            <div className="py-1">
              {chatSessions.map(session => (
                <button
                  key={session.id}
                  onClick={() => switchToSession(session)}
                  className={`w-full flex items-center gap-3 px-3 py-2.5 text-left hover:bg-slate-800 transition-colors group ${
                    session.id === activeSessionId ? 'bg-slate-800/70' : ''
                  }`}
                >
                  <div className="min-w-0 flex-1">
                    <p className="text-white text-sm truncate">{session.title}</p>
                    <p className="text-slate-500 text-[11px]">
                      {getRelativeDate(session.updatedAt)} · {session.messages.filter(m => m.role === 'user').length} 則訊息
                    </p>
                  </div>
                  <button
                    onClick={(e) => deleteSession(session.id, e)}
                    className="p-1 text-slate-600 hover:text-red-400 opacity-0 group-hover:opacity-100 transition-all flex-shrink-0"
                    title="刪除"
                  >
                    <Trash2 className="w-3.5 h-3.5" />
                  </button>
                </button>
              ))}
            </div>
          )}
        </div>
      ) : (
        /* ── 對話區 ── */
        <>
          {/* 訊息列表 */}
          <div className="flex-1 overflow-y-auto p-3 space-y-3">
            <AnimatePresence>
              {messages.map((msg) => (
                <motion.div
                  key={msg.id}
                  initial={{ opacity: 0, y: 10 }}
                  animate={{ opacity: 1, y: 0 }}
                  className={`flex gap-2 ${msg.role === 'user' ? 'flex-row-reverse' : ''}`}
                >
                  <div className={`w-7 h-7 rounded-full flex items-center justify-center flex-shrink-0 ${
                    msg.role === 'user' ? 'bg-brand-primary/20' : 'bg-brand-accent/20'
                  }`}>
                    {msg.role === 'user' ? <User className="w-3.5 h-3.5 text-brand-primary" /> : <Bot className="w-3.5 h-3.5 text-brand-accent" />}
                  </div>
                  <div className={`min-w-0 ${msg.role === 'user' ? 'max-w-[85%] text-right' : 'max-w-[92%]'}`}>
                    <div className={`px-3 py-2 rounded-xl text-[13px] leading-relaxed ${
                      msg.role === 'user' ? 'inline-block bg-brand-primary text-white' : 'bg-slate-800 text-slate-200'
                    }`}>
                      {msg.role === 'user' ? (
                        <p className="text-left whitespace-pre-wrap">{msg.content}</p>
                      ) : (
                        <div className="prose prose-invert prose-sm max-w-none break-words prose-p:my-1 prose-li:my-0.5 prose-headings:my-2 prose-hr:my-2 prose-ul:my-1 prose-ol:my-1 [&_pre]:overflow-x-auto [&_table]:overflow-x-auto">
                          <ReactMarkdown remarkPlugins={[remarkGfm]}>{msg.content}</ReactMarkdown>
                        </div>
                      )}
                    </div>
                  </div>
                </motion.div>
              ))}
            </AnimatePresence>

            {isTyping && (
              <div className="flex gap-2">
                <div className="w-7 h-7 rounded-full bg-brand-accent/20 flex items-center justify-center">
                  <Bot className="w-3.5 h-3.5 text-brand-accent" />
                </div>
                <div className="bg-slate-800 px-3 py-2 rounded-xl flex items-center gap-1.5">
                  <span className="text-slate-500 text-xs">思考中</span>
                  <div className="flex gap-0.5">
                    {[0, 0.2, 0.4].map((delay, i) => (
                      <motion.span key={i} animate={{ opacity: [0.3, 1, 0.3] }} transition={{ duration: 1, repeat: Infinity, delay }} className="w-1 h-1 bg-brand-accent rounded-full" />
                    ))}
                  </div>
                </div>
              </div>
            )}
            <div ref={messagesEndRef} />
          </div>

          {/* 快捷建議 */}
          {messages.length <= 1 && (
            <div className="px-3 pb-2 flex flex-wrap gap-1.5">
              {pageContext.type === 'challenge' && (
                <>
                  <QuickBtn text="這題在考什麼？" onClick={handleSend} />
                  <QuickBtn text="給我一個提示" onClick={handleSend} />
                  <QuickBtn text="解題思路" onClick={handleSend} />
                </>
              )}
              {pageContext.type === 'lesson' && (
                <>
                  <QuickBtn text="這章重點是什麼？" onClick={handleSend} />
                  <QuickBtn text="面試會怎麼考？" onClick={handleSend} />
                </>
              )}
              <QuickBtn text="什麼是 funnel？" onClick={handleSend} />
              <QuickBtn text="我的進度" onClick={handleSend} />
            </div>
          )}

          {/* 輸入區 */}
          <div className="px-3 pb-3">
            {/* 選取文字引用（ChatGPT 風格，顯示在輸入框上方） */}
            {selectedText && (
              <div className="mb-2 bg-slate-800 border border-slate-700 rounded-lg px-3 py-2 flex items-start gap-2">
                <div className="w-0.5 self-stretch bg-brand-primary rounded-full flex-shrink-0" />
                <p className="text-slate-300 text-xs leading-relaxed line-clamp-3 flex-1">
                  {selectedText.slice(0, 200)}{selectedText.length > 200 ? '...' : ''}
                </p>
                <button onClick={onClearSelection} className="text-slate-500 hover:text-white flex-shrink-0 mt-0.5">
                  <X className="w-3.5 h-3.5" />
                </button>
              </div>
            )}
            <div className="flex gap-2 items-end">
              <textarea
                ref={inputRef}
                rows={1}
                value={input}
                onChange={(e) => {
                  setInput(e.target.value)
                  // 自動展開高度，最多 5 行
                  e.target.style.height = 'auto'
                  e.target.style.height = Math.min(e.target.scrollHeight, 120) + 'px'
                }}
                onCompositionStart={() => { isComposingRef.current = true }}
                onCompositionEnd={() => { isComposingRef.current = false }}
                onKeyDown={(e) => {
                  if (e.key === 'Enter' && !e.shiftKey && !isComposingRef.current) {
                    e.preventDefault()
                    handleSend()
                  }
                }}
                placeholder={selectedText ? '想問什麼？' : '問小迪...'}
                className="flex-1 px-3 py-2.5 bg-slate-800 border border-slate-700 rounded-lg text-white text-sm placeholder-slate-500 focus:outline-none focus:border-brand-primary transition-colors resize-none overflow-y-auto"
                style={{ maxHeight: '120px' }}
              />
              <button
                onClick={() => handleSend()}
                disabled={!input.trim() || isTyping}
                className="px-3 py-2.5 bg-brand-primary text-white rounded-lg hover:bg-blue-600 transition-colors disabled:opacity-50"
              >
                <Send className="w-4 h-4" />
              </button>
            </div>
          </div>
        </>
      )}
    </>
  )

  // ── 全螢幕覆蓋模式（主畫面：地圖/進度/複習） ──
  if (isOverlay) {
    return (
      <div className="fixed inset-0 z-[55] flex items-center justify-center" onClick={onClose}>
        <div className="absolute inset-0 bg-black/50 backdrop-blur-sm" />
        <div
          className="relative w-full max-w-lg mx-4 h-[80vh] flex flex-col bg-slate-900 border border-slate-700 rounded-2xl shadow-2xl overflow-hidden"
          onClick={(e) => e.stopPropagation()}
        >
          {panelContent}
        </div>
      </div>
    )
  }

  // ── 側邊欄模式（講義/題目頁） ──
  return (
    <div className="flex flex-col bg-slate-900 border-l border-slate-700 flex-shrink-0 w-[380px] min-h-0 overflow-hidden">
      {panelContent}
    </div>
  )
}

function QuickBtn({ text, onClick }) {
  return (
    <button
      onClick={() => onClick(text)}
      className="px-2.5 py-1 bg-slate-800 hover:bg-slate-700 text-slate-400 text-[11px] rounded-full transition-colors border border-slate-700"
    >
      {text}
    </button>
  )
}

export default ChatPanel
