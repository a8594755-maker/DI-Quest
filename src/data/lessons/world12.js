const world12 = `
# World 12：工程品質信號

> **目標：** 理解 Decision Intelligence 的測試策略、回歸測試、Release Gate、Guardrails
> **對應專案：** Decision-Intelligence-
> **預估學習時間：** 2-3 小時

---

## 12-1：測試金字塔

### 為什麼工程品質很重要？

一個專案的成熟度不只看功能數量，更要看它怎麼驗證品質。Decision Intelligence 有完整的測試策略，從單元測試到端對端測試。

### 測試層級

| 層級 | 工具 | 範圍 | 指令 |
|------|------|------|------|
| **Unit Tests** | Vitest | 單一函數/模組 | \`npm run test:unit\` |
| **Component Tests** | Vitest | React 元件與 View | \`npm run test:components\` |
| **E2E Tests** | Playwright | 完整使用者流程 | \`npm run test:e2e\` |
| **Regression Tests** | Pytest（Python） | ML 模型回歸 | \`npm run test:regression\` |
| **Guardrail Tests** | Vitest | 政策與治理 | \`npm run test:phase4-guardrails\` |
| **DW Gate Tests** | Vitest | Digital Worker 驗收 | \`npm run test:dw-gate\` |
| **v1 Gate Tests** | Playwright | v1 完整流程 | \`npm run test:v1-gate\` |

### 前端測試範圍

Unit tests 覆蓋：
- \`src/domains/\` — 領域邏輯
- \`src/utils/\` — 工具函數
- \`src/risk/\` — 風險計算
- \`src/services/closed_loop/\` — 閉環流程

Component tests 覆蓋：
- \`src/components/\` — UI 元件
- \`src/views/\` — 功能視圖

### Python 後端測試

\`tests/\` 目錄有 50+ 測試檔案，涵蓋：
- 規劃回歸套件
- 求解器引擎
- 治理控制
- API guardrails
- 模型註冊表

> 💡 **Framework Tip：** 測試金字塔：底層（unit）數量最多、速度最快；頂層（E2E）數量最少、最慢但最接近真實情境。好的測試策略是每一層都有覆蓋。

---

## 12-2：回歸測試套件

### 什麼是回歸測試？

回歸測試確保「修改程式碼後，原本能跑的東西還是能跑」。

### Decision Intelligence 的回歸策略

**規劃回歸套件（\`tests/test_planning_regression_suite.py\`）：**
- 使用 **deterministic fixtures**（固定的測試數據）
- 每次跑出的結果應該一模一樣
- 如果結果變了，代表有東西被改壞了

**結果格式（\`regression_result.json\`）：**
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

### 求解器回歸

\`npm run test:solver-regression\` 專門測試求解器引擎（OR-Tools）：
- 確保最佳化結果不會因為程式碼變更而劣化
- 測試求解時間是否在可接受範圍內
- 驗證約束條件是否被正確執行

> 💡 **Framework Tip：** 回歸測試的核心是「可重現性」。用固定數據、固定參數，期望固定結果。任何偏差都是一個需要調查的信號。

---

## 12-3：Release Gate 機制

### 什麼是 Release Gate？

Release Gate 是發佈前的品質關卡。只有通過所有檢查，程式碼才能被部署到生產環境。

### 三個必要檢查

**1. Artifact Quality Gates**
- **MAPE**（Mean Absolute Percentage Error）< 閾值
- **Coverage**（測試覆蓋率）> 閾值
- **Pinball Loss** 和 **Bias** 在可接受範圍

**2. Regression Suite**
- 所有回歸測試必須通過
- 結果和 baseline 比較

**3. Canary Checks**
- 小流量測試新版本
- 確認沒有新的錯誤或效能退化

### CI Pipeline

\`npm run ci\` 會依序執行：
\`\`\`
lint → test:run → test:dw-gate → test:v1-gate → build
\`\`\`

每一步失敗都會阻止後續步驟。

### 為什麼這很重要？

沒有 release gate 的後果：
- 壞掉的程式碼進入生產環境
- 模型精度退化但沒人發現
- 治理規則被繞過

> 💡 **Framework Tip：** Release Gate 的設計原則：「沒有通過的證據，就當作沒通過」。寧可多擋一次好的部署，也不要放過一次壞的。

---

## 12-4：E2E 與 Smoke Tests

### Playwright E2E 測試

Decision Intelligence 使用 Playwright 進行端對端測試，位於 \`e2e/\` 目錄。

**Smoke Tests（\`e2e/smoke.spec.js\`）：**
- 最基本的可用性測試
- 頁面能載入嗎？
- 主要元素都在嗎？
- 沒有 JavaScript 錯誤嗎？

**Flow Tests：**
- \`npm run test:flows:upload\` — 上傳流程
- \`npm run test:flows:chat\` — 聊天流程
- \`npm run test:flows:full\` — 完整流程
- \`npm run test:flows:upload-chat\` — 上傳 + 聊天

**v1 Gate Tests（\`npm run test:v1-gate\`）：**
- upload-to-plan — 從上傳到計畫的完整鏈路
- revise — 修訂流程
- approve-audit — 批准和審計流程

### Live Worker Tests

\`npm run test:live\` — 使用真實 LLM 呼叫的測試
\`npm run test:live:ui-only\` — 不呼叫 LLM 的 UI 測試
\`npm run test:live:headful\` — 開瀏覽器可以看到的測試

### Auto-Crawler

\`npm run test:auto-debug\` — 自動爬取頁面找問題

> 💡 **Framework Tip：** E2E 測試的價值不在數量，而在覆蓋了真實的使用者流程。一個好的 E2E 測試模擬使用者會做的事，而不是測試技術細節。

---

## 12-5：Guardrail 檢查

### 什麼是 Guardrail？

Guardrail（護欄）是系統層級的安全檢查，確保 AI Worker 不會做出越權的行為。

### 測試檔案

| 測試 | 檔案 | 驗證什麼 |
|------|------|----------|
| Action Guardrails | \`tests/test_action_guardrails.py\` | Worker 動作是否在允許範圍 |
| Guardrails E2E | \`tests/test_guardrails_e2e.py\` | 端對端 guardrail 執行 |
| Governance Controls | \`tests/test_governance_controls.py\` | 治理規則是否被執行 |
| API Guards | \`tests/test_main_api_guards.py\` | API 層的安全檢查 |

### Phase 4 Guardrails

\`npm run test:phase4-guardrails\` 涵蓋：
- Guardrail 檢查
- Registry（模型註冊表）
- Retrain（重新訓練觸發）
- Lifecycle（生命週期管理）
- Promotion Gate（模型升級閘門）

### 為什麼 Guardrail 測試很重要？

在一個有 AI 自主性的系統中：
- AI 可能嘗試執行未授權的動作
- 模型可能產生超出信任範圍的建議
- 自動化流程可能繞過人工審核

Guardrail 測試確保這些情況不會發生。

> 💡 **Framework Tip：** 在 AI 系統中，guardrail 測試比功能測試更重要。功能壞了使用者會看到，guardrail 壞了可能沒人發現——直到出大事。

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

1. 你會 promote 到 production 嗎？為什麼？
2. 你的調查步驟是什麼？
3. 如果這兩個失敗無法在短時間修復，你會怎麼做？

### 評估標準

- 是否明確說不該 promote（2 個失敗 = 不通過）
- 是否能解讀 MAPE 和 risk score 的含義
- 調查步驟是否系統化（而非「試試看修修看」）
- 是否考慮了替代方案（rollback、hotfix、disable feature）
`

export default world12
