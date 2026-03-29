/** Get today's date in local timezone as YYYY-MM-DD */
export function getLocalToday() {
  const d = new Date()
  return `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}-${String(d.getDate()).padStart(2, '0')}`
}

/** Get today's date in US Eastern time as YYYY-MM-DD */
export function getEasternToday() {
  return new Date().toLocaleDateString('en-CA', { timeZone: 'America/New_York' })
}
