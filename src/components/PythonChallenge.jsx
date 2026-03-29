import { useState, useEffect, useRef, useCallback } from 'react'
import { Play, Send, CheckCircle, XCircle, Loader2, RotateCcw } from 'lucide-react'
import Editor from '@monaco-editor/react'
import { useTranslation } from 'react-i18next'

function PythonChallenge({ question, starterCode, expectedQuery, testCases, onAnswer, disabled }) {
  const { t } = useTranslation('case')
  const [userCode, setUserCode] = useState(starterCode || '')
  const [output, setOutput] = useState(null)
  const [error, setError] = useState(null)
  const [validationResult, setValidationResult] = useState(null)
  const [loading, setLoading] = useState(false)
  const [pyReady, setPyReady] = useState(false)
  const workerRef = useRef(null)

  useEffect(() => {
    const worker = new Worker(new URL('../workers/pythonRunner.js', import.meta.url))
    workerRef.current = worker

    worker.onmessage = (e) => {
      const { type } = e.data
      switch (type) {
        case 'READY':
          setPyReady(true)
          break
        case 'RESULT':
          setOutput(e.data.output || '')
          setError(e.data.error || null)
          setLoading(false)
          break
        case 'ERROR': {
          const errMsg = e.data.code === 'NOT_READY'
            ? 'Python 環境載入中…'
            : e.data.message || '未知錯誤'
          setError(errMsg)
          setOutput(null)
          setLoading(false)
          break
        }
        case 'VALIDATION':
          setValidationResult(e.data)
          setLoading(false)
          if (e.data.correct) {
            onAnswer(true, userCode)
          }
          break
      }
    }

    worker.postMessage({ type: 'INIT' })

    return () => {
      worker.terminate()
      workerRef.current = null
    }
  }, [])

  const handleRun = useCallback(() => {
    if (!pyReady || !workerRef.current) return
    setLoading(true)
    setValidationResult(null)
    setError(null)
    workerRef.current.postMessage({ type: 'RUN_CODE', payload: { code: userCode } })
  }, [pyReady, userCode])

  const handleReset = useCallback(() => {
    setUserCode(starterCode || '')
    setOutput(null)
    setError(null)
    setValidationResult(null)
  }, [starterCode])

  const handleSubmit = useCallback(() => {
    if (!pyReady || !workerRef.current) return
    setLoading(true)
    workerRef.current.postMessage({
      type: 'VALIDATE',
      payload: { userCode, expectedCode: expectedQuery, testCases },
    })
  }, [pyReady, userCode, expectedQuery, testCases])

  return (
    <div className="flex flex-col gap-4">
      <h3 className="text-white font-medium text-lg">{question}</h3>

      {!pyReady && (
        <div className="flex items-center gap-2 text-slate-400 text-sm">
          <Loader2 className="w-4 h-4 animate-spin" />
          Python 環境載入中…
        </div>
      )}

      <div className="border border-slate-700 rounded-lg overflow-hidden">
        <Editor
          height="220px"
          language="python"
          theme="vs-dark"
          value={userCode}
          onChange={(val) => setUserCode(val || '')}
          options={{
            minimap: { enabled: false },
            fontSize: 14,
            lineNumbers: 'on',
            scrollBeyondLastLine: false,
            wordWrap: 'on',
            readOnly: disabled,
            padding: { top: 8 },
          }}
        />
      </div>

      <div className="flex items-center gap-3">
        <button
          onClick={handleRun}
          disabled={!pyReady || loading || disabled}
          className="flex items-center gap-2 px-4 py-2 bg-slate-700 text-white rounded-lg hover:bg-slate-600 transition-colors disabled:opacity-50 text-sm"
        >
          {loading ? <Loader2 className="w-4 h-4 animate-spin" /> : <Play className="w-4 h-4" />}
          執行
        </button>
        <button
          onClick={handleSubmit}
          disabled={!pyReady || loading || disabled}
          className="flex items-center gap-2 px-4 py-2 bg-brand-primary text-white rounded-lg hover:bg-blue-600 transition-colors disabled:opacity-50 text-sm"
        >
          <Send className="w-4 h-4" />
          提交
        </button>
        <button
          onClick={handleReset}
          disabled={loading || disabled}
          className="flex items-center gap-2 px-4 py-2 bg-slate-800 text-slate-300 rounded-lg hover:bg-slate-700 hover:text-white transition-colors disabled:opacity-50 text-sm ml-auto"
        >
          <RotateCcw className="w-4 h-4" />
          重置
        </button>
      </div>

      {/* stdout output */}
      {output != null && !error && (
        <div className="p-3 bg-slate-800 border border-slate-700 rounded-lg">
          <p className="text-slate-400 text-xs mb-1">Output:</p>
          <pre className="text-green-400 text-sm whitespace-pre-wrap font-mono">{output || '(no output)'}</pre>
        </div>
      )}

      {/* error */}
      {error && (
        <div className="p-3 bg-red-500/10 border border-red-500/30 rounded-lg">
          <p className="text-red-400 text-sm flex items-start gap-2">
            <XCircle className="w-4 h-4 flex-shrink-0 mt-0.5" />
            <pre className="whitespace-pre-wrap font-mono">{error}</pre>
          </p>
        </div>
      )}

      {/* validation results */}
      {validationResult && (
        <div className={`p-3 rounded-lg border ${
          validationResult.correct
            ? 'bg-emerald-500/10 border-emerald-500/30'
            : 'bg-red-500/10 border-red-500/30'
        }`}>
          {validationResult.correct ? (
            <p className="text-emerald-400 font-medium flex items-center gap-2">
              <CheckCircle className="w-4 h-4" />
              正確！
            </p>
          ) : (
            <div>
              <p className="text-red-400 font-medium flex items-center gap-2 mb-3">
                <XCircle className="w-4 h-4" />
                結果不正確
              </p>
              {validationResult.results && validationResult.results.length > 0 && (
                <div className="space-y-2">
                  {validationResult.results.map((r, i) => (
                    <div key={i} className={`p-2 rounded text-sm font-mono ${
                      r.passed ? 'bg-emerald-500/10 text-emerald-300' : 'bg-red-500/10 text-red-300'
                    }`}>
                      <div className="text-slate-400 text-xs mb-1">
                        {r.passed ? '✓' : '✗'} Test: <code>{r.input}</code>
                      </div>
                      {!r.passed && (
                        <>
                          <div>Expected: <span className="text-emerald-400">{r.expected}</span></div>
                          <div>Got: <span className="text-red-400">{r.actual}</span></div>
                        </>
                      )}
                    </div>
                  ))}
                </div>
              )}
            </div>
          )}
        </div>
      )}
    </div>
  )
}

export default PythonChallenge
