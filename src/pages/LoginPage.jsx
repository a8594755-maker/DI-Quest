import { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { motion, AnimatePresence } from 'framer-motion'
import { Briefcase, Mail, Lock, User, Eye, EyeOff, AlertCircle } from 'lucide-react'
import { useTranslation } from 'react-i18next'
import { useAuth } from '../contexts/AuthContext'
import LanguageSwitcher from '../components/LanguageSwitcher'

function LoginPage() {
  const { t } = useTranslation('auth')
  const navigate = useNavigate()
  const { signIn, signUp, signInWithGoogle, continueAsGuest, resetPasswordForEmail } = useAuth()

  const [mode, setMode] = useState('signin') // 'signin' | 'signup' | 'forgot'
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [confirmPassword, setConfirmPassword] = useState('')
  const [username, setUsername] = useState('')
  const [displayName, setDisplayName] = useState('')
  const [showPassword, setShowPassword] = useState(false)
  const [error, setError] = useState('')
  const [loading, setLoading] = useState(false)
  const [signUpSuccess, setSignUpSuccess] = useState(false)
  const [resetEmailSent, setResetEmailSent] = useState(false)

  const handleSubmit = async (e) => {
    e.preventDefault()
    setError('')
    setLoading(true)

    try {
      if (mode === 'forgot') {
        await resetPasswordForEmail(email)
        setResetEmailSent(true)
        setLoading(false)
        return
      }
      if (mode === 'signup') {
        if (password !== confirmPassword) {
          setError(t('error.passwordMismatch'))
          setLoading(false)
          return
        }
        if (username.length < 3) {
          setError(t('error.usernameTooShort'))
          setLoading(false)
          return
        }
        await signUp({ email, password, username, displayName: displayName || username })
        setSignUpSuccess(true)
      } else {
        await signIn({ email, password })
        navigate('/di-quest', { replace: true })
      }
    } catch (err) {
      setError(err.message)
    } finally {
      setLoading(false)
    }
  }

  const handleGoogle = async () => {
    try {
      await signInWithGoogle()
    } catch (err) {
      setError(err.message)
    }
  }

  const handleGuest = () => {
    continueAsGuest()
    navigate('/di-quest', { replace: true })
  }

  if (resetEmailSent) {
    return (
      <div className="min-h-screen bg-slate-950 flex items-center justify-center p-4">
        <motion.div
          initial={{ opacity: 0, scale: 0.9 }}
          animate={{ opacity: 1, scale: 1 }}
          className="w-full max-w-md bg-brand-dark border border-slate-700 rounded-2xl p-8 text-center"
        >
          <div className="w-16 h-16 bg-emerald-500/20 rounded-full flex items-center justify-center mx-auto mb-4">
            <Mail className="w-8 h-8 text-emerald-400" />
          </div>
          <h2 className="text-xl font-bold text-white mb-2">{t('forgot.checkEmail')}</h2>
          <p className="text-slate-400 text-sm mb-6">{t('forgot.checkEmailDesc')}</p>
          <button
            onClick={() => { setResetEmailSent(false); setMode('signin') }}
            className="btn-primary"
          >
            {t('signup.backToLogin')}
          </button>
        </motion.div>
      </div>
    )
  }

  if (signUpSuccess) {
    return (
      <div className="min-h-screen bg-slate-950 flex items-center justify-center p-4">
        <motion.div
          initial={{ opacity: 0, scale: 0.9 }}
          animate={{ opacity: 1, scale: 1 }}
          className="w-full max-w-md bg-brand-dark border border-slate-700 rounded-2xl p-8 text-center"
        >
          <div className="w-16 h-16 bg-emerald-500/20 rounded-full flex items-center justify-center mx-auto mb-4">
            <Mail className="w-8 h-8 text-emerald-400" />
          </div>
          <h2 className="text-xl font-bold text-white mb-2">{t('signup.checkEmail')}</h2>
          <p className="text-slate-400 text-sm mb-6">{t('signup.checkEmailDesc')}</p>
          <button
            onClick={() => { setSignUpSuccess(false); setMode('signin') }}
            className="btn-primary"
          >
            {t('signup.backToLogin')}
          </button>
        </motion.div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-slate-950 flex items-center justify-center p-4">
      {/* Language switcher */}
      <div className="fixed top-4 right-4 z-10">
        <LanguageSwitcher />
      </div>

      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        className="w-full max-w-md"
      >
        {/* Logo */}
        <div className="flex items-center justify-center gap-3 mb-8">
          <div className="w-12 h-12 bg-gradient-to-br from-brand-primary to-brand-secondary rounded-xl flex items-center justify-center">
            <Briefcase className="w-6 h-6 text-white" />
          </div>
          <div>
            <h1 className="text-2xl font-bold text-white">DI Quest</h1>
            <p className="text-xs text-slate-400">{t('tagline')}</p>
          </div>
        </div>

        {/* Card */}
        <div className="bg-brand-dark border border-slate-700 rounded-2xl p-6 sm:p-8">
          {/* Tabs */}
          {mode === 'forgot' ? (
            <div className="mb-6">
              <button
                onClick={() => { setMode('signin'); setError('') }}
                className="text-sm text-slate-400 hover:text-white transition-colors"
              >
                &larr; {t('signup.backToLogin')}
              </button>
              <h2 className="text-lg font-bold text-white mt-2">{t('forgot.title')}</h2>
              <p className="text-slate-400 text-sm mt-1">{t('forgot.desc')}</p>
            </div>
          ) : (
          <div className="flex mb-6 bg-slate-800 rounded-lg p-1">
            {['signin', 'signup'].map((tab) => (
              <button
                key={tab}
                onClick={() => { setMode(tab); setError('') }}
                className={`flex-1 py-2 text-sm font-medium rounded-md transition-colors ${
                  mode === tab
                    ? 'bg-brand-primary text-white'
                    : 'text-slate-400 hover:text-white'
                }`}
              >
                {t(`${tab}.title`)}
              </button>
            ))}
          </div>
          )}

          {/* Error */}
          <AnimatePresence>
            {error && (
              <motion.div
                initial={{ opacity: 0, height: 0 }}
                animate={{ opacity: 1, height: 'auto' }}
                exit={{ opacity: 0, height: 0 }}
                className="mb-4 p-3 bg-red-500/10 border border-red-500/30 rounded-lg flex items-start gap-2"
              >
                <AlertCircle className="w-4 h-4 text-red-400 mt-0.5 shrink-0" />
                <p className="text-red-400 text-sm">{error}</p>
              </motion.div>
            )}
          </AnimatePresence>

          {/* Form */}
          <form onSubmit={handleSubmit} className="space-y-4">
            <AnimatePresence mode="wait">
              {mode === 'signup' && (
                <motion.div
                  key="signup-fields"
                  initial={{ opacity: 0, height: 0 }}
                  animate={{ opacity: 1, height: 'auto' }}
                  exit={{ opacity: 0, height: 0 }}
                  className="space-y-4"
                >
                  {/* Username */}
                  <div>
                    <label className="block text-sm text-slate-400 mb-1.5">{t('signup.username')}</label>
                    <div className="relative">
                      <User className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-500" />
                      <input
                        type="text"
                        value={username}
                        onChange={(e) => setUsername(e.target.value.toLowerCase().replace(/[^a-z0-9_]/g, ''))}
                        placeholder={t('signup.usernamePlaceholder')}
                        className="w-full pl-10 pr-4 py-2.5 bg-slate-800 border border-slate-700 rounded-lg text-white placeholder-slate-500 focus:border-brand-primary focus:outline-none transition-colors"
                        required
                        minLength={3}
                        maxLength={20}
                      />
                    </div>
                  </div>

                  {/* Display Name */}
                  <div>
                    <label className="block text-sm text-slate-400 mb-1.5">{t('signup.displayName')}</label>
                    <input
                      type="text"
                      value={displayName}
                      onChange={(e) => setDisplayName(e.target.value)}
                      placeholder={t('signup.displayNamePlaceholder')}
                      className="w-full px-4 py-2.5 bg-slate-800 border border-slate-700 rounded-lg text-white placeholder-slate-500 focus:border-brand-primary focus:outline-none transition-colors"
                      maxLength={30}
                    />
                  </div>
                </motion.div>
              )}
            </AnimatePresence>

            {/* Email */}
            <div>
              <label className="block text-sm text-slate-400 mb-1.5">{t('common.email')}</label>
              <div className="relative">
                <Mail className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-500" />
                <input
                  type="email"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  placeholder={t('common.emailPlaceholder')}
                  className="w-full pl-10 pr-4 py-2.5 bg-slate-800 border border-slate-700 rounded-lg text-white placeholder-slate-500 focus:border-brand-primary focus:outline-none transition-colors"
                  required
                />
              </div>
            </div>

            {/* Password */}
            {mode !== 'forgot' && (
            <div>
              <div className="flex items-center justify-between mb-1.5">
                <label className="block text-sm text-slate-400">{t('common.password')}</label>
                {mode === 'signin' && (
                  <button
                    type="button"
                    onClick={() => { setMode('forgot'); setError('') }}
                    className="text-xs text-brand-primary hover:underline"
                  >
                    {t('forgot.link')}
                  </button>
                )}
              </div>
              <div className="relative">
                <Lock className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-500" />
                <input
                  type={showPassword ? 'text' : 'password'}
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  placeholder={t('common.passwordPlaceholder')}
                  className="w-full pl-10 pr-10 py-2.5 bg-slate-800 border border-slate-700 rounded-lg text-white placeholder-slate-500 focus:border-brand-primary focus:outline-none transition-colors"
                  required
                  minLength={6}
                />
                <button
                  type="button"
                  onClick={() => setShowPassword(!showPassword)}
                  className="absolute right-3 top-1/2 -translate-y-1/2 text-slate-500 hover:text-slate-300"
                >
                  {showPassword ? <EyeOff className="w-4 h-4" /> : <Eye className="w-4 h-4" />}
                </button>
              </div>
            </div>
            )}

            {/* Confirm Password */}
            <AnimatePresence>
              {mode === 'signup' && mode !== 'forgot' && (
                <motion.div
                  initial={{ opacity: 0, height: 0 }}
                  animate={{ opacity: 1, height: 'auto' }}
                  exit={{ opacity: 0, height: 0 }}
                >
                  <label className="block text-sm text-slate-400 mb-1.5">{t('signup.confirmPassword')}</label>
                  <div className="relative">
                    <Lock className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-500" />
                    <input
                      type={showPassword ? 'text' : 'password'}
                      value={confirmPassword}
                      onChange={(e) => setConfirmPassword(e.target.value)}
                      placeholder={t('signup.confirmPasswordPlaceholder')}
                      className="w-full pl-10 pr-4 py-2.5 bg-slate-800 border border-slate-700 rounded-lg text-white placeholder-slate-500 focus:border-brand-primary focus:outline-none transition-colors"
                      required
                      minLength={6}
                    />
                  </div>
                </motion.div>
              )}
            </AnimatePresence>

            {/* Submit */}
            <button
              type="submit"
              disabled={loading}
              className="btn-primary w-full flex items-center justify-center gap-2"
            >
              {loading && <div className="w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin" />}
              {mode === 'forgot' ? t('forgot.submit') : mode === 'signin' ? t('signin.submit') : t('signup.submit')}
            </button>
          </form>

          {/* Divider + Google + Guest (hidden in forgot mode) */}
          {mode !== 'forgot' && (<>
          <div className="flex items-center gap-3 my-6">
            <div className="flex-1 h-px bg-slate-700" />
            <span className="text-slate-500 text-xs">{t('common.orContinueWith')}</span>
            <div className="flex-1 h-px bg-slate-700" />
          </div>

          {/* Google */}
          <button
            onClick={handleGoogle}
            className="w-full py-2.5 bg-slate-800 border border-slate-700 rounded-lg text-white hover:bg-slate-700 transition-colors flex items-center justify-center gap-2 text-sm"
          >
            <svg className="w-4 h-4" viewBox="0 0 24 24">
              <path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92a5.06 5.06 0 0 1-2.2 3.32v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.1z" />
              <path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" />
              <path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z" />
              <path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" />
            </svg>
            {t('common.google')}
          </button>

          {/* Guest */}
          <div className="mt-6 text-center">
            <button
              onClick={handleGuest}
              className="text-slate-400 text-sm hover:text-brand-primary transition-colors"
            >
              {t('common.guest')}
            </button>
            <p className="text-slate-600 text-xs mt-1">{t('common.guestNote')}</p>
          </div>
          </>)}
        </div>

        {/* Switch mode */}
        {mode !== 'forgot' && <p className="text-center text-slate-400 text-sm mt-4">
          {mode === 'signin' ? t('signin.noAccount') : t('signup.hasAccount')}{' '}
          <button
            onClick={() => { setMode(mode === 'signin' ? 'signup' : 'signin'); setError('') }}
            className="text-brand-primary hover:underline"
          >
            {mode === 'signin' ? t('signin.signUpLink') : t('signup.signInLink')}
          </button>
        </p>}
      </motion.div>
    </div>
  )
}

export default LoginPage
