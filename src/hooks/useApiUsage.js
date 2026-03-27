import { useState, useEffect, useCallback } from 'react'
import { supabase } from '../utils/supabase'
import { useAuth } from '../contexts/AuthContext'

const DAILY_LIMIT = 20

export function useApiUsage() {
  const { user, isAuthenticated, profile } = useAuth()
  const [todayUsage, setTodayUsage] = useState(0)
  const [loading, setLoading] = useState(true)

  const isPremium = profile?.role === 'premium'
  const remaining = isPremium ? Infinity : Math.max(0, DAILY_LIMIT - todayUsage)
  const canUseApi = isAuthenticated && (isPremium || todayUsage < DAILY_LIMIT)

  const fetchUsage = useCallback(async () => {
    if (!isAuthenticated || !user) {
      setLoading(false)
      return
    }
    try {
      const today = new Date().toISOString().slice(0, 10)
      const { data } = await supabase
        .from('api_usage')
        .select('call_count')
        .eq('user_id', user.id)
        .eq('usage_date', today)
        .maybeSingle()

      setTodayUsage(data?.call_count || 0)
    } catch {}
    setLoading(false)
  }, [isAuthenticated, user])

  useEffect(() => { fetchUsage() }, [fetchUsage])

  const incrementUsage = useCallback(async () => {
    if (!isAuthenticated || !user || isPremium) return true

    const today = new Date().toISOString().slice(0, 10)

    // Try upsert: increment or create
    const { data, error } = await supabase.rpc('increment_api_usage', {
      p_user_id: user.id,
      p_date: today,
      p_limit: DAILY_LIMIT,
    })

    // If RPC doesn't exist, fallback to manual upsert
    if (error) {
      // Manual approach
      const { data: existing } = await supabase
        .from('api_usage')
        .select('call_count')
        .eq('user_id', user.id)
        .eq('usage_date', today)
        .maybeSingle()

      const currentCount = existing?.call_count || 0
      if (currentCount >= DAILY_LIMIT) {
        setTodayUsage(currentCount)
        return false
      }

      if (existing) {
        await supabase
          .from('api_usage')
          .update({ call_count: currentCount + 1 })
          .eq('user_id', user.id)
          .eq('usage_date', today)
      } else {
        await supabase
          .from('api_usage')
          .insert({ user_id: user.id, usage_date: today, call_count: 1 })
      }

      setTodayUsage(currentCount + 1)
      return currentCount + 1 <= DAILY_LIMIT
    }

    // RPC succeeded
    if (data === false) {
      await fetchUsage()
      return false
    }
    setTodayUsage(prev => prev + 1)
    return true
  }, [isAuthenticated, user, isPremium, fetchUsage])

  return {
    todayUsage,
    remaining,
    dailyLimit: DAILY_LIMIT,
    canUseApi,
    isPremium,
    loading,
    incrementUsage,
    refresh: fetchUsage,
  }
}
