import { useState, useEffect } from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import { X, Zap } from 'lucide-react'
import { useTranslation } from 'react-i18next'
import { useQuest } from '../contexts/QuestContext'
import { useAuth } from '../contexts/AuthContext'
import { supabase } from '../utils/supabase'
import { getLocalToday } from '../utils/localDate'
import StreakFlame from './StreakFlame'
import StreakCalendar from './StreakCalendar'
import AnimatedNumber from './AnimatedNumber'

function DailyCheckinModal({ isOpen, onClose }) {
  const { t } = useTranslation('social')
  const { streakDays, totalXp, analytics, dispatch, longestStreak = 0, streakFreezes = 1, checkedInToday } = useQuest()
  const { isAuthenticated, user } = useAuth()
  const [checkedIn, setCheckedIn] = useState(checkedInToday)
  const [bonusXp, setBonusXp] = useState(0)

  // Sync if checkedInToday changes (e.g. loaded from storage after mount)
  useEffect(() => {
    if (checkedInToday) setCheckedIn(true)
  }, [checkedInToday])

  // Daily XP goal
  const dailyGoal = 50
  const today = getLocalToday()
  const todayStats = analytics?.dailyStats?.[today] || { xpEarned: 0 }
  const dailyProgress = todayStats.xpEarned || 0

  // Get checkin dates from analytics
  const checkinDates = Object.keys(analytics?.dailyStats || {}).filter(
    d => (analytics.dailyStats[d]?.challengesCompleted > 0) || (analytics.dailyStats[d]?.xpEarned > 0)
  )

  const handleCheckin = async () => {
    // Calculate bonus XP: base 10 + 5 per streak day, max 50
    const bonus = Math.min(10 + streakDays * 5, 50)
    setBonusXp(bonus)

    // Dispatch streak update and XP bonus
    dispatch({ type: 'DAILY_CHECKIN', payload: { bonusXp: bonus } })

    // Record to Supabase if authenticated
    if (isAuthenticated && user) {
      try {
        await supabase.from('daily_checkins').upsert({
          user_id: user.id,
          checkin_date: today,
          xp_earned: bonus,
        }, { onConflict: 'user_id,checkin_date' })
      } catch {}
    }

    setCheckedIn(true)
  }

  return (
    <AnimatePresence>
      {isOpen && (
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          exit={{ opacity: 0 }}
          className="fixed inset-0 z-[60] flex items-center justify-center bg-black/60 backdrop-blur-sm p-4"
          onClick={onClose}
        >
          <motion.div
            initial={{ opacity: 0, scale: 0.9, y: 20 }}
            animate={{ opacity: 1, scale: 1, y: 0 }}
            exit={{ opacity: 0, scale: 0.9, y: 20 }}
            transition={{ type: 'spring', damping: 25, stiffness: 300 }}
            className="w-full max-w-sm bg-brand-dark border border-slate-700 rounded-2xl p-6 relative"
            onClick={(e) => e.stopPropagation()}
          >
            {/* Close button */}
            <button
              onClick={onClose}
              className="absolute top-3 right-3 text-slate-500 hover:text-slate-300 transition-colors"
            >
              <X className="w-5 h-5" />
            </button>

            {/* Content */}
            <div className="text-center">
              {/* Flame */}
              <motion.div
                initial={{ scale: 0 }}
                animate={{ scale: 1 }}
                transition={{ type: 'spring', damping: 10, stiffness: 200, delay: 0.1 }}
                className="flex justify-center mb-4"
              >
                <StreakFlame streakDays={checkedIn ? streakDays + 1 : streakDays} size="xl" />
              </motion.div>

              <h2 className="text-xl font-bold text-white mb-1">
                {checkedIn ? t('checkin.congrats') : t('checkin.streakTitle')}
              </h2>
              <p className="text-slate-400 text-sm mb-5">
                {checkedIn ? t('checkin.keepGoing') : t('checkin.title')}
              </p>

              {/* Calendar */}
              <div className="flex justify-center mb-5">
                <StreakCalendar
                  checkinDates={checkedIn ? [...checkinDates, today] : checkinDates}
                  mode="week"
                />
              </div>

              {/* Daily XP Goal */}
              <div className="bg-slate-800/50 rounded-xl p-4 mb-5">
                <div className="flex items-center justify-between mb-2">
                  <span className="text-sm text-slate-400">{t('checkin.dailyGoal')}</span>
                  <span className="text-sm text-brand-accent font-medium">
                    {t('checkin.goalTarget', { current: dailyProgress, target: dailyGoal })}
                  </span>
                </div>
                <div className="progress-bar h-2.5">
                  <div
                    className="h-full bg-brand-accent rounded-full transition-all duration-500"
                    style={{ width: `${Math.min(100, (dailyProgress / dailyGoal) * 100)}%` }}
                  />
                </div>
                <p className="text-xs text-slate-500 mt-2">
                  {dailyProgress >= dailyGoal
                    ? t('checkin.dailyGoalDone')
                    : t('checkin.dailyGoalDesc', { remaining: dailyGoal - dailyProgress })
                  }
                </p>
              </div>

              {/* Check-in button or success */}
              <AnimatePresence mode="wait">
                {checkedIn ? (
                  <motion.div
                    key="success"
                    initial={{ opacity: 0, scale: 0.8 }}
                    animate={{ opacity: 1, scale: 1 }}
                    className="space-y-3"
                  >
                    <div className="flex items-center justify-center gap-2 text-brand-accent">
                      <Zap className="w-5 h-5" />
                      <span className="text-lg font-bold">
                        {t('checkin.bonusXp', { xp: bonusXp })}
                      </span>
                    </div>
                    <button onClick={onClose} className="btn-primary w-full">
                      {t('checkin.checked')}
                    </button>
                  </motion.div>
                ) : (
                  <motion.div key="checkin" className="space-y-3">
                    <button onClick={handleCheckin} className="btn-primary w-full">
                      {t('checkin.checkInNow')}
                    </button>
                    <button onClick={onClose} className="text-slate-500 text-sm hover:text-slate-300 transition-colors">
                      {t('checkin.dismiss')}
                    </button>
                  </motion.div>
                )}
              </AnimatePresence>

              {/* Streak freeze info */}
              <div className="mt-4 pt-4 border-t border-slate-700/50">
                <p className="text-xs text-slate-500">
                  {streakFreezes > 0
                    ? t('checkin.streakFreezeDesc', { count: streakFreezes })
                    : t('checkin.streakFreezeNone')
                  }
                </p>
              </div>
            </div>
          </motion.div>
        </motion.div>
      )}
    </AnimatePresence>
  )
}

export default DailyCheckinModal
