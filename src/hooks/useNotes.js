import { useState, useEffect, useRef, useCallback } from 'react'
import { supabase } from '../utils/supabase'
import { useAuth } from '../contexts/AuthContext'

const NOTES_STORAGE_KEY = 'di-quest-notes'

function loadLocal() {
  try {
    const raw = localStorage.getItem(NOTES_STORAGE_KEY)
    return raw ? JSON.parse(raw) : []
  } catch { return [] }
}

function saveLocal(notes) {
  try {
    localStorage.setItem(NOTES_STORAGE_KEY, JSON.stringify(notes))
  } catch {}
}

function mergeNotes(local, cloud) {
  const map = new Map()
  for (const n of local) map.set(n.id, n)
  for (const n of cloud) {
    const existing = map.get(n.id)
    if (!existing || (n.updatedAt || 0) >= (existing.updatedAt || 0)) {
      map.set(n.id, n)
    }
  }
  return Array.from(map.values()).sort((a, b) => {
    if (a.pinned !== b.pinned) return a.pinned ? -1 : 1
    return (b.updatedAt || 0) - (a.updatedAt || 0)
  })
}

export function useNotes() {
  const { user, isAuthenticated } = useAuth()
  const [notes, setNotes] = useState(() => loadLocal())
  const cloudLoadedRef = useRef(false)
  const saveTimerRef = useRef(null)

  const saveToCloud = useCallback(async (userId, notesToSave) => {
    try {
      const rows = notesToSave.map(n => ({
        id: n.id,
        user_id: userId,
        title: n.title,
        content: n.content,
        world_id: n.worldId || null,
        quest_id: n.questId || null,
        challenge_key: n.challengeKey || null,
        pinned: n.pinned || false,
        created_at: new Date(n.createdAt).toISOString(),
        updated_at: new Date(n.updatedAt).toISOString(),
      }))
      await supabase
        .from('user_notes')
        .upsert(rows, { onConflict: 'id,user_id' })
    } catch {}
  }, [])

  // Load from cloud on first auth
  useEffect(() => {
    if (!isAuthenticated || !user || cloudLoadedRef.current) return
    cloudLoadedRef.current = true

    const loadCloud = async () => {
      try {
        const { data, error } = await supabase
          .from('user_notes')
          .select('*')
          .eq('user_id', user.id)
          .order('updated_at', { ascending: false })

        if (error) {
          console.warn('Failed to load notes from cloud:', error.message)
          return
        }

        if (data && data.length > 0) {
          const cloudNotes = data.map(row => ({
            id: row.id,
            title: row.title,
            content: row.content,
            worldId: row.world_id,
            questId: row.quest_id,
            challengeKey: row.challenge_key,
            pinned: row.pinned,
            createdAt: new Date(row.created_at).getTime(),
            updatedAt: new Date(row.updated_at).getTime(),
          }))

          setNotes(prev => {
            const merged = mergeNotes(prev, cloudNotes)
            saveLocal(merged)
            return merged
          })
        } else {
          const local = loadLocal()
          if (local.length > 0) {
            await saveToCloud(user.id, local)
          }
        }
      } catch (err) {
        console.warn('Notes cloud sync error:', err)
      }
    }
    loadCloud()
  }, [isAuthenticated, user, saveToCloud])

  // Debounced cloud sync on notes change
  const scheduleSave = useCallback((updated) => {
    saveLocal(updated)
    if (isAuthenticated && user) {
      if (saveTimerRef.current) clearTimeout(saveTimerRef.current)
      saveTimerRef.current = setTimeout(() => {
        saveToCloud(user.id, updated)
      }, 2000)
    }
  }, [isAuthenticated, user, saveToCloud])

  const createNote = useCallback((initialData = {}) => {
    const now = Date.now()
    const newNote = {
      id: crypto.randomUUID(),
      title: initialData.title || '',
      content: initialData.content || '',
      worldId: initialData.worldId || null,
      questId: initialData.questId || null,
      challengeKey: initialData.challengeKey || null,
      pinned: false,
      createdAt: now,
      updatedAt: now,
    }
    setNotes(prev => {
      const updated = [newNote, ...prev]
      scheduleSave(updated)
      return updated
    })
    return newNote
  }, [scheduleSave])

  const updateNote = useCallback((noteId, changes) => {
    setNotes(prev => {
      const updated = prev.map(n =>
        n.id === noteId
          ? { ...n, ...changes, updatedAt: Date.now() }
          : n
      )
      scheduleSave(updated)
      return updated
    })
  }, [scheduleSave])

  const deleteNote = useCallback(async (noteId) => {
    setNotes(prev => {
      const updated = prev.filter(n => n.id !== noteId)
      saveLocal(updated)
      return updated
    })

    if (isAuthenticated && user) {
      try {
        await supabase
          .from('user_notes')
          .delete()
          .eq('id', noteId)
          .eq('user_id', user.id)
      } catch {}
    }
  }, [isAuthenticated, user])

  const togglePin = useCallback((noteId) => {
    setNotes(prev => {
      const updated = prev.map(n =>
        n.id === noteId ? { ...n, pinned: !n.pinned, updatedAt: Date.now() } : n
      ).sort((a, b) => {
        if (a.pinned !== b.pinned) return a.pinned ? -1 : 1
        return (b.updatedAt || 0) - (a.updatedAt || 0)
      })
      scheduleSave(updated)
      return updated
    })
  }, [scheduleSave])

  const getNotesForQuest = useCallback((questId) => {
    return notes.filter(n => n.questId === questId)
  }, [notes])

  const getNotesForWorld = useCallback((worldId) => {
    return notes.filter(n => n.worldId === Number(worldId))
  }, [notes])

  const getNotesForChallenge = useCallback((challengeKey) => {
    return notes.filter(n => n.challengeKey === challengeKey)
  }, [notes])

  const getNotesForContext = useCallback((worldId, questId, challengeKey) => {
    return notes.filter(n =>
      (challengeKey && n.challengeKey === challengeKey) ||
      (questId && n.questId === questId) ||
      (worldId && n.worldId === Number(worldId))
    )
  }, [notes])

  return {
    notes,
    createNote,
    updateNote,
    deleteNote,
    togglePin,
    getNotesForQuest,
    getNotesForWorld,
    getNotesForChallenge,
    getNotesForContext,
  }
}
