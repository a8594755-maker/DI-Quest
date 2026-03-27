import { useState } from 'react'
import { CheckCircle, XCircle } from 'lucide-react'
import { motion } from 'framer-motion'
import { useTranslation } from 'react-i18next'

function MultipleChoice({ question, options, correctAnswer, onAnswer, disabled = false }) {
  const { t } = useTranslation('case')
  const [selected, setSelected] = useState(null)
  const [submitted, setSubmitted] = useState(false)

  const handleSelect = (optionId) => {
    if (submitted || disabled) return
    setSelected(optionId)
  }

  const handleSubmit = () => {
    if (!selected || submitted || disabled) return
    setSubmitted(true)
    const isCorrect = selected === correctAnswer
    onAnswer?.(isCorrect, selected)
  }

  const handleRetry = () => {
    setSelected(null)
    setSubmitted(false)
  }

  const getOptionStyle = (optionId) => {
    if (!submitted) {
      if (selected === optionId) {
        return 'border-brand-primary bg-brand-primary/10 ring-2 ring-brand-primary/30'
      }
      return 'border-slate-700 bg-slate-800/50 hover:border-slate-500 cursor-pointer'
    }

    if (optionId === correctAnswer) {
      return 'border-emerald-500 bg-emerald-500/10'
    }
    if (optionId === selected && selected !== correctAnswer) {
      return 'border-red-500 bg-red-500/10'
    }
    return 'border-slate-700/50 bg-slate-800/30 opacity-60'
  }

  return (
    <div>
      <h3 className="text-base sm:text-lg font-medium text-white mb-3 sm:mb-4">{question}</h3>
      <div className="space-y-2.5 sm:space-y-3">
        {options.map((option) => (
          <motion.button
            key={option.id}
            onClick={() => handleSelect(option.id)}
            disabled={submitted || disabled}
            className={`w-full text-left p-3 sm:p-4 rounded-lg border-2 transition-all duration-200 touch-manipulation ${getOptionStyle(option.id)}`}
            whileHover={!submitted && !disabled ? { scale: 1.01 } : {}}
            whileTap={!submitted && !disabled ? { scale: 0.98 } : {}}
          >
            <div className="flex items-start gap-2.5 sm:gap-3">
              <span className="flex-shrink-0 w-7 h-7 rounded-full bg-slate-700 flex items-center justify-center text-sm font-bold text-slate-300">
                {option.id}
              </span>
              <div className="flex-1 min-w-0">
                <p className="text-slate-200 text-sm sm:text-base">{option.text}</p>
                {submitted && (
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

      {!submitted ? (
        <button
          onClick={handleSubmit}
          disabled={!selected || disabled}
          className="mt-4 w-full sm:w-auto px-6 py-3 sm:py-2.5 bg-brand-primary text-white rounded-lg hover:bg-blue-600 transition-colors disabled:opacity-50 disabled:cursor-not-allowed font-medium touch-manipulation"
        >
          {t('multipleChoice.confirm')}
        </button>
      ) : submitted && selected !== correctAnswer && !disabled && (
        <button
          onClick={handleRetry}
          className="mt-4 w-full sm:w-auto px-6 py-3 sm:py-2.5 bg-brand-accent text-white rounded-lg hover:bg-amber-600 transition-colors font-medium touch-manipulation"
        >
          {t('multipleChoice.retry', '再試一次')}
        </button>
      )}
    </div>
  )
}

export default MultipleChoice
