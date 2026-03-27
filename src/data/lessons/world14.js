const world14 = `
# World 14：邊界與限制

> **目標：** 理解 Decision Intelligence 的操作邊界、已知限制、以及如何成熟地溝通這些限制
> **對應專案：** Decision-Intelligence-
> **預估學習時間：** 2-3 小時

---

## 14-1：Frontend-Only 部分啟動

### 什麼是部分啟動？

Decision Intelligence 的前端可以在沒有後端的情況下啟動（\`npm run dev\`），但這只是「部分啟動」。

### 能跑 vs 能用

| 狀態 | 前端 Only | 完整啟動 |
|------|-----------|----------|
| 頁面載入 | ✅ | ✅ |
| 路由切換 | ✅ | ✅ |
| UI 元件渲染 | ✅ | ✅ |
| 使用者認證 | ❌ | ✅ |
| 數據上傳與儲存 | ❌ | ✅ |
| AI 對話 | ❌ | ✅ |
| 預測執行 | ❌ | ✅ |
| 工作流完整執行 | ❌ | ✅ |
| 健康檢查通過 | ❌ | ✅ |

### 為什麼這很重要？

1. **Demo 風險**：如果只跑前端去 demo，會看到很多「載入中」或錯誤
2. **開發誤解**：新開發者可能以為「跑起來了 = 可以用了」
3. **測試盲點**：前端 only 的測試不能代表系統真的可用

### 正確的做法

用 \`./scripts/healthcheck.sh\` 作為真正的 readiness 信號，而不是「瀏覽器能打開」。

> 💡 **Framework Tip：** 「能啟動」和「能用」是完全不同的概念。在分散式系統中，你需要一個明確的 readiness 定義，而不是「看起來沒問題」。

---

## 14-2：SAP Adapter 邊界

### Adapter ≠ Turnkey Connector

Decision Intelligence 有 5 個 SAP 同步 Edge Functions：
- \`sync-materials-from-sap\`
- \`sync-demand-fg-from-sap\`
- \`sync-inventory-from-sap\`
- \`sync-bom-from-sap\`
- \`sync-po-open-lines-from-sap\`

**但這些是 adapter，不是 turnkey connector。**

### Adapter vs Turnkey Connector

| | Adapter | Turnkey Connector |
|---|---------|-------------------|
| 合約（Schema） | ✅ 已鎖定 | ✅ 已鎖定 |
| 驗證邏輯 | ✅ 有 | ✅ 有 |
| 客戶端設定 | ❌ 需要客製 | ✅ 自助設定 |
| 認證管理 | ❌ 需要手動 | ✅ OAuth/SSO 整合 |
| 監控 | ❌ 基本 | ✅ 完整 |
| 錯誤處理 | ⚠️ 有限 | ✅ 完整重試 |

### 合約已鎖定的意義

雖然不是 turnkey，但合約（contract）是穩定的：
- \`ADAPTER_PAYLOAD_CONTRACT\` 定義了資料格式
- \`MUTATION_FIELD_TYPES\` 強制值類型
- \`validateWritebackPayload()\` 做完整的 schema + type 驗證
- 有 25+ 個合約測試

這代表：**介面是穩定的，但整合需要工程工作。**

### 生產環境需要什麼？

要讓 SAP sync 在生產環境跑起來，還需要：
- 客戶特定的 SAP endpoint URL
- SAP API credentials
- 網路連通性（通常需要 VPN 或 private link）
- 欄位映射的客製化

> 💡 **Framework Tip：** 「有 adapter」和「能連」是不同的。成熟的說法是：「我們有穩定的合約和驗證邏輯，但生產整合需要客戶端的設定工作。」

---

## 14-3：Optional ML 足跡

### Chronos 排除

Dockerfile 預設 **排除** Chronos 相關依賴（PyTorch、Transformers、Accelerate）。

### 為什麼排除？

| 考量 | 含 Chronos | 不含 Chronos |
|------|-----------|-------------|
| Docker image 大小 | ~3-4 GB | ~800 MB |
| 啟動時間 | 較長 | 較短 |
| 記憶體需求 | 較高 | 較低 |
| 部署成本 | 較高 | 較低 |
| 預測能力 | Prophet + LightGBM + Chronos | Prophet + LightGBM |

### 設定方式

\`\`\`
DI_CHRONOS_ENABLED=false  # 預設值
\`\`\`

### Lean Runtime vs Full Research

這是一個 **產品決策**：
- **預設部署**：lean runtime，適合大多數場景
- **完整部署**：需要手動修改 Dockerfile 和設定
- 這不是「缺少功能」，而是「刻意選擇精簡」

> 💡 **Framework Tip：** 好的系統設計會考慮「預設應該是什麼」。預設值應該對最多的使用場景有效，而不是把所有東西都塞進去。

---

## 14-4：文件閱讀路線

### 建議閱讀順序

Decision Intelligence 有 50+ 份文件。repo 自己建議的閱讀順序是：

**第一輪：產品理解**
1. \`README.md\` — 產品概覽、快速開始
2. \`docs/DEMO.md\` — 推薦的 demo 路徑
3. \`docs/GOLDEN_PATH.md\` — v1 使用者流程

**第二輪：技術理解**
4. \`docs/ARCHITECTURE.md\` — 系統拓撲與層級
5. \`docs/DEPLOYMENT.md\` — 部署步驟
6. \`docs/KNOWN_LIMITATIONS.md\` — 操作邊界

**第三輪：深度參考**
7. \`docs/SPECIFICATION_zh-TW.md\` — 模組級規格
8. \`docs/planning_api_contract.md\` — 任務分解 API
9. \`docs/forecast_contract.md\` — 預測 API
10. \`docs/model_registry_and_promotion.md\` — 模型治理

**第四輪：營運參考**
11. \`docs/RUNBOOK.md\` — 營運手冊
12. \`docs/telemetry_schema.md\` — 遙測 schema
13. \`docs/drift_and_retrain.md\` — 訓練管線

### 文件不等於產品

一個常見的誤解：「文件寫了 = 功能存在且完整」。

實際上：
- 文件可能描述了目標狀態（不是現在狀態）
- 某些功能可能只有 adapter 但沒有完整實作
- \`docs/archive/\` 裡的文件是歷史記錄，不是現在的規格

> 💡 **Framework Tip：** 閱讀文件時，區分「規格文件」（應該是什麼樣）和「狀態文件」（現在是什麼樣）。KNOWN_LIMITATIONS.md 通常是最誠實的文件。

---

## 14-5：操作邊界總覽

### 環境依賴表

| 依賴 | 為什麼重要 | 怎麼處理 |
|------|-----------|----------|
| Supabase | Auth、persistence、storage、Edge Functions 都靠它 | 設定 URL 和 anon key，部署 Edge Functions |
| ML API | 預測、規劃、非同步作業不在前端跑 | 用 \`start.sh --backend\` 或容器部署 |
| AI provider secrets | 助手、映射、prompt 流程依賴 server-side credentials | 用 \`supabase secrets set\` |
| Migration set | 某些流程依賴特定的 schema | 按順序套用所有 migrations |

### 已解決 vs 未解決

**已解決的邊界：**
- ✅ Bootstrap experience → \`start.sh\` 單一命令啟動
- ✅ Health monitoring → \`healthcheck.sh\` + API probes + frontend check
- ✅ ERP adapter contract → locked schema + validation + 25+ tests

**仍需注意的邊界：**
- ⚠️ Partial bring-up → 前端可跑但 workflow 不完整
- ⚠️ ERP integration → adapter 不是 turnkey connector
- ⚠️ Optional ML footprint → Chronos 預設排除

### Execution Guardrails

系統透過環境變數設定操作上限：
\`\`\`
DI_MAX_ROWS_PER_SHEET=2000000   # 每張表最大行數
DI_MAX_SKUS=5000                 # 最大 SKU 數
DI_SOLVER_MAX_SECONDS=90         # 求解器最大時間
DI_BOM_MAX_EDGES=200000          # BOM 最大邊數
DI_BOM_MAX_DEPTH=12              # BOM 最大深度
DI_FORECAST_MAX_SERIES=5000      # 預測最大序列數
DI_JOB_MAX_ATTEMPTS=3            # 作業最大重試次數
\`\`\`

> 💡 **Framework Tip：** 操作邊界不是「系統的缺點」，而是「系統的安全閥」。沒有邊界的系統是不安全的。

---

## 14-6（Boss）：限制溝通

### 情境

一個潛在客戶來信問：

> 「我們公司用 SAP S/4HANA。Decision Intelligence 可以直接連接我們的 SAP 系統嗎？我們希望即時同步庫存和需求數據。」

### 你的任務

寫一封專業的回覆信。你的回覆應該：
1. **誠實說明限制**（不是 turnkey connector）
2. **展示技術成熟度**（有鎖定合約、有驗證、有測試）
3. **說明需要的整合工作**（客戶端設定、credentials、映射）
4. **把限制變成優勢**（穩定的合約 = 可靠的整合基礎）

### 評估標準

- 是否誠實（沒有說「可以直接連」）
- 是否專業（不是只說「不行」就結束）
- 是否展示技術深度（提到 contract、validation、adapter）
- 是否提供了前進路徑（需要做什麼才能整合）
- 語調是否適合客戶溝通
`

export default world14
