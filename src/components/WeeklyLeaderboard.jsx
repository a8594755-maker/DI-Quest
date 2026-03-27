import { useTranslation } from 'react-i18next'
import { Trophy } from 'lucide-react'
import FriendCard from './FriendCard'

function WeeklyLeaderboard({ entries, currentUserId }) {
  const { t } = useTranslation('social')

  const sorted = [...entries].sort((a, b) => (b.weekly_xp || 0) - (a.weekly_xp || 0))

  return (
    <div>
      <h3 className="text-lg font-bold text-white mb-1 flex items-center gap-2">
        <Trophy className="w-5 h-5 text-brand-accent" />
        {t('leaderboard.title')}
      </h3>
      <p className="text-slate-400 text-sm mb-4">{t('leaderboard.subtitle')}</p>

      {sorted.length === 0 ? (
        <div className="text-center py-8 text-slate-500">
          <Trophy className="w-10 h-10 mx-auto mb-3 opacity-30" />
          <p className="text-sm">{t('leaderboard.noData')}</p>
        </div>
      ) : (
        <div className="space-y-2">
          {sorted.map((entry, i) => (
            <FriendCard
              key={entry.id}
              friend={entry}
              rank={i + 1}
              isCurrentUser={entry.id === currentUserId}
            />
          ))}
        </div>
      )}
    </div>
  )
}

export default WeeklyLeaderboard
