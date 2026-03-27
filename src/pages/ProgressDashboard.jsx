import { motion } from 'framer-motion'
import { Trophy, Flame, Clock, Target, TrendingUp, Award, Zap, BarChart3 } from 'lucide-react'
import { useTranslation } from 'react-i18next'
import { WORLDS } from '../data/questData'
import { BRANCHES } from '../data/branches'
import { useQuest } from '../contexts/QuestContext'
import { DailyActivityChart, XpTrendChart, TimePerChallengeChart } from '../components/AnalyticsCharts'
import AnimatedNumber from '../components/AnimatedNumber'

function ProgressDashboard() {
  const { t } = useTranslation(['progress', 'common'])
  const { totalXp, levelInfo, questStatus, challengeStatus, streakDays, analytics, getAnalyticsSummary } = useQuest()

  const totalQuestsCompleted = Object.values(questStatus).filter(q => q.completed).length
  const totalChallengesCompleted = Object.values(challengeStatus).filter(c => c.completed).length

  const branchProgress = BRANCHES.filter(b => b.worldIds.length > 0).map(branch => {
    const worlds = WORLDS.filter(w => branch.worldIds.includes(w.id))
    const branchName = t(`common:branch.${branch.id}.name`, branch.name)
    return {
      branchId: branch.id,
      branchName: `${branch.emoji} ${branchName}`,
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
    { id: 'first_case', emoji: '🐣', check: () => totalChallengesCompleted >= 1 },
    { id: 'streak_3', emoji: '🔥', check: () => streakDays >= 3 },
    { id: 'streak_7', emoji: '🔥', check: () => streakDays >= 7 },
    { id: 'world1_done', emoji: '🏝️', check: () => questStatus['1-6']?.completed },
    { id: 'ten_challenges', emoji: '🧪', check: () => totalChallengesCompleted >= 10 },
    { id: 'boss_killer', emoji: '💎', check: () => ['1-6','2-6','3-6','4-6','5-6','6-6','7-6','8-6'].some(id => questStatus[id]?.completed) },
  ]

  return (
    <div className="max-w-5xl mx-auto p-4 sm:p-6">
      <div className="mb-6 sm:mb-8">
        <h2 className="text-2xl sm:text-3xl font-bold text-white mb-2">{t('progress:dashboard.title')}</h2>
        <p className="text-slate-400">{t('progress:dashboard.subtitle')}</p>
      </div>

      {/* 等級與 XP 卡 */}
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        className="card mb-6"
      >
        <div className="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-4 mb-6">
          <div className="flex items-center gap-3 sm:gap-4">
            <div className="w-12 h-12 sm:w-16 sm:h-16 rounded-2xl bg-gradient-to-br from-brand-primary to-brand-secondary flex items-center justify-center text-xl sm:text-2xl font-bold text-white">
              {levelInfo.level}
            </div>
            <div>
              <h3 className="text-lg sm:text-xl font-bold text-white">{levelInfo.title}</h3>
              <p className="text-slate-400 text-sm">Lv.{levelInfo.level} Analyst</p>
            </div>
          </div>
          <div className="text-left sm:text-right">
            <div className="flex items-center gap-2 text-xl sm:text-2xl font-bold text-white">
              <Zap className="w-5 h-5 sm:w-6 sm:h-6 text-brand-accent" />
              <AnimatedNumber value={totalXp} />
              <span className="text-slate-400 text-base sm:text-lg">/ {levelInfo.xpForNext} XP</span>
            </div>
            <p className="text-slate-400 text-xs sm:text-sm">
              {t('progress:dashboard.needXp', { amount: Math.max(0, levelInfo.xpForNext - totalXp) })}
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
      <div className="grid grid-cols-2 md:grid-cols-4 gap-3 sm:gap-4 mb-6">
        {[
          { icon: Trophy, color: 'emerald', label: t('progress:dashboard.questsCompleted'), value: totalQuestsCompleted },
          { icon: Target, color: 'blue', label: t('progress:dashboard.challengesPassed'), value: totalChallengesCompleted },
          { icon: Flame, color: 'orange', label: t('progress:dashboard.streakDays'), value: t('progress:dashboard.streakValue', { count: streakDays }) },
          { icon: Zap, color: 'purple', label: t('progress:dashboard.totalXp'), value: totalXp },
        ].map((stat, i) => (
          <motion.div
            key={stat.label}
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: Math.min(0.05 + i * 0.05, 0.25) }}
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
          transition={{ delay: 0.15 }}
          className="card"
        >
          <h3 className="text-lg font-bold text-white mb-4 flex items-center gap-2">
            <TrendingUp className="w-5 h-5 text-brand-primary" />
            {t('progress:dashboard.worldProgress')}
          </h3>
          <div className="space-y-6">
            {branchProgress.map((branch) => (
              <div key={branch.branchId}>
                <h4 className="text-sm font-semibold text-slate-300 mb-3">{branch.branchName}</h4>
                <div className="space-y-3 pl-2">
                  {branch.worlds.map((w) => (
                    <div key={w.worldId}>
                      <div className="flex items-center justify-between mb-1">
                        <span className={`text-sm ${w.pct > 0 ? 'text-white' : 'text-slate-400'}`}>
                          {w.name}
                        </span>
                        <span className={`text-sm ${w.pct > 0 ? 'text-brand-primary' : 'text-slate-500'}`}>
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
          transition={{ delay: 0.2 }}
          className="card"
        >
          <h3 className="text-lg font-bold text-white mb-4 flex items-center gap-2">
            <Clock className="w-5 h-5 text-brand-secondary" />
            {t('progress:dashboard.completedChallenges')}
          </h3>
          <div className="space-y-3">
            {recentActivity.length === 0 ? (
              <p className="text-slate-400 text-sm text-center py-4">{t('progress:dashboard.noChallenges')}</p>
            ) : (
              recentActivity.map((a) => (
                <div
                  key={a.key}
                  className="flex items-center justify-between py-2 border-b border-slate-700/50 last:border-0"
                >
                  <div className="flex items-center gap-3">
                    <div className="w-2 h-2 rounded-full bg-brand-primary" />
                    <span className="text-slate-300 text-sm">{t('progress:dashboard.challengeLabel', { questId: a.questId, challengeId: a.challengeId })}</span>
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
        transition={{ delay: 0.15 }}
        className="card mt-6"
      >
        <h3 className="text-lg font-bold text-white mb-4 flex items-center gap-2">
          <Award className="w-5 h-5 text-brand-accent" />
          {t('progress:dashboard.achievements')}
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
                  {t(`progress:achievement.${ach.id}`)}
                </p>
                <p className={`text-xs mt-1 ${unlocked ? 'text-emerald-400' : 'text-slate-500'}`}>
                  {t(`progress:achievement.${ach.id}_desc`)}
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
        transition={{ delay: 0.2 }}
        className="mt-6"
      >
        <h3 className="text-lg font-bold text-white mb-4 flex items-center gap-2">
          <BarChart3 className="w-5 h-5 text-brand-primary" />
          {t('progress:dashboard.analytics')}
        </h3>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
          <div className="card">
            <p className="text-slate-400 text-sm mb-1">{t('progress:dashboard.avgTime')}</p>
            <p className="text-2xl font-bold text-white">
              {getAnalyticsSummary.avgChallengeTimeMs > 0
                ? `${Math.round(getAnalyticsSummary.avgChallengeTimeMs / 1000)}s`
                : '—'}
            </p>
          </div>
          <div className="card">
            <p className="text-slate-400 text-sm mb-1">{t('progress:dashboard.weeklyTime')}</p>
            <p className="text-2xl font-bold text-white">
              {getAnalyticsSummary.weeklyTimeMs > 0
                ? t('progress:dashboard.weeklyMinutes', { count: Math.round(getAnalyticsSummary.weeklyTimeMs / 60000) })
                : '—'}
            </p>
          </div>
          <div className="card">
            <p className="text-slate-400 text-sm mb-1">{t('progress:dashboard.velocity')}</p>
            <p className="text-2xl font-bold text-white">
              {t('progress:dashboard.velocityValue', { count: getAnalyticsSummary.velocityPerDay })}
            </p>
          </div>
        </div>

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
