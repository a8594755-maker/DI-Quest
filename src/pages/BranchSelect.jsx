import { motion } from 'framer-motion'
import { Link } from 'react-router-dom'
import { Lock } from 'lucide-react'
import { BRANCHES } from '../data/branches'
import { WORLDS } from '../data/questData'
import { useQuest } from '../contexts/QuestContext'

function BranchSelect() {
  const { questStatus } = useQuest()

  const getBranchProgress = (branch) => {
    const worlds = WORLDS.filter(w => branch.worldIds.includes(w.id))
    const totalQuests = worlds.reduce((sum, w) => sum + w.quests.length, 0)
    const completedQuests = worlds.reduce(
      (sum, w) => sum + w.quests.filter(q => questStatus[q.id]?.completed).length,
      0
    )
    return { completedQuests, totalQuests, pct: totalQuests > 0 ? Math.round((completedQuests / totalQuests) * 100) : 0 }
  }

  return (
    <div className="max-w-6xl mx-auto p-6">
      <div className="mb-8">
        <h2 className="text-3xl font-bold text-white mb-2">DI Quest</h2>
        <p className="text-slate-400">選擇一條學習路線開始你的旅程</p>
      </div>

      <div className="grid gap-6 md:grid-cols-2">
        {BRANCHES.map((branch, i) => {
          const progress = getBranchProgress(branch)
          const isComingSoon = branch.comingSoon

          return (
            <motion.div
              key={branch.id}
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: i * 0.1 }}
            >
              {isComingSoon ? (
                <div className="relative rounded-2xl border-2 border-slate-800 bg-slate-900/50 p-8 opacity-60">
                  <div className="absolute top-4 right-4 px-3 py-1 bg-slate-700 text-slate-400 text-xs rounded-full font-medium">
                    Coming Soon
                  </div>
                  <div className={`w-16 h-16 rounded-2xl bg-gradient-to-br ${branch.color} flex items-center justify-center text-3xl shadow-lg grayscale`}>
                    {branch.emoji}
                  </div>
                  <h3 className="text-xl font-bold text-slate-500 mt-4">{branch.name}</h3>
                  <p className="text-sm text-slate-600 mt-2">{branch.description}</p>
                </div>
              ) : (
                <Link to={`/di-quest/branch/${branch.id}`}>
                  <div className={`relative rounded-2xl border-2 border-slate-700 hover:border-slate-500 bg-slate-900/80 p-8 transition-all duration-300 hover:scale-[1.02] cursor-pointer`}>
                    <div className={`w-16 h-16 rounded-2xl bg-gradient-to-br ${branch.color} flex items-center justify-center text-3xl shadow-lg`}>
                      {branch.emoji}
                    </div>
                    <h3 className="text-xl font-bold text-white mt-4">{branch.name}</h3>
                    <p className="text-sm text-slate-400 mt-2">{branch.description}</p>
                    <div className="mt-4 flex items-center gap-3">
                      <span className="text-xs text-slate-500">{branch.worldIds.length} 個世界</span>
                      {progress.completedQuests > 0 && (
                        <>
                          <span className="text-slate-700">|</span>
                          <div className="flex items-center gap-2 flex-1">
                            <div className="flex-1 h-1.5 bg-slate-700 rounded-full max-w-[120px]">
                              <div className="h-full bg-brand-primary rounded-full transition-all" style={{ width: `${progress.pct}%` }} />
                            </div>
                            <span className="text-xs text-slate-500">{progress.completedQuests}/{progress.totalQuests}</span>
                          </div>
                        </>
                      )}
                    </div>
                  </div>
                </Link>
              )}
            </motion.div>
          )
        })}
      </div>
    </div>
  )
}

export default BranchSelect
