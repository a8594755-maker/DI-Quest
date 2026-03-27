import { useState, useEffect } from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import { User, Check, Gift, Crown } from 'lucide-react'
import { useTranslation } from 'react-i18next'
import { useAuth } from '../contexts/AuthContext'
import { usePromoCode } from '../hooks/usePromoCode'

function ProfileSetupModal({ isOpen, onClose }) {
  const { t } = useTranslation('auth')
  const { profile, completeProfileSetup } = useAuth()
  const { redeemCode, loading: promoLoading } = usePromoCode()
  const [username, setUsername] = useState('')
  const [displayName, setDisplayName] = useState('')
  const [promoCode, setPromoCode] = useState('')
  const [error, setError] = useState('')
  const [promoStatus, setPromoStatus] = useState(null) // 'success' | 'error'
  const [promoMessage, setPromoMessage] = useState('')
  const [saving, setSaving] = useState(false)

  // Reset state when modal opens
  useEffect(() => {
    if (isOpen && profile) {
      setDisplayName(profile.display_name || '')
      setUsername(profile.username?.startsWith('user_') ? '' : (profile.username || ''))
    }
  }, [isOpen, profile])

  const handleSubmit = async (e) => {
    e.preventDefault()
    setError('')

    const trimmed = username.trim().toLowerCase()
    if (trimmed.length < 3) {
      setError(t('error.usernameTooShort'))
      return
    }
    if (!/^[a-z0-9_]+$/.test(trimmed)) {
      setError(t('profile.usernameInvalid', 'Username can only contain lowercase letters, numbers, and underscores'))
      return
    }

    setSaving(true)
    try {
      const timeout = new Promise((_, reject) =>
        setTimeout(() => reject(new Error('TIMEOUT')), 10000)
      )
      await Promise.race([
        completeProfileSetup({ username: trimmed, displayName: displayName.trim() || trimmed }),
        timeout,
      ])
      onClose()
    } catch (err) {
      if (err.message === 'TIMEOUT') {
        setError(t('profile.timeout', 'Request timed out. Please try again.'))
      } else if (err.message?.includes('duplicate') || err.code === '23505') {
        setError(t('profile.usernameTaken', 'This username is already taken'))
      } else {
        setError(err.message)
      }
    } finally {
      setSaving(false)
    }
  }

  const handlePromo = async () => {
    if (!promoCode.trim()) return
    setPromoStatus(null)
    setPromoMessage('')
    try {
      const result = await redeemCode(promoCode)
      setPromoStatus('success')
      setPromoMessage(t('promo.success', 'Premium activated! All content unlocked.'))
      setPromoCode('')
      // Force re-render with updated premium status
      if (result?.role === 'premium') {
        setLocalPremium(true)
      }
    } catch (err) {
      setPromoStatus('error')
      if (err.message === 'INVALID_CODE') {
        setPromoMessage(t('promo.invalid', 'Invalid promo code'))
      } else if (err.message === 'CODE_EXPIRED') {
        setPromoMessage(t('promo.expired', 'This code has expired'))
      } else {
        setPromoMessage(err.message)
      }
    }
  }

  // Track premium status locally to update immediately after promo code redemption
  const [localPremium, setLocalPremium] = useState(false)
  const isPremium = profile?.role === 'premium' || localPremium

  return (
    <AnimatePresence>
      {isOpen && (
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          exit={{ opacity: 0 }}
          className="fixed inset-0 z-[60] flex items-center justify-center bg-black/60 backdrop-blur-sm p-4"
          onClick={onClose}
        >
          <motion.div
            initial={{ opacity: 0, scale: 0.9, y: 20 }}
            animate={{ opacity: 1, scale: 1, y: 0 }}
            exit={{ opacity: 0, scale: 0.9, y: 20 }}
            transition={{ type: 'spring', damping: 25, stiffness: 300 }}
            className="w-full max-w-sm bg-brand-dark border border-slate-700 rounded-2xl p-6 max-h-[90vh] overflow-y-auto"
            onClick={(e) => e.stopPropagation()}
          >
            <div className="text-center mb-6">
              <div className="w-16 h-16 bg-brand-primary/20 rounded-full flex items-center justify-center mx-auto mb-4">
                <User className="w-8 h-8 text-brand-primary" />
              </div>
              <h2 className="text-xl font-bold text-white mb-1">
                {t('profile.setupTitle', 'Set Up Your Profile')}
              </h2>
              <p className="text-slate-400 text-sm">
                {t('profile.setupDesc', 'Choose a username so friends can find you')}
              </p>
              {isPremium && (
                <div className="inline-flex items-center gap-1.5 mt-2 px-3 py-1 bg-amber-500/20 text-amber-400 rounded-full text-xs font-medium">
                  <Crown className="w-3.5 h-3.5" />
                  Premium
                </div>
              )}
            </div>

            <form onSubmit={handleSubmit} className="space-y-4">
              <div>
                <label className="block text-sm text-slate-300 mb-1.5">
                  {t('signup.username')} *
                </label>
                <input
                  type="text"
                  value={username}
                  onChange={(e) => setUsername(e.target.value.toLowerCase().replace(/[^a-z0-9_]/g, ''))}
                  placeholder={t('signup.usernamePlaceholder')}
                  className="w-full px-4 py-2.5 bg-slate-800 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:border-brand-primary focus:outline-none"
                  autoFocus
                  maxLength={20}
                />
              </div>

              <div>
                <label className="block text-sm text-slate-300 mb-1.5">
                  {t('signup.displayName')}
                </label>
                <input
                  type="text"
                  value={displayName}
                  onChange={(e) => setDisplayName(e.target.value)}
                  placeholder={t('signup.displayNamePlaceholder')}
                  className="w-full px-4 py-2.5 bg-slate-800 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:border-brand-primary focus:outline-none"
                  maxLength={30}
                />
              </div>

              {error && (
                <p className="text-red-400 text-sm">{error}</p>
              )}

              <button
                type="submit"
                disabled={saving || username.trim().length < 3}
                className="btn-primary w-full flex items-center justify-center gap-2 disabled:opacity-50"
              >
                {saving ? (
                  <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin" />
                ) : (
                  <Check className="w-4 h-4" />
                )}
                {t('profile.saveProfile', 'Save Profile')}
              </button>
            </form>

            {/* Promo Code Section */}
            {!isPremium && (
              <div className="mt-6 pt-5 border-t border-slate-700/50">
                <div className="flex items-center gap-2 mb-3">
                  <Gift className="w-4 h-4 text-brand-accent" />
                  <span className="text-sm text-slate-300 font-medium">
                    {t('promo.title', 'Promo Code')}
                  </span>
                </div>
                <div className="flex gap-2">
                  <input
                    type="text"
                    value={promoCode}
                    onChange={(e) => setPromoCode(e.target.value.toUpperCase())}
                    placeholder={t('promo.placeholder', 'Enter code')}
                    className="flex-1 px-3 py-2 bg-slate-800 border border-slate-700 rounded-xl text-white placeholder-slate-500 focus:border-brand-accent focus:outline-none text-sm font-mono"
                    maxLength={20}
                  />
                  <button
                    type="button"
                    onClick={handlePromo}
                    disabled={promoLoading || !promoCode.trim()}
                    className="px-4 py-2 bg-brand-accent/20 text-brand-accent rounded-xl text-sm font-medium hover:bg-brand-accent/30 transition-colors disabled:opacity-50"
                  >
                    {promoLoading ? '...' : t('promo.redeem', 'Redeem')}
                  </button>
                </div>
                {promoStatus && (
                  <p className={`text-xs mt-2 ${promoStatus === 'success' ? 'text-emerald-400' : 'text-red-400'}`}>
                    {promoMessage}
                  </p>
                )}
              </div>
            )}
          </motion.div>
        </motion.div>
      )}
    </AnimatePresence>
  )
}

export default ProfileSetupModal
