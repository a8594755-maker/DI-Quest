import { useParams, Link, useNavigate } from 'react-router-dom'
import { ArrowLeft, Play, RotateCcw, Send, Lightbulb, CheckCircle, XCircle, ChevronLeft, ChevronRight, BookOpen, GraduationCap, ChevronDown } from 'lucide-react'
import { useState, useRef, useEffect, useCallback } from 'react'
import Editor from '@monaco-editor/react'
import { getQuest, getChallenge, getWorld } from '../data/questData'
import { getQuestSectionTitle, getQuestSectionId } from '../data/lessons/index'
import { useQuest } from '../contexts/QuestContext'

function CodeArena() {
  const { worldId, questId, challengeId = '1' } = useParams()
  const navigate = useNavigate()
  const { dispatch, challengeStatus } = useQuest()

  const quest = getQuest(questId)
  const challenge = getChallenge(questId, challengeId)
  const world = getWorld(worldId)
  const sectionTitle = getQuestSectionTitle(questId)
  const sectionId = getQuestSectionId(questId)

  const [code, setCode] = useState('')
  const [output, setOutput] = useState('')
  const [testResults, setTestResults] = useState([])
  const [isRunning, setIsRunning] = useState(false)
  const [hintLevel, setHintLevel] = useState(0)
  const [attempts, setAttempts] = useState(0)
  const [submitted, setSubmitted] = useState(false)
  const [showExample, setShowExample] = useState(true)
  const editorRef = useRef(null)
  const workerRef = useRef(null)

  // 初始化
  useEffect(() => {
    if (challenge) {
      const saved = challengeStatus[`${questId}-${challengeId}`]
      setCode(saved?.code || challenge.defaultCode || '')
      setTestResults([])
      setOutput('')
      setHintLevel(0)
      setAttempts(0)
      setSubmitted(!!saved?.completed)
      setShowExample(true)
    }
  }, [questId, challengeId])

  const handleEditorDidMount = (editor) => {
    editorRef.current = editor
  }

  const runCode = useCallback(() => {
    if (!challenge) return
    setIsRunning(true)
    setOutput('')
    setTestResults([])
    setAttempts(prev => prev + 1)

    // 終止之前的 worker
    if (workerRef.current) workerRef.current.terminate()

    const worker = new Worker(
      new URL('../workers/codeRunner.js', import.meta.url),
      { type: 'module' }
    )
    workerRef.current = worker

    worker.onmessage = (e) => {
      const { success, error, logs, testResults: results } = e.data
      if (success) {
        setOutput(logs.join('\n') || '程式碼執行完成')
        setTestResults(results)
      } else {
        setOutput(`錯誤：${error}`)
        setTestResults([])
      }
      setIsRunning(false)
      worker.terminate()
    }

    worker.onerror = (err) => {
      setOutput(`Worker 錯誤：${err.message}`)
      setIsRunning(false)
      worker.terminate()
    }

    worker.postMessage({
      code,
      tests: challenge.tests,
      returnVars: challenge.returnVars,
      timeout: 5000,
    })
  }, [code, challenge])

  const resetCode = () => {
    if (challenge) {
      setCode(challenge.defaultCode || '')
      setOutput('')
      setTestResults([])
      setHintLevel(0)
    }
  }

  const getHint = () => {
    setHintLevel(prev => Math.min(prev + 1, 3))
  }

  const allTestsPassed = testResults.length > 0 && testResults.every(r => r.passed)

  const handleSubmit = () => {
    if (!allTestsPassed || submitted) return

    const score = Math.round((testResults.filter(r => r.passed).length / testResults.length) * 100)

    dispatch({
      type: 'COMPLETE_CHALLENGE',
      payload: {
        questId,
        challengeId: Number(challengeId),
        score,
        code,
        usedHints: hintLevel,
        attempts,
        baseXp: quest?.isBoss ? 200 : 50,
      },
    })

    setSubmitted(true)

    // 檢查是否所有挑戰都完成 → 完成整個 quest
    if (quest) {
      const allDone = quest.challenges.every((c) => {
        if (c.id === Number(challengeId)) return true // 這個剛完成
        return challengeStatus[`${questId}-${c.id}`]?.completed
      })
      if (allDone) {
        dispatch({
          type: 'COMPLETE_QUEST',
          payload: { questId, score: 100, bonusXp: quest.isBoss ? 100 : 50 },
        })
      }
    }
  }

  // 上/下一個 challenge 導航
  const currentIndex = quest ? quest.challenges.findIndex(c => c.id === Number(challengeId)) : -1
  const prevChallenge = quest?.challenges[currentIndex - 1]
  const nextChallenge = quest?.challenges[currentIndex + 1]

  const hints = [
    challenge?.instruction ? `想想看這個挑戰的關鍵：${challenge.instruction.split('。')[0]}` : '先看清楚題目要求',
    '注意邊界情況：輸入是 0、負數、或 null 的時候怎麼辦？',
    challenge?.referenceCode ? '看看右邊的參考程式碼，關鍵邏輯在那裡面' : '試著把問題拆成更小的步驟',
  ]

  if (!challenge || !quest) {
    return (
      <div className="h-[calc(100vh-73px)] flex items-center justify-center">
        <div className="text-center">
          <p className="text-slate-500 text-lg mb-4">找不到這個挑戰</p>
          <Link to="/di-quest/map" className="btn-primary">返回地圖</Link>
        </div>
      </div>
    )
  }

  return (
    <div className="h-[calc(100vh-73px)] flex flex-col">
      {/* 頂部導航 */}
      <div className="flex items-center justify-between px-6 py-3 border-b border-slate-700 bg-slate-900/50">
        <div className="flex items-center gap-4">
          <Link
            to={`/di-quest/quest/${worldId}/${questId}`}
            className="text-slate-400 hover:text-white transition-colors"
          >
            <ArrowLeft className="w-5 h-5" />
          </Link>
          <div>
            <span className="text-slate-500 text-sm">{world?.emoji} World {worldId} / {quest.name}</span>
            <h1 className="text-white font-medium">
              挑戰 {challengeId}: {challenge.name}
              {challenge.difficulty && (
                <span className={`ml-2 text-xs px-2 py-0.5 rounded ${
                  challenge.difficulty === 'easy' ? 'bg-emerald-500/20 text-emerald-400' :
                  challenge.difficulty === 'medium' ? 'bg-yellow-500/20 text-yellow-400' :
                  'bg-red-500/20 text-red-400'
                }`}>
                  {challenge.difficulty === 'easy' ? '簡單' : challenge.difficulty === 'medium' ? '中等' : '困難'}
                </span>
              )}
            </h1>
          </div>
          {/* 回到講義 */}
          {sectionTitle && (
            <Link
              to={`/di-quest/lesson/${worldId}${sectionId ? `#${sectionId}` : ''}`}
              className="flex items-center gap-1.5 px-3 py-1.5 bg-brand-primary/10 border border-brand-primary/30 text-brand-primary text-xs rounded-lg hover:bg-brand-primary/20 transition-colors"
            >
              <BookOpen className="w-3.5 h-3.5" />
              📖 {sectionTitle}
            </Link>
          )}
        </div>
        <div className="flex items-center gap-3">
          {/* 挑戰導航 */}
          {prevChallenge && (
            <button
              onClick={() => navigate(`/di-quest/arena/${worldId}/${questId}/${prevChallenge.id}`)}
              className="flex items-center gap-1 px-3 py-2 text-slate-400 hover:text-white text-sm transition-colors"
            >
              <ChevronLeft className="w-4 h-4" /> 上一題
            </button>
          )}
          {nextChallenge && (
            <button
              onClick={() => navigate(`/di-quest/arena/${worldId}/${questId}/${nextChallenge.id}`)}
              className="flex items-center gap-1 px-3 py-2 text-slate-400 hover:text-white text-sm transition-colors"
            >
              下一題 <ChevronRight className="w-4 h-4" />
            </button>
          )}
          <div className="w-px h-6 bg-slate-700" />
          <button
            onClick={resetCode}
            className="flex items-center gap-2 px-4 py-2 text-slate-400 hover:text-white transition-colors"
          >
            <RotateCcw className="w-4 h-4" />
            重置
          </button>
          <button
            onClick={runCode}
            disabled={isRunning}
            className="flex items-center gap-2 px-6 py-2 bg-brand-primary text-white rounded-lg hover:bg-blue-600 transition-colors disabled:opacity-50"
          >
            <Play className="w-4 h-4" />
            {isRunning ? '執行中...' : '執行'}
          </button>
        </div>
      </div>

      {/* 題目說明 + 範例 */}
      <div className="px-6 py-3 bg-slate-800/50 border-b border-slate-700">
        <p className="text-slate-300 text-sm whitespace-pre-line">{challenge.instruction}</p>
        {challenge.example && (
          <div className="mt-3">
            <button
              onClick={() => setShowExample(!showExample)}
              className="flex items-center gap-1.5 text-brand-accent text-sm font-medium hover:text-yellow-300 transition-colors"
            >
              <GraduationCap className="w-4 h-4" />
              {showExample ? '收起範例' : '看範例學習'}
              <ChevronDown className={`w-3.5 h-3.5 transition-transform ${showExample ? 'rotate-180' : ''}`} />
            </button>
            {showExample && (
              <div className="mt-2 p-3 bg-slate-900/80 border border-brand-accent/20 rounded-lg">
                <p className="text-slate-400 text-xs mb-2">{challenge.example.title || '範例'}</p>
                <pre className="text-sm font-mono text-emerald-300 bg-slate-950 p-3 rounded overflow-x-auto mb-2">{challenge.example.code}</pre>
                {challenge.example.output && (
                  <div className="text-xs text-slate-400">
                    <span className="text-slate-500">輸出：</span>
                    <code className="text-brand-primary ml-1">{challenge.example.output}</code>
                  </div>
                )}
                {challenge.example.explanation && (
                  <p className="text-xs text-slate-400 mt-2 leading-relaxed">{challenge.example.explanation}</p>
                )}
              </div>
            )}
          </div>
        )}
      </div>

      {/* 主要編輯區 */}
      <div className="flex-1 flex min-h-0">
        {/* 左側：程式碼編輯器 */}
        <div className="flex-1 flex flex-col min-w-0">
          <div className="px-4 py-2 bg-slate-800 text-slate-400 text-sm flex items-center justify-between">
            <span>你的程式碼</span>
            {submitted && <span className="text-emerald-400 text-xs font-bold">已提交</span>}
          </div>
          <div className="flex-1">
            <Editor
              height="100%"
              defaultLanguage="javascript"
              value={code}
              onChange={setCode}
              onMount={handleEditorDidMount}
              theme="vs-dark"
              options={{
                minimap: { enabled: false },
                fontSize: 14,
                lineNumbers: 'on',
                roundedSelection: false,
                scrollBeyondLastLine: false,
                automaticLayout: true,
                padding: { top: 16 },
                readOnly: submitted,
              }}
            />
          </div>
        </div>

        {/* 右側：參考碼 + 測試 */}
        <div className="w-[420px] flex flex-col border-l border-slate-700 bg-slate-900">
          {/* 參考程式碼（Boss 關才有） */}
          {challenge.referenceCode && (
            <div className="max-h-[35%] overflow-auto border-b border-slate-700">
              <div className="px-4 py-2 bg-slate-800 text-slate-400 text-sm">
                參考：真實專案程式碼
              </div>
              <pre className="p-4 text-xs font-mono text-slate-400 whitespace-pre-wrap">
                {challenge.referenceCode}
              </pre>
            </div>
          )}

          {/* 測試結果 */}
          <div className="flex-1 overflow-auto">
            <div className="px-4 py-2 bg-slate-800 text-slate-400 text-sm flex items-center justify-between">
              <span>測試案例</span>
              {allTestsPassed && <span className="text-emerald-400 text-xs font-bold">全部通過！</span>}
            </div>
            <div className="p-4 space-y-3">
              {testResults.length === 0 ? (
                <p className="text-slate-500 text-sm text-center py-8">
                  點擊「執行」開始測試
                </p>
              ) : (
                testResults.map((result, index) => (
                  <div
                    key={index}
                    className={`p-3 rounded-lg border ${
                      result.passed
                        ? 'border-emerald-500/30 bg-emerald-500/10'
                        : 'border-red-500/30 bg-red-500/10'
                    }`}
                  >
                    <div className="flex items-center gap-2">
                      {result.passed ? (
                        <CheckCircle className="w-4 h-4 text-emerald-400 flex-shrink-0" />
                      ) : (
                        <XCircle className="w-4 h-4 text-red-400 flex-shrink-0" />
                      )}
                      <span className={`text-sm font-medium ${
                        result.passed ? 'text-emerald-400' : 'text-red-400'
                      }`}>
                        {result.description}
                      </span>
                    </div>
                    {result.error && (
                      <p className="text-xs text-red-300 mt-1 pl-6">{result.error}</p>
                    )}
                  </div>
                ))
              )}
            </div>
          </div>

          {/* 執行輸出 */}
          <div className="h-36 border-t border-slate-700">
            <div className="px-4 py-2 bg-slate-800 text-slate-400 text-sm">
              執行結果
            </div>
            <pre className="p-4 text-sm font-mono text-slate-300 h-[calc(100%-36px)] overflow-auto">
              {output || '等待執行...'}
            </pre>
          </div>
        </div>
      </div>

      {/* 底部：小迪提示區 */}
      <div className="border-t border-slate-700 bg-slate-900 p-5 pr-16">
        <div className="flex items-start gap-4 max-w-full">
          <div className="w-12 h-12 rounded-full bg-brand-accent/20 flex items-center justify-center flex-shrink-0">
            <span className="text-brand-accent font-bold text-base">小迪</span>
          </div>
          <div className="flex-1 min-w-0">
            {submitted ? (
              <div className="text-emerald-400 font-medium text-base">
                太棒了！這關通過了！
                {nextChallenge ? ' 準備好挑戰下一題了嗎？' : ' 你已經完成這個關卡的所有挑戰！'}
              </div>
            ) : hintLevel > 0 ? (
              <div>
                <p className="text-slate-200 text-base leading-relaxed mb-3">{hints[hintLevel - 1]}</p>
                <div className="flex items-center gap-3">
                  {hintLevel < 3 && (
                    <button onClick={getHint} className="text-brand-accent text-sm hover:underline">
                      需要更多提示？(-20 XP)
                    </button>
                  )}
                  <Link
                    to={`/di-quest/lesson/${worldId}`}
                    className="inline-flex items-center gap-1.5 text-sm text-blue-400 hover:text-blue-300 hover:underline"
                  >
                    <BookOpen className="w-4 h-4" />
                    回去看講義
                  </Link>
                </div>
              </div>
            ) : allTestsPassed ? (
              <p className="text-emerald-400 text-base">全部測試都通過了！點「提交答案」完成這個挑戰。</p>
            ) : testResults.length > 0 ? (
              <div>
                <p className="text-slate-300 text-base">
                  有 {testResults.filter(r => !r.passed).length} 個測試沒過。仔細看看錯誤訊息，想想邊界情況！
                </p>
                <Link
                  to={`/di-quest/lesson/${worldId}`}
                  className="inline-flex items-center gap-1.5 text-sm text-blue-400 hover:text-blue-300 hover:underline mt-2"
                >
                  <BookOpen className="w-4 h-4" />
                  回去看講義
                </Link>
              </div>
            ) : (
              <p className="text-slate-400 text-base">準備好了就按「執行」跑測試吧！卡住的話可以按右邊的提示按鈕。</p>
            )}
          </div>
          <div className="flex items-center gap-2 flex-shrink-0">
            <button
              onClick={getHint}
              disabled={hintLevel >= 3 || submitted}
              className="flex items-center gap-2 px-4 py-2.5 bg-slate-800 text-brand-accent rounded-lg hover:bg-slate-700 transition-colors disabled:opacity-50 text-sm"
            >
              <Lightbulb className="w-4 h-4" />
              提示 {hintLevel > 0 ? `(${hintLevel}/3)` : ''}
            </button>
            {allTestsPassed && !submitted && (
              <button
                onClick={handleSubmit}
                className="flex items-center gap-2 px-6 py-2.5 bg-brand-secondary text-white rounded-lg hover:bg-emerald-600 transition-colors"
              >
                <Send className="w-4 h-4" />
                提交答案
              </button>
            )}
            {submitted && nextChallenge && (
              <button
                onClick={() => navigate(`/di-quest/arena/${worldId}/${questId}/${nextChallenge.id}`)}
                className="flex items-center gap-2 px-6 py-2.5 bg-brand-primary text-white rounded-lg hover:bg-blue-600 transition-colors"
              >
                下一題 <ChevronRight className="w-4 h-4" />
              </button>
            )}
          </div>
        </div>
      </div>
    </div>
  )
}

export default CodeArena
