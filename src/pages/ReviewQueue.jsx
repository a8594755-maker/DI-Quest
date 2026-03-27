import { Link } from 'react-router-dom'
import { RotateCcw, ChevronRight, Clock } from 'lucide-react'
import { motion } from 'framer-motion'
import { useQuest } from '../contexts/QuestContext'
import { getDueReviews } from '../utils/spacedRepetition'
import { getQuest, getChallenge, getWorld } from '../data/questData'

function ReviewQueue() {
  const { reviewSchedule, challengeStatus } = useQuest()
  const today = new Date().toISOString().slice(0, 10)
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
          複習佇列
        </h2>
        <p className="text-slate-400">
          根據你的答題表現，系統會自動排定需要複習的題目。
        </p>
      </div>

      {dueReviews.length === 0 ? (
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          className="card text-center py-16"
        >
          <p className="text-4xl mb-4">🎉</p>
          <p className="text-white text-lg font-medium mb-2">目前沒有待複習的題目！</p>
          <p className="text-slate-400 mb-6">繼續完成新的挑戰，系統會自動幫你排定複習時間。</p>
          <Link to="/di-quest/map" className="btn-primary">
            回到地圖
          </Link>
        </motion.div>
      ) : (
        <div className="space-y-6">
          <div className="card">
            <p className="text-white font-medium">
              共 <span className="text-brand-primary">{dueReviews.length}</span> 題待複習
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
                <span className="text-slate-500 text-sm">({items.length} 題)</span>
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
                          上次得分：{item.lastScore}
                        </span>
                        {item.daysSinceReview > 0 && (
                          <span className="text-slate-500 text-xs flex items-center gap-1">
                            <Clock className="w-3 h-3" />
                            逾期 {item.daysSinceReview} 天
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
