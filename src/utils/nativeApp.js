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

/**
 * Trigger native haptic feedback.
 * Types: "success" | "warning" | "error" | "light" | "medium" | "heavy" | "selection"
 */
export function triggerHaptic(type = 'light') {
  if (!isNativeApp()) return
  window.webkit?.messageHandlers?.haptic?.postMessage({ type })
}

/**
 * Open native iOS share sheet.
 * @param {string} text - Text to share
 * @param {string} [url] - Optional URL to share
 * @returns {boolean} Whether the share was triggered
 */
export function nativeShare(text, url) {
  if (!isNativeApp()) return false
  window.webkit?.messageHandlers?.share?.postMessage({ text, url })
  return true
}

/**
 * Open the native Settings screen.
 */
export function openNativeSettings() {
  if (!isNativeApp()) return
  window.webkit?.messageHandlers?.openSettings?.postMessage({})
}

/**
 * Request biometric authentication (Face ID / Touch ID).
 * @param {string} reason - The reason shown to the user
 * @returns {Promise<boolean>} Whether authentication succeeded
 */
export function requestBiometricAuth(reason = '驗證身分') {
  return new Promise((resolve) => {
    if (!isNativeApp()) {
      resolve(false)
      return
    }
    window.__DI_QUEST_BRIDGE__ = window.__DI_QUEST_BRIDGE__ || {}
    window.__DI_QUEST_BRIDGE__.onBiometricResult = (result) => resolve(result.success)
    window.webkit?.messageHandlers?.biometricAuth?.postMessage({ reason })
  })
}
