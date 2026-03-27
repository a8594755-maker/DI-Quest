// SQL Web Worker — 使用 sql.js 在瀏覽器端執行 SQLite

let db = null

async function loadSqlJs() {
  const SQL = await globalThis.initSqlJs({
    locateFile: () => '/sql-wasm.wasm',
  })
  return SQL
}

self.onmessage = async function (e) {
  const { type, payload } = e.data

  try {
    switch (type) {
      case 'INIT_DB': {
        // 載入 sql.js from local public folder
        if (!globalThis.initSqlJs) {
          importScripts('/sql-wasm.js')
        }
        const SQL = await loadSqlJs()
        db = new SQL.Database()
        // 執行 schema + seed data
        if (payload.schema) {
          db.run(payload.schema)
        }
        self.postMessage({ type: 'READY' })
        break
      }

      case 'RUN_SQL': {
        if (!db) {
          self.postMessage({ type: 'ERROR', message: '資料庫尚未初始化' })
          return
        }
        const timeoutId = setTimeout(() => {
          self.postMessage({ type: 'ERROR', message: '查詢超時（5 秒）' })
        }, 5000)

        const results = db.exec(payload.sql)
        clearTimeout(timeoutId)

        if (results.length === 0) {
          self.postMessage({ type: 'RESULT', columns: [], rows: [] })
        } else {
          const { columns, values } = results[0]
          self.postMessage({ type: 'RESULT', columns, rows: values })
        }
        break
      }

      case 'VALIDATE': {
        if (!db) {
          self.postMessage({ type: 'ERROR', message: '資料庫尚未初始化' })
          return
        }
        // 執行使用者查詢
        let userResult
        try {
          userResult = db.exec(payload.userSql)
        } catch (err) {
          self.postMessage({ type: 'VALIDATION', correct: false, error: err.message })
          return
        }

        // 執行預期查詢
        const expectedResult = db.exec(payload.expectedSql)

        // 比對結果
        const userRows = userResult.length > 0 ? JSON.stringify(userResult[0].values) : '[]'
        const expectedRows = expectedResult.length > 0 ? JSON.stringify(expectedResult[0].values) : '[]'

        self.postMessage({
          type: 'VALIDATION',
          correct: userRows === expectedRows,
          expected: expectedResult.length > 0 ? { columns: expectedResult[0].columns, rows: expectedResult[0].values } : { columns: [], rows: [] },
          actual: userResult.length > 0 ? { columns: userResult[0].columns, rows: userResult[0].values } : { columns: [], rows: [] },
        })
        break
      }

      default:
        self.postMessage({ type: 'ERROR', message: `未知的訊息類型: ${type}` })
    }
  } catch (err) {
    self.postMessage({ type: 'ERROR', message: err.message })
  }
}
