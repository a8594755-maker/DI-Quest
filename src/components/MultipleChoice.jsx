import { useState } from 'react'
import { CheckCircle, XCircle } from 'lucide-react'
import { motion } from 'framer-motion'
import { useTranslation } from 'react-i18next'
import { triggerHaptic } from '../utils/nativeApp'

const MAX_ATTEMPTS = 3

function MultipleChoice({ question, options: rawOptions, correctAnswer, onAnswer, disabled = false, showAnswer = false }) {
  const { t } = useTranslation('case')
  const [selected, setSelected] = useState(null)
  const [submitted, setSubmitted] = useState(false)
  const [attemptCount, setAttemptCount] = useState(0)
  const [wrongSelections, setWrongSelections] = useState([])

  // Reveal correct answer: parent says show, user answered correctly, or exhausted attempts
  const revealAnswer = showAnswer || (submitted && (selected === correctAnswer || attemptCount >= MAX_ATTEMPTS))

  const options = rawOptions.map((opt) => {
    if (typeof opt === 'string') {
      const match = opt.match(/^([A-Z])\.\s*(.*)$/)
      return match ? { id: match[1], text: match[2], explanation: '' } : { id: opt, text: opt, explanation: '' }
    }
    return opt
  })

  const handleSelect = (optionId) => {
    if (disabled || revealAnswer) return
    setSelected(optionId)
    triggerHaptic('selection')
  }

  const handleSubmit = () => {
    if (!selected || disabled || revealAnswer) return
    const newAttemptCount = attemptCount + 1
    const isCorrect = selected === correctAnswer

    setAttemptCount(newAttemptCount)
    setSubmitted(true)
    triggerHaptic(isCorrect ? 'success' : 'error')

    if (isCorrect) {
      onAnswer?.(true, selected, newAttemptCount)
    } else {
      setWrongSelections(prev => [...prev, selected])
      if (newAttemptCount >= MAX_ATTEMPTS) {
        onAnswer?.(false, selected, newAttemptCount)
      }
    }
  }

  const handleRetry = () => {
    setSelected(null)
    setSubmitted(false)
  }

  const canRetry = submitted && selected !== correctAnswer && attemptCount < MAX_ATTEMPTS && !disabled

  const getOptionStyle = (optionId) => {
    const isWrong = wrongSelections.includes(optionId)

    // Reveal mode: show correct answer (revisiting or exhausted attempts)
    if (revealAnswer) {
      if (optionId === correctAnswer) {
        return 'border-emerald-500 bg-emerald-500/10'
      }
      if (optionId === selected && selected !== correctAnswer) {
        return 'border-red-500 bg-red-500/10'
      }
      if (isWrong) {
        return 'border-red-500/30 bg-red-500/5 opacity-60'
      }
      return 'border-slate-700/50 bg-slate-800/30 opacity-60'
    }

    // Active answering
    if (!submitted) {
      if (selected === optionId) {
        return 'border-brand-primary bg-brand-primary/10 ring-2 ring-brand-primary/30'
      }
      if (isWrong) {
        return 'border-red-500/30 bg-red-500/5 opacity-60'
      }
      return 'border-slate-700 bg-slate-800/50 hover:border-slate-500 cursor-pointer'
    }

    // Just submitted wrong (before retry)
    if (optionId === selected && selected !== correctAnswer) {
      return 'border-red-500 bg-red-500/10'
    }
    if (isWrong) {
      return 'border-red-500/30 bg-red-500/5 opacity-60'
    }
    return 'border-slate-700/50 bg-slate-800/30 opacity-60'
  }

  return (
    <div>
      <h3 className="text-sm sm:text-base font-medium text-white mb-2.5 sm:mb-3">{question}</h3>
      <div className="space-y-2">
        {options.map((option, index) => (
          <motion.button
            key={option.id ?? index}
            onClick={() => handleSelect(option.id)}
            disabled={disabled || revealAnswer}
            className={`w-full text-left px-3 py-2.5 rounded-lg border-2 transition-all duration-200 touch-manipulation ${getOptionStyle(option.id)}`}
            whileHover={!revealAnswer && !submitted && !disabled ? { scale: 1.01 } : {}}
            whileTap={!revealAnswer && !submitted && !disabled ? { scale: 0.98 } : {}}
          >
            <div className="flex items-start gap-2.5">
              <span className="flex-shrink-0 w-6 h-6 rounded-full bg-slate-700 flex items-center justify-center text-xs font-bold text-slate-300">
                {option.id}
              </span>
              <div className="flex-1 min-w-0">
                <p className="text-slate-200 text-sm">{option.text}</p>
                {revealAnswer && (
                  <motion.div
                    initial={{ opacity: 0, height: 0 }}
                    animate={{ opacity: 1, height: 'auto' }}
                    className="mt-2"
                  >
                    {option.id === correctAnswer && (
                      <div className="flex items-start gap-2 text-emerald-400 text-xs sm:text-sm">
                        <CheckCircle className="w-4 h-4 mt-0.5 flex-shrink-0" />
                        <span>{option.explanation}</span>
                      </div>
                    )}
                    {option.id === selected && selected !== correctAnswer && (
                      <div className="flex items-start gap-2 text-red-400 text-xs sm:text-sm">
                        <XCircle className="w-4 h-4 mt-0.5 flex-shrink-0" />
                        <span>{option.explanation}</span>
                      </div>
                    )}
                  </motion.div>
                )}
              </div>
            </div>
          </motion.button>
        ))}
      </div>

      {/* Attempt indicator */}
      {attemptCount > 0 && !revealAnswer && (
        <p className="mt-2 text-slate-500 text-xs">
          {t('multipleChoice.attemptsLeft', { count: MAX_ATTEMPTS - attemptCount }, `${MAX_ATTEMPTS - attemptCount} attempts left`)}
        </p>
      )}

      {revealAnswer ? null : !submitted ? (
        <button
          onClick={handleSubmit}
          disabled={!selected || disabled}
          className="mt-3 w-full sm:w-auto px-5 py-2.5 sm:py-2 bg-brand-primary text-white rounded-lg hover:bg-blue-600 transition-colors disabled:opacity-50 disabled:cursor-not-allowed font-medium text-sm touch-manipulation"
        >
          {t('multipleChoice.confirm')}
        </button>
      ) : canRetry ? (
        <button
          onClick={handleRetry}
          className="mt-3 w-full sm:w-auto px-5 py-2.5 sm:py-2 bg-brand-accent text-white rounded-lg hover:bg-amber-600 transition-colors font-medium text-sm touch-manipulation"
        >
          {t('multipleChoice.retry', '再試一次')}
        </button>
      ) : null}
    </div>
  )
}

export default MultipleChoice
