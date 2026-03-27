import { createContext, useContext, useState, useEffect, useCallback } from 'react'
import { supabase } from '../utils/supabase'

const AuthContext = createContext(null)

export function AuthProvider({ children }) {
  const [user, setUser] = useState(null)
  const [profile, setProfile] = useState(null)
  const [isGuest, setIsGuest] = useState(false)
  const [loading, setLoading] = useState(true)
  const [needsProfileSetup, setNeedsProfileSetup] = useState(false)

  // Extract Google metadata from various possible locations
  const getGoogleMeta = (userMeta, user) => {
    const meta = userMeta || {}
    // Google data can be in user_metadata directly or in identities
    const identityData = user?.identities?.find(i => i.provider === 'google')?.identity_data || {}
    return {
      full_name: meta.full_name || meta.name || identityData.full_name || identityData.name || '',
      avatar_url: meta.avatar_url || meta.picture || identityData.avatar_url || identityData.picture || '',
      email: meta.email || identityData.email || '',
    }
  }

  // Fetch profile from Supabase, auto-create if missing, auto-populate from Google metadata
  const fetchProfile = useCallback(async (userId, userMeta, retryCount = 0) => {
    const { data, error } = await supabase
      .from('profiles')
      .select('*')
      .eq('id', userId)
      .maybeSingle()

    if (error) {
      console.error('Error fetching profile:', error)
      // Retry once after a short delay (auth token may still be settling)
      if (retryCount < 1) {
        await new Promise(r => setTimeout(r, 1000))
        return fetchProfile(userId, userMeta, retryCount + 1)
      }
      return null
    }

    // Profile doesn't exist — create it (user was created before migration)
    if (!data) {
      const gMeta = getGoogleMeta(userMeta, user)
      const autoUsername = 'user_' + userId.substring(0, 8)
      const displayName = gMeta.full_name || 'Learner'
      const avatarUrl = gMeta.avatar_url || null

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
    const gMeta = getGoogleMeta(userMeta, user)
    const isDefaultProfile = data.display_name === 'Learner' || data.username?.startsWith('user_')
    if (isDefaultProfile && (gMeta.full_name || gMeta.avatar_url)) {
      const updates = {}
      if (data.display_name === 'Learner' && gMeta.full_name) {
        updates.display_name = gMeta.full_name
      }
      if (!data.avatar_url && gMeta.avatar_url) {
        updates.avatar_url = gMeta.avatar_url
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
  // Supabase v2 fires INITIAL_SESSION on subscribe, so we don't need a separate getSession() call.
  // Calling both causes an auth token lock race condition.
  useEffect(() => {
    let initialSessionHandled = false

    // Safety timeout: give more time when exchanging OAuth code
    const hasAuthCode = window.location.search.includes('code=')
    const timeoutMs = hasAuthCode ? 10000 : 3000
    const loadingTimeout = setTimeout(() => {
      setLoading(prev => {
        if (prev) console.warn('Auth loading timeout — forcing load complete')
        return false
      })
    }, timeoutMs)

    const { data: { subscription } } = supabase.auth.onAuthStateChange(async (event, session) => {
      try {
        // Skip redundant TOKEN_REFRESHED events — just update the user object
        if (event === 'TOKEN_REFRESHED' && session?.user) {
          setUser(session.user)
          return
        }

        if (session?.user) {
          setUser(session.user)
          setIsGuest(false)
          await fetchProfile(session.user.id, session.user.user_metadata)
          // Clean up OAuth code from URL to prevent stale code exchange on refresh
          if (window.location.search.includes('code=')) {
            window.history.replaceState({}, '', window.location.pathname)
          }
        } else if (event === 'SIGNED_OUT') {
          setUser(null)
          setProfile(null)
        } else if (!session) {
          setUser(null)
          setProfile(null)
          // On initial load with no session, check for guest mode
          if (!initialSessionHandled) {
            const wasGuest = localStorage.getItem('di-quest-guest')
            if (wasGuest) setIsGuest(true)
          }
        }
      } catch (err) {
        // Ignore lock contention errors — session is still valid
        if (err?.message?.includes('Lock')) {
          console.warn('Auth lock contention (safe to ignore):', err.message)
          return
        }
        console.error('Auth state change error:', err)
      } finally {
        initialSessionHandled = true
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

  const resetPasswordForEmail = async (email) => {
    const { error } = await supabase.auth.resetPasswordForEmail(email, {
      redirectTo: window.location.origin + '/di-quest/reset-password',
    })
    if (error) throw error
  }

  const updatePassword = async (newPassword) => {
    const { error } = await supabase.auth.updateUser({ password: newPassword })
    if (error) throw error
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

    // Use update (not upsert) to preserve existing fields like role/premium status
    const { data, error } = await supabase
      .from('profiles')
      .update(updates)
      .eq('id', user.id)
      .select()
      .single()

    if (error) {
      // If profile doesn't exist yet, fall back to insert (preserving any known role)
      if (error.code === 'PGRST116') {
        const { data: created, error: insertErr } = await supabase
          .from('profiles')
          .insert({ id: user.id, ...updates })
          .select()
          .single()
        if (insertErr) throw insertErr
        if (created) setProfile(created)
        setNeedsProfileSetup(false)
        return created
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
      resetPasswordForEmail,
      updatePassword,
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
