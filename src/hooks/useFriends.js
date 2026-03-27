import { useState, useEffect, useCallback } from 'react'
import { supabase } from '../utils/supabase'
import { useAuth } from '../contexts/AuthContext'

export function useFriends() {
  const { user, isAuthenticated } = useAuth()
  const [friends, setFriends] = useState([])
  const [pendingRequests, setPendingRequests] = useState([])
  const [loading, setLoading] = useState(true)

  const fetchFriends = useCallback(async () => {
    if (!isAuthenticated || !user) {
      setLoading(false)
      return
    }
    setLoading(true)

    try {
      // Get accepted friendships where user is either requester or addressee
      const { data: friendships, error: friendshipsErr } = await supabase
        .from('friendships')
        .select('id, requester_id, addressee_id, status')
        .or(`requester_id.eq.${user.id},addressee_id.eq.${user.id}`)
        .eq('status', 'accepted')

      if (friendshipsErr) {
        console.error('Error fetching friendships:', friendshipsErr)
        setFriends([])
        setPendingRequests([])
        return
      }

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
      const { data: pending, error: pendingErr } = await supabase
        .from('friendships')
        .select('id, requester_id, created_at')
        .eq('addressee_id', user.id)
        .eq('status', 'pending')

      if (pendingErr) {
        console.error('Error fetching pending requests:', pendingErr)
        setPendingRequests([])
        return
      }

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
      setFriends([])
      setPendingRequests([])
    } finally {
      setLoading(false)
    }
  }, [user, isAuthenticated])

  useEffect(() => {
    fetchFriends()
  }, [fetchFriends])

  const searchUsers = async (query) => {
    if (!query || query.length < 2) return []

    // Support @username for exact username search
    const isUsernameSearch = query.startsWith('@')
    const searchTerm = isUsernameSearch ? query.slice(1) : query
    if (!searchTerm) return []

    let q = supabase
      .from('profiles')
      .select('id, username, display_name, avatar_url, total_xp, streak_days')
      .neq('id', user?.id)
      .limit(10)

    if (isUsernameSearch) {
      q = q.ilike('username', `%${searchTerm}%`)
    } else {
      q = q.or(`username.ilike.%${searchTerm}%,display_name.ilike.%${searchTerm}%`)
    }

    const { data } = await q
    return data || []
  }

  // Find user by exact username (for invite links)
  const findByUsername = async (username) => {
    if (!username) return null
    const { data } = await supabase
      .from('profiles')
      .select('id, username, display_name, avatar_url, total_xp, streak_days')
      .eq('username', username.toLowerCase())
      .single()
    return data
  }

  // Generate invite link for current user
  const getInviteLink = () => {
    if (!user) return null
    const profile = friends // we need the profile from auth context
    const base = window.location.origin
    return `${base}/di-quest/friends?invite=${encodeURIComponent(user.id)}`
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
    findByUsername,
    getInviteLink,
    sendFriendRequest,
    acceptRequest,
    declineRequest,
    removeFriend,
    refresh: fetchFriends,
  }
}
