import { useParams, Link } from 'react-router-dom'
import { ArrowLeft, FileQuestion, BookOpen, Trophy, CheckCircle, ExternalLink } from 'lucide-react'
import { motion } from 'framer-motion'
import { useTranslation } from 'react-i18next'
import { getWorld, getQuest } from '../data/questData'
import { getBranchForWorld } from '../data/branches'
import { useQuest } from '../contexts/QuestContext'
import { getQuestResources } from '../data/sqlExternalResources'

function QuestDetail() {
  const { t } = useTranslation(['quest', 'common'])
  const { worldId, questId } = useParams()
  const { challengeStatus, questStatus } = useQuest()

  const world = getWorld(worldId)
  const quest = getQuest(questId)
  const branch = getBranchForWorld(worldId)
  const backPath = branch ? `/di-quest/branch/${branch.id}` : '/di-quest'

  if (!quest || !world) {
    return (
      <div className="max-w-4xl mx-auto p-6 text-center py-20">
        <p className="text-slate-500 text-lg">{t('quest:questDetail.notFound')}</p>
        <Link to="/di-quest" className="btn-primary inline-block mt-4">{t('common:action.backToMap')}</Link>
      </div>
    )
  }

  const isCompleted = questStatus[questId]?.completed
  const externalResources = getQuestResources(questId)

  const getDifficultyLabel = (diff) => {
    if (diff === 'easy') return t('common:difficulty.easy')
    if (diff === 'medium') return t('common:difficulty.medium')
    return t('common:difficulty.hard')
  }

  return (
    <div className="max-w-4xl mx-auto p-6">
      <Link
        to={backPath}
        className="inline-flex items-center gap-2 text-slate-400 hover:text-white mb-6 transition-colors"
      >
        <ArrowLeft className="w-4 h-4" />
        {t('common:action.backToMap')}
      </Link>

      {/* 關卡標題 */}
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        className="card mb-6"
      >
        <div className="flex items-start justify-between mb-4">
          <div>
            <div className="flex items-center gap-2 mb-1">
              <span className="text-2xl">{world.emoji}</span>
              <span className="text-slate-500 text-sm">World {worldId}</span>
              {quest.isBoss && (
                <span className="px-2 py-0.5 bg-red-500/20 text-red-400 text-xs rounded font-bold">BOSS</span>
              )}
            </div>
            <h1 className="text-3xl font-bold text-white mt-1">{quest.name}</h1>
          </div>
          <div className="flex items-center gap-2 px-3 py-2 bg-brand-primary/20 rounded-lg">
            <Trophy className="w-5 h-5 text-brand-primary" />
            <span className="text-brand-primary font-bold">{quest.xp} XP</span>
          </div>
        </div>
        <p className="text-slate-300 text-lg">{quest.description}</p>
        {isCompleted && (
          <div className="mt-4 flex items-center gap-2 text-emerald-400">
            <CheckCircle className="w-5 h-5" />
            <span className="font-medium">{t('common:status.completed')}</span>
          </div>
        )}
      </motion.div>

      {/* 講義閱讀區 */}
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.1 }}
        className="card mb-6 border-brand-primary/30 bg-brand-primary/5"
      >
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-4">
            <div className="w-12 h-12 rounded-lg bg-brand-primary/20 flex items-center justify-center">
              <BookOpen className="w-6 h-6 text-brand-primary" />
            </div>
            <div>
              <h2 className="text-white font-bold text-lg">{t('quest:questDetail.readMaterial')}</h2>
              <p className="text-slate-400 text-sm">
                {t('quest:questDetail.readMaterialDesc', { worldName: world.name })}
              </p>
            </div>
          </div>
          <Link
            to={`/di-quest/lesson/${worldId}`}
            className="flex items-center gap-2 px-6 py-3 bg-brand-primary text-white rounded-lg hover:bg-blue-600 transition-colors font-medium"
          >
            <BookOpen className="w-4 h-4" />
            {t('common:action.startReading')}
          </Link>
        </div>
      </motion.div>

      {/* 挑戰列表 */}
      <div className="grid gap-4 mb-6">
        <h2 className="text-xl font-bold text-white flex items-center gap-2">
          <FileQuestion className="w-5 h-5 text-brand-secondary" />
          {t('quest:questDetail.caseStudyQuestions')}
        </h2>

        {quest.challenges && quest.challenges.length > 0 ? (
          quest.challenges.map((item, index) => {
            const cKey = `${questId}-${item.id}`
            const cStatus = challengeStatus[cKey]
            const cCompleted = cStatus?.completed

            return (
              <motion.div
                key={item.id}
                initial={{ opacity: 0, x: -20 }}
                animate={{ opacity: 1, x: 0 }}
                transition={{ delay: 0.2 + index * 0.08 }}
              >
                <Link
                  to={`/di-quest/case/${worldId}/${questId}/${item.id}`}
                  className="card flex items-center gap-4 hover:border-brand-primary/50 transition-colors group"
                >
                  <div className={`w-12 h-12 rounded-lg flex items-center justify-center text-xl font-bold transition-colors ${
                    cCompleted
                      ? 'bg-emerald-500/20 text-emerald-400'
                      : 'bg-slate-800 text-slate-400 group-hover:bg-brand-primary/20 group-hover:text-brand-primary'
                  }`}>
                    {cCompleted ? <CheckCircle className="w-6 h-6" /> : index + 1}
                  </div>
                  <div className="flex-1">
                    <h3 className="text-white font-medium group-hover:text-brand-primary transition-colors">
                      {item.name}
                    </h3>
                    <div className="flex items-center gap-3 mt-1">
                      <span className={`text-xs px-2 py-0.5 rounded ${
                        item.difficulty === 'easy' ? 'bg-emerald-500/20 text-emerald-400' :
                        item.difficulty === 'medium' ? 'bg-yellow-500/20 text-yellow-400' :
                        'bg-red-500/20 text-red-400'
                      }`}>
                        {getDifficultyLabel(item.difficulty)}
                      </span>
                      <span className="text-slate-500 text-sm">{item.type}</span>
                      {cStatus?.earnedXp && (
                        <span className="text-brand-accent text-xs">+{cStatus.earnedXp} XP</span>
                      )}
                    </div>
                  </div>
                  <FileQuestion className="w-5 h-5 text-slate-500 group-hover:text-brand-primary transition-colors" />
                </Link>
              </motion.div>
            )
          })
        ) : (
          <div className="card text-center py-12">
            <p className="text-slate-500">{t('quest:questDetail.questInDev')}</p>
            <p className="text-slate-600 text-sm mt-2">{t('quest:questDetail.questInDevHint')}</p>
            <Link to={`/di-quest/lesson/${worldId}`} className="btn-primary inline-block mt-4">
              {t('common:action.readLesson')}
            </Link>
          </div>
        )}
      </div>

      {/* 推薦外部練習 */}
      {externalResources.length > 0 && (
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.4 }}
          className="mb-6"
        >
          <h2 className="text-xl font-bold text-white flex items-center gap-2 mb-4">
            <ExternalLink className="w-5 h-5 text-brand-accent" />
            {t('quest:questDetail.externalPractice')}
          </h2>
          <div className="grid gap-3">
            {externalResources.map((r, i) => (
              <a
                key={i}
                href={r.url}
                target="_blank"
                rel="noopener noreferrer"
                className="card flex items-center gap-4 hover:border-brand-accent/50 transition-colors group"
              >
                <span className={`px-2.5 py-1 text-xs font-bold rounded whitespace-nowrap ${
                  r.source === 'LeetCode'
                    ? 'bg-amber-500/20 text-amber-400'
                    : 'bg-cyan-500/20 text-cyan-400'
                }`}>
                  {r.source}
                </span>

                <div className="flex-1 min-w-0">
                  <span className="text-white group-hover:text-brand-accent transition-colors">
                    {r.id ? `#${r.id} ` : ''}{r.title}
                  </span>
                  {r.company && (
                    <span className="ml-2 text-slate-500 text-sm">from {r.company}</span>
                  )}
                </div>

                <span className={`text-xs px-2 py-0.5 rounded whitespace-nowrap ${
                  r.difficulty === 'easy' ? 'bg-emerald-500/20 text-emerald-400' :
                  r.difficulty === 'medium' ? 'bg-yellow-500/20 text-yellow-400' :
                  'bg-red-500/20 text-red-400'
                }`}>
                  {r.difficulty === 'easy' ? 'Easy' : r.difficulty === 'medium' ? 'Medium' : 'Hard'}
                </span>

                <ExternalLink className="w-4 h-4 text-slate-500 group-hover:text-brand-accent transition-colors flex-shrink-0" />
              </a>
            ))}
          </div>
          <p className="text-slate-600 text-xs mt-3">
            {t('quest:questDetail.externalPracticeHint')}
          </p>
        </motion.div>
      )}

    </div>
  )
}

export default QuestDetail
