const world13 = `
# World 13：ML API 後端深度

> **目標：** 理解 ML API 的認證、多租戶、速率限制、非同步作業、遙測
> **對應專案：** Decision-Intelligence-（\`src/ml/api/\`）
> **預估學習時間：** 2-3 小時

---

## 13-1：JWT 認證機制

### 什麼是 JWT？

JWT（JSON Web Token）是一種用來在不同系統之間安全傳遞身份資訊的標準。

### Decision Intelligence 的 JWT 實作

檔案位置：\`src/ml/api/jwt_auth.py\`

**JWTClaims 資料結構：**
- \`sub\` — 使用者 ID
- \`role\` — 角色
- \`email\` — 電子郵件
- \`raw_claims\` — 原始 claims

**認證流程：**
1. 使用者登入 Supabase → 取得 JWT
2. 前端在 API 請求的 Header 附上 JWT
3. ML API 用 Supabase 的 HS256 secret 驗證 JWT
4. 從 JWT 解析出身份和角色資訊

**公開路徑（Public Paths）：**
- 某些 endpoints（如 \`/healthz\`、\`/readyz\`）不需要 JWT
- 這些路徑跳過認證檢查

**環境變數：**
- \`DI_JWT_REQUIRED\` — 控制 JWT 是否為必要（開發時可關閉）

> 💡 **Framework Tip：** JWT 的核心價值是「stateless 認證」——server 不需要查資料庫就能驗證身份。但 secret 一定要安全保管。

---

## 13-2：多租戶與角色控制

### 什麼是多租戶（Multi-Tenant）？

多租戶系統讓多個組織共用同一套系統，但彼此的數據完全隔離。

### Decision Intelligence 的角色控制

**核心函數：**
- \`_actor_from_request()\` — 從 request 提取執行者身份
- \`_require_action_role()\` — 檢查執行者是否有權執行某動作
- \`ensure_role_allowed()\` — 角色驗證
- \`normalize_role()\` — 角色名稱標準化

**GovernanceAction 類型：**
定義了系統中所有需要權限控制的動作，例如：
- 執行預測
- 修改模型
- 批准計畫
- 存取敏感數據

**GovernanceStore：**
儲存和檢索治理規則，決定誰可以做什麼。

### 為什麼需要這些？

在企業環境中：
- 不是每個人都能修改模型
- 不是每個人都能批准計畫
- 不是每個人都能看到所有數據
- 所有操作都需要可追溯到誰做的

> 💡 **Framework Tip：** 角色控制的設計原則是「最小權限」——每個使用者只能做他被明確允許做的事，其他一律拒絕。

---

## 13-3：Rate Limiting

### 為什麼需要速率限制？

- 防止單一使用者佔用所有資源
- 保護外部 API 呼叫（Gemini/DeepSeek 有費用）
- 防止惡意攻擊或意外的無限循環

### Decision Intelligence 的實作

檔案位置：\`src/ml/api/rate_limiter.py\`

**兩種實作：**

| 實作 | 適用場景 | 特點 |
|------|----------|------|
| \`InProcessRateLimiter\` | 單機部署 | 用記憶體計數，簡單但不支援多機 |
| \`RedisRateLimiter\` | 多機部署 | 用 Redis 做分散式計數 |

**Sliding Window（滑動窗口）演算法：**
- 不是「每分鐘重置」，而是真的看「過去 60 秒」
- 更公平、更不容易被突發請求繞過

**環境變數：**
- \`DI_RATE_LIMIT_PER_MINUTE\` — 每分鐘最大請求數
- \`DI_REDIS_URL\` — Redis 連線（有設就用 Redis，沒設就用記憶體）

### 降級策略

如果 Redis 不可用，系統會自動降級到 \`InProcessRateLimiter\`。這是一個 **graceful degradation** 的例子。

> 💡 **Framework Tip：** 好的系統設計會考慮「依賴不可用時怎麼辦」。Rate limiter 不能因為 Redis 掛了就讓所有請求通過（不安全），也不能全部擋掉（不可用）。降級到單機限制是合理的折衷。

---

## 13-4：非同步作業系統

### 為什麼需要非同步？

ML 計算可能需要幾秒到幾分鐘。如果用同步 API：
- 使用者必須等待
- HTTP 連線可能 timeout
- 伺服器資源被長時間佔用

### Decision Intelligence 的非同步架構

檔案位置：\`src/ml/api/async_runs.py\`

**核心元件：**

| 元件 | 職責 |
|------|------|
| \`AsyncRunService\` | 管理非同步作業的生命週期 |
| \`AsyncRunWorker\` | 在背景執行作業 |
| \`AsyncRunConfig\` | 作業配置（timeout、重試策略） |

**兩種儲存：**

| 儲存 | 適用場景 |
|------|----------|
| \`InMemoryAsyncRunStore\` | 開發/測試，簡單但重啟後遺失 |
| \`PostgresAsyncRunStore\` | 生產環境，持久化 |

**作業狀態（Job States）：**
\`\`\`
pending → running → completed
                  → failed
                  → cancelled
\`\`\`

\`TERMINAL_JOB_STATUSES\` = \`completed\`、\`failed\`、\`cancelled\`

### 作業流程

1. 前端提交作業請求 → API 回傳 \`run_id\`
2. 前端定期輪詢 \`run_id\` 的狀態
3. Worker 在背景執行計算
4. 完成後更新狀態和結果
5. 前端取得結果並顯示

> 💡 **Framework Tip：** 非同步模式的核心是「提交-輪詢-取結果」。這讓前端不需要保持長連線，也讓後端可以更好地管理資源。

---

## 13-5：Telemetry 與 SSE

### Telemetry（遙測）

檔案位置：\`src/ml/api/solver_telemetry.py\`、\`observability.py\`

**求解器遙測事件包含：**
- Contract version（合約版本）
- Engine（使用的求解器）
- Solve time（求解時間）
- Status（成功/失敗）
- Termination reason（結束原因）

### 為什麼需要遙測？

1. **效能監控**：求解時間突然變長 → 可能有問題
2. **品質追蹤**：模型精度隨時間變化
3. **容量規劃**：知道資源使用模式才能規劃擴展
4. **除錯**：出問題時快速定位原因

### SSE（Server-Sent Events）

檔案位置：\`src/ml/api/agent_sse_router.py\`

SSE 讓伺服器可以即時推送事件給前端：
- Agent 執行進度更新
- 步驟完成通知
- 錯誤通知

跟 WebSocket 的差異：
- SSE 是單向的（伺服器 → 客戶端）
- 更簡單、更容易穿越防火牆
- 適合「伺服器推送更新」的場景

### Prometheus Metrics

ML API 也暴露 Prometheus 格式的 metrics：
- 請求計數
- 延遲分佈
- 錯誤率
- 資源使用

> 💡 **Framework Tip：** 遙測是「可觀測性」（Observability）的核心。好的系統不只要能跑，還要能被觀察。Logs 告訴你發生了什麼，Metrics 告訴你系統狀態，Traces 告訴你請求去了哪裡。

---

## 13-6（Boss）：API 安全架構審查

### 情境

你的主管問你：

> 「Decision Intelligence 的 ML API 是怎麼保護多租戶安全的？從認證到授權到速率限制，幫我做一個快速的安全審查。」

### 你的任務

說明以下安全機制如何協同工作：

1. **JWT 認證** — 身份驗證
2. **角色控制** — 授權
3. **Rate Limiting** — 資源保護
4. **Async Runs** — 隔離執行
5. **Telemetry** — 可追溯性

### 評估標準

- 是否理解每個機制的職責
- 是否能說明它們如何協同（不是各自獨立的）
- 是否提到 graceful degradation（如 Redis 不可用時的降級）
- 是否提到公開路徑（health endpoints 不需要 JWT）
`

export default world13
