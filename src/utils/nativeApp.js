/**
 * Detect if the web app is running inside the native iOS wrapper.
 *
 * Detection methods (both set by WKUserScript at document-start):
 *   1. window.__DI_QUEST_NATIVE__  — JS flag injected by WKWebView
 *   2. User-Agent contains "DIQuestApp"
 */

export function isNativeApp() {
  if (typeof window === 'undefined') return false
  return (
    window.__DI_QUEST_NATIVE__ === true ||
    /DIQuestApp/i.test(navigator.userAgent)
  )
}

export function getNativeAppVersion() {
  if (typeof window === 'undefined') return null
  return window.__DI_QUEST_VERSION__ ?? null
}
