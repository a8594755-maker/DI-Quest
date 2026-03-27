/**
 * Web Worker — 安全的程式碼執行沙盒
 * 在獨立執行緒中執行學生程式碼，避免阻塞 UI 或存取 DOM
 */

/* eslint-disable no-restricted-globals */
self.onmessage = function (e) {
  const { code, tests, returnVars, timeout = 5000 } = e.data

  const logs = []
  const errors = []

  // 覆寫 console.log
  const fakeConsole = {
    log: (...args) => logs.push(args.map(String).join(' ')),
    error: (...args) => errors.push(args.map(String).join(' ')),
    warn: (...args) => logs.push('[warn] ' + args.map(String).join(' ')),
  }

  let timer = null

  try {
    // 建立安全環境：禁止存取 DOM、fetch 等
    const sandbox = {
      console: fakeConsole,
      Math,
      Date,
      parseInt,
      parseFloat,
      isNaN,
      isFinite,
      Number,
      String,
      Boolean,
      Array,
      Object,
      JSON,
      Map,
      Set,
      RegExp,
      Error,
      TypeError,
      RangeError,
      DOMException,
      Promise,
      Infinity,
      NaN,
      undefined,
    }

    // 建立函式，把 returnVars 回傳
    const returnStatement = returnVars && returnVars.length > 0
      ? `\nreturn { ${returnVars.join(', ')} };`
      : '\nreturn {};'

    const wrappedCode = `"use strict";\n${code}${returnStatement}`

    const keys = Object.keys(sandbox)
    const values = Object.values(sandbox)

    // 用 Function constructor + 超時保護
    const fn = new Function(...keys, wrappedCode)

    // 超時保護
    let finished = false
    timer = setTimeout(() => {
      if (!finished) {
        self.postMessage({
          success: false,
          error: `程式執行超過 ${timeout / 1000} 秒，可能有無窮迴圈`,
          logs,
          testResults: [],
        })
      }
    }, timeout)

    const ctx = fn(...values)
    finished = true
    clearTimeout(timer)

    // 執行測試
    const testResults = (tests || []).map((test) => {
      try {
        // 用 eval 建立測試函式（測試定義來自我們自己的 questData，不是用戶輸入）
        const testFn = new Function('return ' + test.fn)()
        const passed = !!testFn(ctx)
        return { description: test.description, passed, error: null }
      } catch (err) {
        return { description: test.description, passed: false, error: err.message }
      }
    })

    self.postMessage({
      success: true,
      logs,
      errors,
      testResults,
    })
  } catch (err) {
    if (timer) clearTimeout(timer)
    self.postMessage({
      success: false,
      error: err.message,
      logs,
      errors,
      testResults: [],
    })
  }
}
