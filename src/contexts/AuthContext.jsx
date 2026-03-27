import { createContext, useContext, useState, useEffect, useCallback } from 'react'
import { supabase } from '../utils/supabase'

const AuthContext = createContext(null)

export function AuthProvider({ children }) {
  const [user, setUser] = useState(null)
  const [profile, setProfile] = useState(null)
  const [isGuest, setIsGuest] = useState(false)
  const [loading, setLoading] = useState(true)
  const [needsProfileSetup, setNeedsProfileSetup] = useState(false)

  // Fetch profile from Supabase, auto-create if missing, auto-populate from Google metadata
  const fetchProfile = useCallback(async (userId, userMeta) => {
    const { data, error } = await supabase
      .from('profiles')
      .select('*')
      .eq('id', userId)
      .maybeSingle()

    // Profile doesn't exist — create it (user was created before migration)
    if (!data) {
      const meta = userMeta || {}
      const autoUsername = 'user_' + userId.substring(0, 8)
      const displayName = meta.full_name || meta.name || 'Learner'
      const avatarUrl = meta.avatar_url || null

      const { data: created } = await supabase
        .from('profiles')
        .insert({
          id: userId,
          username: autoUsername,
          display_name: displayName,
          avatar_url: avatarUrl,
        })
        .select()
        .single()

      // Also create user_progress row
      await supabase.from('user_progress').upsert({ user_id: userId, progress_data: {} })

      if (created) {
        setProfile(created)
        setNeedsProfileSetup(true)
        return created
      }
      return null
    }

    // Profile exists — check if we should update from Google metadata
    const meta = userMeta || {}
    const isDefaultProfile = data.display_name === 'Learner' || data.username?.startsWith('user_')
    if (isDefaultProfile && (meta.full_name || meta.name || meta.avatar_url)) {
      const updates = {}
      if (data.display_name === 'Learner' && (meta.full_name || meta.name)) {
        updates.display_name = meta.full_name || meta.name
      }
      if (!data.avatar_url && meta.avatar_url) {
        updates.avatar_url = meta.avatar_url
      }
      if (Object.keys(updates).length > 0) {
        const { data: updated } = await supabase
          .from('profiles')
          .update(updates)
          .eq('id', userId)
          .select()
          .single()
        if (updated) {
          setProfile(updated)
          if (updated.username?.startsWith('user_')) {
            setNeedsProfileSetup(true)
          }
          return updated
        }
      }
    }
    // Check if username needs setup
    if (data.username?.startsWith('user_')) {
      setNeedsProfileSetup(true)
    }
    setProfile(data)
    return data
  }, [])

  // Update profile in Supabase
  const updateProfile = useCallback(async (updates) => {
    if (!user) return
    const { data } = await supabase
      .from('profiles')
      .update(updates)
      .eq('id', user.id)
      .select()
      .single()
    if (data) setProfile(data)
    return data
  }, [user])

  // Listen to auth state changes
  useEffect(() => {
    // Safety timeout: if loading takes more than 5 seconds, force it to stop
    const loadingTimeout = setTimeout(() => {
      setLoading(prev => {
        if (prev) console.warn('Auth loading timeout — forcing load complete')
        return false
      })
    }, 5000)

    const { data: { subscription } } = supabase.auth.onAuthStateChange(async (event, session) => {
      try {
        if (session?.user) {
          setUser(session.user)
          setIsGuest(false)
          await fetchProfile(session.user.id, session.user.user_metadata)
        } else {
          setUser(null)
          setProfile(null)
        }
      } catch (err) {
        console.error('Auth state change error:', err)
      } finally {
        clearTimeout(loadingTimeout)
        setLoading(false)
      }
    })

    // Check initial session
    supabase.auth.getSession().then(async ({ data: { session } }) => {
      try {
        if (session?.user) {
          setUser(session.user)
          setIsGuest(false)
          await fetchProfile(session.user.id, session.user.user_metadata)
        } else {
          const wasGuest = localStorage.getItem('di-quest-guest')
          if (wasGuest) setIsGuest(true)
        }
      } catch (err) {
        console.error('Get session error:', err)
      } finally {
        clearTimeout(loadingTimeout)
        setLoading(false)
      }
    })

    return () => {
      clearTimeout(loadingTimeout)
      subscription.unsubscribe()
    }
  }, [fetchProfile])

  const signUp = async ({ email, password, username, displayName }) => {
    const { data, error } = await supabase.auth.signUp({
      email,
      password,
      options: {
        data: { username, display_name: displayName || username },
      },
    })
    if (error) throw error
    return data
  }

  const signIn = async ({ email, password }) => {
    const { data, error } = await supabase.auth.signInWithPassword({ email, password })
    if (error) throw error
    return data
  }

  const signInWithGoogle = async () => {
    const { data, error } = await supabase.auth.signInWithOAuth({
      provider: 'google',
      options: { redirectTo: window.location.origin + '/di-quest' },
    })
    if (error) throw error
    return data
  }

  const signOut = async () => {
    await supabase.auth.signOut()
    setUser(null)
    setProfile(null)
    setIsGuest(false)
    localStorage.removeItem('di-quest-guest')
  }

  const continueAsGuest = () => {
    setIsGuest(true)
    localStorage.setItem('di-quest-guest', 'true')
    setLoading(false)
  }

  const completeProfileSetup = async ({ username, displayName }) => {
    if (!user) return
    const updates = { username: username.toLowerCase() }
    if (displayName) updates.display_name = displayName

    // Try update first, then upsert if needed
    const { data, error } = await supabase
      .from('profiles')
      .update(updates)
      .eq('id', user.id)
      .select()
      .single()

    if (error) {
      // If update failed (no row), try insert
      if (error.code === 'PGRST116') {
        const { data: inserted, error: insertError } = await supabase
          .from('profiles')
          .insert({ id: user.id, ...updates })
          .select()
          .single()
        if (insertError) throw insertError
        if (inserted) setProfile(inserted)
        setNeedsProfileSetup(false)
        return inserted
      }
      throw error
    }
    if (data) setProfile(data)
    setNeedsProfileSetup(false)
    return data
  }

  const isAuthenticated = !!user
  const isLoggedInOrGuest = isAuthenticated || isGuest

  return (
    <AuthContext.Provider value={{
      user,
      profile,
      isGuest,
      isAuthenticated,
      isLoggedInOrGuest,
      loading,
      needsProfileSetup,
      signUp,
      signIn,
      signInWithGoogle,
      signOut,
      continueAsGuest,
      completeProfileSetup,
      fetchProfile,
      updateProfile,
    }}>
      {children}
    </AuthContext.Provider>
  )
}

export function useAuth() {
  const ctx = useContext(AuthContext)
  if (!ctx) throw new Error('useAuth must be used inside <AuthProvider>')
  return ctx
}
