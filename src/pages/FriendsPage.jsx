import { useState, useEffect } from 'react'
import { motion } from 'framer-motion'
import { Users, UserPlus, Search, Check, X, Clock } from 'lucide-react'
import { useTranslation } from 'react-i18next'
import { useAuth } from '../contexts/AuthContext'
import { useFriends } from '../hooks/useFriends'
import { useLeaderboard } from '../hooks/useLeaderboard'
import FriendCard from '../components/FriendCard'
import WeeklyLeaderboard from '../components/WeeklyLeaderboard'
import UserAvatar from '../components/UserAvatar'

function FriendsPage() {
  const { t } = useTranslation('social')
  const { user, isAuthenticated, isGuest } = useAuth()
  const { friends, pendingRequests, loading, searchUsers, sendFriendRequest, acceptRequest, declineRequest } = useFriends()
  const { entries: leaderboardEntries } = useLeaderboard(friends.map(f => f.id))

  const [activeTab, setActiveTab] = useState('friends')
  const [searchQuery, setSearchQuery] = useState('')
  const [searchResults, setSearchResults] = useState([])
  const [searching, setSearching] = useState(false)
  const [sentRequests, setSentRequests] = useState(new Set())

  // Debounced search
  useEffect(() => {
    if (!searchQuery || searchQuery.length < 2) {
      setSearchResults([])
      return
    }
    const timer = setTimeout(async () => {
      setSearching(true)
      try {
        const results = await searchUsers(searchQuery)
        setSearchResults(results)
      } catch {}
      setSearching(false)
    }, 400)
    return () => clearTimeout(timer)
  }, [searchQuery])

  const handleSendRequest = async (userId) => {
    try {
      await sendFriendRequest(userId)
      setSentRequests(prev => new Set([...prev, userId]))
    } catch {}
  }

  const tabs = [
    { id: 'friends', label: t('friends.list'), icon: Users, count: friends.length },
    { id: 'pending', label: t('friends.pending'), icon: Clock, count: pendingRequests.length },
    { id: 'add', label: t('friends.addFriend'), icon: UserPlus },
    { id: 'leaderboard', label: t('leaderboard.title'), icon: null },
  ]

  // Guest mode: show prompt to sign in
  if (isGuest || !isAuthenticated) {
    return (
      <div className="max-w-3xl mx-auto p-4 sm:p-6">
        <div className="text-center py-16">
          <Users className="w-16 h-16 text-slate-600 mx-auto mb-4" />
          <h2 className="text-xl font-bold text-white mb-2">{t('friends.title')}</h2>
          <p className="text-slate-400 mb-6">{t('friends.subtitle')}</p>
          <p className="text-slate-500 text-sm">
            {t('friends.noFriends')}
          </p>
        </div>
      </div>
    )
  }

  return (
    <div className="max-w-3xl mx-auto p-4 sm:p-6">
      {/* Header */}
      <div className="mb-6">
        <h2 className="text-2xl sm:text-3xl font-bold text-white mb-2">{t('friends.title')}</h2>
        <p className="text-slate-400">{t('friends.subtitle')}</p>
      </div>

      {/* Tabs */}
      <div className="flex gap-1 bg-slate-800/50 rounded-xl p-1 mb-6 overflow-x-auto">
        {tabs.map((tab) => (
          <button
            key={tab.id}
            onClick={() => setActiveTab(tab.id)}
            className={`flex-1 min-w-0 px-3 py-2 rounded-lg text-sm font-medium transition-colors flex items-center justify-center gap-1.5 whitespace-nowrap ${
              activeTab === tab.id
                ? 'bg-brand-primary text-white'
                : 'text-slate-400 hover:text-white'
            }`}
          >
            {tab.icon && <tab.icon className="w-4 h-4 shrink-0" />}
            <span className="truncate">{tab.label}</span>
            {tab.count > 0 && (
              <span className={`px-1.5 py-0.5 rounded-full text-xs ${
                activeTab === tab.id ? 'bg-white/20' : 'bg-slate-700'
              }`}>
                {tab.count}
              </span>
            )}
          </button>
        ))}
      </div>

      {/* Tab Content */}
      <motion.div
        key={activeTab}
        initial={{ opacity: 0, y: 10 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.2 }}
      >
        {/* Friends List */}
        {activeTab === 'friends' && (
          <div className="space-y-2">
            {loading ? (
              <div className="text-center py-8">
                <div className="w-8 h-8 border-2 border-brand-primary border-t-transparent rounded-full animate-spin mx-auto" />
              </div>
            ) : friends.length === 0 ? (
              <div className="text-center py-12 text-slate-500">
                <Users className="w-12 h-12 mx-auto mb-3 opacity-30" />
                <p>{t('friends.noFriends')}</p>
              </div>
            ) : (
              friends.map((friend) => (
                <FriendCard key={friend.id} friend={friend} />
              ))
            )}
          </div>
        )}

        {/* Pending Requests */}
        {activeTab === 'pending' && (
          <div className="space-y-2">
            {pendingRequests.length === 0 ? (
              <div className="text-center py-12 text-slate-500">
                <Clock className="w-12 h-12 mx-auto mb-3 opacity-30" />
                <p>{t('friends.noPending')}</p>
              </div>
            ) : (
              pendingRequests.map((req) => (
                <FriendCard
                  key={req.id}
                  friend={req.profile || { username: 'unknown' }}
                  actions={
                    <>
                      <button
                        onClick={() => acceptRequest(req.id)}
                        className="px-3 py-1.5 bg-emerald-500/20 text-emerald-400 rounded-lg text-sm hover:bg-emerald-500/30 transition-colors flex items-center gap-1"
                      >
                        <Check className="w-3.5 h-3.5" />
                        {t('friends.accept')}
                      </button>
                      <button
                        onClick={() => declineRequest(req.id)}
                        className="px-3 py-1.5 bg-red-500/20 text-red-400 rounded-lg text-sm hover:bg-red-500/30 transition-colors flex items-center gap-1"
                      >
                        <X className="w-3.5 h-3.5" />
                        {t('friends.decline')}
                      </button>
                    </>
                  }
                />
              ))
            )}
          </div>
        )}

        {/* Add Friend */}
        {activeTab === 'add' && (
          <div>
            <div className="relative mb-6">
              <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-500" />
              <input
                type="text"
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                placeholder={t('friends.searchPlaceholder')}
                className="w-full pl-10 pr-4 py-3 bg-slate-800 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:border-brand-primary focus:outline-none transition-colors"
                autoFocus
              />
            </div>

            <div className="space-y-2">
              {searching ? (
                <div className="text-center py-8">
                  <div className="w-8 h-8 border-2 border-brand-primary border-t-transparent rounded-full animate-spin mx-auto" />
                </div>
              ) : searchResults.length === 0 && searchQuery.length >= 2 ? (
                <div className="text-center py-8 text-slate-500">
                  <p>{t('friends.noResults')}</p>
                </div>
              ) : (
                searchResults.map((result) => {
                  const isFriend = friends.some(f => f.id === result.id)
                  const isSent = sentRequests.has(result.id)
                  return (
                    <div key={result.id} className="flex items-center gap-3 p-3 bg-slate-800/50 rounded-xl">
                      <UserAvatar
                        username={result.username}
                        displayName={result.display_name}
                        avatarUrl={result.avatar_url}
                        size="md"
                      />
                      <div className="flex-1 min-w-0">
                        <p className="text-white font-medium text-sm truncate">{result.display_name || result.username}</p>
                        <p className="text-slate-400 text-xs">@{result.username}</p>
                      </div>
                      {isFriend ? (
                        <span className="text-emerald-400 text-xs flex items-center gap-1">
                          <Check className="w-3.5 h-3.5" />
                          {t('friends.list')}
                        </span>
                      ) : isSent ? (
                        <span className="text-slate-400 text-xs">{t('friends.requestSent')}</span>
                      ) : (
                        <button
                          onClick={() => handleSendRequest(result.id)}
                          className="px-3 py-1.5 bg-brand-primary/20 text-brand-primary rounded-lg text-sm hover:bg-brand-primary/30 transition-colors flex items-center gap-1"
                        >
                          <UserPlus className="w-3.5 h-3.5" />
                          {t('friends.sendRequest')}
                        </button>
                      )}
                    </div>
                  )
                })
              )}
            </div>
          </div>
        )}

        {/* Leaderboard */}
        {activeTab === 'leaderboard' && (
          <WeeklyLeaderboard entries={leaderboardEntries} currentUserId={user?.id} />
        )}
      </motion.div>
    </div>
  )
}

export default FriendsPage
