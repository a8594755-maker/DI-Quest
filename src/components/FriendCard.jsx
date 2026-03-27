import { motion } from 'framer-motion'
import { useTranslation } from 'react-i18next'
import { getLevelInfo } from '../utils/xpCalculator'
import UserAvatar from './UserAvatar'
import StreakFlame from './StreakFlame'

function FriendCard({ friend, rank, isCurrentUser, actions }) {
  const { t } = useTranslation('social')
  const levelInfo = getLevelInfo(friend.total_xp || 0)

  const rankColors = {
    1: 'text-amber-400',
    2: 'text-slate-300',
    3: 'text-orange-600',
  }

  return (
    <motion.div
      initial={{ opacity: 0, y: 10 }}
      animate={{ opacity: 1, y: 0 }}
      className={`flex items-center gap-3 p-3 rounded-xl transition-colors ${
        isCurrentUser
          ? 'bg-brand-primary/10 border border-brand-primary/30'
          : 'bg-slate-800/50 hover:bg-slate-800'
      }`}
    >
      {/* Rank */}
      {rank !== undefined && (
        <div className={`w-8 text-center font-bold text-lg ${rankColors[rank] || 'text-slate-500'}`}>
          {rank <= 3 ? ['', '\uD83E\uDD47', '\uD83E\uDD48', '\uD83E\uDD49'][rank] : `#${rank}`}
        </div>
      )}

      {/* Avatar */}
      <UserAvatar
        username={friend.username}
        displayName={friend.display_name}
        avatarUrl={friend.avatar_url}
        size="md"
      />

      {/* Info */}
      <div className="flex-1 min-w-0">
        <div className="flex items-center gap-2">
          <span className="text-white font-medium text-sm truncate">
            {friend.display_name || friend.username}
          </span>
          {isCurrentUser && (
            <span className="text-xs text-brand-primary bg-brand-primary/20 px-1.5 py-0.5 rounded">
              {t('leaderboard.you')}
            </span>
          )}
        </div>
        <div className="flex items-center gap-3 text-xs text-slate-400">
          <span>Lv.{levelInfo.level}</span>
          <span>{levelInfo.title}</span>
        </div>
      </div>

      {/* Streak */}
      <StreakFlame streakDays={friend.streak_days || 0} size="sm" />

      {/* Weekly XP or actions */}
      {friend.weekly_xp !== undefined && (
        <div className="text-right">
          <p className="text-brand-accent font-bold text-sm">{friend.weekly_xp}</p>
          <p className="text-slate-500 text-xs">XP</p>
        </div>
      )}

      {/* Action buttons (for pending requests) */}
      {actions && <div className="flex gap-2">{actions}</div>}
    </motion.div>
  )
}

export default FriendCard
