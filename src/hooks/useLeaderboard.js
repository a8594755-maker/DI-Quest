import { useState, useEffect, useCallback } from 'react'
import { supabase } from '../utils/supabase'
import { useAuth } from '../contexts/AuthContext'

export function useLeaderboard(friendIds = []) {
  const { user, isAuthenticated } = useAuth()
  const [entries, setEntries] = useState([])
  const [loading, setLoading] = useState(true)

  const fetchLeaderboard = useCallback(async () => {
    if (!isAuthenticated || !user) {
      setLoading(false)
      return
    }

    try {
      // Get leaderboard for friends + self
      const ids = [...new Set([...friendIds, user.id])]
      const { data, error } = await supabase
        .from('weekly_leaderboard')
        .select('*')
        .in('id', ids)

      if (error) console.error('Error fetching leaderboard:', error)
      setEntries(data || [])
    } catch (err) {
      console.error('Error fetching leaderboard:', err)
      setEntries([])
    } finally {
      setLoading(false)
    }
  }, [user, isAuthenticated, friendIds.join(',')])

  useEffect(() => {
    fetchLeaderboard()
  }, [fetchLeaderboard])

  return { entries, loading, refresh: fetchLeaderboard }
}
