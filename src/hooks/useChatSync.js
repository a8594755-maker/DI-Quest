import { useState, useEffect, useRef, useCallback } from 'react'
import { supabase } from '../utils/supabase'
import { useAuth } from '../contexts/AuthContext'

const CHAT_STORAGE_KEY = 'di-quest-chat-history'
const THIRTY_DAYS_MS = 30 * 24 * 60 * 60 * 1000

// ── localStorage helpers ──────────────────────────────────
function loadLocal() {
  try {
    const raw = localStorage.getItem(CHAT_STORAGE_KEY)
    return raw ? JSON.parse(raw) : []
  } catch { return [] }
}

function saveLocal(sessions) {
  try {
    localStorage.setItem(CHAT_STORAGE_KEY, JSON.stringify(sessions.slice(0, 30)))
  } catch {}
}

// ── Filter sessions older than 30 days ────────────────────
function filterRecent(sessions) {
  const cutoff = Date.now() - THIRTY_DAYS_MS
  return sessions.filter(s => (s.updatedAt || s.createdAt || 0) > cutoff)
}

// ── Merge local + cloud sessions (cloud wins on conflict) ─
function mergeSessions(local, cloud) {
  const map = new Map()
  for (const s of local) map.set(s.id, s)
  for (const s of cloud) {
    const existing = map.get(s.id)
    if (!existing || (s.updatedAt || 0) >= (existing.updatedAt || 0)) {
      map.set(s.id, s)
    }
  }
  return filterRecent(
    Array.from(map.values()).sort((a, b) => (b.updatedAt || 0) - (a.updatedAt || 0))
  ).slice(0, 30)
}

export function useChatSync() {
  const { user, isAuthenticated } = useAuth()
  const [sessions, setSessions] = useState(() => {
    const all = loadLocal()
    const valid = all.filter(s => s.messages?.some(m => m.role === 'user'))
    if (valid.length !== all.length) saveLocal(valid)
    return filterRecent(valid)
  })
  const cloudLoadedRef = useRef(false)
  const saveTimerRef = useRef(null)

  // Debounced save to cloud when sessions change
  const saveToCloud = useCallback(async (userId, session) => {
    try {
      await supabase
        .from('chat_sessions')
        .upsert({
          id: session.id,
          user_id: userId,
          title: session.title,
          messages: session.messages,
          created_at: new Date(session.createdAt).toISOString(),
          updated_at: new Date(session.updatedAt).toISOString(),
        }, { onConflict: 'id,user_id' })
    } catch {}
  }, [])

  const uploadAllToCloud = useCallback(async (userId, localSessions) => {
    try {
      const rows = localSessions.map(s => ({
        id: s.id,
        user_id: userId,
        title: s.title,
        messages: s.messages,
        created_at: new Date(s.createdAt).toISOString(),
        updated_at: new Date(s.updatedAt).toISOString(),
      }))
      await supabase
        .from('chat_sessions')
        .upsert(rows, { onConflict: 'id,user_id' })
    } catch {}
  }, [])

  // Load from Supabase on first auth, merge with localStorage
  useEffect(() => {
    if (!isAuthenticated || !user || cloudLoadedRef.current) return
    cloudLoadedRef.current = true

    const loadCloud = async () => {
      try {
        const cutoffDate = new Date(Date.now() - THIRTY_DAYS_MS).toISOString()
        const { data, error } = await supabase
          .from('chat_sessions')
          .select('*')
          .eq('user_id', user.id)
          .gte('updated_at', cutoffDate)
          .order('updated_at', { ascending: false })
          .limit(30)

        if (error) {
          console.warn('Failed to load chat sessions from cloud:', error.message)
          return
        }

        if (data && data.length > 0) {
          const cloudSessions = data.map(row => ({
            id: row.id,
            title: row.title,
            messages: row.messages || [],
            createdAt: new Date(row.created_at).getTime(),
            updatedAt: new Date(row.updated_at).getTime(),
          }))

          setSessions(prev => {
            const merged = mergeSessions(prev, cloudSessions)
            saveLocal(merged)
            return merged
          })
        } else {
          // No cloud data — upload local sessions to cloud
          const local = loadLocal()
          if (local.length > 0) {
            await uploadAllToCloud(user.id, filterRecent(local))
          }
        }
      } catch (err) {
        console.warn('Chat cloud sync error:', err)
      }
    }
    loadCloud()
  }, [isAuthenticated, user, uploadAllToCloud])

  // Update or create a session
  const updateSession = useCallback((sessionOrUpdater) => {
    setSessions(prev => {
      const updated = typeof sessionOrUpdater === 'function'
        ? sessionOrUpdater(prev)
        : prev

      saveLocal(updated)

      // Debounced cloud save
      if (isAuthenticated && user) {
        if (saveTimerRef.current) clearTimeout(saveTimerRef.current)
        saveTimerRef.current = setTimeout(() => {
          // Find the most recently updated session and save it
          const newest = updated[0]
          if (newest) saveToCloud(user.id, newest)
        }, 2000)
      }

      return updated
    })
  }, [isAuthenticated, user, saveToCloud])

  // Delete a session
  const deleteSession = useCallback(async (sessionId) => {
    setSessions(prev => {
      const updated = prev.filter(s => s.id !== sessionId)
      saveLocal(updated)
      return updated
    })

    if (isAuthenticated && user) {
      try {
        await supabase
          .from('chat_sessions')
          .delete()
          .eq('id', sessionId)
          .eq('user_id', user.id)
      } catch {}
    }
  }, [isAuthenticated, user])

  return { sessions, updateSession, deleteSession }
}
