import { useParams, Link, useNavigate, useSearchParams } from 'react-router-dom'
import { ArrowLeft, Lightbulb, Send, ChevronLeft, ChevronRight, BookOpen, CheckCircle } from 'lucide-react'
import { useState, useEffect } from 'react'
import { motion } from 'framer-motion'
import { getQuest, getChallenge, getWorld } from '../data/questData'
import { getQuestSectionTitle, getQuestSectionId } from '../data/lessons/index'
import { useQuest } from '../contexts/QuestContext'
import { startChallenge, endChallenge } from '../utils/analyticsTracker'
import DataTable from '../components/DataTable'
import SimpleChart from '../components/SimpleChart'
import MultipleChoice from '../components/MultipleChoice'
import OpenEndedAnswer from '../components/OpenEndedAnswer'
import CodeChallenge from '../components/CodeChallenge'

function CaseStudy() {
  const { worldId, questId, challengeId = '1' } = useParams()
  const [searchParams] = useSearchParams()
  const isReview = searchParams.get('review') === '1'
  const navigate = useNavigate()
  const { dispatch, challengeStatus } = useQuest()

  const quest = getQuest(questId)
  const challenge = getChallenge(questId, challengeId)
  const world = getWorld(worldId)
  const sectionTitle = getQuestSectionTitle(questId)
  const sectionId = getQuestSectionId(questId)

  const [hintLevel, setHintLevel] = useState(0)
  const [attempts, setAttempts] = useState(0)
  const [submitted, setSubmitted] = useState(false)
  const [answerCorrect, setAnswerCorrect] = useState(false)

  // Reset state when challenge changes + start timing
  useEffect(() => {
    if (challenge) {
      const saved = challengeStatus[`${questId}-${challengeId}`]
      setHintLevel(0)
      setAttempts(0)
      setSubmitted(isReview ? false : !!saved?.completed)
      setAnswerCorrect(isReview ? false : !!saved?.completed)
      startChallenge(questId, challengeId)
    }
  }, [questId, challengeId])

  const getHint = () => {
    setHintLevel(prev => Math.min(prev + 1, challenge?.hints?.length || 3))
  }

  const completeChallenge = (score) => {
    // 記錄作答時間
    const durationMs = endChallenge(questId, challengeId)
    if (durationMs > 0) {
      dispatch({
        type: 'RECORD_CHALLENGE_TIMING',
        payload: { questId, challengeId: Number(challengeId), durationMs },
      })
    }

    dispatch({
      type: 'COMPLETE_CHALLENGE',
      payload: {
        questId,
        challengeId: Number(challengeId),
        score,
        usedHints: hintLevel,
        attempts: attempts + 1,
        baseXp: quest?.isBoss ? 200 : 50,
        isReview,
      },
    })

    setSubmitted(true)

    // Check if all challenges complete -> complete quest
    if (quest) {
      const allDone = quest.challenges.every((c) => {
        if (c.id === Number(challengeId)) return true
        return challengeStatus[`${questId}-${c.id}`]?.completed
      })
      if (allDone) {
        dispatch({
          type: 'COMPLETE_QUEST',
          payload: { questId, score: 100, bonusXp: quest.isBoss ? 100 : 50 },
        })
      }
    }
  }

  const handleAnswer = (isCorrect) => {
    setAttempts(prev => prev + 1)
    setAnswerCorrect(isCorrect)
    if (isCorrect) completeChallenge(100)
  }

  const handleOpenEndedSubmit = (score) => {
    setAnswerCorrect(score >= 60)
    completeChallenge(score)
  }

  // Challenge navigation
  const currentIndex = quest ? quest.challenges.findIndex(c => c.id === Number(challengeId)) : -1
  const prevChallenge = quest?.challenges[currentIndex - 1]
  const nextChallenge = quest?.challenges[currentIndex + 1]

  if (!challenge || !quest) {
    return (
      <div className="h-[calc(100vh-73px)] flex items-center justify-center">
        <div className="text-center">
          <p className="text-slate-500 text-lg mb-4">找不到這個題目</p>
          <Link to="/di-quest/map" className="btn-primary">返回地圖</Link>
        </div>
      </div>
    )
  }

  return (
    <div className="h-[calc(100vh-73px)] flex flex-col">
      {/* Top navigation */}
      <div className="flex items-center justify-between px-6 py-3 border-b border-slate-700 bg-slate-900/50">
        <div className="flex items-center gap-4">
          <Link
            to={`/di-quest/quest/${worldId}/${questId}`}
            className="text-slate-400 hover:text-white transition-colors"
          >
            <ArrowLeft className="w-5 h-5" />
          </Link>
          <div>
            <span className="text-slate-500 text-sm">{world?.emoji} World {worldId} / {quest.name}</span>
            <h1 className="text-white font-medium">
              Q{challengeId}: {challenge.name}
              {challenge.difficulty && (
                <span className={`ml-2 text-xs px-2 py-0.5 rounded ${
                  challenge.difficulty === 'easy' ? 'bg-emerald-500/20 text-emerald-400' :
                  challenge.difficulty === 'medium' ? 'bg-yellow-500/20 text-yellow-400' :
                  'bg-red-500/20 text-red-400'
                }`}>
                  {challenge.difficulty === 'easy' ? '基礎' : challenge.difficulty === 'medium' ? '進階' : '挑戰'}
                </span>
              )}
            </h1>
          </div>
          {sectionTitle && (
            <Link
              to={`/di-quest/lesson/${worldId}${sectionId ? `#${sectionId}` : ''}`}
              className="flex items-center gap-1.5 px-3 py-1.5 bg-brand-primary/10 border border-brand-primary/30 text-brand-primary text-xs rounded-lg hover:bg-brand-primary/20 transition-colors"
            >
              <BookOpen className="w-3.5 h-3.5" />
              {sectionTitle}
            </Link>
          )}
        </div>
        <div className="flex items-center gap-3">
          {prevChallenge && (
            <button
              onClick={() => navigate(`/di-quest/case/${worldId}/${questId}/${prevChallenge.id}`)}
              className="flex items-center gap-1 px-3 py-2 text-slate-400 hover:text-white text-sm transition-colors"
            >
              <ChevronLeft className="w-4 h-4" /> 上一題
            </button>
          )}
          {nextChallenge && (
            <button
              onClick={() => navigate(`/di-quest/case/${worldId}/${questId}/${nextChallenge.id}`)}
              className="flex items-center gap-1 px-3 py-2 text-slate-400 hover:text-white text-sm transition-colors"
            >
              下一題 <ChevronRight className="w-4 h-4" />
            </button>
          )}
        </div>
      </div>

      {/* Main content area */}
      <div className="flex-1 flex min-h-0 overflow-hidden">
        {/* Left: Scenario */}
        <div className="flex-1 overflow-y-auto p-6 border-r border-slate-700">
          {challenge.scenario && (
            <div>
              <h2 className="text-xl font-bold text-white mb-3">{challenge.scenario.title}</h2>
              <p className="text-slate-300 leading-relaxed whitespace-pre-line mb-4">
                {challenge.scenario.narrative}
              </p>
              {challenge.scenario.chartConfig && (
                <div className="mb-4">
                  <SimpleChart config={{ ...challenge.scenario.chartConfig, data: challenge.scenario.data }} />
                </div>
              )}
              {challenge.scenario.data && (
                <DataTable
                  data={challenge.scenario.data}
                  caption={challenge.scenario.dataCaption}
                  highlightRows={challenge.scenario.highlightRows}
                />
              )}
              {challenge.scenario.additionalContext && (
                <div className="mt-4 p-4 bg-slate-800/50 border border-slate-700 rounded-lg">
                  <p className="text-slate-400 text-sm leading-relaxed">{challenge.scenario.additionalContext}</p>
                </div>
              )}
            </div>
          )}

          {/* Framework tip */}
          {challenge.frameworkTip && (
            <div className="mt-4 p-3 bg-brand-accent/10 border border-brand-accent/30 rounded-lg">
              <p className="text-brand-accent text-sm">
                <span className="font-bold">Framework: </span>
                {challenge.frameworkTip}
              </p>
            </div>
          )}
        </div>

        {/* Right: Question + Answer */}
        <div className="w-[480px] flex flex-col overflow-y-auto">
          <div className="p-6 flex-1">
            {challenge.type === 'multiple-choice' || challenge.type === 'data-interpretation' ? (
              <MultipleChoice
                question={challenge.question}
                options={challenge.options}
                correctAnswer={challenge.correctAnswer}
                onAnswer={handleAnswer}
                disabled={submitted}
              />
            ) : challenge.type === 'open-ended' ? (
              <OpenEndedAnswer
                prompt={challenge.prompt}
                evaluationCriteria={challenge.evaluationCriteria}
                sampleAnswer={challenge.sampleAnswer}
                scenario={challenge.scenario}
                onSubmit={handleOpenEndedSubmit}
                disabled={submitted}
              />
            ) : challenge.type === 'code' ? (
              <CodeChallenge
                question={challenge.question}
                starterCode={challenge.starterCode || ''}
                sampleSchema={challenge.sampleSchema}
                expectedQuery={challenge.expectedQuery}
                onAnswer={(isCorrect, code) => {
                  setAttempts(prev => prev + 1)
                  setAnswerCorrect(isCorrect)
                  if (isCorrect) completeChallenge(100)
                }}
                disabled={submitted}
              />
            ) : (
              <div className="text-slate-400 text-center py-12">
                此題型開發中
              </div>
            )}

            {/* Explanation after correct answer */}
            {submitted && challenge.explanation && (
              <motion.div
                initial={{ opacity: 0, y: 10 }}
                animate={{ opacity: 1, y: 0 }}
                className="mt-6 p-4 bg-emerald-500/10 border border-emerald-500/30 rounded-lg"
              >
                <h4 className="text-emerald-400 font-medium mb-2 flex items-center gap-2">
                  <CheckCircle className="w-4 h-4" />
                  解析
                </h4>
                <p className="text-slate-300 text-sm leading-relaxed">{challenge.explanation}</p>
              </motion.div>
            )}
          </div>
        </div>
      </div>

      {/* Bottom: Hint area */}
      <div className="border-t border-slate-700 bg-slate-900 p-5 pr-16">
        <div className="flex items-start gap-4 max-w-full">
          <div className="w-12 h-12 rounded-full bg-brand-accent/20 flex items-center justify-center flex-shrink-0">
            <span className="text-brand-accent font-bold text-base">小迪</span>
          </div>
          <div className="flex-1 min-w-0">
            {submitted ? (
              <div className="text-emerald-400 font-medium text-base">
                {answerCorrect ? '答對了！' : ''}
                {nextChallenge ? ' 準備好挑戰下一題了嗎？' : ' 你已經完成這個關卡的所有題目！'}
              </div>
            ) : hintLevel > 0 && challenge.hints ? (
              <div>
                <p className="text-slate-200 text-base leading-relaxed mb-3">
                  {challenge.hints[hintLevel - 1]}
                </p>
                <div className="flex items-center gap-3">
                  {hintLevel < (challenge.hints?.length || 3) && (
                    <button onClick={getHint} className="text-brand-accent text-sm hover:underline">
                      需要更多提示？(-20 XP)
                    </button>
                  )}
                  <Link
                    to={`/di-quest/lesson/${worldId}`}
                    className="inline-flex items-center gap-1.5 text-sm text-blue-400 hover:text-blue-300 hover:underline"
                  >
                    <BookOpen className="w-4 h-4" />
                    回去看教材
                  </Link>
                </div>
              </div>
            ) : (
              <p className="text-slate-400 text-base">
                仔細閱讀左邊的情境和數據，再回答右邊的問題。卡住的話可以按提示按鈕。
              </p>
            )}
          </div>
          <div className="flex items-center gap-2 flex-shrink-0">
            <button
              onClick={getHint}
              disabled={hintLevel >= (challenge.hints?.length || 3) || submitted}
              className="flex items-center gap-2 px-4 py-2.5 bg-slate-800 text-brand-accent rounded-lg hover:bg-slate-700 transition-colors disabled:opacity-50 text-sm"
            >
              <Lightbulb className="w-4 h-4" />
              提示 {hintLevel > 0 ? `(${hintLevel}/${challenge.hints?.length || 3})` : ''}
            </button>
            {submitted && nextChallenge && (
              <button
                onClick={() => navigate(`/di-quest/case/${worldId}/${questId}/${nextChallenge.id}`)}
                className="flex items-center gap-2 px-6 py-2.5 bg-brand-primary text-white rounded-lg hover:bg-blue-600 transition-colors"
              >
                下一題 <ChevronRight className="w-4 h-4" />
              </button>
            )}
          </div>
        </div>
      </div>
    </div>
  )
}

export default CaseStudy
