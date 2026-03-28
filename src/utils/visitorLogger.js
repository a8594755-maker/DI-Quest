import { supabase } from './supabase'

const SESSION_KEY = 'di-quest-visit-logged'

export async function logVisit({ userId, isGuest }) {
  // Only log once per session
  if (sessionStorage.getItem(SESSION_KEY)) return
  sessionStorage.setItem(SESSION_KEY, '1')

  try {
    // Fetch public IP
    let ip = null
    try {
      const res = await fetch('https://api.ipify.org?format=json', { signal: AbortSignal.timeout(3000) })
      const data = await res.json()
      ip = data.ip
    } catch {}

    await supabase.from('visitor_logs').insert({
      user_id: userId || null,
      is_guest: !!isGuest,
      ip_address: ip,
      user_agent: navigator.userAgent,
      referrer: document.referrer || null,
      page_path: window.location.pathname,
    })
  } catch (err) {
    console.error('[visitorLogger]', err)
  }
}
