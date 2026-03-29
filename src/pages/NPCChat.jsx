import { useState, useRef, useEffect } from 'react'
import { Send, Bot, User, Sparkles, BookOpen, HelpCircle, Map, BarChart3, Copy, Check } from 'lucide-react'
import { motion, AnimatePresence } from 'framer-motion'
import ReactMarkdown from 'react-markdown'
import remarkGfm from 'remark-gfm'
import { useTranslation } from 'react-i18next'
import { useQuest } from '../contexts/QuestContext'
import { WORLDS } from '../data/questData'
import { Link } from 'react-router-dom'
import { chatWithDeepSeek } from '../utils/deepseek'
import { route } from '../config/product'

// ── 知識庫主題列表 ────────────────────────────────────────
const KNOWLEDGE_TOPICS = [
  'kpi', 'metrics', 'funnel', 'segmentation', 'retention',
  'cohort', 'sql', 'dashboard', 'process', 'ab_testing',
  'recommendation', 'prioritization',
]

// ── 知識庫主題的建議按鈕映射 ──────────────────────────────
const KNOWLEDGE_SUGGESTIONS = {
  kpi: ['suggestFunnel', 'suggestGoMap'],
  metrics: ['suggestKPI', 'suggestGoMap'],
  funnel: ['suggestCohort', 'suggestGoMap'],
  segmentation: ['suggestCohort', 'suggestGoMap'],
  retention: ['suggestCohort', 'suggestKPI'],
  cohort: ['suggestProgress', 'suggestGoMap'],
  sql: ['suggestKPI', 'suggestGoMap'],
  dashboard: ['suggestKPI', 'suggestGoMap'],
  process: ['suggestGoMap'],
  ab_testing: ['suggestKPI', 'suggestGoMap'],
  recommendation: ['suggestGoMap'],
  prioritization: ['suggestKPI', 'suggestGoMap'],
}

// ── 關鍵字匹配 ────────────────────────────────────────────
const KEYWORD_MAP = [
  { keywords: ['kpi', '指標', 'leading', 'lagging', 'guardrail', 'north star'], topic: 'kpi' },
  { keywords: ['metric', '衡量', '成功指標', 'success metric'], topic: 'metrics' },
  { keywords: ['funnel', '漏斗', 'drop-off', 'conversion', '轉換率'], topic: 'funnel' },
  { keywords: ['segmentation', '分群', '分段', 'segment', '使用者分群'], topic: 'segmentation' },
  { keywords: ['retention', '留存', '回訪', '流失'], topic: 'retention' },
  { keywords: ['cohort', '世代', '世代分析'], topic: 'cohort' },
  { keywords: ['sql', 'join', 'group by', '資料庫', '查詢', 'query'], topic: 'sql' },
  { keywords: ['dashboard', '儀表板', '報表', '視覺化'], topic: 'dashboard' },
  { keywords: ['process', '流程', 'bottleneck', '瓶頸', 'process mapping'], topic: 'process' },
  { keywords: ['a/b test', 'ab test', '實驗', 'experiment', '假設驗證'], topic: 'ab_testing' },
  { keywords: ['recommendation', '建議', '改善', '行動方案'], topic: 'recommendation' },
  { keywords: ['prioritization', '優先', '排序', 'ice', 'rice', 'impact'], topic: 'prioritization' },
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

// ── 程式碼區塊（含複製按鈕） ─────────────────────────────────
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

// ── 主元件 ────────────────────────────────────────────────
function NPCChat() {
  const { t } = useTranslation('chat')
  const { questStatus, challengeStatus, totalXp, levelInfo } = useQuest()
  const [messages, setMessages] = useState([
    {
      id: 1,
      role: 'assistant',
      content: t('npc.welcome'),
      suggestions: [t('npc.suggestProgress'), t('npc.suggestAdvice'), t('npc.suggestFunnel')],
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

  // ── 進度相關回答 ──────────────────────────────────────
  const getProgressResponse = () => {
    const completedQuests = Object.values(questStatus).filter(q => q.completed).length
    const completedChallenges = Object.values(challengeStatus).filter(c => c.completed).length
    const totalQuests = WORLDS.reduce((sum, w) => sum + w.quests.length, 0)

    if (completedQuests === 0) {
      return {
        content: t('npc.progressNoQuests'),
        suggestions: [t('npc.suggestGoWorld1'), t('npc.suggestKPI'), t('npc.suggestAdvice')],
      }
    }

    let currentWorld = null
    for (const world of WORLDS) {
      const worldCompleted = world.quests.every(q => questStatus[q.id]?.completed)
      if (!worldCompleted) { currentWorld = world; break }
    }

    const nextQuestName = currentWorld
      ? currentWorld.quests.find(q => !questStatus[q.id]?.completed)?.name || t('npc.allComplete')
      : t('npc.allCleared')

    return {
      content: t('npc.progressStatus', {
        level: levelInfo.level,
        title: levelInfo.title,
        xp: totalXp,
        completedQuests,
        totalQuests,
        completedChallenges,
        currentWorld: currentWorld ? `${currentWorld.emoji} ${currentWorld.name}` : t('npc.allCleared'),
        nextQuest: nextQuestName,
      }),
      suggestions: currentWorld
        ? [t('npc.suggestGoWorld', { worldName: currentWorld.name }), t('npc.suggestAdvice'), t('npc.suggestGoMap')]
        : [t('npc.suggestAwesome'), t('npc.suggestGoMap')],
    }
  }

  // ── 建議回答 ──────────────────────────────────────────
  const getAdviceResponse = () => {
    let currentWorldIndex = 0
    for (let i = 0; i < WORLDS.length; i++) {
      const allDone = WORLDS[i].quests.every(q => questStatus[q.id]?.completed)
      if (!allDone) { currentWorldIndex = i; break }
    }

    const world = WORLDS[currentWorldIndex]
    const tip = t(`npc.adviceTip${world.id}`)

    return {
      content: t('npc.advicePrefix', { worldEmoji: world.emoji, worldName: world.name }) + tip,
      suggestions: [t('npc.suggestLessonWhere', { worldName: world.name }), t('npc.suggestWhereStuck'), t('npc.suggestGoMap')],
    }
  }

  const generateResponse = (userInput) => {
    const lower = userInput.toLowerCase()

    if (lower.includes('進度') || lower.includes('等級') || lower.includes('xp') || lower.includes('做到哪') || lower.includes('progress') || lower.includes('how am i')) {
      return getProgressResponse()
    }

    if (lower.includes('建議') || lower.includes('怎麼學') || lower.includes('下一步') || lower.includes('卡在') || lower.includes('advice') || lower.includes('suggest') || lower.includes('tip')) {
      return getAdviceResponse()
    }

    if (lower.includes('回到地圖') || lower.includes('帶我去') || lower.includes('go to map') || lower.includes('take me to') || lower.includes('back to map')) {
      return {
        content: t('npc.goToMapResponse'),
        suggestions: [t('npc.suggestProgress'), t('npc.suggestAdvice')],
        showMapLink: true,
      }
    }

    if (lower.includes('講義') || lower.includes('教材') || lower.includes('在哪') || lower.includes('lesson') || lower.includes('material') || lower.includes('where')) {
      return {
        content: t('npc.lessonResponse'),
        suggestions: [t('npc.suggestGoMap'), t('npc.suggestAdvice'), t('npc.suggestProgress')],
      }
    }

    if (lower.includes('卡關') || lower.includes('不會') || lower.includes('好難') || lower.includes('提示') || lower.includes('hint') || lower.includes('stuck') || lower.includes('difficult')) {
      return {
        content: t('npc.stuckResponse'),
        suggestions: [t('npc.suggestFunnel'), t('npc.suggestCohort'), t('npc.suggestProgress')],
      }
    }

    const topic = findTopic(userInput)
    if (topic && KNOWLEDGE_TOPICS.includes(topic)) {
      const suggestionKeys = KNOWLEDGE_SUGGESTIONS[topic] || ['suggestGoMap']
      return {
        content: t(`knowledge.${topic}`),
        suggestions: suggestionKeys.map(key => t(`npc.${key}`)),
      }
    }

    if (lower.match(/^(嗨|你好|hi|hello|hey|哈囉)/)) {
      return {
        content: t('npc.greeting', { level: levelInfo.level, title: levelInfo.title, xp: totalXp }),
        suggestions: [t('npc.suggestProgress'), t('npc.suggestAdvice'), t('npc.suggestKPI')],
      }
    }

    if (lower.includes('厲害') || lower.includes('太強') || lower.includes('awesome') || lower.includes('amazing')) {
      return {
        content: t('npc.awesomeResponse', { xp: totalXp, xpNeeded: levelInfo.xpForNext - levelInfo.currentXp }),
        suggestions: [t('npc.suggestNextStep'), t('npc.suggestGoMap')],
      }
    }

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
      const localResponse = generateResponse(messageText)

      if (localResponse) {
        await new Promise(resolve => setTimeout(resolve, 500))
        setMessages(prev => [...prev, {
          id: prev.length + 1,
          role: 'assistant',
          content: localResponse.content,
          suggestions: localResponse.suggestions,
          showMapLink: localResponse.showMapLink,
        }])
      } else {
        const aiMessages = [
          {
            role: 'system',
            content: t('npc.systemPrompt', { level: levelInfo.level, title: levelInfo.title, xp: totalXp }),
          },
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
          suggestions: [t('npc.suggestProgress'), t('npc.suggestAdvice'), t('npc.suggestGoMap')],
        }])
      }
    } catch (error) {
      console.error('DeepSeek API error:', error)
      setMessages(prev => [...prev, {
        id: prev.length + 1,
        role: 'assistant',
        content: t('npc.aiError'),
        suggestions: [t('npc.suggestFunnel'), t('npc.suggestProgress'), t('npc.suggestAdvice')],
      }])
    } finally {
      setIsTyping(false)
    }
  }

  const handleSuggestion = (suggestion) => {
    handleSend(suggestion)
  }

  const quickActions = [
    { icon: BookOpen, label: t('npc.quickExplain'), action: () => handleSend(t('npc.suggestQuickExplain')) },
    { icon: BarChart3, label: t('npc.quickStuck'), action: () => handleSend(t('npc.suggestQuickStuck')) },
    { icon: HelpCircle, label: t('npc.quickAdvice'), action: () => handleSend(t('npc.suggestAdvice')) },
    { icon: Map, label: t('npc.quickProgress'), action: () => handleSend(t('npc.suggestProgress')) },
  ]

  return (
    <div className="h-[calc(100vh-73px)] flex flex-col max-w-4xl mx-auto">
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

              <div className={`max-w-[80%] ${message.role === 'user' ? 'text-right' : ''}`}>
                <div className={`inline-block px-4 py-3 rounded-2xl ${
                  message.role === 'user'
                    ? 'bg-brand-primary text-white'
                    : 'bg-slate-800 text-slate-200'
                }`}>
                  {message.role === 'user' ? (
                    <p className="text-left whitespace-pre-wrap text-sm leading-relaxed">{message.content}</p>
                  ) : (
                    <div className="prose prose-invert prose-sm max-w-none break-words prose-p:my-1 prose-li:my-0.5 prose-headings:my-2 prose-hr:my-2 prose-ul:my-1 prose-ol:my-1 [&_pre]:overflow-x-auto [&_table]:overflow-x-auto">
                      <ReactMarkdown remarkPlugins={[remarkGfm]} components={{ pre: CodeBlock }}>{message.content}</ReactMarkdown>
                    </div>
                  )}
                </div>

                {message.showMapLink && (
                  <div className="mt-2">
                    <Link
                      to={route('/map')} className="inline-flex items-center gap-2 px-4 py-2 bg-brand-primary text-white rounded-lg text-sm hover:bg-blue-600 transition-colors"
                    >
                      <Map className="w-4 h-4" />
                      {t('npc.goToMap')}
                    </Link>
                  </div>
                )}

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
              <span className="text-slate-400">{t('npc.thinking')}</span>
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

      <div className="p-6 pt-0">
        <div className="flex gap-3">
          <div className="flex-1 relative">
            <input
              type="text"
              value={input}
              onChange={(e) => setInput(e.target.value)}
              onKeyDown={(e) => e.key === 'Enter' && handleSend()}
              placeholder={t('npc.inputPlaceholder')}
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
            {t('npc.send')}
          </button>
        </div>
        <p className="text-xs text-slate-500 mt-2 text-center">
          {t('npc.npcDesc')}
        </p>
      </div>
    </div>
  )
}

export default NPCChat
