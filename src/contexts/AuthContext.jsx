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
  const getGoogleMeta = (userMeta, authUser) => {
    const meta = userMeta || {}
    // Google data can be in user_metadata directly or in identities
    const identityData = authUser?.identities?.find(i => i.provider === 'google')?.identity_data || {}
    return {
      full_name: meta.full_name || meta.name || identityData.full_name || identityData.name || '',
      avatar_url: meta.avatar_url || meta.picture || identityData.avatar_url || identityData.picture || '',
      email: meta.email || identityData.email || '',
    }
  }

  // Fetch profile from Supabase, auto-create if missing, auto-populate from Google metadata
  const fetchProfile = useCallback(async (userId, userMeta, sessionUser) => {
    let data, error
    for (let attempt = 0; attempt < 2; attempt++) {
      const result = await supabase
        .from('profiles')
        .select('*')
        .eq('id', userId)
        .maybeSingle()
      data = result.data
      error = result.error
      if (!error) break
      console.error('Error fetching profile:', error)
      if (attempt === 0) await new Promise(r => setTimeout(r, 1000))
    }
    if (error) return null

    // Profile doesn't exist — create it (user was created before migration)
    if (!data) {
      const gMeta = getGoogleMeta(userMeta, sessionUser)
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
    const gMeta = getGoogleMeta(userMeta, sessionUser)
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
  useEffect(() => {
    let initialSessionHandled = false

    // Safety timeout
    const loadingTimeout = setTimeout(() => {
      setLoading(prev => {
        if (prev) console.warn('Auth loading timeout — forcing load complete')
        return false
      })
    }, 10000)

    const handleSession = async (session) => {
      if (session?.user) {
        setUser(session.user)
        setIsGuest(false)
        await fetchProfile(session.user.id, session.user.user_metadata, session.user)
      } else {
        setUser(null)
        setProfile(null)
        if (!initialSessionHandled) {
          const wasGuest = localStorage.getItem('di-quest-guest')
          if (wasGuest) setIsGuest(true)
        }
      }
      initialSessionHandled = true
      clearTimeout(loadingTimeout)
      setLoading(false)
    }

    // If URL has OAuth code, exchange it explicitly first
    const params = new URLSearchParams(window.location.search)
    const code = params.get('code')
    if (code) {
      supabase.auth.exchangeCodeForSession(code).then(({ data, error }) => {
        if (error) {
          console.error('Code exchange failed:', error.message)
          // Fall back to existing session
          supabase.auth.getSession().then(({ data: d }) => handleSession(d.session))
        } else {
          handleSession(data.session)
        }
        // Clean up URL
        window.history.replaceState({}, '', window.location.pathname)
      })
    }

    const { data: { subscription } } = supabase.auth.onAuthStateChange(async (event, session) => {
      try {
        if (event === 'TOKEN_REFRESHED' && session?.user) {
          setUser(session.user)
          return
        }
        if (event === 'SIGNED_OUT') {
          setUser(null)
          setProfile(null)
          setIsGuest(false)
          clearTimeout(loadingTimeout)
          setLoading(false)
          return
        }
        // Skip if we already handled via explicit code exchange
        if (code && initialSessionHandled) return
        await handleSession(session)
      } catch (err) {
        if (err?.message?.includes('Lock')) {
          console.warn('Auth lock contention (safe to ignore):', err.message)
          return
        }
        console.error('Auth state change error:', err)
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
