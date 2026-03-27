import { useState } from 'react'
import { motion } from 'framer-motion'
import { Link } from 'react-router-dom'
import { Lock, CheckCircle, Circle } from 'lucide-react'
import { WORLDS } from '../data/questData'
import { useQuest } from '../contexts/QuestContext'

function QuestMap() {
  const [expandedWorld, setExpandedWorld] = useState(1)
  const { questStatus, challengeStatus, isWorldUnlocked, isQuestUnlocked } = useQuest()

  const getQuestStatus = (quest) => {
    if (questStatus[quest.id]?.completed) return 'completed'
    // 有任何 challenge 完成就算 in-progress
    for (let i = 1; i <= (quest.challenges?.length || 0); i++) {
      if (challengeStatus[`${quest.id}-${i}`]?.completed) return 'in-progress'
    }
    if (!isQuestUnlocked(quest.id)) return 'locked'
    return 'available'
  }

  const getStatusIcon = (status) => {
    switch (status) {
      case 'completed':
        return <CheckCircle className="w-5 h-5 text-emerald-400" />
      case 'in-progress':
        return <Circle className="w-5 h-5 text-brand-primary animate-pulse" />
      case 'available':
        return <Circle className="w-5 h-5 text-slate-400" />
      default:
        return <Lock className="w-5 h-5 text-slate-500" />
    }
  }

  const getStatusStyle = (status) => {
    switch (status) {
      case 'completed':
        return 'border-emerald-500/30 bg-emerald-500/10'
      case 'in-progress':
        return 'border-brand-primary/50 bg-brand-primary/10'
      case 'available':
        return 'border-slate-600 bg-slate-800/80 hover:border-brand-primary/30'
      default:
        return 'border-slate-700 bg-slate-800/50 opacity-60 pointer-events-none'
    }
  }

  const getWorldProgress = (world) => {
    const total = world.quests.length
    const completed = world.quests.filter(q => questStatus[q.id]?.completed).length
    return { completed, total, pct: total > 0 ? Math.round((completed / total) * 100) : 0 }
  }

  return (
    <div className="max-w-6xl mx-auto p-6">
      <div className="mb-8">
        <h2 className="text-3xl font-bold text-white mb-2">關卡地圖</h2>
        <p className="text-slate-400">選擇一個世界開始你的學習之旅</p>
      </div>

      <div className="grid gap-4">
        {WORLDS.map((world, wi) => {
          const isExpanded = expandedWorld === world.id
          const unlocked = isWorldUnlocked(world.id)
          const progress = getWorldProgress(world)

          return (
            <motion.div
              key={world.id}
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: wi * 0.08 }}
              className={`rounded-xl border-2 overflow-hidden transition-all duration-300 ${
                isExpanded ? 'border-slate-600' : 'border-slate-800 hover:border-slate-700'
              }`}
            >
              <button
                onClick={() => setExpandedWorld(isExpanded ? null : world.id)}
                className="w-full p-6 flex items-center gap-4 text-left"
              >
                <div className={`w-14 h-14 rounded-xl bg-gradient-to-br ${world.color} flex items-center justify-center text-2xl shadow-lg ${!unlocked ? 'opacity-40 grayscale' : ''}`}>
                  {world.emoji}
                </div>
                <div className="flex-1">
                  <h3 className={`text-xl font-bold ${unlocked ? 'text-white' : 'text-slate-500'}`}>
                    {world.name}
                  </h3>
                  <p className={`text-sm mt-1 ${unlocked ? 'text-slate-400' : 'text-slate-600'}`}>
                    {world.description}
                  </p>
                  {unlocked && progress.completed > 0 && (
                    <div className="flex items-center gap-2 mt-2">
                      <div className="flex-1 h-1.5 bg-slate-700 rounded-full max-w-[200px]">
                        <div className="h-full bg-brand-primary rounded-full transition-all" style={{ width: `${progress.pct}%` }} />
                      </div>
                      <span className="text-xs text-slate-500">{progress.completed}/{progress.total}</span>
                    </div>
                  )}
                </div>
                {!unlocked && <Lock className="w-5 h-5 text-slate-600" />}
              </button>

              {isExpanded && unlocked && (
                <motion.div
                  initial={{ height: 0, opacity: 0 }}
                  animate={{ height: 'auto', opacity: 1 }}
                  exit={{ height: 0, opacity: 0 }}
                  className="border-t border-slate-800"
                >
                  <div className="p-6 grid gap-3">
                    {/* 講義閱讀入口 */}
                    <Link
                      to={`/di-quest/lesson/${world.id}`}
                      className="flex items-center gap-4 p-4 rounded-lg border border-brand-primary/30 bg-brand-primary/5 hover:bg-brand-primary/10 transition-colors"
                    >
                      <div className="w-8 h-8 rounded-full bg-brand-primary/20 flex items-center justify-center">
                        <span className="text-brand-primary text-sm">📖</span>
                      </div>
                      <span className="flex-1 font-medium text-brand-primary">閱讀講義</span>
                      <span className="text-slate-500 text-sm">先讀再練</span>
                    </Link>
                    {world.quests.map((quest, index) => {
                      const status = getQuestStatus(quest)
                      const hasChallenges = quest.challenges && quest.challenges.length > 0
                      const linkTo = hasChallenges
                        ? `/di-quest/quest/${world.id}/${quest.id}`
                        : '#'

                      return (
                        <Link
                          key={quest.id}
                          to={linkTo}
                          onClick={(e) => { if (!hasChallenges || status === 'locked') e.preventDefault() }}
                          className={`flex items-center gap-4 p-4 rounded-lg border transition-all duration-200 ${
                            status !== 'locked' && hasChallenges ? 'hover:scale-[1.02] cursor-pointer' : 'cursor-default'
                          } ${getStatusStyle(status)}`}
                        >
                          <div className="w-8 h-8 rounded-full bg-slate-900 flex items-center justify-center text-sm font-mono text-slate-400">
                            {index + 1}
                          </div>
                          {getStatusIcon(status)}
                          <span className={`flex-1 font-medium ${
                            status === 'locked' ? 'text-slate-500' : 'text-white'
                          }`}>
                            {quest.name}
                          </span>
                          {!hasChallenges && status !== 'locked' && (
                            <span className="px-2 py-1 bg-slate-700/50 text-slate-500 text-xs rounded">
                              開發中
                            </span>
                          )}
                          {quest.isBoss && (
                            <span className="px-2 py-1 bg-red-500/20 text-red-400 text-xs rounded font-bold">
                              BOSS
                            </span>
                          )}
                          <span className="text-slate-500 text-sm">{quest.xp} XP</span>
                        </Link>
                      )
                    })}
                  </div>
                </motion.div>
              )}
            </motion.div>
          )
        })}
      </div>
    </div>
  )
}

export default QuestMap
