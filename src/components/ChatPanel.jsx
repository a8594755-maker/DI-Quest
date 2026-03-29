import { useState, useRef, useEffect, useCallback } from 'react'
import { Send, Bot, User, X, Plus, Clock, ChevronLeft, Trash2, ThumbsUp, ThumbsDown, Lock, Crown, Copy, Check } from 'lucide-react'
import { motion, AnimatePresence } from 'framer-motion'
import ReactMarkdown from 'react-markdown'
import remarkGfm from 'remark-gfm'
import { useLocation } from 'react-router-dom'
import { useTranslation } from 'react-i18next'
import { useQuest } from '../contexts/QuestContext'
import { useAuth } from '../contexts/AuthContext'
import { useApiUsage } from '../hooks/useApiUsage'
import { useChatSync } from '../hooks/useChatSync'
import { WORLDS, getWorld, getQuest, getChallenge } from '../data/questData'
import { getWorldLesson } from '../data/lessons'
import { chatWithDeepSeek } from '../utils/deepseek'

function generateTitle(messages) {
  const firstUser = messages.find(m => m.role === 'user')
  if (!firstUser) return 'New Chat'
  const text = firstUser.content.slice(0, 40)
  return text.length < firstUser.content.length ? text + '...' : text
}

// ── 知識庫（從 i18n 載入） ────────────────────────────────────
const KNOWLEDGE_TOPICS = ['kpi', 'funnel', 'segmentation', 'retention', 'cohort', 'sql', 'ab_testing']

const KEYWORD_MAP = [
  { keywords: ['kpi', '指標', 'leading', 'lagging', 'guardrail', 'north star', 'metric', '衡量'], topic: 'kpi' },
  { keywords: ['funnel', '漏斗', 'drop-off', 'conversion', '轉換率'], topic: 'funnel' },
  { keywords: ['segmentation', '分群', '分段', 'segment'], topic: 'segmentation' },
  { keywords: ['retention', '留存', '回訪', '流失'], topic: 'retention' },
  { keywords: ['cohort', '世代'], topic: 'cohort' },
  { keywords: ['sql', 'join', 'group by', '查詢', 'query'], topic: 'sql' },
  { keywords: ['a/b test', 'ab test', '實驗', 'experiment'], topic: 'ab_testing' },
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
function usePageContext(pathname, t) {
  const parts = pathname.split('/')
  if (parts.includes('lesson')) {
    const worldId = parts[parts.indexOf('lesson') + 1]
    const world = getWorld(worldId)
    return { type: 'lesson', worldId, world, description: t('chat:pageContext.reading', { name: `${world?.emoji || ''} ${world?.name || `World ${worldId}`}` }) }
  }
  if (parts.includes('case')) {
    const idx = parts.indexOf('case')
    const worldId = parts[idx + 1]
    const questId = parts[idx + 2]
    const challengeId = parts[idx + 3]
    const world = getWorld(worldId)
    const quest = getQuest(questId)
    const challenge = getChallenge(questId, challengeId)
    return { type: 'challenge', worldId, questId, challengeId, world, quest, challenge, description: t('chat:pageContext.doing', { worldEmoji: world?.emoji || '', questName: quest?.name || '', challengeName: challenge?.name || '' }) }
  }
  if (parts.includes('quest')) {
    const idx = parts.indexOf('quest')
    const worldId = parts[idx + 1]
    const questId = parts[idx + 2]
    const world = getWorld(worldId)
    const quest = getQuest(questId)
    return { type: 'quest-detail', worldId, questId, world, quest, description: t('chat:pageContext.viewing', { questName: quest?.name || '' }) }
  }
  if (parts.includes('map')) return { type: 'map', description: t('chat:pageContext.map') }
  if (parts.includes('progress')) return { type: 'progress', description: t('chat:pageContext.progress') }
  if (parts.includes('review')) return { type: 'review', description: t('chat:pageContext.review') }
  return { type: 'other', description: '' }
}

// ── 相對時間 ──────────────────────────────────────────────
function useRelativeDate() {
  const { t, i18n } = useTranslation('chat')
  return (ts) => {
    const diff = Date.now() - ts
    const mins = Math.floor(diff / 60000)
    if (mins < 1) return t('time.justNow')
    if (mins < 60) return t('time.minutesAgo', { count: mins })
    const hours = Math.floor(mins / 60)
    if (hours < 24) return t('time.hoursAgo', { count: hours })
    const days = Math.floor(hours / 24)
    if (days < 7) return t('time.daysAgo', { count: days })
    return new Date(ts).toLocaleDateString(i18n.language === 'en' ? 'en-US' : 'zh-TW', { month: 'short', day: 'numeric' })
  }
}

// ── Code block with copy button ─────────────────────────────
function CodeBlock({ children, ...props }) {
  const [copied, setCopied] = useState(false)

  const extractText = (node) => {
    if (typeof node === 'string') return node
    if (!node) return ''
    if (node.props?.children) {
      return Array.isArray(node.props.children)
        ? node.props.children.map(extractText).join('')
        : extractText(node.props.children)
    }
    return ''
  }

  const code = extractText(children).replace(/\n$/, '')

  const handleCopy = async () => {
    await navigator.clipboard.writeText(code)
    setCopied(true)
    setTimeout(() => setCopied(false), 1500)
  }

  return (
    <div className="relative group">
      <button
        onClick={handleCopy}
        className="absolute top-1.5 right-1.5 p-1 rounded bg-slate-700/80 text-slate-400 hover:text-white opacity-0 group-hover:opacity-100 transition-opacity"
        title="Copy code"
      >
        {copied ? <Check className="w-3.5 h-3.5 text-emerald-400" /> : <Copy className="w-3.5 h-3.5" />}
      </button>
      <pre {...props}>{children}</pre>
    </div>
  )
}

// ── 主元件 ──────────────────────────────────────────────────
function ChatPanel({ isOpen, onClose, selectedText, onClearSelection, mode = 'sidebar' }) {
  const { t } = useTranslation('chat')
  const { questStatus, challengeStatus, totalXp, levelInfo } = useQuest()
  const { isAuthenticated, isGuest } = useAuth()
  const { remaining, dailyLimit, canUseApi, isPremium, incrementUsage } = useApiUsage()
  const location = useLocation()
  const getRelativeDate = useRelativeDate()

  const pageContext = usePageContext(location.pathname, t)

  // 歷史對話 (cloud + localStorage sync)
  const { sessions: chatSessions, updateSession: setChatSessions, deleteSession: cloudDeleteSession } = useChatSync()
  const [activeSessionId, setActiveSessionId] = useState(null)
  const [showHistory, setShowHistory] = useState(false)

  const [messages, setMessages] = useState([])
  const [input, setInput] = useState('')
  const [isTyping, setIsTyping] = useState(false)
  const [feedback, setFeedback] = useState({}) // { [msgId]: 'up' | 'down' }
  const messagesEndRef = useRef(null)
  const inputRef = useRef(null)
  const isComposingRef = useRef(false)

  useEffect(() => {
    if (isOpen && !activeSessionId) {
      const welcomeMsg = {
        id: 1,
        role: 'assistant',
        content: t('panel.welcome', { context: pageContext.description || t('pageContext.learning') }),
      }
      setMessages([welcomeMsg])
      setShowHistory(false)
    }
  }, [isOpen])

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

  useEffect(() => {
    const hasUserMsg = messages.some(m => m.role === 'user')
    if (!hasUserMsg) return

    if (!activeSessionId) {
      const newId = Date.now().toString()
      setActiveSessionId(newId)
      const newSession = {
        id: newId,
        title: generateTitle(messages),
        messages,
        createdAt: Date.now(),
        updatedAt: Date.now(),
      }
      setChatSessions(prev => [newSession, ...prev])
    } else {
      setChatSessions(prev =>
        prev.map(s =>
          s.id === activeSessionId
            ? { ...s, messages, title: generateTitle(messages), updatedAt: Date.now() }
            : s
        )
      )
    }
  }, [messages])

  function startNewChat() {
    const welcomeMsg = {
      id: 1,
      role: 'assistant',
      content: `嗨！我是小迪 🤖\n\n我知道你${pageContext.description || t('pageContext.learning')}。\n\n你可以：\n• 選取頁面上的文字，問我相關問題\n• 直接問分析概念\n• 問我當前題目或講義的內容\n\n有什麼想問的？`,
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
    cloudDeleteSession(sessionId)
    if (activeSessionId === sessionId) {
      setActiveSessionId(null)
      setMessages([])
    }
  }

  const buildSystemPrompt = useCallback(() => {
    let prompt = t('panel.systemPrompt', { level: levelInfo.level, title: levelInfo.title, xp: totalXp })

    const worldId = pageContext.worldId
    const lessonContent = worldId ? getWorldLesson(Number(worldId)) : null
    const noLesson = t('panel.noLessonData')

    if (pageContext.type === 'lesson') {
      prompt += t('panel.systemPromptLesson', {
        worldName: pageContext.world?.name || '',
        lessonContent: lessonContent || noLesson,
      })
    } else if (pageContext.type === 'challenge') {
      const c = pageContext.challenge
      prompt += t('panel.systemPromptChallenge', {
        worldName: pageContext.world?.name || '',
        questName: pageContext.quest?.name || '',
        challengeName: c?.name || '',
        challengeType: c?.type || '',
        difficulty: c?.difficulty || '',
        scenarioTitle: c?.scenario?.title || '',
        scenarioNarrative: c?.scenario?.narrative || '',
        question: c?.question || c?.prompt || '',
        options: c?.options?.map(o => `${o.id}. ${o.text}`).join('\n') || '',
        lessonContent: lessonContent || noLesson,
      })
    } else if (pageContext.type === 'quest-detail') {
      prompt += t('panel.systemPromptQuestDetail', {
        questName: pageContext.quest?.name || '',
        lessonContent: lessonContent || noLesson,
      })
    }

    return prompt
  }, [levelInfo, totalXp, pageContext, t])

  const generateLocalResponse = (userInput) => {
    const lower = userInput.toLowerCase()
    if (lower.includes('進度') || lower.includes('等級') || lower.includes('xp') || lower.includes('progress')) {
      const completedQuests = Object.values(questStatus).filter(q => q.completed).length
      const completedChallenges = Object.values(challengeStatus).filter(c => c.completed).length
      return t('panel.progressResponse', { level: levelInfo.level, title: levelInfo.title, xp: totalXp, quests: completedQuests, challenges: completedChallenges })
    }
    const topic = findTopic(userInput)
    if (topic && KNOWLEDGE_TOPICS.includes(topic)) return t(`knowledge.${topic}`)
    return null
  }

  const handleSend = async (text) => {
    const messageText = text || input
    if (!messageText.trim()) return

    const contextPrefix = selectedText ? t('panel.contextPrefix', { text: selectedText.slice(0, 200) }) : ''
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
        // Check rate limit for non-premium users
        if (!isAuthenticated) {
          setMessages(prev => [...prev, { id: Date.now() + 1, role: 'assistant', content: t('panel.guestBlocked', 'Please sign in to use the AI assistant.') }])
          setIsTyping(false)
          return
        }
        if (!canUseApi) {
          setMessages(prev => [...prev, { id: Date.now() + 1, role: 'assistant', content: t('panel.rateLimited', 'You have reached today\'s limit ({{limit}} calls/day). Upgrade to Premium for unlimited access!', { limit: dailyLimit }) }])
          setIsTyping(false)
          return
        }
        // Increment usage before calling
        const allowed = await incrementUsage()
        if (!allowed) {
          setMessages(prev => [...prev, { id: Date.now() + 1, role: 'assistant', content: t('panel.rateLimited', 'You have reached today\'s limit ({{limit}} calls/day). Upgrade to Premium for unlimited access!', { limit: dailyLimit }) }])
          setIsTyping(false)
          return
        }

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
        content: t('panel.aiError'),
      }])
    } finally {
      setIsTyping(false)
    }
  }

  if (!isOpen) return null

  const isOverlay = mode === 'overlay'

  const panelContent = (
    <>
      {/* 標題列 */}
      <div className="flex items-center justify-between px-3 py-2.5 border-b border-slate-700">
        {showHistory ? (
          <div className="flex items-center gap-2">
            <button onClick={() => setShowHistory(false)} className="p-1 text-slate-400 hover:text-white transition-colors">
              <ChevronLeft className="w-4 h-4" />
            </button>
            <span className="text-white text-sm font-medium">{t('panel.history')}</span>
          </div>
        ) : (
          <div className="flex items-center gap-2 min-w-0">
            <div className="w-7 h-7 rounded-full bg-brand-accent/20 flex items-center justify-center flex-shrink-0">
              <Bot className="w-4 h-4 text-brand-accent" />
            </div>
            <div className="min-w-0">
              <span className="text-white text-sm font-medium">{t('panel.xiaoDi')}</span>
              {pageContext.description && (
                <p className="text-slate-500 text-[10px] leading-tight truncate">{pageContext.description}</p>
              )}
            </div>
          </div>
        )}
        <div className="flex items-center gap-0.5 flex-shrink-0">
          {!showHistory && isAuthenticated && (
            <>
              {isPremium ? (
                <span className="flex items-center gap-1 px-2 py-0.5 text-[10px] text-amber-400 bg-amber-500/10 rounded-full mr-1">
                  <Crown className="w-3 h-3" /> Premium
                </span>
              ) : (
                <span className={`px-2 py-0.5 text-[10px] rounded-full mr-1 ${remaining <= 5 ? 'text-red-400 bg-red-500/10' : 'text-slate-400 bg-slate-800'}`}>
                  {remaining}/{dailyLimit}
                </span>
              )}
              <button onClick={() => setShowHistory(true)} className="p-1.5 text-slate-500 hover:text-white transition-colors rounded" title={t('panel.history')}>
                <Clock className="w-4 h-4" />
              </button>
              <button onClick={startNewChat} className="p-1.5 text-slate-500 hover:text-white transition-colors rounded" title={t('panel.newChat')}>
                <Plus className="w-4 h-4" />
              </button>
            </>
          )}
          <button onClick={onClose} className="p-1.5 text-slate-500 hover:text-white transition-colors rounded" title={t('panel.close')}>
            <X className="w-4 h-4" />
          </button>
        </div>
      </div>

      {showHistory ? (
        <div className="flex-1 overflow-y-auto">
          {chatSessions.length === 0 ? (
            <p className="text-slate-500 text-sm text-center py-12">{t('panel.noHistory')}</p>
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
                      {getRelativeDate(session.updatedAt)} · {t('panel.messageCount', { count: session.messages.filter(m => m.role === 'user').length })}
                    </p>
                  </div>
                  <button
                    onClick={(e) => deleteSession(session.id, e)}
                    className="p-1 text-slate-600 hover:text-red-400 opacity-0 group-hover:opacity-100 transition-all flex-shrink-0"
                    title={t('panel.delete')}
                  >
                    <Trash2 className="w-3.5 h-3.5" />
                  </button>
                </button>
              ))}
            </div>
          )}
        </div>
      ) : (
        <>
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
                          <ReactMarkdown remarkPlugins={[remarkGfm]} components={{ pre: CodeBlock }}>{msg.content}</ReactMarkdown>
                        </div>
                      )}
                    </div>
                    {/* Feedback buttons for AI responses (skip welcome message) */}
                    {msg.role === 'assistant' && msg.id !== 1 && (
                      <div className="flex items-center gap-1 mt-1">
                        <button
                          onClick={() => setFeedback(prev => ({ ...prev, [msg.id]: prev[msg.id] === 'up' ? null : 'up' }))}
                          className={`p-1 rounded transition-colors ${
                            feedback[msg.id] === 'up' ? 'text-brand-primary' : 'text-slate-600 hover:text-slate-400'
                          }`}
                          aria-label={t('panel.helpful', 'Helpful')}
                        >
                          <ThumbsUp className="w-3 h-3" />
                        </button>
                        <button
                          onClick={() => setFeedback(prev => ({ ...prev, [msg.id]: prev[msg.id] === 'down' ? null : 'down' }))}
                          className={`p-1 rounded transition-colors ${
                            feedback[msg.id] === 'down' ? 'text-red-400' : 'text-slate-600 hover:text-slate-400'
                          }`}
                          aria-label={t('panel.notHelpful', 'Not helpful')}
                        >
                          <ThumbsDown className="w-3 h-3" />
                        </button>
                      </div>
                    )}
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
                  <span className="text-slate-400 text-xs">{t('panel.thinking')}</span>
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

          {messages.length <= 1 && (
            <div className="px-3 pb-2 flex flex-wrap gap-1.5">
              {pageContext.type === 'challenge' && (
                <>
                  <QuickBtn text={t('panel.quickChallenge1')} onClick={handleSend} />
                  <QuickBtn text={t('panel.quickChallenge2')} onClick={handleSend} />
                  <QuickBtn text={t('panel.quickChallenge3')} onClick={handleSend} />
                </>
              )}
              {pageContext.type === 'lesson' && (
                <>
                  <QuickBtn text={t('panel.quickLesson1')} onClick={handleSend} />
                  <QuickBtn text={t('panel.quickLesson2')} onClick={handleSend} />
                </>
              )}
              <QuickBtn text={t('panel.quickFunnel')} onClick={handleSend} />
              <QuickBtn text={t('panel.quickProgress')} onClick={handleSend} />
            </div>
          )}

          <div className="px-3 pb-3">
            {!isAuthenticated ? (
              <div className="flex items-center gap-2 p-3 bg-slate-800/50 rounded-xl text-center">
                <Lock className="w-4 h-4 text-slate-500 flex-shrink-0" />
                <p className="text-slate-400 text-xs">{t('panel.guestBlocked', 'Please sign in to use the AI assistant.')}</p>
              </div>
            ) : (
              <>
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
                    placeholder={!canUseApi && !isPremium ? t('panel.rateLimitedPlaceholder', 'Daily limit reached') : selectedText ? t('panel.askSelectedPlaceholder') : t('panel.askPlaceholder')}
                    className="flex-1 px-3 py-2.5 bg-slate-800 border border-slate-700 rounded-lg text-white text-sm placeholder-slate-500 focus:outline-none focus:border-brand-primary transition-colors resize-none overflow-y-auto"
                    style={{ maxHeight: '120px' }}
                    disabled={!canUseApi && !isPremium}
                  />
                  <button
                    onClick={() => handleSend()}
                    disabled={!input.trim() || isTyping || (!canUseApi && !isPremium)}
                    className="px-3 py-2.5 bg-brand-primary text-white rounded-lg hover:bg-blue-600 transition-colors disabled:opacity-50"
                  >
                    <Send className="w-4 h-4" />
                  </button>
                </div>
              </>
            )}
          </div>
        </>
      )}
    </>
  )

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

  return (
    <>
      {/* Mobile overlay backdrop */}
      <div className="fixed inset-0 bg-black/50 backdrop-blur-sm z-[54] md:hidden" onClick={onClose} />
      <div className="fixed inset-y-0 right-0 z-[55] w-full max-w-[380px] md:relative md:inset-auto md:z-auto flex flex-col bg-slate-900 border-l border-slate-700 flex-shrink-0 md:w-[380px] min-h-0 overflow-hidden">
        {panelContent}
      </div>
    </>
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
