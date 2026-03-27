const world12 = `
# World 12：工程品質信號

> **目標：** 理解 DI 怎麼確保程式碼品質、什麼是回歸測試、什麼是 Release Gate、AI 系統的 Guardrail 為什麼特別重要
> **對應專案：** Decision-Intelligence-
> **預估學習時間：** 3-4 小時

---

## 12-1：測試金字塔 — 從零件到整車

### 用一個比喻理解測試

你買了一台新車。出廠前，車廠做了哪些測試？

1. **零件檢查（Unit Test）** — 每個螺絲、每個燈泡、每個煞車片都個別測過。數量最多、速度最快。
2. **組裝測試（Integration Test）** — 引擎裝上車身後，確認它們合在一起能正常運作。數量中等。
3. **整車試駕（E2E Test）** — 請一個人坐進去，啟動、加速、煞車、轉彎，走一圈完整的路線。數量最少但最接近真實。

這就是「測試金字塔」：底部是大量的 unit test（快、便宜），頂部是少量的 E2E test（慢、貴但全面）。

### DI 的測試層級

DI 有七層測試。聽起來很多，但每一層都有明確的目的：

| 層級 | 工具 | 測什麼 | 類比 |
|------|------|--------|------|
| **Unit Tests** | Vitest | 單一函數正不正確 | 檢查每個螺絲 |
| **Component Tests** | Vitest | React 元件渲染正不正確 | 檢查儀表板組裝 |
| **Regression Tests** | Pytest | ML 模型的結果有沒有變壞 | 確認引擎性能沒退化 |
| **Guardrail Tests** | Vitest/Pytest | AI Worker 有沒有越權 | 確認安全氣囊有效 |
| **DW Gate Tests** | Vitest | Digital Worker 核心流程正不正確 | 確認自動駕駛能用 |
| **E2E Tests** | Playwright | 使用者完整流程跑得通嗎 | 整車試駕 |
| **v1 Gate Tests** | Playwright | v1 發佈標準達到了嗎 | 出廠品管認證 |

### 前端 vs 後端的測試分工

**前端測試（JavaScript/Vitest）：**
- \`src/domains/\` 裡的領域邏輯 — 例如「計算採購建議」的邏輯
- \`src/utils/\` 裡的工具函數 — 例如日期轉換、數字格式化
- \`src/services/\` 裡的 service 邏輯 — 例如意圖解析
- \`src/components/\` 裡的 UI 元件 — 例如圖表、表格

**後端測試（Python/Pytest）：**
- ML 模型預測結果 — 確認用相同數據得到相同結果
- 求解器引擎 — 確認最佳化結果品質
- API 安全 — 確認沒有權限的人不能做敏感操作
- 治理規則 — 確認 governance 邏輯正確

> 💡 **面試官可能會追問：**
> 「如果時間不夠，只能選一種測試，你選哪一種？」
> → 看產品階段。如果是 MVP/v1，我會優先選 **E2E smoke test** — 確保核心流程（上傳 → 預測 → 計畫 → 審核）走得通。如果是成熟產品，我會優先選 **regression test** — 確保不會因為改了一行程式碼就讓模型結果變差。

---

## 12-2：回歸測試 — 確認沒有改壞東西

### 什麼是回歸測試？

你修了一個 bug，結果另一個地方壞了。這叫做「回歸」（regression）— 軟體品質倒退了。

**回歸測試就是用來防止這件事的：** 每次改程式碼後，跑一遍固定的測試，確認「原本能跑的東西還是能跑」。

### DI 的回歸測試有什麼特別？

普通軟體的回歸測試很簡單：輸入 A → 預期輸出 B → 實際輸出是 B 嗎？

但 DI 有 **ML 模型**。ML 模型的輸出是浮點數（像 0.15234），不是精確的字串。你不能說「預測值必須等於 42.57」，因為模型每次訓練可能有微小差異。

所以 DI 的回歸測試用的是**品質指標**而不是精確值：

- **MAPE（Mean Absolute Percentage Error）** — 預測誤差百分比。MAPE < 0.15 代表誤差在 15% 以內，合格。
- **Pinball Loss** — 量化區間預測的品質
- **Bias** — 預測是偏高還是偏低

**Deterministic Fixtures：**

為了讓結果可重現，測試用的數據是固定的（不是隨機生成的）。Python 環境甚至設了 \`PYTHONHASHSEED=0\` 來消除隨機性。同一組數據 + 同一個模型 → 應該得到一模一樣的結果。

### 回歸結果怎麼看？

\`\`\`json
{
  "passed": 70,
  "total": 72,
  "failed": 2,
  "failures": [
    {
      "test": "test_demand_planning_basic",
      "reason": "Expected MAPE < 0.15, got 0.23"
    }
  ]
}
\`\`\`

這份報告告訴你：72 個測試跑了 70 個通過，2 個失敗。其中一個是因為預測誤差（MAPE 0.23）超過了門檻（0.15）。

**看到這個你該怎麼想？**
1. 不能部署 — 有 2 個失敗
2. 要調查為什麼 MAPE 變大了 — 是不是數據變了？模型被改了？
3. 如果短期修不好，考慮替代方案 — rollback 到上一版、或暫時關掉那個功能

> 💡 **面試官可能會追問：**
> 「MAPE 0.23 代表什麼？嚴不嚴重？」
> → MAPE 0.23 代表預測平均偏離實際值 23%。嚴不嚴重要看場景。如果是便利商店的飲料預測，23% 可能 OK。如果是精密零件的採購計畫，23% 可能代表幾十萬的庫存成本差異。DI 的門檻設在 15%，所以 23% 被判定為失敗。

---

## 12-3：Release Gate — 出廠前的品管關卡

### 什麼是 Release Gate？

你的車組裝好了，但不能直接開出工廠。要先通過一系列品管檢查。**Release Gate 就是軟體的品管關卡 — 只有全部通過，程式碼才能部署到正式環境。**

### DI 的三道關卡

**第 1 道：Artifact Quality Gate（產出物品質）**

檢查 ML 模型的品質指標：
- MAPE < 門檻 ✅
- 測試覆蓋率 > 門檻 ✅
- Bias 在合理範圍 ✅

只要有一個不合格，就不能過關。

**第 2 道：Regression Suite（回歸測試）**

所有回歸測試都要通過。跟上一版的 baseline 比較，確認沒有退化。

**第 3 道：Canary Check（金絲雀測試）**

部署到正式環境之前，先給一小部分使用者用。如果這些人遇到問題，馬上回滾（rollback）。就像礦坑裡的金絲雀 — 如果金絲雀死了，代表空氣有毒，人不能進去。

### CI Pipeline 的執行順序

\`\`\`
lint → test:run → test:dw-gate → test:v1-gate → build
\`\`\`

每一步失敗都會阻止後續步驟。白話講：
1. **lint** — 程式碼格式有沒有問題？（語法檢查）
2. **test:run** — 基本測試都過了嗎？
3. **test:dw-gate** — Digital Worker 的核心功能正常嗎？
4. **test:v1-gate** — v1 的發佈標準達到了嗎？
5. **build** — 能不能成功打包？

### GitHub Actions 裡長什麼樣？

DI 的 \`.github/workflows/\` 有幾個重要的 CI workflow：

**ml-ci.yml** — ML 模型測試
- 每次有人改 \`src/ml/\` 底下的程式碼，自動觸發
- 跑 unit test、drift 監控、回歸測試
- timeout 20 分鐘（ML 測試需要時間）
- 用固定的隨機種子：\`PYTHONHASHSEED=0\`、\`OMP_NUM_THREADS=1\`（確保結果可重現）

**phase4-guardrails.yml** — 治理測試
- 每次有人改 governance 相關程式碼，自動觸發
- 確認權限控制、模型註冊表、升級閘門都正常

**planning-regression.yml** — 求解器回歸測試
- 確認 solver 的結果沒有退化

> 💡 **面試官可能會追問：**
> 「如果 CI 過了，是不是代表可以安心部署了？」
> → CI 通過是**必要條件但不是充分條件**。CI 是在模擬環境裡跑的，可能缺少正式環境才有的數據、流量、或邊界條件。所以除了 CI，還需要 canary 部署和生產監控。

---

## 12-4：E2E 與 Smoke Test — 整車試駕

### Smoke Test — 能不能點燃？

Smoke Test 的名字來自硬體工程：新的電路板通電時，如果冒煙了（smoke），代表有問題。

DI 的 Smoke Test（\`e2e/smoke.spec.js\`）做的是最基本的檢查：
- 頁面能載入嗎？
- 主要元素都在嗎？
- 沒有 JavaScript 錯誤嗎？

**如果 smoke test 都過不了，就不用跑更深入的測試了。**

### E2E Flow Tests — 模擬使用者操作

DI 用 Playwright（一個瀏覽器自動化工具）來模擬使用者的完整操作流程：

| 測試 | 做什麼 |
|------|--------|
| upload flow | 模擬上傳 Excel → 確認數據被正確匯入 |
| chat flow | 模擬在聊天框輸入指令 → 確認 AI 有回應 |
| full flow | 從上傳到預測到計畫到審核，跑一遍完整的 Golden Path |
| upload-chat | 上傳後馬上在聊天框下指令 |

### v1 Gate Test — 發佈門檻

\`npm run test:v1-gate\` 是最嚴格的測試，驗證三個核心流程：

1. **upload-to-plan** — 從上傳到產出計畫，完整鏈路
2. **revise** — 修訂流程（主管要求修改 → Worker 重新執行）
3. **approve-audit** — 批准 + 審計追蹤（批准後能不能看到完整歷史）

這三個測試代表了 Golden Path 的核心。如果這三個過了，系統的核心功能就是正常的。

### Live Worker Test — 用真的 AI

\`npm run test:live\` 會真的呼叫 LLM（Gemini/DeepSeek）。這比 mock 測試更接近真實，但也更慢、更貴。適合在正式發佈前做最後確認。

> 💡 **面試官可能會追問：**
> 「E2E 測試很慢很貴，為什麼還需要？」
> → 因為 unit test 和 integration test 可能各自都通過，但組合在一起卻不 work。比如 chatIntentService 正確解析了意圖，ML API 正確跑了預測，但前端的 Canvas 沒有正確顯示結果 — 這種問題只有 E2E 才能發現。

---

## 12-5：Guardrail 測試 — AI 的安全氣囊

### 為什麼 AI 系統需要特別的測試？

一般軟體的 bug 是「功能壞了」— 按鈕點了沒反應、數字算錯了。使用者會看到，你會收到 bug report。

AI 系統的問題更隱蔽：**AI 可能做了一些「看起來合理但其實不該做」的事。** 比如：
- Worker 明明是 A2 等級（需要人事後審核），但它自動執行了不該自動做的操作
- 模型的精度慢慢退化了，但因為退化是漸進的，沒人注意到
- 自動化流程繞過了人工審核的閘門

**Guardrail 測試就是確保這些事不會發生。** 它測的不是「功能有沒有」，而是「限制有沒有生效」。

### DI 的 Guardrail 測試

| 測試 | 驗什麼 |
|------|--------|
| Action Guardrails | Worker 的每個動作是否在允許範圍內（不能越權） |
| Governance Controls | 治理規則是否被正確執行（批准流程不能被跳過） |
| API Guards | ML API 的安全檢查是否正確（未授權的請求被擋掉） |
| Promotion Gate | 模型升級是否通過品質閘門（不能把壞模型推上線） |
| Registry Guards | 模型註冊表的操作是否合規（不能隨便刪除或修改已發佈的模型） |

### Phase 4 Guardrails — 最嚴格的一關

\`npm run test:phase4-guardrails\` 涵蓋整個治理系統：
- 權限控制：沒有權限的人嘗試做敏感操作 → 被拒絕 ✅
- 模型生命週期：模型從訓練 → 驗證 → 上線 → 退役，每一步都有閘門 ✅
- 重新訓練觸發：模型精度下降到門檻以下 → 自動觸發重新訓練 ✅
- 升級閘門：新模型必須比舊模型好才能取代 ✅

### 為什麼 Guardrail 比功能測試更重要？

> **功能壞了，使用者會看到。Guardrail 壞了，可能沒人發現——直到出大事。**

如果預測功能壞了，使用者會說「跑不了」，你會馬上修。但如果自主等級的控制邏輯壞了，Worker 可能在不該自動執行的時候自動執行了，而且「看起來一切正常」— 因為它確實執行了，只是不該那樣做。

> 💡 **面試官可能會追問：**
> 「你們怎麼確保 AI 不會做出超出預期的事？」
> → 三道防線：1. **程式碼層面** — 狀態機確保任務只能按合法的順序轉換。2. **政策層面** — ApprovalPolicy 定義什麼動作需要人批准，writeback 在 v1 永遠需要。3. **測試層面** — Guardrail 測試每次 CI 都跑，確保這些限制沒有被意外移除。

---

## 12-6（Boss）：品質報告

### 情境

你收到一份 regression_result.json：

\`\`\`json
{
  "passed": 70,
  "total": 72,
  "failed": 2,
  "failures": [
    {
      "test": "test_demand_planning_basic",
      "reason": "Expected MAPE < 0.15, got 0.23"
    },
    {
      "test": "test_inventory_risk_threshold",
      "reason": "Risk score 0.82 exceeds safe threshold 0.75"
    }
  ]
}
\`\`\`

### 你的任務

1. 你會把這個版本推到正式環境嗎？為什麼？
2. 你會怎麼調查這兩個失敗？
3. 如果這兩個問題短期修不好，你有什麼替代方案？

### 評估標準

- 是否明確說**不推**（2 個失敗 = Release Gate 沒過）
- 是否能解讀指標（MAPE 0.23 代表預測偏差 23%；Risk score 0.82 代表風險指標超標）
- 調查步驟是否系統化：
  1. 先看是不是數據問題（測試數據有沒有被改？）
  2. 再看是不是程式碼問題（最近誰改了預測邏輯？用 git blame 查）
  3. 最後看是不是環境問題（Python 版本？套件版本？）
- 替代方案是否務實：
  - **rollback** — 退回上一個通過的版本
  - **feature flag** — 關掉出問題的功能，其他功能繼續部署
  - **hotfix** — 只修這個 bug，做一個最小的修復
`

export default world12
