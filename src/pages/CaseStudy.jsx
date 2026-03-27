import { useParams, Link, useNavigate, useSearchParams } from 'react-router-dom'
import { ArrowLeft, Lightbulb, Send, ChevronLeft, ChevronRight, BookOpen, CheckCircle, FileText, PenTool } from 'lucide-react'
import { useState, useEffect } from 'react'
import { motion } from 'framer-motion'
import { useTranslation } from 'react-i18next'
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
  const { t } = useTranslation(['case', 'common'])
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
  // Mobile tab: 'answer' shows question by default, 'scenario' shows context
  const [mobileTab, setMobileTab] = useState('answer')

  useEffect(() => {
    if (challenge) {
      const saved = challengeStatus[`${questId}-${challengeId}`]
      setHintLevel(0)
      setAttempts(0)
      setSubmitted(isReview ? false : !!saved?.completed)
      setAnswerCorrect(isReview ? false : !!saved?.completed)
      startChallenge(questId, challengeId)
      setMobileTab('answer')
    }
  }, [questId, challengeId])

  const getHint = () => {
    setHintLevel(prev => Math.min(prev + 1, challenge?.hints?.length || 3))
  }

  const completeChallenge = (score) => {
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

  const currentIndex = quest ? quest.challenges.findIndex(c => c.id === Number(challengeId)) : -1
  const prevChallenge = quest?.challenges[currentIndex - 1]
  const nextChallenge = quest?.challenges[currentIndex + 1]

  const getDifficultyLabel = (diff) => {
    if (diff === 'easy') return t('case:caseStudy.difficultyBasic')
    if (diff === 'medium') return t('case:caseStudy.difficultyAdvanced')
    return t('case:caseStudy.difficultyChallenge')
  }

  if (!challenge || !quest) {
    return (
      <div className="h-[calc(100dvh-73px)] flex items-center justify-center">
        <div className="text-center">
          <p className="text-slate-500 text-lg mb-4">{t('case:caseStudy.notFound')}</p>
          <Link to="/di-quest/map" className="btn-primary">{t('common:action.backToMap')}</Link>
        </div>
      </div>
    )
  }

  // Scenario content (shared between desktop left panel and mobile tab)
  const scenarioContent = (
    <>
      {challenge.scenario && (
        <div>
          <h2 className="text-lg sm:text-xl font-bold text-white mb-3">{challenge.scenario.title}</h2>
          <p className="text-slate-300 text-sm sm:text-base leading-relaxed whitespace-pre-line mb-4">
            {challenge.scenario.narrative}
          </p>
          {challenge.scenario.chartConfig && (
            <div className="mb-4 overflow-x-auto">
              <SimpleChart config={{ ...challenge.scenario.chartConfig, data: challenge.scenario.data }} />
            </div>
          )}
          {challenge.scenario.data && (
            <div className="overflow-x-auto">
              <DataTable
                data={challenge.scenario.data}
                caption={challenge.scenario.dataCaption}
                highlightRows={challenge.scenario.highlightRows}
              />
            </div>
          )}
          {challenge.scenario.additionalContext && (
            <div className="mt-4 p-3 sm:p-4 bg-slate-800/50 border border-slate-700 rounded-lg">
              <p className="text-slate-400 text-sm leading-relaxed">{challenge.scenario.additionalContext}</p>
            </div>
          )}
        </div>
      )}

      {challenge.frameworkTip && (
        <div className="mt-4 p-3 bg-brand-accent/10 border border-brand-accent/30 rounded-lg">
          <p className="text-brand-accent text-sm">
            <span className="font-bold">Framework: </span>
            {challenge.frameworkTip}
          </p>
        </div>
      )}
    </>
  )

  // Question content (shared between desktop right panel and mobile tab)
  const questionContent = (
    <>
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
          {t('case:caseStudy.typeInDev')}
        </div>
      )}

      {submitted && challenge.explanation && (
        <motion.div
          initial={{ opacity: 0, y: 10 }}
          animate={{ opacity: 1, y: 0 }}
          className="mt-6 p-4 bg-emerald-500/10 border border-emerald-500/30 rounded-lg"
        >
          <h4 className="text-emerald-400 font-medium mb-2 flex items-center gap-2">
            <CheckCircle className="w-4 h-4" />
            {t('case:caseStudy.explanation')}
          </h4>
          <p className="text-slate-300 text-sm leading-relaxed">{challenge.explanation}</p>
        </motion.div>
      )}
    </>
  )

  return (
    <div className="h-[calc(100dvh-73px)] flex flex-col">
      {/* Top navigation */}
      <div className="flex items-center justify-between px-3 sm:px-6 py-2 sm:py-3 border-b border-slate-700 bg-slate-900/50 flex-shrink-0">
        <div className="flex items-center gap-2 sm:gap-4 min-w-0 flex-1">
          <Link
            to={`/di-quest/quest/${worldId}/${questId}`}
            className="text-slate-400 hover:text-white transition-colors flex-shrink-0"
          >
            <ArrowLeft className="w-5 h-5" />
          </Link>
          <div className="min-w-0">
            <span className="text-slate-500 text-xs sm:text-sm truncate block">{world?.emoji} World {worldId} / {quest.name}</span>
            <h1 className="text-white font-medium text-sm sm:text-base truncate">
              Q{challengeId}: {challenge.name}
              {challenge.difficulty && (
                <span className={`ml-2 text-xs px-2 py-0.5 rounded ${
                  challenge.difficulty === 'easy' ? 'bg-emerald-500/20 text-emerald-400' :
                  challenge.difficulty === 'medium' ? 'bg-yellow-500/20 text-yellow-400' :
                  'bg-red-500/20 text-red-400'
                }`}>
                  {getDifficultyLabel(challenge.difficulty)}
                </span>
              )}
            </h1>
          </div>
          {sectionTitle && (
            <Link
              to={`/di-quest/lesson/${worldId}${sectionId ? `#${sectionId}` : ''}`}
              className="hidden md:flex items-center gap-1.5 px-3 py-1.5 bg-brand-primary/10 border border-brand-primary/30 text-brand-primary text-xs rounded-lg hover:bg-brand-primary/20 transition-colors flex-shrink-0"
            >
              <BookOpen className="w-3.5 h-3.5" />
              {sectionTitle}
            </Link>
          )}
        </div>
        <div className="flex items-center gap-1 sm:gap-3 flex-shrink-0">
          {prevChallenge && (
            <button
              onClick={() => navigate(`/di-quest/case/${worldId}/${questId}/${prevChallenge.id}`)}
              className="flex items-center gap-1 px-2 sm:px-3 py-2 text-slate-400 hover:text-white text-sm transition-colors"
            >
              <ChevronLeft className="w-4 h-4" /> <span className="hidden sm:inline">{t('case:caseStudy.prevQuestion')}</span>
            </button>
          )}
          {nextChallenge && (
            <button
              onClick={() => navigate(`/di-quest/case/${worldId}/${questId}/${nextChallenge.id}`)}
              className="flex items-center gap-1 px-2 sm:px-3 py-2 text-slate-400 hover:text-white text-sm transition-colors"
            >
              <span className="hidden sm:inline">{t('case:caseStudy.nextQuestion')}</span> <ChevronRight className="w-4 h-4" />
            </button>
          )}
        </div>
      </div>

      {/* Mobile tab switcher - only visible on mobile */}
      <div className="md:hidden flex border-b border-slate-700 flex-shrink-0">
        <button
          onClick={() => setMobileTab('scenario')}
          className={`flex-1 flex items-center justify-center gap-2 py-2.5 text-sm font-medium transition-colors ${
            mobileTab === 'scenario'
              ? 'text-brand-primary border-b-2 border-brand-primary bg-brand-primary/5'
              : 'text-slate-400'
          }`}
        >
          <FileText className="w-4 h-4" />
          {t('case:caseStudy.scenarioTab', '情境資料')}
        </button>
        <button
          onClick={() => setMobileTab('answer')}
          className={`flex-1 flex items-center justify-center gap-2 py-2.5 text-sm font-medium transition-colors ${
            mobileTab === 'answer'
              ? 'text-brand-primary border-b-2 border-brand-primary bg-brand-primary/5'
              : 'text-slate-400'
          }`}
        >
          <PenTool className="w-4 h-4" />
          {t('case:caseStudy.answerTab', '作答')}
        </button>
      </div>

      {/* Main content area */}
      {/* Desktop: side-by-side layout */}
      <div className="flex-1 hidden md:flex min-h-0 overflow-hidden">
        {/* Left: Scenario */}
        <div className="flex-1 overflow-y-auto p-6 border-r border-slate-700">
          {scenarioContent}
        </div>
        {/* Right: Question + Answer */}
        <div className="w-[480px] flex flex-col overflow-y-auto">
          <div className="p-6 flex-1">
            {questionContent}
          </div>
        </div>
      </div>

      {/* Mobile: tab-based layout - full height for content */}
      <div className="flex-1 md:hidden overflow-y-auto min-h-0">
        {mobileTab === 'scenario' ? (
          <div className="p-4 pb-20">
            {scenarioContent}
            {/* Quick switch to answer button */}
            <button
              onClick={() => setMobileTab('answer')}
              className="mt-6 w-full flex items-center justify-center gap-2 py-3 bg-brand-primary text-white rounded-lg font-medium text-sm active:scale-[0.98] transition-transform"
            >
              <PenTool className="w-4 h-4" />
              {t('case:caseStudy.goToAnswer', '前往作答')}
            </button>
          </div>
        ) : (
          <div className="p-4 pb-20">
            {questionContent}
          </div>
        )}
      </div>

      {/* Bottom: Hint area */}
      <div className="border-t border-slate-700 bg-slate-900 p-2.5 sm:p-5 pr-14 sm:pr-16 flex-shrink-0">
        <div className="flex items-center sm:items-start gap-2 sm:gap-4 max-w-full">
          <div className="hidden sm:flex w-12 h-12 rounded-full bg-brand-accent/20 items-center justify-center flex-shrink-0">
            <span className="text-brand-accent font-bold text-base">{t('case:caseStudy.xiaoDi')}</span>
          </div>
          <div className="flex-1 min-w-0 hidden sm:block">
            {submitted ? (
              <div className="text-emerald-400 font-medium text-base">
                {answerCorrect ? t('case:caseStudy.correctAnswer') : ''}
                {nextChallenge ? ` ${t('case:caseStudy.readyForNext')}` : ` ${t('case:caseStudy.allComplete')}`}
              </div>
            ) : hintLevel > 0 && challenge.hints ? (
              <div>
                <p className="text-slate-200 text-base leading-relaxed mb-3">
                  {challenge.hints[hintLevel - 1]}
                </p>
                <div className="flex items-center gap-3">
                  {hintLevel < (challenge.hints?.length || 3) && (
                    <button onClick={getHint} className="text-brand-accent text-sm hover:underline">
                      {t('case:caseStudy.moreHints')}
                    </button>
                  )}
                  <Link
                    to={`/di-quest/lesson/${worldId}`}
                    className="inline-flex items-center gap-1.5 text-sm text-blue-400 hover:text-blue-300 hover:underline"
                  >
                    <BookOpen className="w-4 h-4" />
                    {t('case:caseStudy.backToLesson')}
                  </Link>
                </div>
              </div>
            ) : (
              <p className="text-slate-400 text-base">
                {t('case:caseStudy.defaultHint')}
              </p>
            )}
          </div>
          {/* Mobile: compact hint text */}
          <div className="flex-1 min-w-0 sm:hidden">
            {submitted ? (
              <span className="text-emerald-400 font-medium text-xs">
                {answerCorrect ? t('case:caseStudy.correctAnswer') : ''}
              </span>
            ) : hintLevel > 0 && challenge.hints ? (
              <p className="text-slate-200 text-xs leading-relaxed line-clamp-2">
                {challenge.hints[hintLevel - 1]}
              </p>
            ) : (
              <p className="text-slate-500 text-xs">{t('case:caseStudy.defaultHint')}</p>
            )}
          </div>
          <div className="flex items-center gap-2 flex-shrink-0">
            <button
              onClick={getHint}
              disabled={hintLevel >= (challenge.hints?.length || 3) || submitted}
              className="flex items-center gap-1.5 sm:gap-2 px-3 sm:px-4 py-2 sm:py-2.5 bg-slate-800 text-brand-accent rounded-lg hover:bg-slate-700 transition-colors disabled:opacity-50 text-xs sm:text-sm"
            >
              <Lightbulb className="w-4 h-4" />
              <span className="hidden sm:inline">{t('case:caseStudy.hintBtn')}</span>
              {hintLevel > 0 ? ` (${hintLevel}/${challenge.hints?.length || 3})` : ''}
            </button>
            {submitted && nextChallenge && (
              <button
                onClick={() => navigate(`/di-quest/case/${worldId}/${questId}/${nextChallenge.id}`)}
                className="flex items-center gap-1 sm:gap-2 px-3 sm:px-6 py-2 sm:py-2.5 bg-brand-primary text-white rounded-lg hover:bg-blue-600 transition-colors text-xs sm:text-sm"
              >
                <span className="hidden sm:inline">{t('case:caseStudy.nextQuestion')}</span>
                <span className="sm:hidden">{t('case:caseStudy.nextQuestion')}</span>
                <ChevronRight className="w-4 h-4" />
              </button>
            )}
          </div>
        </div>
      </div>
    </div>
  )
}

export default CaseStudy
