import { useState, useEffect } from 'react'
import { useSearchParams } from 'react-router-dom'
import { motion } from 'framer-motion'
import { Users, UserPlus, Search, Check, X, Clock, Link2, Copy } from 'lucide-react'
import { useTranslation } from 'react-i18next'
import { useAuth } from '../contexts/AuthContext'
import { useFriends } from '../hooks/useFriends'
import { useLeaderboard } from '../hooks/useLeaderboard'
import FriendCard from '../components/FriendCard'
import WeeklyLeaderboard from '../components/WeeklyLeaderboard'
import UserAvatar from '../components/UserAvatar'

function FriendsPage() {
  const { t } = useTranslation('social')
  const { user, isAuthenticated, isGuest, profile } = useAuth()
  const { friends, pendingRequests, loading, searchUsers, sendFriendRequest, acceptRequest, declineRequest } = useFriends()
  const { entries: leaderboardEntries } = useLeaderboard(friends.map(f => f.id))
  const [searchParams, setSearchParams] = useSearchParams()

  const [activeTab, setActiveTab] = useState('friends')
  const [searchQuery, setSearchQuery] = useState('')
  const [searchResults, setSearchResults] = useState([])
  const [searching, setSearching] = useState(false)
  const [sentRequests, setSentRequests] = useState(new Set())
  const [copied, setCopied] = useState(false)
  const [inviteStatus, setInviteStatus] = useState(null) // { type: 'success'|'error'|'already', message }

  // Handle invite link: ?invite=userId
  useEffect(() => {
    const inviteId = searchParams.get('invite')
    if (!inviteId || !isAuthenticated || !user) return
    if (inviteId === user.id) {
      searchParams.delete('invite')
      setSearchParams(searchParams, { replace: true })
      return
    }

    const handleInvite = async () => {
      try {
        // Check if already friends
        const isFriend = friends.some(f => f.id === inviteId)
        if (isFriend) {
          setInviteStatus({ type: 'already', message: t('friends.alreadyFriends', 'You are already friends!') })
        } else {
          await sendFriendRequest(inviteId)
          setInviteStatus({ type: 'success', message: t('friends.inviteAccepted', 'Friend request sent!') })
        }
      } catch (err) {
        if (err.message?.includes('duplicate') || err.code === '23505') {
          setInviteStatus({ type: 'already', message: t('friends.requestAlreadySent', 'Request already sent!') })
        } else {
          setInviteStatus({ type: 'error', message: t('friends.inviteError', 'Could not send request') })
        }
      }
      searchParams.delete('invite')
      setSearchParams(searchParams, { replace: true })
    }
    handleInvite()
  }, [searchParams, isAuthenticated, user, friends])

  // Auto-dismiss invite status
  useEffect(() => {
    if (inviteStatus) {
      const timer = setTimeout(() => setInviteStatus(null), 4000)
      return () => clearTimeout(timer)
    }
  }, [inviteStatus])

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

  const handleCopyInvite = async () => {
    if (!user) return
    const link = `${window.location.origin}/di-quest/friends?invite=${user.id}`
    try {
      await navigator.clipboard.writeText(link)
      setCopied(true)
      setTimeout(() => setCopied(false), 2000)
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
      {/* Invite status banner */}
      {inviteStatus && (
        <motion.div
          initial={{ opacity: 0, y: -10 }}
          animate={{ opacity: 1, y: 0 }}
          exit={{ opacity: 0 }}
          className={`mb-4 p-3 rounded-xl text-sm text-center ${
            inviteStatus.type === 'success' ? 'bg-emerald-500/20 text-emerald-400' :
            inviteStatus.type === 'already' ? 'bg-amber-500/20 text-amber-400' :
            'bg-red-500/20 text-red-400'
          }`}
        >
          {inviteStatus.message}
        </motion.div>
      )}

      {/* Header with invite button */}
      <div className="mb-6 flex items-start justify-between">
        <div>
          <h2 className="text-2xl sm:text-3xl font-bold text-white mb-2">{t('friends.title')}</h2>
          <p className="text-slate-400">{t('friends.subtitle')}</p>
        </div>
        <button
          onClick={handleCopyInvite}
          className={`flex items-center gap-1.5 px-3 py-2 rounded-xl text-sm font-medium transition-all ${
            copied
              ? 'bg-emerald-500/20 text-emerald-400 border border-emerald-500/30'
              : 'bg-brand-primary/20 text-brand-primary border border-brand-primary/30 hover:bg-brand-primary/30'
          }`}
        >
          {copied ? <Check className="w-4 h-4" /> : <Link2 className="w-4 h-4" />}
          <span className="hidden sm:inline">{copied ? t('friends.linkCopied', 'Copied!') : t('friends.inviteLink', 'Invite Link')}</span>
        </button>
      </div>

      {/* My invite code */}
      {profile && !profile.username?.startsWith('user_') && (
        <div className="mb-6 p-3 bg-slate-800/50 rounded-xl flex items-center justify-between">
          <div className="flex items-center gap-3">
            <UserAvatar username={profile.username} displayName={profile.display_name} avatarUrl={profile.avatar_url} size="sm" />
            <div>
              <p className="text-slate-400 text-xs">{t('friends.myUsername', 'My Username')}</p>
              <p className="text-white font-mono text-sm">@{profile.username}</p>
            </div>
          </div>
          <button
            onClick={() => {
              navigator.clipboard.writeText(profile.username)
              setCopied(true)
              setTimeout(() => setCopied(false), 2000)
            }}
            className="p-2 text-slate-400 hover:text-white transition-colors"
            title={t('friends.copyUsername', 'Copy username')}
          >
            <Copy className="w-4 h-4" />
          </button>
        </div>
      )}

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
                <p className="mb-4">{t('friends.noFriends')}</p>
                <button
                  onClick={handleCopyInvite}
                  className="inline-flex items-center gap-2 px-4 py-2 bg-brand-primary/20 text-brand-primary rounded-xl text-sm hover:bg-brand-primary/30 transition-colors"
                >
                  <Link2 className="w-4 h-4" />
                  {t('friends.shareInvite', 'Share your invite link')}
                </button>
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
              ) : searchQuery.length < 2 ? (
                <div className="text-center py-8 text-slate-500">
                  <UserPlus className="w-12 h-12 mx-auto mb-3 opacity-30" />
                  <p className="mb-2">{t('friends.searchHint', 'Search by username or display name')}</p>
                  <p className="text-xs">{t('friends.orShareLink', 'Or share your invite link to add friends')}</p>
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
