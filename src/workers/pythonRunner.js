// Python Web Worker — 使用 Pyodide 在瀏覽器端執行 Python

let pyodide = null

async function loadPyodide() {
  importScripts('https://cdn.jsdelivr.net/pyodide/v0.27.5/full/pyodide.js')
  pyodide = await globalThis.loadPyodide({
    indexURL: 'https://cdn.jsdelivr.net/pyodide/v0.27.5/full/',
  })
  return pyodide
}

self.onmessage = async function (e) {
  const { type, payload } = e.data

  try {
    switch (type) {
      case 'INIT': {
        if (!pyodide) {
          await loadPyodide()
        }
        self.postMessage({ type: 'READY' })
        break
      }

      case 'RUN_CODE': {
        if (!pyodide) {
          self.postMessage({ type: 'ERROR', code: 'NOT_READY' })
          return
        }
        // Capture stdout
        pyodide.runPython(`
import sys, io
_stdout_capture = io.StringIO()
sys.stdout = _stdout_capture
`)
        try {
          pyodide.runPython(payload.code)
          const stdout = pyodide.runPython('_stdout_capture.getvalue()')
          self.postMessage({ type: 'RESULT', output: stdout })
        } catch (err) {
          self.postMessage({ type: 'RESULT', output: '', error: err.message })
        } finally {
          pyodide.runPython('sys.stdout = sys.__stdout__')
        }
        break
      }

      case 'VALIDATE': {
        if (!pyodide) {
          self.postMessage({ type: 'ERROR', code: 'NOT_READY' })
          return
        }

        const { userCode, expectedCode, testCases } = payload

        // If testCases are provided, run user function + expected function and compare
        if (testCases && testCases.length > 0) {
          const results = []
          let allCorrect = true

          for (const tc of testCases) {
            try {
              // Run expected code first to define reference function
              pyodide.runPython(expectedCode)
              const expectedResult = pyodide.runPython(tc.input)
              const expectedStr = expectedResult != null ? String(expectedResult) : 'None'

              // Run user code to redefine the function
              pyodide.runPython(userCode)
              const userResult = pyodide.runPython(tc.input)
              const userStr = userResult != null ? String(userResult) : 'None'

              const passed = userStr === expectedStr
              if (!passed) allCorrect = false
              results.push({
                input: tc.input,
                expected: tc.expected || expectedStr,
                actual: userStr,
                passed,
              })
            } catch (err) {
              allCorrect = false
              results.push({
                input: tc.input,
                expected: tc.expected || '(reference)',
                actual: `Error: ${err.message}`,
                passed: false,
              })
            }
          }

          self.postMessage({ type: 'VALIDATION', correct: allCorrect, results })
        } else {
          // Fallback: no testCases — try to compare output directly
          try {
            // Run user code, capture stdout
            pyodide.runPython(`
import sys, io
_user_out = io.StringIO()
sys.stdout = _user_out
`)
            pyodide.runPython(userCode)
            const userOut = pyodide.runPython('_user_out.getvalue()')
            pyodide.runPython('sys.stdout = sys.__stdout__')

            // Run expected code, capture stdout
            pyodide.runPython(`
_exp_out = io.StringIO()
sys.stdout = _exp_out
`)
            pyodide.runPython(expectedCode)
            const expOut = pyodide.runPython('_exp_out.getvalue()')
            pyodide.runPython('sys.stdout = sys.__stdout__')

            const correct = userOut.trim() === expOut.trim()
            self.postMessage({
              type: 'VALIDATION',
              correct,
              results: [{
                input: '(stdout comparison)',
                expected: expOut.trim(),
                actual: userOut.trim(),
                passed: correct,
              }],
            })
          } catch (err) {
            self.postMessage({
              type: 'VALIDATION',
              correct: false,
              results: [{
                input: '(execution)',
                expected: '(no error)',
                actual: `Error: ${err.message}`,
                passed: false,
              }],
            })
          }
        }
        break
      }

      default:
        self.postMessage({ type: 'ERROR', code: 'UNKNOWN_TYPE', message: type })
    }
  } catch (err) {
    self.postMessage({ type: 'ERROR', message: err.message })
  }
}
