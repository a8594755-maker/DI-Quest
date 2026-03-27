import { motion } from 'framer-motion'
import { Trophy, Flame, Clock, Target, TrendingUp, Award, Zap, BarChart3 } from 'lucide-react'
import { WORLDS } from '../data/questData'
import { BRANCHES } from '../data/branches'
import { useQuest } from '../contexts/QuestContext'
import { DailyActivityChart, XpTrendChart, TimePerChallengeChart } from '../components/AnalyticsCharts'

function ProgressDashboard() {
  const { totalXp, levelInfo, questStatus, challengeStatus, streakDays, analytics, getAnalyticsSummary } = useQuest()

  const totalQuestsCompleted = Object.values(questStatus).filter(q => q.completed).length
  const totalChallengesCompleted = Object.values(challengeStatus).filter(c => c.completed).length

  const branchProgress = BRANCHES.filter(b => b.worldIds.length > 0).map(branch => {
    const worlds = WORLDS.filter(w => branch.worldIds.includes(w.id))
    return {
      branchId: branch.id,
      branchName: `${branch.emoji} ${branch.name}`,
      worlds: worlds.map(w => {
        const completed = w.quests.filter(q => questStatus[q.id]?.completed).length
        return {
          worldId: w.id,
          name: `${w.emoji} ${w.name}`,
          completed,
          total: w.quests.length,
          pct: w.quests.length > 0 ? Math.round((completed / w.quests.length) * 100) : 0,
        }
      }),
    }
  })

  const recentActivity = Object.entries(challengeStatus)
    .filter(([, v]) => v.completed)
    .map(([key, v]) => {
      const [qId, cId] = [key.substring(0, key.lastIndexOf('-')), key.substring(key.lastIndexOf('-') + 1)]
      return { key, questId: qId, challengeId: cId, ...v }
    })
    .sort((a, b) => (b.earnedXp || 0) - (a.earnedXp || 0))
    .slice(0, 8)

  const ACHIEVEMENT_DEFS = [
    { id: 'first_case', name: '第一個 Case Study', emoji: '🐣', desc: '完成第一個挑戰', check: () => totalChallengesCompleted >= 1 },
    { id: 'streak_3', name: '連續三天', emoji: '🔥', desc: '連續 3 天登入學習', check: () => streakDays >= 3 },
    { id: 'streak_7', name: '連續七天', emoji: '🔥', desc: '連續 7 天登入學習', check: () => streakDays >= 7 },
    { id: 'world1_done', name: '問題拆解大師', emoji: '🏝️', desc: '完成 World 1 所有關卡', check: () => questStatus['1-6']?.completed },
    { id: 'ten_challenges', name: 'Case Study 達人', emoji: '🧪', desc: '完成 10 個挑戰', check: () => totalChallengesCompleted >= 10 },
    { id: 'boss_killer', name: 'Boss 征服者', emoji: '💎', desc: '通過任何 Boss 關', check: () => ['1-6','2-6','3-6','4-6','5-6','6-6','7-6','8-6'].some(id => questStatus[id]?.completed) },
  ]

  return (
    <div className="max-w-5xl mx-auto p-6">
      <div className="mb-8">
        <h2 className="text-3xl font-bold text-white mb-2">進度儀表板</h2>
        <p className="text-slate-400">追蹤你的學習進度與成就</p>
      </div>

      {/* 等級與 XP 卡 */}
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        className="card mb-6"
      >
        <div className="flex items-center justify-between mb-6">
          <div className="flex items-center gap-4">
            <div className="w-16 h-16 rounded-2xl bg-gradient-to-br from-brand-primary to-brand-secondary flex items-center justify-center text-2xl font-bold text-white">
              {levelInfo.level}
            </div>
            <div>
              <h3 className="text-xl font-bold text-white">{levelInfo.title}</h3>
              <p className="text-slate-400">Lv.{levelInfo.level} Analyst</p>
            </div>
          </div>
          <div className="text-right">
            <div className="flex items-center gap-2 text-2xl font-bold text-white">
              <Zap className="w-6 h-6 text-brand-accent" />
              {totalXp}
              <span className="text-slate-500 text-lg">/ {levelInfo.xpForNext} XP</span>
            </div>
            <p className="text-slate-400 text-sm">
              還需要 {Math.max(0, levelInfo.xpForNext - totalXp)} XP 升級
            </p>
          </div>
        </div>
        <div className="progress-bar h-3">
          <div
            className="progress-fill h-full rounded-full"
            style={{ width: `${Math.round(levelInfo.progress * 100)}%` }}
          />
        </div>
      </motion.div>

      {/* 統計卡片 */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
        {[
          { icon: Trophy, color: 'emerald', label: '完成關卡', value: totalQuestsCompleted },
          { icon: Target, color: 'blue', label: '通過挑戰', value: totalChallengesCompleted },
          { icon: Flame, color: 'orange', label: '連續學習', value: `${streakDays} 天` },
          { icon: Zap, color: 'purple', label: '總 XP', value: totalXp },
        ].map((stat, i) => (
          <motion.div
            key={stat.label}
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.1 + i * 0.1 }}
            className="card"
          >
            <div className="flex items-center gap-3 mb-2">
              <div className={`w-10 h-10 rounded-lg bg-${stat.color}-500/20 flex items-center justify-center`}>
                <stat.icon className={`w-5 h-5 text-${stat.color}-400`} />
              </div>
              <span className="text-slate-400">{stat.label}</span>
            </div>
            <p className="text-2xl font-bold text-white">{stat.value}</p>
          </motion.div>
        ))}
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        {/* 世界進度 */}
        <motion.div
          initial={{ opacity: 0, x: -20 }}
          animate={{ opacity: 1, x: 0 }}
          transition={{ delay: 0.5 }}
          className="card"
        >
          <h3 className="text-lg font-bold text-white mb-4 flex items-center gap-2">
            <TrendingUp className="w-5 h-5 text-brand-primary" />
            世界進度
          </h3>
          <div className="space-y-6">
            {branchProgress.map((branch) => (
              <div key={branch.branchId}>
                <h4 className="text-sm font-semibold text-slate-300 mb-3">{branch.branchName}</h4>
                <div className="space-y-3 pl-2">
                  {branch.worlds.map((w) => (
                    <div key={w.worldId}>
                      <div className="flex items-center justify-between mb-1">
                        <span className={`text-sm ${w.pct > 0 ? 'text-white' : 'text-slate-500'}`}>
                          {w.name}
                        </span>
                        <span className={`text-sm ${w.pct > 0 ? 'text-brand-primary' : 'text-slate-600'}`}>
                          {w.completed}/{w.total} ({w.pct}%)
                        </span>
                      </div>
                      <div className="progress-bar h-2">
                        <div
                          className="h-full bg-brand-primary rounded-full transition-all duration-500"
                          style={{ width: `${w.pct}%` }}
                        />
                      </div>
                    </div>
                  ))}
                </div>
              </div>
            ))}
          </div>
        </motion.div>

        {/* 近期完成 */}
        <motion.div
          initial={{ opacity: 0, x: 20 }}
          animate={{ opacity: 1, x: 0 }}
          transition={{ delay: 0.6 }}
          className="card"
        >
          <h3 className="text-lg font-bold text-white mb-4 flex items-center gap-2">
            <Clock className="w-5 h-5 text-brand-secondary" />
            已完成的挑戰
          </h3>
          <div className="space-y-3">
            {recentActivity.length === 0 ? (
              <p className="text-slate-500 text-sm text-center py-4">還沒有完成任何挑戰</p>
            ) : (
              recentActivity.map((a) => (
                <div
                  key={a.key}
                  className="flex items-center justify-between py-2 border-b border-slate-700/50 last:border-0"
                >
                  <div className="flex items-center gap-3">
                    <div className="w-2 h-2 rounded-full bg-brand-primary" />
                    <span className="text-slate-300 text-sm">Quest {a.questId} - 挑戰 {a.challengeId}</span>
                  </div>
                  <span className="text-brand-accent font-medium text-sm">+{a.earnedXp || 0} XP</span>
                </div>
              ))
            )}
          </div>
        </motion.div>
      </div>

      {/* 成就區 */}
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.7 }}
        className="card mt-6"
      >
        <h3 className="text-lg font-bold text-white mb-4 flex items-center gap-2">
          <Award className="w-5 h-5 text-brand-accent" />
          成就
        </h3>
        <div className="grid grid-cols-2 md:grid-cols-3 gap-4">
          {ACHIEVEMENT_DEFS.map((ach) => {
            const unlocked = ach.check()
            return (
              <div
                key={ach.id}
                className={`p-4 rounded-lg border ${
                  unlocked
                    ? 'bg-emerald-500/10 border-emerald-500/30'
                    : 'bg-slate-800/50 border-slate-700 opacity-50'
                }`}
              >
                <p className="text-2xl mb-2">{ach.emoji}</p>
                <p className={`font-medium text-sm ${unlocked ? 'text-white' : 'text-slate-400'}`}>
                  {ach.name}
                </p>
                <p className={`text-xs mt-1 ${unlocked ? 'text-emerald-400' : 'text-slate-500'}`}>
                  {ach.desc}
                </p>
              </div>
            )
          })}
        </div>
      </motion.div>

      {/* 學習分析 */}
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.8 }}
        className="mt-6"
      >
        <h3 className="text-lg font-bold text-white mb-4 flex items-center gap-2">
          <BarChart3 className="w-5 h-5 text-brand-primary" />
          學習分析
        </h3>

        {/* 分析統計卡片 */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
          <div className="card">
            <p className="text-slate-400 text-sm mb-1">平均答題時間</p>
            <p className="text-2xl font-bold text-white">
              {getAnalyticsSummary.avgChallengeTimeMs > 0
                ? `${Math.round(getAnalyticsSummary.avgChallengeTimeMs / 1000)}s`
                : '—'}
            </p>
          </div>
          <div className="card">
            <p className="text-slate-400 text-sm mb-1">本週學習時間</p>
            <p className="text-2xl font-bold text-white">
              {getAnalyticsSummary.weeklyTimeMs > 0
                ? `${Math.round(getAnalyticsSummary.weeklyTimeMs / 60000)} 分鐘`
                : '—'}
            </p>
          </div>
          <div className="card">
            <p className="text-slate-400 text-sm mb-1">學習速度</p>
            <p className="text-2xl font-bold text-white">
              {getAnalyticsSummary.velocityPerDay} 題/天
            </p>
          </div>
        </div>

        {/* 圖表 */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          <DailyActivityChart dailyStats={analytics.dailyStats} />
          <XpTrendChart dailyStats={analytics.dailyStats} />
        </div>
        <div className="mt-6">
          <TimePerChallengeChart challengeTimings={analytics.challengeTimings} />
        </div>
      </motion.div>
    </div>
  )
}

export default ProgressDashboard
