import { useState, useRef, useEffect } from 'react'
import { Send, Bot, User, Sparkles, BookOpen, HelpCircle, Map, BarChart3 } from 'lucide-react'
import { motion, AnimatePresence } from 'framer-motion'
import { useTranslation } from 'react-i18next'
import { useQuest } from '../contexts/QuestContext'
import { WORLDS } from '../data/questData'
import { Link } from 'react-router-dom'
import { chatWithDeepSeek } from '../utils/deepseek'

// ── 知識庫：每個主題的解釋 ────────────────────────────────
const KNOWLEDGE = {
  'kpi': {
    content: 'KPI（Key Performance Indicator）是衡量業務表現的關鍵指標：\n\n面試中常見的 KPI 概念：\n• **Leading Indicator** — 預測未來的指標（如：pipeline 數量預測營收）\n• **Lagging Indicator** — 結果指標（如：本月營收、客戶流失率）\n• **Guardrail Metric** — 確保你在改善一個指標時沒有傷害其他面向\n\n例：提升 conversion rate 時，guardrail 可以是退貨率或客訴數。\n\n面試技巧：提到 KPI 時永遠要說清楚「對誰而言」和「為什麼這個指標重要」。',
    suggestions: ['什麼是 funnel analysis？', '什麼是 retention？', '回到地圖'],
  },
  'metrics': {
    content: '面試中常被問到的 Metrics 概念：\n\n• **North Star Metric** — 最能代表產品核心價值的單一指標\n• **Input vs Output Metrics** — 你能控制的 vs 結果\n• **Ratio vs Absolute** — 比率指標更能跨期比較\n\n範例：\n• Uber 的 North Star：完成的乘車次數\n• Airbnb 的 North Star：預訂住宿天數\n• Slack 的 North Star：每日發送訊息數\n\n面試技巧：永遠能解釋「為什麼選這個指標」而不是另一個。',
    suggestions: ['什麼是 KPI？', '什麼是 A/B testing？', '回到地圖'],
  },
  'funnel': {
    content: 'Funnel Analysis（漏斗分析）是拆解使用者旅程的核心方法：\n\n典型電商漏斗：\n瀏覽 (100%) → 加入購物車 (30%) → 開始結帳 (15%) → 完成付款 (8%)\n\n分析重點：\n1. 找到最大的 drop-off（流失最多的那一步）\n2. 按 segment 切開看（mobile vs desktop、新客 vs 舊客）\n3. 看趨勢變化（是突然掉還是逐漸下降）\n\n面試中被問到「指標下降」時，funnel 幾乎永遠是第一個分析工具。',
    suggestions: ['什麼是 segmentation？', '什麼是 cohort？', '回到地圖'],
  },
  'segmentation': {
    content: 'Segmentation（分群）是把使用者按特徵分組分析：\n\n常見的切分維度：\n• **人口統計** — 年齡、地區、語言\n• **行為** — 使用頻率、功能使用、消費金額\n• **來源** — organic vs paid、referral vs direct\n• **時間** — 新用戶 vs 老用戶、註冊時間\n\n為什麼重要？\n總體數據可能隱藏真相。例：整體 retention 持平，但新用戶 retention 大幅下降，只是被老用戶稀釋了。\n\n面試口訣：「我會先按 segment 切開看，看問題是 across the board 還是集中在某個群體。」',
    suggestions: ['什麼是 cohort？', '什麼是 funnel？', '回到地圖'],
  },
  'retention': {
    content: 'Retention（留存率）衡量用戶是否持續回來使用產品：\n\n常見 retention 指標：\n• **D1 / D7 / D30** — 第 1/7/30 天還有多少人回來\n• **Weekly Retention** — 每週回訪率\n• **Logo Retention vs Revenue Retention** — B2B 常用\n\nRetention 是最重要的 product-market fit 指標之一。\n如果 retention curve 最後趨於平穩（flatten），代表有一群核心用戶留下來了。\n如果一路往下掉到 0，代表產品沒有 product-market fit。\n\n面試技巧：討論 retention 時要指出你會用 cohort analysis 來追蹤。',
    suggestions: ['什麼是 cohort？', '什麼是 KPI？', '回到地圖'],
  },
  'cohort': {
    content: 'Cohort Analysis（世代分析）把用戶按「加入時間」分組追蹤：\n\n為什麼不直接看整體？\n因為整體數據會混合不同時期的用戶，掩蓋真實趨勢。\n\n範例：\n• 1 月 cohort：D7 retention = 40%\n• 2 月 cohort：D7 retention = 35%\n• 3 月 cohort：D7 retention = 28%\n→ 明顯看出新用戶的留存在惡化！\n\n但如果只看整體 DAU，可能因為用戶基數還在增長而看起來正常。\n\nCohort 是面試中最能展示分析深度的工具之一。',
    suggestions: ['什麼是 retention？', '什麼是 segmentation？', '回到地圖'],
  },
  'sql': {
    content: '面試中的 SQL 思維（不用真的寫程式碼，但要會說邏輯）：\n\n面試官可能問：「你要怎麼查過去 30 天每個 channel 的轉換率？」\n\n你的回答架構：\n1. 需要哪些 table？（users, events, transactions）\n2. 怎麼 JOIN？（用 user_id 關聯）\n3. 怎麼 filter？（WHERE event_date >= 30 days ago）\n4. 怎麼 aggregate？（GROUP BY channel, COUNT + 比率計算）\n\n重點概念：\n• JOIN = 合併不同表的資料\n• GROUP BY = 按維度分組聚合\n• Window Function = 排名、移動平均、前後比較\n• Subquery = 先算出中間結果再繼續分析',
    suggestions: ['什麼是 KPI？', '什麼是 dashboard？', '回到地圖'],
  },
  'dashboard': {
    content: 'Dashboard 設計是面試常見題型：\n\n設計 dashboard 的思路：\n1. **給誰看？** — C-level、PM、營運團隊需要看不同東西\n2. **回答什麼問題？** — 每個 dashboard 應該回答 2-3 個核心問題\n3. **指標選擇** — North Star + 3-5 個 supporting metrics + guardrails\n4. **時間粒度** — 日報、週報、月報各有不同用途\n\n好 dashboard 的原則：\n• 一眼能看出「事情好不好」\n• 能引導下一步行動（actionable）\n• 不超過 8-10 個指標（太多就是噪音）',
    suggestions: ['什麼是 KPI？', '什麼是 process mapping？', '回到地圖'],
  },
  'process': {
    content: 'Process Mapping（流程圖）是分析商業流程的基礎：\n\n步驟：\n1. 列出所有步驟（從觸發到完成）\n2. 標出每一步的負責人\n3. 標出每一步的平均時間\n4. 找出 bottleneck（最慢的那一步）\n\nBottleneck（瓶頸）識別方法：\n• 哪一步等待時間最長？\n• 哪一步需要最多人工介入？\n• 哪一步最常出錯需要 rework？\n\n面試中常被問：「如果要改善這個流程，你會先做什麼？」\n答案永遠是：先畫出流程，找到 bottleneck，改那個。',
    suggestions: ['什麼是 A/B testing？', '什麼是 dashboard？', '回到地圖'],
  },
  'ab testing': {
    content: 'A/B Testing（實驗設計）是驗證假設的標準方法：\n\n基本架構：\n1. **假設**：改變 X 會讓 Y 提升\n2. **對照組 vs 實驗組**：隨機分配用戶\n3. **衡量指標**：primary metric + guardrail metrics\n4. **樣本量和時間**：要跑多久才有足夠信心\n\n常見陷阱：\n• 太早結束實驗（false positive）\n• Novelty effect（新鮮感導致的假提升）\n• Selection bias（分組不隨機）\n• 只看 primary metric 忽略 guardrail\n\n面試技巧：提到實驗時要能說出「我要觀察什麼指標」和「什麼情況下我不會做 A/B test」。',
    suggestions: ['什麼是 KPI？', '什麼是 segmentation？', '回到地圖'],
  },
  'recommendation': {
    content: '面試中「提出建議」的框架：\n\n結構化建議的 4 步驟：\n1. **問題摘要** — 用一句話說清楚問題是什麼\n2. **分析發現** — 數據告訴你什麼（2-3 個 key findings）\n3. **建議行動** — 優先順序排列的具體建議\n4. **衡量成功** — 怎麼知道建議有效\n\nPrioritization 框架：\n• **Impact vs Effort** — 2×2 matrix\n• **ICE Score** — Impact × Confidence × Ease\n• **RICE** — Reach × Impact × Confidence / Effort\n\n面試技巧：永遠從 high impact + low effort 的建議開始講。',
    suggestions: ['什麼是 A/B testing？', '什麼是 process mapping？', '回到地圖'],
  },
  'prioritization': {
    content: 'Prioritization（排序優先級）是面試的核心能力：\n\n常用框架：\n• **2×2 Matrix** — Impact vs Effort，先做右上角（高影響低成本）\n• **ICE** — 每個選項打 Impact / Confidence / Ease 分數\n• **MoSCoW** — Must have / Should have / Could have / Won\'t have\n\n面試中的應用場景：\n• 「你有 3 個建議，先做哪個？」\n• 「資源有限，你怎麼決定？」\n• 「stakeholder 意見不同，怎麼排序？」\n\n永遠能解釋你的排序邏輯，而不是只說「我覺得 A 比較重要」。',
    suggestions: ['什麼是 recommendation？', '什麼是 KPI？', '回到地圖'],
  },
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
  { keywords: ['a/b test', 'ab test', '實驗', 'experiment', '假設驗證'], topic: 'ab testing' },
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

// ── 進度相關回答 ──────────────────────────────────────────
function getProgressResponse(questStatus, challengeStatus, totalXp, levelInfo) {
  const completedQuests = Object.values(questStatus).filter(q => q.completed).length
  const completedChallenges = Object.values(challengeStatus).filter(c => c.completed).length
  const totalQuests = WORLDS.reduce((sum, w) => sum + w.quests.length, 0)

  if (completedQuests === 0) {
    return {
      content: `你還沒完成任何關卡！建議從「World 1: 問題拆解基礎」開始。先閱讀講義，再去挑戰！\n\n第一關是學會分類問題 — Business / Product / System。你可以的！💪`,
      suggestions: ['帶我去 World 1', '什麼是 KPI？', '有什麼建議？'],
    }
  }

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
  let currentWorldIndex = 0
  for (let i = 0; i < WORLDS.length; i++) {
    const allDone = WORLDS[i].quests.every(q => questStatus[q.id]?.completed)
    if (!allDone) { currentWorldIndex = i; break }
  }

  const world = WORLDS[currentWorldIndex]
  const tips = {
    1: '建議先花 10 分鐘讀完 World 1 的講義，了解問題分類（Business / Product / System）和結構化拆解。這些是所有 Case Study 的基礎！',
    2: 'World 2 的重點是 KPI 和商業指標。記住：永遠要能解釋「為什麼選這個指標」。Leading vs Lagging、Guardrail Metrics 是面試高頻考點。',
    3: 'World 3 是數據分析思維。Funnel、Segmentation、Cohort 是分析的三大武器。練習時想像面試官問你「指標掉了怎麼查」。',
    4: 'World 4 是 SQL 與資料素養。面試不一定要寫 SQL，但要能說出查詢邏輯 — 需要哪些 table、怎麼 JOIN、怎麼 aggregate。',
    5: 'World 5 是 Product Thinking！User Journey、Feature 評估、Adoption 問題診斷 — 這些是 PM 和 Product Analyst 面試的核心。',
    6: 'World 6 是 Business Process。學會畫流程圖、找 bottleneck、判斷哪些步驟該自動化。很多公司愛考流程改善的 case。',
    7: 'World 7 是實驗與驗證！A/B Testing、假設設計、Correlation vs Causation — 這些概念在面試中非常高頻。',
    8: 'World 8 是綜合模擬面試！把前面學的全部串起來，練習完整回答 Case Study。Boss 關是完整模擬面試，加油！',
  }

  return {
    content: `你現在在 ${world.emoji} ${world.name}。\n\n${tips[world.id]}`,
    suggestions: [`${world.name} 的講義在哪？`, '我卡在哪？', '回到地圖'],
  }
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
      suggestions: ['我的進度如何？', '有什麼建議？', '什麼是 funnel analysis？'],
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

    if (lower.includes('進度') || lower.includes('等級') || lower.includes('xp') || lower.includes('做到哪') || lower.includes('progress')) {
      return getProgressResponse(questStatus, challengeStatus, totalXp, levelInfo)
    }

    if (lower.includes('建議') || lower.includes('怎麼學') || lower.includes('下一步') || lower.includes('卡在') || lower.includes('advice') || lower.includes('suggest')) {
      return getAdviceResponse(questStatus)
    }

    if (lower.includes('回到地圖') || lower.includes('帶我去') || lower.includes('go to map')) {
      return {
        content: '好的！點擊下方按鈕前往地圖，選擇你想去的世界。',
        suggestions: ['我的進度如何？', '有什麼建議？'],
        showMapLink: true,
      }
    }

    if (lower.includes('講義') || lower.includes('教材') || lower.includes('在哪') || lower.includes('lesson') || lower.includes('material')) {
      return {
        content: '每個世界都有自己的講義！進入方式：\n\n1. 在地圖中展開任一世界\n2. 點擊最上方的「📖 閱讀講義」\n3. 或在關卡詳情頁點「開始閱讀」\n\n建議流程：**先讀講義 → 再做挑戰** 效果最好！',
        suggestions: ['帶我去地圖', '有什麼建議？', '我的進度如何？'],
      }
    }

    if (lower.includes('卡關') || lower.includes('不會') || lower.includes('好難') || lower.includes('提示') || lower.includes('hint') || lower.includes('stuck')) {
      return {
        content: '卡關很正常！這裡有幾個建議：\n\n1. **回去看講義** — 每個世界都有詳細教材\n2. **用提示系統** — 挑戰頁面右上角有「💡 提示」按鈕（最多 3 級提示）\n3. **想想框架** — 面試回答都有結構，先想大方向再補細節\n4. **問我概念** — 直接問我你不懂的分析概念\n\n別忘了：每個挑戰都是模擬真實面試情境，多練幾次就會越來越順！',
        suggestions: ['什麼是 funnel analysis？', '什麼是 cohort？', '我的進度如何？'],
      }
    }

    const topic = findTopic(userInput)
    if (topic && KNOWLEDGE[topic]) {
      return KNOWLEDGE[topic]
    }

    if (lower.match(/^(嗨|你好|hi|hello|hey|哈囉)/)) {
      return {
        content: `嗨！我是小迪，你目前是 Lv.${levelInfo.level} ${levelInfo.title}，共 ${totalXp} XP。有什麼我可以幫忙的嗎？`,
        suggestions: ['我的進度如何？', '有什麼建議？', '什麼是 KPI？'],
      }
    }

    if (lower.includes('厲害') || lower.includes('太強') || lower.includes('awesome')) {
      return {
        content: `你確實很厲害！已經拿到 ${totalXp} XP 了！繼續加油，距離下一級還有 ${levelInfo.xpForNext - levelInfo.currentXp} XP。\n\n每一關都是模擬真實面試情境，能通過這些挑戰代表你的分析思維越來越強了。`,
        suggestions: ['下一步做什麼？', '回到地圖'],
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
            content: `你是「小迪」，一個友善的面試練習教練（DI Quest 學習平台的 NPC）。
你的任務是用繁體中文幫助使用者準備商業 Case Study 面試，特別是問題拆解、KPI 分析、Funnel、Segmentation、Cohort、A/B Testing、流程優化、Product Thinking 等主題。
回答要簡潔、有架構、鼓勵性質。盡量用真實的商業情境舉例，不要寫程式碼。
使用者目前等級：Lv.${levelInfo.level} ${levelInfo.title}，共 ${totalXp} XP。
請保持回答在 300 字以內。`,
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
          suggestions: ['我的進度如何？', '有什麼建議？', '回到地圖'],
        }])
      }
    } catch (error) {
      console.error('DeepSeek API error:', error)
      setMessages(prev => [...prev, {
        id: prev.length + 1,
        role: 'assistant',
        content: t('npc.aiError'),
        suggestions: ['什麼是 funnel？', '我的進度如何？', '有什麼建議？'],
      }])
    } finally {
      setIsTyping(false)
    }
  }

  const handleSuggestion = (suggestion) => {
    handleSend(suggestion)
  }

  const quickActions = [
    { icon: BookOpen, label: t('npc.quickExplain'), action: () => handleSend('什麼是 funnel analysis？') },
    { icon: BarChart3, label: t('npc.quickStuck'), action: () => handleSend('我卡關了怎麼辦') },
    { icon: HelpCircle, label: t('npc.quickAdvice'), action: () => handleSend('有什麼建議？') },
    { icon: Map, label: t('npc.quickProgress'), action: () => handleSend('我的進度如何？') },
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
                  <p className="text-left whitespace-pre-wrap text-sm leading-relaxed">{message.content}</p>
                </div>

                {message.showMapLink && (
                  <div className="mt-2">
                    <Link
                      to="/di-quest/map"
                      className="inline-flex items-center gap-2 px-4 py-2 bg-brand-primary text-white rounded-lg text-sm hover:bg-blue-600 transition-colors"
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
