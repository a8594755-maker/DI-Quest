import { useState, useEffect, useCallback } from 'react'
import { supabase } from '../utils/supabase'
import { useAuth } from '../contexts/AuthContext'

export function useFriends() {
  const { user, isAuthenticated } = useAuth()
  const [friends, setFriends] = useState([])
  const [pendingRequests, setPendingRequests] = useState([])
  const [loading, setLoading] = useState(true)

  const fetchFriends = useCallback(async () => {
    if (!isAuthenticated || !user) return
    setLoading(true)

    try {
      // Get accepted friendships where user is either requester or addressee
      const { data: friendships } = await supabase
        .from('friendships')
        .select('id, requester_id, addressee_id, status')
        .or(`requester_id.eq.${user.id},addressee_id.eq.${user.id}`)
        .eq('status', 'accepted')

      if (friendships && friendships.length > 0) {
        const friendIds = friendships.map(f =>
          f.requester_id === user.id ? f.addressee_id : f.requester_id
        )
        const { data: profiles } = await supabase
          .from('profiles')
          .select('*')
          .in('id', friendIds)

        setFriends(profiles || [])
      } else {
        setFriends([])
      }

      // Get pending incoming requests
      const { data: pending } = await supabase
        .from('friendships')
        .select('id, requester_id, created_at')
        .eq('addressee_id', user.id)
        .eq('status', 'pending')

      if (pending && pending.length > 0) {
        const requesterIds = pending.map(p => p.requester_id)
        const { data: profiles } = await supabase
          .from('profiles')
          .select('*')
          .in('id', requesterIds)

        setPendingRequests(pending.map(p => ({
          ...p,
          profile: profiles?.find(pr => pr.id === p.requester_id),
        })))
      } else {
        setPendingRequests([])
      }
    } catch (err) {
      console.error('Error fetching friends:', err)
    } finally {
      setLoading(false)
    }
  }, [user, isAuthenticated])

  useEffect(() => {
    fetchFriends()
  }, [fetchFriends])

  const searchUsers = async (query) => {
    if (!query || query.length < 2) return []
    const { data } = await supabase
      .from('profiles')
      .select('id, username, display_name, avatar_url, total_xp, streak_days')
      .ilike('username', `%${query}%`)
      .neq('id', user?.id)
      .limit(10)
    return data || []
  }

  const sendFriendRequest = async (addresseeId) => {
    if (!user) return
    const { error } = await supabase.from('friendships').insert({
      requester_id: user.id,
      addressee_id: addresseeId,
    })
    if (error) throw error
  }

  const acceptRequest = async (friendshipId) => {
    const { error } = await supabase
      .from('friendships')
      .update({ status: 'accepted' })
      .eq('id', friendshipId)
    if (error) throw error
    await fetchFriends()
  }

  const declineRequest = async (friendshipId) => {
    const { error } = await supabase
      .from('friendships')
      .update({ status: 'declined' })
      .eq('id', friendshipId)
    if (error) throw error
    await fetchFriends()
  }

  const removeFriend = async (friendId) => {
    if (!user) return
    await supabase
      .from('friendships')
      .delete()
      .or(`and(requester_id.eq.${user.id},addressee_id.eq.${friendId}),and(requester_id.eq.${friendId},addressee_id.eq.${user.id})`)
    await fetchFriends()
  }

  return {
    friends,
    pendingRequests,
    loading,
    searchUsers,
    sendFriendRequest,
    acceptRequest,
    declineRequest,
    removeFriend,
    refresh: fetchFriends,
  }
}
