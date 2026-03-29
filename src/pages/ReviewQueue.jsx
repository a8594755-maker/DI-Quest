import { useState } from 'react'
import { Link } from 'react-router-dom'
import { RotateCcw, ChevronRight, Clock, Zap, Play } from 'lucide-react'
import { motion } from 'framer-motion'
import { useTranslation, Trans } from 'react-i18next'
import { useQuest } from '../contexts/QuestContext'
import { getDueReviews, selectReviewQuestions } from '../utils/spacedRepetition'
import { getQuest, getChallenge, getWorld } from '../data/questData'
import { getLocalToday } from '../utils/localDate'
import ReviewSession from '../components/ReviewSession'

function ReviewQueue() {
  const { t } = useTranslation(['review', 'common'])
  const { reviewSchedule, challengeStatus } = useQuest()
  const today = getLocalToday()
  const dueReviews = getDueReviews(reviewSchedule, today)

  const [sessionActive, setSessionActive] = useState(false)
  const [sessionQuestions, setSessionQuestions] = useState([])

  const startSession = () => {
    const selected = selectReviewQuestions(reviewSchedule, challengeStatus, today, 5)
    if (selected.length === 0) return
    setSessionQuestions(selected)
    setSessionActive(true)
  }

  const handleSessionComplete = (action) => {
    setSessionActive(false)
    setSessionQuestions([])
    if (action === 'restart') {
      // Small delay to let state update, then start a new session
      setTimeout(startSession, 100)
    }
  }

  // Session mode
  if (sessionActive && sessionQuestions.length > 0) {
    return (
      <div className="max-w-3xl mx-auto p-4 sm:p-6">
        <ReviewSession
          questions={sessionQuestions}
          onComplete={handleSessionComplete}
        />
      </div>
    )
  }

  // 按 world 分組
  const groupedByWorld = {}
  dueReviews.forEach((review) => {
    const world = getWorld(review.worldId)
    if (!world) return
    if (!groupedByWorld[review.worldId]) {
      groupedByWorld[review.worldId] = { world, items: [] }
    }
    const quest = getQuest(review.questId)
    const challenge = getChallenge(review.questId, review.challengeId)
    const status = challengeStatus[review.key]
    if (quest && challenge) {
      groupedByWorld[review.worldId].items.push({
        ...review,
        questName: quest.name,
        challengeName: challenge.name,
        lastScore: status?.score || 0,
        daysSinceReview: Math.floor((Date.now() - new Date(review.nextReviewDate).getTime()) / 86400000),
      })
    }
  })

  // Count total completed challenges — need at least 10 to unlock review session
  const totalCompleted = Object.keys(challengeStatus).filter(k => challengeStatus[k]?.completed).length
  const MIN_TO_UNLOCK = 10
  const canStartSession = totalCompleted >= MIN_TO_UNLOCK

  return (
    <div className="max-w-3xl mx-auto p-4 sm:p-6">
      <div className="mb-8">
        <h2 className="text-2xl sm:text-3xl font-bold text-white mb-2 flex items-center gap-3">
          <RotateCcw className="w-7 h-7 sm:w-8 sm:h-8 text-brand-primary" />
          {t('review:title')}
        </h2>
        <p className="text-slate-400">
          {t('review:subtitle')}
        </p>
      </div>

      {totalCompleted === 0 ? (
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          className="card text-center py-16"
        >
          <p className="text-4xl mb-4">🎉</p>
          <p className="text-white text-lg font-medium mb-2">{t('review:empty')}</p>
          <p className="text-slate-400 mb-6">{t('review:emptyHint')}</p>
          <Link to="/di-quest/map" className="btn-primary">
            {t('common:action.backToMap')}
          </Link>
        </motion.div>
      ) : (
        <div className="space-y-6">
          {/* Start session card */}
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            className="card"
          >
            <div className="flex items-center justify-between">
              <div>
                <p className="text-white font-medium">
                  {dueReviews.length > 0 ? (
                    <Trans i18nKey="review:totalDue" values={{ count: dueReviews.length }}>
                      <span className="text-brand-primary" />
                    </Trans>
                  ) : (
                    t('review:allCaughtUp', 'All caught up! Practice with completed questions.')
                  )}
                </p>
                <p className="text-slate-500 text-xs mt-1 flex items-center gap-1">
                  <Zap className="w-3 h-3" />
                  {t('review:sessionXpHint', '+10 XP per correct answer')}
                </p>
              </div>
              {canStartSession ? (
                <button
                  onClick={startSession}
                  className="flex items-center gap-2 px-4 py-2.5 bg-brand-primary text-white rounded-xl hover:bg-blue-600 transition-colors text-sm font-medium cursor-pointer"
                >
                  <Play className="w-4 h-4" />
                  {t('review:startSession')}
                  <span className="text-white/70 text-xs">
                    ({Math.min(5, totalCompleted)})
                  </span>
                </button>
              ) : (
                <div className="text-right">
                  <p className="text-slate-500 text-xs">
                    {t('review:unlockHint', { current: totalCompleted, required: MIN_TO_UNLOCK })}
                  </p>
                </div>
              )}
            </div>
          </motion.div>

          {/* Due reviews grouped by world */}
          {dueReviews.length > 0 && Object.entries(groupedByWorld).map(([worldId, { world, items }]) => (
            <motion.div
              key={worldId}
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              className="card"
            >
              <h3 className="text-white font-medium mb-4 flex items-center gap-2">
                <span>{world.emoji}</span>
                {world.name}
                <span className="text-slate-500 text-sm">({t('review:questionCount', { count: items.length })})</span>
              </h3>
              <div className="space-y-2">
                {items.map((item) => (
                  <Link
                    key={item.key}
                    to={`/di-quest/case/${item.worldId}/${item.questId}/${item.challengeId}?review=1`}
                    className="flex items-center justify-between p-3 rounded-lg bg-slate-800/50 hover:bg-slate-700/50 transition-colors group"
                  >
                    <div>
                      <p className="text-white text-sm group-hover:text-brand-primary transition-colors">
                        {item.questName} — {item.challengeName}
                      </p>
                      <div className="flex items-center gap-3 mt-1">
                        <span className="text-slate-500 text-xs">
                          {t('review:lastScore', { score: item.lastScore })}
                        </span>
                        {item.daysSinceReview > 0 && (
                          <span className="text-slate-500 text-xs flex items-center gap-1">
                            <Clock className="w-3 h-3" />
                            {t('review:overdue', { days: item.daysSinceReview })}
                          </span>
                        )}
                      </div>
                    </div>
                    <ChevronRight className="w-4 h-4 text-slate-500 group-hover:text-brand-primary transition-colors" />
                  </Link>
                ))}
              </div>
            </motion.div>
          ))}
        </div>
      )}
    </div>
  )
}

export default ReviewQueue
