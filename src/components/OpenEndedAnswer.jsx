import { useState } from 'react'
import { Send, Loader2, CheckCircle, AlertCircle, BookOpen } from 'lucide-react'
import { motion } from 'framer-motion'
import { useTranslation } from 'react-i18next'
import { chatWithDeepSeek } from '../utils/deepseek'
import { useAuth } from '../contexts/AuthContext'
import { useApiUsage } from '../hooks/useApiUsage'
import ReactMarkdown from 'react-markdown'
import remarkGfm from 'remark-gfm'
import DOMPurify from 'dompurify'

function OpenEndedAnswer({ prompt, evaluationCriteria = [], sampleAnswer, scenario, onSubmit, disabled = false }) {
  const { t, i18n } = useTranslation('case')
  const { isAuthenticated } = useAuth()
  const { canUseApi, isPremium, incrementUsage, remaining, dailyLimit } = useApiUsage()
  const [answer, setAnswer] = useState('')
  const [isEvaluating, setIsEvaluating] = useState(false)
  const [evaluation, setEvaluation] = useState(null)
  const [error, setError] = useState(null)
  const [showSample, setShowSample] = useState(false)
  const [lastScore, setLastScore] = useState(null)

  const handleSubmit = async () => {
    if (!answer.trim() || isEvaluating || disabled) return
    if (!isAuthenticated) { setError(t('openEnded.signInRequired', 'Please sign in to use AI evaluation.')); return }
    if (!canUseApi && !isPremium) { setError(t('openEnded.rateLimited', 'Daily limit reached ({{limit}}/day).', { limit: dailyLimit })); return }

    setIsEvaluating(true)
    setError(null)

    try {
      if (!isPremium) {
        const allowed = await incrementUsage()
        if (!allowed) { setError(t('openEnded.rateLimited', 'Daily limit reached ({{limit}}/day).', { limit: dailyLimit })); setIsEvaluating(false); return }
      }
      const isZh = i18n.language?.startsWith('zh')
      const responseFormat = isZh
        ? `Please evaluate the candidate's answer and respond in Traditional Chinese with this exact format:

## 分數：[0-100]

## 優點
- [具體的優點 1]
- [具體的優點 2]

## 改進建議
- [具體的改進建議 1]
- [具體的改進建議 2]

## 參考方向
[簡短說明一個更完整的回答應該包含什麼]`
        : `Please evaluate the candidate's answer and respond in English with this exact format:

## Score: [0-100]

## Strengths
- [Specific strength 1]
- [Specific strength 2]

## Suggestions for Improvement
- [Specific suggestion 1]
- [Specific suggestion 2]

## Reference Direction
[Briefly describe what a more complete answer should include]`

      const systemPrompt = `You are an interview evaluator for Product Analyst / Business Analyst / Business Engineer roles in the tech industry.

You will evaluate a candidate's case study answer. Be constructive but honest.

SCENARIO:
${scenario?.title || 'N/A'}
${scenario?.narrative || ''}

QUESTION:
${prompt}

EVALUATION CRITERIA:
${evaluationCriteria.map((c, i) => `${i + 1}. ${c}`).join('\n')}

${sampleAnswer ? `REFERENCE ANSWER:\n${sampleAnswer}` : ''}

${responseFormat}`

      const messages = [
        { role: 'system', content: systemPrompt },
        { role: 'user', content: answer },
      ]

      const result = await chatWithDeepSeek(messages)
      setEvaluation(result)

      const scoreMatch = result.match(/(?:分數|Score)[：:]\s*(\d+)/i)
      if (!scoreMatch) {
        // AI didn't return a parseable score — treat as failed so the user isn't falsely passed
        setLastScore(0)
        onSubmit?.(0)
        return
      }
      const score = Math.min(100, Math.max(0, parseInt(scoreMatch[1])))
      setLastScore(score)

      onSubmit?.(score)
    } catch (err) {
      console.error('AI evaluation error:', err)
      setError(t('openEnded.aiError'))
    } finally {
      setIsEvaluating(false)
    }
  }

  const getScoreColor = (text) => {
    const match = text?.match(/(?:分數|Score)[：:]\s*(\d+)/i)
    if (!match) return 'text-slate-400'
    const score = parseInt(match[1])
    if (score >= 80) return 'text-emerald-400'
    if (score >= 60) return 'text-yellow-400'
    return 'text-red-400'
  }

  return (
    <div>
      <h3 className="text-lg font-medium text-white mb-2">{prompt}</h3>

      {evaluationCriteria.length > 0 && (
        <div className="mb-4 p-3 bg-slate-800/50 border border-slate-700 rounded-lg">
          <p className="text-slate-400 text-xs font-medium mb-2">{t('openEnded.criteria')}</p>
          <ul className="space-y-1">
            {evaluationCriteria.map((c, i) => (
              <li key={i} className="text-slate-300 text-sm flex items-start gap-2">
                <span className="text-brand-accent mt-0.5">•</span>
                <span>{c}</span>
              </li>
            ))}
          </ul>
        </div>
      )}

      {!evaluation && (
        <>
          <textarea
            value={answer}
            onChange={(e) => setAnswer(e.target.value)}
            disabled={disabled || isEvaluating}
            placeholder={t('openEnded.placeholder')}
            className="w-full h-48 px-4 py-3 bg-slate-900 border border-slate-700 rounded-lg text-white placeholder-slate-500 focus:outline-none focus:border-brand-primary transition-colors resize-y text-base leading-relaxed disabled:opacity-50"
          />

          <div className="flex items-center justify-between mt-3">
            <span className="text-slate-500 text-xs">
              {answer.length > 0 ? t('openEnded.charCount', { count: answer.length }) : t('openEnded.minChars')}
            </span>
            <button
              onClick={handleSubmit}
              disabled={!answer.trim() || answer.length < 20 || isEvaluating || disabled}
              className="flex items-center gap-2 px-6 py-2.5 bg-brand-secondary text-white rounded-lg hover:bg-emerald-600 transition-colors disabled:opacity-50 disabled:cursor-not-allowed font-medium"
            >
              {isEvaluating ? (
                <>
                  <Loader2 className="w-4 h-4 animate-spin" />
                  {t('openEnded.evaluating')}
                </>
              ) : (
                <>
                  <Send className="w-4 h-4" />
                  {t('openEnded.submitAi')}
                </>
              )}
            </button>
          </div>
        </>
      )}

      {error && (
        <div className="mt-4 p-4 bg-red-500/10 border border-red-500/30 rounded-lg flex items-start gap-3">
          <AlertCircle className="w-5 h-5 text-red-400 flex-shrink-0 mt-0.5" />
          <div>
            <p className="text-red-400 text-sm">{error}</p>
            <button
              onClick={() => { setError(null); setIsEvaluating(false) }}
              className="text-red-300 text-xs underline mt-1"
            >
              {t('openEnded.retry')}
            </button>
          </div>
        </div>
      )}

      {evaluation && (
        <motion.div
          initial={{ opacity: 0, y: 10 }}
          animate={{ opacity: 1, y: 0 }}
          className="mt-4 space-y-4"
        >
          <div className="p-4 bg-slate-800/50 border border-slate-700 rounded-lg">
            <p className="text-slate-400 text-xs font-medium mb-2">{t('openEnded.yourAnswer')}</p>
            <p className="text-slate-300 text-sm whitespace-pre-wrap">{answer}</p>
          </div>

          <div className={`p-4 border rounded-lg ${
            getScoreColor(evaluation).includes('emerald') ? 'bg-emerald-500/10 border-emerald-500/30' :
            getScoreColor(evaluation).includes('yellow') ? 'bg-yellow-500/10 border-yellow-500/30' :
            'bg-red-500/10 border-red-500/30'
          }`}>
            <h4 className={`font-medium mb-3 flex items-center gap-2 ${getScoreColor(evaluation)}`}>
              <CheckCircle className="w-4 h-4" />
              {t('openEnded.aiCoachTitle')}
            </h4>
            <div className="prose prose-sm prose-invert max-w-none text-slate-300">
              <ReactMarkdown remarkPlugins={[remarkGfm]}>{DOMPurify.sanitize(evaluation)}</ReactMarkdown>
            </div>
          </div>

          {lastScore !== null && lastScore < 60 && !disabled && (
            <div className="p-4 bg-amber-500/10 border border-amber-500/30 rounded-lg">
              <p className="text-amber-400 text-sm mb-3">
                {t('openEnded.belowThreshold', '分數未達 60 分，請參考建議後重新作答。')}
              </p>
              <button
                onClick={() => { setEvaluation(null); setLastScore(null); setAnswer('') }}
                className="px-4 py-2 bg-brand-accent text-white rounded-lg hover:bg-amber-600 transition-colors text-sm font-medium"
              >
                {t('openEnded.retryBtn', '重新作答')}
              </button>
            </div>
          )}

          {sampleAnswer && (
            <div>
              <button
                onClick={() => setShowSample(!showSample)}
                className="flex items-center gap-2 text-brand-primary text-sm hover:underline"
              >
                <BookOpen className="w-4 h-4" />
                {showSample ? t('openEnded.hideSample') : t('openEnded.showSample')}
              </button>
              {showSample && (
                <motion.div
                  initial={{ opacity: 0, height: 0 }}
                  animate={{ opacity: 1, height: 'auto' }}
                  className="mt-2 p-4 bg-brand-primary/10 border border-brand-primary/30 rounded-lg"
                >
                  <p className="text-slate-300 text-sm whitespace-pre-wrap">{sampleAnswer}</p>
                </motion.div>
              )}
            </div>
          )}
        </motion.div>
      )}
    </div>
  )
}

export default OpenEndedAnswer
