import { useState, useEffect, useRef, useCallback } from 'react'
import { Play, Send, CheckCircle, XCircle, Loader2, RotateCcw } from 'lucide-react'
import Editor from '@monaco-editor/react'
import { useTranslation } from 'react-i18next'
import DataTable from './DataTable'

function CodeChallenge({ question, starterCode, sampleSchema, expectedQuery, onAnswer, disabled }) {
  const { t } = useTranslation('case')
  const [userCode, setUserCode] = useState(starterCode || '')
  const [queryResult, setQueryResult] = useState(null)
  const [queryError, setQueryError] = useState(null)
  const [validationResult, setValidationResult] = useState(null)
  const [loading, setLoading] = useState(false)
  const [dbReady, setDbReady] = useState(false)
  const workerRef = useRef(null)

  useEffect(() => {
    const worker = new Worker(new URL('../workers/codeRunner.js', import.meta.url))
    workerRef.current = worker

    worker.onmessage = (e) => {
      const { type } = e.data
      switch (type) {
        case 'READY':
          setDbReady(true)
          break
        case 'RESULT':
          setQueryResult(e.data)
          setQueryError(null)
          setLoading(false)
          break
        case 'ERROR': {
          const errMsg = e.data.code === 'DB_NOT_READY'
            ? t('codeChallenge.dbNotReady')
            : e.data.message || t('codeChallenge.unknownError')
          setQueryError(errMsg)
          setQueryResult(null)
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

    worker.postMessage({ type: 'INIT_DB', payload: { schema: sampleSchema } })

    return () => {
      worker.terminate()
      workerRef.current = null
    }
  }, [sampleSchema])

  const handleRun = useCallback(() => {
    if (!dbReady || !workerRef.current) return
    setLoading(true)
    setValidationResult(null)
    workerRef.current.postMessage({ type: 'RUN_SQL', payload: { sql: userCode } })
  }, [dbReady, userCode])

  const handleReset = useCallback(() => {
    setUserCode(starterCode || '')
    setQueryResult(null)
    setQueryError(null)
    setValidationResult(null)
  }, [starterCode])

  const handleSubmit = useCallback(() => {
    if (!dbReady || !workerRef.current) return
    setLoading(true)
    workerRef.current.postMessage({
      type: 'VALIDATE',
      payload: { userSql: userCode, expectedSql: expectedQuery },
    })
  }, [dbReady, userCode, expectedQuery])

  const formatForTable = (data) => {
    if (!data || !data.columns || !data.rows) return null
    return data.rows.map(row => {
      const obj = {}
      data.columns.forEach((col, i) => { obj[col] = row[i] })
      return obj
    })
  }

  const resultData = queryResult ? formatForTable(queryResult) : null

  return (
    <div className="flex flex-col gap-4">
      <h3 className="text-white font-medium text-lg">{question}</h3>

      {!dbReady && (
        <div className="flex items-center gap-2 text-slate-400 text-sm">
          <Loader2 className="w-4 h-4 animate-spin" />
          {t('codeChallenge.initDb')}
        </div>
      )}

      <div className="border border-slate-700 rounded-lg overflow-hidden">
        <Editor
          height="220px"
          language="sql"
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
          disabled={!dbReady || loading || disabled}
          className="flex items-center gap-2 px-4 py-2 bg-slate-700 text-white rounded-lg hover:bg-slate-600 transition-colors disabled:opacity-50 text-sm"
        >
          {loading ? <Loader2 className="w-4 h-4 animate-spin" /> : <Play className="w-4 h-4" />}
          {t('codeChallenge.runQuery')}
        </button>
        <button
          onClick={handleSubmit}
          disabled={!dbReady || loading || disabled}
          className="flex items-center gap-2 px-4 py-2 bg-brand-primary text-white rounded-lg hover:bg-blue-600 transition-colors disabled:opacity-50 text-sm"
        >
          <Send className="w-4 h-4" />
          {t('codeChallenge.submit')}
        </button>
        <button
          onClick={handleReset}
          disabled={loading || disabled}
          className="flex items-center gap-2 px-4 py-2 bg-slate-800 text-slate-300 rounded-lg hover:bg-slate-700 hover:text-white transition-colors disabled:opacity-50 text-sm ml-auto"
        >
          <RotateCcw className="w-4 h-4" />
          {t('codeChallenge.reset')}
        </button>
      </div>

      {queryError && (
        <div className="p-3 bg-red-500/10 border border-red-500/30 rounded-lg">
          <p className="text-red-400 text-sm flex items-center gap-2">
            <XCircle className="w-4 h-4 flex-shrink-0" />
            {queryError}
          </p>
        </div>
      )}

      {resultData && (
        <div>
          <p className="text-slate-400 text-xs mb-2">{t('codeChallenge.resultCount', { count: queryResult.rows.length })}</p>
          <DataTable data={resultData} />
        </div>
      )}

      {validationResult && (
        <div className={`p-3 rounded-lg border ${
          validationResult.correct
            ? 'bg-emerald-500/10 border-emerald-500/30'
            : 'bg-red-500/10 border-red-500/30'
        }`}>
          {validationResult.correct ? (
            <p className="text-emerald-400 font-medium flex items-center gap-2">
              <CheckCircle className="w-4 h-4" />
              {t('codeChallenge.correct')}
            </p>
          ) : (
            <div>
              <p className="text-red-400 font-medium flex items-center gap-2 mb-2">
                <XCircle className="w-4 h-4" />
                {validationResult.error ? t('codeChallenge.sqlError', { error: validationResult.error }) : t('codeChallenge.incorrect')}
              </p>
              {validationResult.expected && validationResult.expected.rows.length > 0 && (
                <details className="mt-2">
                  <summary className="text-slate-400 text-xs cursor-pointer hover:text-slate-300">
                    {t('codeChallenge.viewExpected')}
                  </summary>
                  <div className="mt-2">
                    <DataTable data={formatForTable(validationResult.expected)} />
                  </div>
                </details>
              )}
            </div>
          )}
        </div>
      )}
    </div>
  )
}

export default CodeChallenge
