import { Link } from 'react-router-dom'
import { RotateCcw, ChevronRight, Clock } from 'lucide-react'
import { motion } from 'framer-motion'
import { useTranslation, Trans } from 'react-i18next'
import { useQuest } from '../contexts/QuestContext'
import { getDueReviews } from '../utils/spacedRepetition'
import { getQuest, getChallenge, getWorld } from '../data/questData'
import { getLocalToday } from '../utils/localDate'

function ReviewQueue() {
  const { t } = useTranslation(['review', 'common'])
  const { reviewSchedule, challengeStatus } = useQuest()
  const today = getLocalToday()
  const dueReviews = getDueReviews(reviewSchedule, today)

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

  return (
    <div className="max-w-3xl mx-auto p-6">
      <div className="mb-8">
        <h2 className="text-3xl font-bold text-white mb-2 flex items-center gap-3">
          <RotateCcw className="w-8 h-8 text-brand-primary" />
          {t('review:title')}
        </h2>
        <p className="text-slate-400">
          {t('review:subtitle')}
        </p>
      </div>

      {dueReviews.length === 0 ? (
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
          <div className="card">
            <p className="text-white font-medium">
              <Trans i18nKey="review:totalDue" values={{ count: dueReviews.length }}>
                <span className="text-brand-primary" />
              </Trans>
            </p>
          </div>

          {Object.entries(groupedByWorld).map(([worldId, { world, items }]) => (
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
