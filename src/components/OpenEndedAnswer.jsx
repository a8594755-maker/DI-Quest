import { useState } from 'react'
import { Send, Loader2, CheckCircle, AlertCircle, BookOpen } from 'lucide-react'
import { motion } from 'framer-motion'
import { chatWithDeepSeek } from '../utils/deepseek'
import ReactMarkdown from 'react-markdown'
import remarkGfm from 'remark-gfm'

/**
 * OpenEndedAnswer — 開放式問答 + AI 評分元件
 * Props:
 *   prompt: string (問題)
 *   evaluationCriteria: string[] (評分標準)
 *   sampleAnswer: string (參考答案)
 *   scenario: object (情境，用於 AI 評分 context)
 *   onSubmit: (score) => void
 *   disabled: boolean
 */
function OpenEndedAnswer({ prompt, evaluationCriteria = [], sampleAnswer, scenario, onSubmit, disabled = false }) {
  const [answer, setAnswer] = useState('')
  const [isEvaluating, setIsEvaluating] = useState(false)
  const [evaluation, setEvaluation] = useState(null)
  const [error, setError] = useState(null)
  const [showSample, setShowSample] = useState(false)

  const handleSubmit = async () => {
    if (!answer.trim() || isEvaluating || disabled) return

    setIsEvaluating(true)
    setError(null)

    try {
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

Please evaluate the candidate's answer and respond in Traditional Chinese with this exact format:

## 分數：[0-100]

## 優點
- [具體的優點 1]
- [具體的優點 2]

## 改進建議
- [具體的改進建議 1]
- [具體的改進建議 2]

## 參考方向
[簡短說明一個更完整的回答應該包含什麼]`

      const messages = [
        { role: 'system', content: systemPrompt },
        { role: 'user', content: answer },
      ]

      const result = await chatWithDeepSeek(messages)
      setEvaluation(result)

      // Extract score from response
      const scoreMatch = result.match(/分數[：:]\s*(\d+)/)
      const score = scoreMatch ? parseInt(scoreMatch[1]) : 70

      onSubmit?.(score)
    } catch (err) {
      console.error('AI evaluation error:', err)
      setError('AI 評分服務暫時無法使用，請稍後再試。')
    } finally {
      setIsEvaluating(false)
    }
  }

  const getScoreColor = (text) => {
    const match = text?.match(/分數[：:]\s*(\d+)/)
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
          <p className="text-slate-400 text-xs font-medium mb-2">評分標準：</p>
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
            placeholder="用你在面試中會講的方式回答這個問題...&#10;&#10;建議使用 Case Answer Framework：&#10;1. 確認目標&#10;2. 定義指標&#10;3. 拆解流程&#10;4. Segmentation / Root Cause&#10;5. 提出建議&#10;6. 驗證方式"
            className="w-full h-48 px-4 py-3 bg-slate-900 border border-slate-700 rounded-lg text-white placeholder-slate-500 focus:outline-none focus:border-brand-primary transition-colors resize-y text-sm leading-relaxed disabled:opacity-50"
          />

          <div className="flex items-center justify-between mt-3">
            <span className="text-slate-500 text-xs">
              {answer.length > 0 ? `${answer.length} 字` : '建議至少寫 100 字以上'}
            </span>
            <button
              onClick={handleSubmit}
              disabled={!answer.trim() || answer.length < 20 || isEvaluating || disabled}
              className="flex items-center gap-2 px-6 py-2.5 bg-brand-secondary text-white rounded-lg hover:bg-emerald-600 transition-colors disabled:opacity-50 disabled:cursor-not-allowed font-medium"
            >
              {isEvaluating ? (
                <>
                  <Loader2 className="w-4 h-4 animate-spin" />
                  AI 評分中...
                </>
              ) : (
                <>
                  <Send className="w-4 h-4" />
                  提交 AI 評分
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
              重試
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
          {/* Your answer */}
          <div className="p-4 bg-slate-800/50 border border-slate-700 rounded-lg">
            <p className="text-slate-400 text-xs font-medium mb-2">你的回答：</p>
            <p className="text-slate-300 text-sm whitespace-pre-wrap">{answer}</p>
          </div>

          {/* AI evaluation */}
          <div className={`p-4 border rounded-lg ${
            getScoreColor(evaluation).includes('emerald') ? 'bg-emerald-500/10 border-emerald-500/30' :
            getScoreColor(evaluation).includes('yellow') ? 'bg-yellow-500/10 border-yellow-500/30' :
            'bg-red-500/10 border-red-500/30'
          }`}>
            <h4 className={`font-medium mb-3 flex items-center gap-2 ${getScoreColor(evaluation)}`}>
              <CheckCircle className="w-4 h-4" />
              AI 面試教練評分
            </h4>
            <div className="prose prose-sm prose-invert max-w-none text-slate-300">
              <ReactMarkdown remarkPlugins={[remarkGfm]}>{evaluation}</ReactMarkdown>
            </div>
          </div>

          {/* Sample answer toggle */}
          {sampleAnswer && (
            <div>
              <button
                onClick={() => setShowSample(!showSample)}
                className="flex items-center gap-2 text-brand-primary text-sm hover:underline"
              >
                <BookOpen className="w-4 h-4" />
                {showSample ? '收起參考答案' : '查看參考答案'}
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
