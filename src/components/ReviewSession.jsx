import { useState, useCallback } from 'react'
import { CheckCircle, XCircle, ChevronRight, RotateCcw, ArrowLeft, ChevronDown, ChevronUp, Zap } from 'lucide-react'
import { motion, AnimatePresence } from 'framer-motion'
import { useTranslation } from 'react-i18next'
import { useQuest } from '../contexts/QuestContext'
import { getQuest, getChallenge, getWorld } from '../data/questData'
import MultipleChoice from './MultipleChoice'
import OpenEndedAnswer from './OpenEndedAnswer'
import CodeChallenge from './CodeChallenge'
import DataTable from './DataTable'
import SimpleChart from './SimpleChart'

const REVIEW_XP_PER_CORRECT = 10

function ReviewSession({ questions, onComplete }) {
  const { t } = useTranslation('review')
  const { dispatch } = useQuest()

  const [currentIndex, setCurrentIndex] = useState(0)
  const [answers, setAnswers] = useState([])
  const [answered, setAnswered] = useState(false)
  const [currentCorrect, setCurrentCorrect] = useState(false)
  const [phase, setPhase] = useState('active') // 'active' | 'summary'
  const [scenarioOpen, setScenarioOpen] = useState(false)

  const current = questions[currentIndex]
  const quest = current ? getQuest(current.questId) : null
  const challenge = current ? getChallenge(current.questId, current.challengeId) : null
  const world = current ? getWorld(current.worldId) : null

  const sessionXp = answers.reduce((sum, a) => sum + a.xpEarned, 0)
  const correctCount = answers.filter(a => a.correct).length

  const recordAnswer = useCallback((isCorrect, score = isCorrect ? 100 : 0) => {
    const xpEarned = isCorrect ? REVIEW_XP_PER_CORRECT : 0

    dispatch({
      type: 'COMPLETE_CHALLENGE',
      payload: {
        questId: current.questId,
        challengeId: Number(current.challengeId),
        score,
        usedHints: 0,
        attempts: 1,
        isReview: true,
      },
    })

    setAnswers(prev => [...prev, {
      key: current.key,
      questId: current.questId,
      challengeId: current.challengeId,
      correct: isCorrect,
      score,
      xpEarned,
    }])
    setAnswered(true)
    setCurrentCorrect(isCorrect)
  }, [current, dispatch])

  const handleAnswer = (isCorrect, _selected, attemptCount) => {
    recordAnswer(isCorrect, isCorrect ? 100 : 0)
  }

  const handleOpenEndedSubmit = (score) => {
    recordAnswer(score >= 60, score)
  }

  const goNext = () => {
    if (currentIndex + 1 >= questions.length) {
      setPhase('summary')
    } else {
      setCurrentIndex(prev => prev + 1)
      setAnswered(false)
      setCurrentCorrect(false)
      setScenarioOpen(false)
    }
  }

  // Summary phase
  if (phase === 'summary') {
    const totalXp = answers.reduce((sum, a) => sum + a.xpEarned, 0)
    const total = questions.length

    return (
      <motion.div
        initial={{ opacity: 0, scale: 0.95 }}
        animate={{ opacity: 1, scale: 1 }}
        className="max-w-lg mx-auto py-8"
      >
        <div className="text-center mb-8">
          <motion.div
            initial={{ scale: 0 }}
            animate={{ scale: 1 }}
            transition={{ type: 'spring', delay: 0.2 }}
            className="w-20 h-20 mx-auto mb-4 rounded-full bg-brand-primary/20 flex items-center justify-center"
          >
            <CheckCircle className="w-10 h-10 text-brand-primary" />
          </motion.div>
          <h2 className="text-2xl font-bold text-white mb-2">{t('summaryTitle')}</h2>
          <p className="text-slate-400">
            {t('summaryCorrect', { correct: correctCount, total })}
          </p>
          {totalXp > 0 && (
            <motion.p
              initial={{ opacity: 0, y: 10 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: 0.4 }}
              className="text-brand-accent text-xl font-bold mt-3 flex items-center justify-center gap-2"
            >
              <Zap className="w-5 h-5" />
              +{totalXp} XP
            </motion.p>
          )}
        </div>

        {/* Per-question breakdown */}
        <div className="space-y-1.5 mb-8">
          {answers.map((answer, i) => {
            const q = getQuest(answer.questId)
            const c = getChallenge(answer.questId, answer.challengeId)
            return (
              <motion.div
                key={answer.key}
                initial={{ opacity: 0, x: -20 }}
                animate={{ opacity: 1, x: 0 }}
                transition={{ delay: 0.1 * i }}
                className="flex items-center gap-3 px-3 py-2 rounded-lg bg-slate-800/50"
              >
                {answer.correct ? (
                  <CheckCircle className="w-4 h-4 text-emerald-400 flex-shrink-0" />
                ) : (
                  <XCircle className="w-4 h-4 text-red-400 flex-shrink-0" />
                )}
                <span className="text-slate-300 text-sm truncate flex-1">
                  {q?.name} — {c?.name}
                </span>
                {answer.xpEarned > 0 && (
                  <span className="text-brand-accent text-xs font-medium">+{answer.xpEarned}</span>
                )}
              </motion.div>
            )
          })}
        </div>

        {/* Actions */}
        <div className="flex gap-3">
          <button
            onClick={onComplete}
            className="flex-1 px-4 py-3 bg-slate-800 text-slate-300 rounded-xl hover:bg-slate-700 transition-colors text-sm font-medium cursor-pointer"
          >
            <ArrowLeft className="w-4 h-4 inline mr-1.5" />
            {t('backToQueue')}
          </button>
          <button
            onClick={() => onComplete('restart')}
            className="flex-1 px-4 py-3 bg-brand-primary text-white rounded-xl hover:bg-blue-600 transition-colors text-sm font-medium cursor-pointer"
          >
            <RotateCcw className="w-4 h-4 inline mr-1.5" />
            {t('anotherSession')}
          </button>
        </div>
      </motion.div>
    )
  }

  if (!challenge || !quest) return null

  return (
    <div className="max-w-2xl mx-auto py-4">
      {/* Progress bar */}
      <div className="flex items-center gap-3 mb-6">
        <button
          onClick={onComplete}
          className="p-1.5 text-slate-500 hover:text-white transition-colors cursor-pointer"
          aria-label={t('backToQueue')}
        >
          <ArrowLeft className="w-4 h-4" />
        </button>
        <div className="flex-1">
          <div className="flex items-center justify-between mb-1.5">
            <span className="text-slate-400 text-xs">
              {t('sessionProgress', { current: currentIndex + 1, total: questions.length })}
            </span>
            {sessionXp > 0 && (
              <span className="text-brand-accent text-xs font-medium flex items-center gap-1">
                <Zap className="w-3 h-3" />
                +{sessionXp} XP
              </span>
            )}
          </div>
          <div className="w-full h-2 bg-slate-800 rounded-full overflow-hidden">
            <motion.div
              className="h-full bg-brand-primary rounded-full"
              initial={false}
              animate={{ width: `${((currentIndex + (answered ? 1 : 0)) / questions.length) * 100}%` }}
              transition={{ duration: 0.3 }}
            />
          </div>
        </div>
      </div>

      {/* Question card */}
      <AnimatePresence mode="wait">
        <motion.div
          key={current.key}
          initial={{ opacity: 0, x: 40 }}
          animate={{ opacity: 1, x: 0 }}
          exit={{ opacity: 0, x: -40 }}
          transition={{ duration: 0.25 }}
        >
          {/* Context label */}
          <div className="flex items-center gap-2 mb-4">
            <span className="text-lg">{world?.emoji}</span>
            <span className="text-slate-400 text-sm">
              {quest.name} — {challenge.name}
            </span>
            {challenge.difficulty && (
              <span className={`text-[10px] px-1.5 py-0.5 rounded ${
                challenge.difficulty === 'easy' ? 'bg-emerald-500/20 text-emerald-400' :
                challenge.difficulty === 'medium' ? 'bg-yellow-500/20 text-yellow-400' :
                'bg-red-500/20 text-red-400'
              }`}>
                {challenge.difficulty}
              </span>
            )}
          </div>

          {/* Collapsible scenario */}
          {challenge.scenario && (
            <div className="mb-4 border border-slate-700 rounded-lg overflow-hidden">
              <button
                onClick={() => setScenarioOpen(prev => !prev)}
                className="w-full flex items-center justify-between px-3 py-2 text-sm text-slate-400 hover:text-slate-200 hover:bg-slate-800/50 transition-colors cursor-pointer"
              >
                <span>{t('scenarioToggle')}</span>
                {scenarioOpen ? <ChevronUp className="w-4 h-4" /> : <ChevronDown className="w-4 h-4" />}
              </button>
              <AnimatePresence>
                {scenarioOpen && (
                  <motion.div
                    initial={{ height: 0, opacity: 0 }}
                    animate={{ height: 'auto', opacity: 1 }}
                    exit={{ height: 0, opacity: 0 }}
                    transition={{ duration: 0.2 }}
                    className="overflow-hidden"
                  >
                    <div className="px-3 pb-3 space-y-3">
                      <h4 className="text-white text-sm font-medium">{challenge.scenario.title}</h4>
                      <p className="text-slate-300 text-sm leading-relaxed whitespace-pre-line">
                        {challenge.scenario.narrative}
                      </p>
                      {challenge.scenario.chartConfig && (
                        <SimpleChart config={{ ...challenge.scenario.chartConfig, data: challenge.scenario.data }} />
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
                        <p className="text-slate-400 text-xs leading-relaxed p-2 bg-slate-800/50 rounded">
                          {challenge.scenario.additionalContext}
                        </p>
                      )}
                    </div>
                  </motion.div>
                )}
              </AnimatePresence>
            </div>
          )}

          {/* Challenge component — key includes index to force remount on every question change */}
          {challenge.type === 'multiple-choice' || challenge.type === 'data-interpretation' ? (
            <MultipleChoice
              key={`review-${currentIndex}-${current.key}`}
              question={challenge.question}
              options={challenge.options}
              correctAnswer={challenge.correctAnswer}
              onAnswer={handleAnswer}
              disabled={answered}
            />
          ) : challenge.type === 'open-ended' ? (
            <OpenEndedAnswer
              key={`review-${currentIndex}-${current.key}`}
              prompt={challenge.prompt}
              evaluationCriteria={challenge.evaluationCriteria}
              sampleAnswer={challenge.sampleAnswer}
              scenario={challenge.scenario}
              onSubmit={handleOpenEndedSubmit}
              disabled={answered}
            />
          ) : challenge.type === 'code' ? (
            <CodeChallenge
              key={`review-${currentIndex}-${current.key}`}
              question={challenge.question}
              starterCode={challenge.starterCode || ''}
              sampleSchema={challenge.sampleSchema}
              expectedQuery={challenge.expectedQuery}
              onAnswer={(isCorrect) => handleAnswer(isCorrect)}
              disabled={answered}
            />
          ) : null}

          {/* Result + Next button */}
          {answered && (
            <motion.div
              initial={{ opacity: 0, y: 10 }}
              animate={{ opacity: 1, y: 0 }}
              className="mt-4 flex items-center justify-between"
            >
              <div className="flex items-center gap-2">
                {currentCorrect ? (
                  <>
                    <CheckCircle className="w-5 h-5 text-emerald-400" />
                    <span className="text-emerald-400 text-sm font-medium">
                      {t('reviewXpLabel')}
                    </span>
                  </>
                ) : (
                  <>
                    <XCircle className="w-5 h-5 text-red-400" />
                    <span className="text-red-400 text-sm font-medium">
                      {t('wrongAnswer', 'Incorrect')}
                    </span>
                  </>
                )}
              </div>
              <button
                onClick={goNext}
                className="flex items-center gap-1.5 px-4 py-2 bg-brand-primary text-white rounded-lg hover:bg-blue-600 transition-colors text-sm font-medium cursor-pointer"
              >
                {currentIndex + 1 >= questions.length
                  ? t('viewResults', 'View Results')
                  : t('nextQuestion', 'Next')}
                <ChevronRight className="w-4 h-4" />
              </button>
            </motion.div>
          )}
        </motion.div>
      </AnimatePresence>
    </div>
  )
}

export default ReviewSession
