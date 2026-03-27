const world27 = `
# World 27：需求分析

> 需求分析是 Business Analyst 最核心的技能。搞清楚「到底要做什麼」比「怎麼做」更重要。
> 這一章教你如何從模糊的業務需求中，提煉出清晰、可執行的需求文件。

面試中最常見的問題：「你怎麼確認需求？」「遇到需求衝突怎麼辦？」
這一章讓你有系統地回答這些問題。

---

## 27-1：Business Requirements vs User Requirements

### 兩種需求的本質差異

| 面向 | Business Requirements | User Requirements |
|------|----------------------|-------------------|
| 視角 | 企業 / 管理層 | 終端用戶 |
| 關注點 | ROI、市場份額、效率 | 易用性、功能、體驗 |
| 表達方式 | 目標導向（提升 20% 轉換率） | 行為導向（我想要一鍵結帳） |
| 決定者 | C-level、Product Owner | 用戶研究、UX 團隊 |
| 優先級 | 策略層面 | 執行層面 |

### Business Requirements 範例

\`\`\`
目標：降低客服成本 30%
背景：目前每月處理 10,000 通客服電話，平均處理時間 8 分鐘
期望：透過自助服務系統，將 40% 的常見問題自動化解決
衡量指標：客服電話數量、平均處理時間、客戶滿意度
時程：Q3 完成 MVP，Q4 全面上線
\`\`\`

### User Requirements 範例

\`\`\`
作為一名線上購物的客戶，
我希望能在網站上查詢訂單配送狀態，
這樣我就不需要打電話給客服詢問。

驗收標準：
- 輸入訂單號碼即可查詢
- 顯示預計到達時間
- 配送異常時主動發通知
- 頁面載入時間 < 2 秒
\`\`\`

### 兩者的關係：從上到下的分解

\`\`\`
Business Goal（商業目標）
  ↓ Why?
Business Requirement（商業需求）
  ↓ What?
User Requirement（用戶需求）
  ↓ How?
Functional Requirement（功能需求）
  ↓ Spec
Technical Specification（技術規格）
\`\`\`

### 面試考點

> 「請描述一個你如何將商業目標轉化為具體需求的經驗。」

回答框架：
1. 商業背景與目標（Business Context）
2. 你做了什麼分析（Gap Analysis）
3. 如何拆解成用戶需求（Decomposition）
4. 最終產出與成果（Deliverable & Impact）

---

## 27-2：Functional vs Non-Functional Requirements

### Functional Requirements（功能需求）

系統「必須做到」的行為和功能。

| 類別 | 範例 |
|------|------|
| 用戶管理 | 用戶可以用 Email 註冊帳號 |
| 搜尋功能 | 支援關鍵字搜尋、篩選、排序 |
| 交易處理 | 支援信用卡、行動支付結帳 |
| 通知系統 | 訂單狀態變更時發送 Email 通知 |
| 報表功能 | 管理員可匯出月度銷售報表（CSV） |

### Non-Functional Requirements（非功能需求）

系統的品質屬性（Quality Attributes）。

| NFR 類別 | 定義 | 衡量方式 | 範例 |
|----------|------|---------|------|
| Performance | 回應速度 | Response Time | 頁面載入 < 2 秒 |
| Scalability | 擴展能力 | Concurrent Users | 支援 10,000 同時在線 |
| Availability | 可用性 | Uptime % | 99.9% uptime (SLA) |
| Security | 安全性 | Compliance | 符合 PCI DSS 標準 |
| Usability | 易用性 | Task Completion Rate | 新用戶 5 分鐘內完成註冊 |
| Maintainability | 可維護性 | MTTR | 平均修復時間 < 4 小時 |
| Compatibility | 相容性 | Browser/OS Support | 支援 Chrome、Safari、Edge |

### FURPS+ 框架

\`\`\`
F — Functionality（功能）
U — Usability（易用性）
R — Reliability（可靠性）
P — Performance（效能）
S — Supportability（可支援性）
+ — Design constraints, Implementation, Interface, Physical
\`\`\`

### 常犯錯誤

- ❌ 只寫功能需求，忽略非功能需求
- ❌ NFR 太模糊：「系統要快」→ ✅「API 回應時間 p95 < 500ms」
- ❌ 沒有定義衡量標準
- ❌ 把解決方案寫成需求：「用 Redis 做快取」→ ✅「重複查詢回應時間 < 100ms」

### 面試題練習

> 「設計一個電商平台的購物車功能，列出 FR 和 NFR。」

功能需求：
- 加入 / 移除商品
- 修改數量
- 顯示小計與總計
- 保存購物車（登入用戶跨裝置同步）
- 套用優惠券

非功能需求：
- 購物車操作回應 < 500ms
- 支援 5,000 同時操作
- 購物車資料保留 30 天
- 行動端與桌面端 RWD 相容

---

## 27-3：需求蒐集技巧

### 常用需求蒐集方法

| 方法 | 適用場景 | 優點 | 缺點 |
|------|---------|------|------|
| Interview（訪談） | 深度理解需求 | 靈活、深入 | 耗時、主觀偏差 |
| Workshop（工作坊） | 多方共識 | 效率高、互動性強 | 需要 Facilitation 技巧 |
| Survey（問卷） | 大量用戶意見 | 規模化、量化 | 回覆率低、深度不足 |
| Observation（觀察） | 了解實際使用行為 | 真實、客觀 | 受觀察效應影響 |
| Document Analysis | 了解現有流程 | 不打擾用戶 | 可能過時 |
| Prototyping（原型） | 驗證需求理解 | 直觀、快速回饋 | 可能被誤認為成品 |

### 訪談技巧 — SPIN 框架

\`\`\`
S — Situation（現況）：目前的流程是什麼？
P — Problem（問題）：最大的痛點是什麼？
I — Implication（影響）：這個問題造成什麼影響？
N — Need-payoff（需求回報）：如果解決了，會帶來什麼好處？
\`\`\`

### 訪談提問範例

\`\`\`
Situation:
「能描述一下你目前處理退貨的流程嗎？」
「一天大約處理多少筆退貨？」

Problem:
「這個流程中最花時間的步驟是哪個？」
「哪個環節最容易出錯？」

Implication:
「這些錯誤導致什麼結果？客戶投訴？退款延遲？」
「這個問題每月造成多少成本？」

Need-payoff:
「如果退貨流程可以自動化，你覺得能節省多少時間？」
「什麼樣的解決方案對你最有幫助？」
\`\`\`

### Workshop 引導技巧

\`\`\`
1. 設定目標與議程（Agenda Setting）
2. 破冰活動（Ice Breaker）
3. 現況分析（As-Is Process）
4. 痛點收集（Pain Point Brainstorming）
5. 需求排序（MoSCoW Prioritization）
6. 共識確認（Consensus Building）
7. 行動項目（Action Items）
\`\`\`

### 需求蒐集的 Do's & Don'ts

| ✅ Do | ❌ Don't |
|-------|---------|
| 開放式提問 | 引導式提問 |
| 記錄原始用詞 | 自行翻譯意思 |
| 確認理解（Paraphrase） | 假設你理解了 |
| 問「為什麼」追根究柢 | 只記錄表面需求 |
| 區分需求 vs 解決方案 | 混淆兩者 |

---

## 27-4：User Stories 撰寫

### User Story 標準格式

\`\`\`
As a [角色],
I want to [行動],
So that [價值/目的].
\`\`\`

### INVEST 原則

| 原則 | 說明 | 反例 |
|------|------|------|
| **I**ndependent | 故事之間互不依賴 | 「做完 A 才能做 B」 |
| **N**egotiable | 細節可協商 | 規定太細的技術方案 |
| **V**aluable | 對用戶有價值 | 「建立 Database Schema」 |
| **E**stimable | 可估算工作量 | 「改善系統效能」 |
| **S**mall | 一個 Sprint 內完成 | 「重新設計整個系統」 |
| **T**estable | 可驗證完成 | 「讓用戶更開心」 |

### User Story 範例（電商退貨）

\`\`\`
Epic: 退貨管理系統

Story 1:
As a 客戶,
I want to 在線上提交退貨申請,
So that 我不需要打電話給客服.

Story 2:
As a 客服人員,
I want to 看到退貨申請的完整歷史記錄,
So that 我可以快速處理客戶問題.

Story 3:
As a 營運主管,
I want to 看到退貨率的趨勢報表,
So that 我可以找出問題產品並採取行動.
\`\`\`

### User Story Mapping

\`\`\`
         活動（Activity）
    ┌────────┬────────┬────────┐
    │ 瀏覽商品 │ 下單結帳 │ 售後服務 │   ← Backbone
    ├────────┼────────┼────────┤
    │ 搜尋    │ 加入購物車│ 查詢訂單 │   ← MVP (Release 1)
    │ 篩選    │ 填寫地址  │ 申請退貨 │
    ├────────┼────────┼────────┤
    │ 推薦    │ 優惠券   │ 退款追蹤 │   ← Release 2
    │ 收藏    │ 分期付款  │ 換貨    │
    ├────────┼────────┼────────┤
    │ 比較    │ 訂閱    │ 評價    │   ← Release 3
    │ 社群分享  │ 禮物卡   │ 客服聊天 │
    └────────┴────────┴────────┘
\`\`\`

### 拆分 User Story 的技巧

\`\`\`
拆分維度：
1. 按工作流步驟拆分
2. 按業務規則拆分
3. 按資料類型拆分
4. 按操作（CRUD）拆分
5. 按用戶角色拆分
6. 按平台拆分（Web / Mobile / API）
\`\`\`

---

## 27-5：Acceptance Criteria 撰寫

### 什麼是 Acceptance Criteria？

User Story 的「完成定義」。當這些條件都滿足時，Story 才算完成。

### 格式一：Given-When-Then（BDD 風格）

\`\`\`
Given [前提條件],
When [用戶操作],
Then [預期結果].
\`\`\`

### 範例：線上退貨申請

\`\`\`
AC 1: 成功提交退貨
Given 客戶已登入且有一筆已完成的訂單,
When 客戶選擇該訂單並點擊「申請退貨」,
Then 系統顯示退貨表單，包含退貨原因選項.

AC 2: 退貨時限驗證
Given 訂單完成已超過 7 天,
When 客戶嘗試申請退貨,
Then 系統顯示「已超過退貨期限」的提示訊息.

AC 3: 退貨狀態通知
Given 客戶已提交退貨申請,
When 退貨狀態從「處理中」變更為「已核准」,
Then 系統發送 Email 通知客戶退貨已核准.

AC 4: 部分退貨
Given 訂單包含多個商品,
When 客戶只選擇部分商品申請退貨,
Then 系統只針對選取的商品計算退款金額.
\`\`\`

### 格式二：Checklist 風格

\`\`\`
Story: 客戶可以搜尋商品

Acceptance Criteria:
☐ 搜尋框出現在頁面頂部
☐ 輸入關鍵字後按 Enter 或點擊搜尋按鈕觸發搜尋
☐ 搜尋結果在 2 秒內顯示
☐ 沒有結果時顯示「找不到相關商品」提示
☐ 搜尋結果可按價格、評分、上架日期排序
☐ 搜尋關鍵字高亮顯示在結果中
☐ 支援中文與英文搜尋
\`\`\`

### AC 撰寫的常見錯誤

| 錯誤 | 修正 |
|------|------|
| 太模糊：「系統正常運作」 | 具體描述預期行為 |
| 太技術：「POST /api/returns 回傳 201」 | 用業務語言描述 |
| 遺漏邊界條件 | 考慮錯誤、空值、極端情況 |
| 遺漏非功能需求 | 加入效能、安全性條件 |
| 只寫 Happy Path | 加入異常處理場景 |

### Definition of Done (DoD) vs Acceptance Criteria

| 面向 | Acceptance Criteria | Definition of Done |
|------|--------------------|--------------------|
| 適用範圍 | 特定 Story | 所有 Story |
| 內容 | 業務條件 | 品質標準 |
| 範例 | 退貨 7 天內可申請 | Code Review 通過 |
| 誰定義 | PO + BA | 團隊共識 |

---

## 27-6：完整需求文件實作

### 案例：線上叫車平台需求分析

#### 1. Business Requirements

\`\`\`
專案名稱：GoRide 線上叫車平台
商業目標：
- 在 6 個月內達到每日 5,000 單
- 司機平均接單時間 < 3 分鐘
- 乘客滿意度 > 4.5 / 5.0
- 首年營收目標 NT$ 50M
\`\`\`

#### 2. Stakeholder Map

\`\`\`
高權力 / 高利益 → 密切合作：CEO、Product Owner、投資人
高權力 / 低利益 → 保持滿意：法規單位、合作車隊
低權力 / 高利益 → 保持知情：司機、乘客、客服
低權力 / 低利益 → 基本監控：媒體、競爭對手
\`\`\`

#### 3. User Stories（核心 Epic）

\`\`\`
Epic 1: 乘客叫車
- US-001: 乘客可以輸入目的地並查看預估費用
- US-002: 乘客可以選擇車型（經濟 / 舒適 / 商務）
- US-003: 乘客可以即時追蹤司機位置
- US-004: 乘客可以在行程結束後評分

Epic 2: 司機接單
- US-010: 司機可以上線/下線切換接單狀態
- US-011: 司機收到叫車通知後 30 秒內決定接受或拒絕
- US-012: 司機可以查看當日收入統計

Epic 3: 計費與支付
- US-020: 系統根據距離 + 時間自動計算費用
- US-021: 支援信用卡、行動支付
- US-022: 行程結束自動扣款並發送收據
\`\`\`

#### 4. 關鍵 Acceptance Criteria

\`\`\`
US-001 Acceptance Criteria:

Given 乘客已輸入上車地點和目的地,
When 系統計算完路線,
Then 顯示預估費用範圍（±15%）和預估時間.

Given 尖峰時段（動態定價生效）,
When 乘客查看預估費用,
Then 顯示加成倍率和原始價格的比較.

Given 輸入的地址無法辨識,
When 乘客提交目的地,
Then 顯示建議地址列表供選擇.
\`\`\`

#### 5. Non-Functional Requirements

\`\`\`
NFR-001: 叫車請求回應時間 < 2 秒（p95）
NFR-002: 系統可用性 99.95%（每月停機 < 22 分鐘）
NFR-003: 支援 50,000 同時在線用戶
NFR-004: 位置更新頻率每 3 秒一次
NFR-005: 支付資料加密（AES-256）
NFR-006: 符合個資法（GDPR / 台灣個資法）
\`\`\`

#### 6. 需求追蹤矩陣（Requirements Traceability Matrix）

| 需求 ID | 需求描述 | 來源 | 優先級 | 狀態 | 測試案例 |
|---------|---------|------|--------|------|---------|
| US-001 | 乘客查看預估費用 | Stakeholder Workshop | Must | In Progress | TC-001, TC-002 |
| US-002 | 選擇車型 | User Research | Must | Backlog | TC-003 |
| US-003 | 即時追蹤司機位置 | User Research | Must | Backlog | TC-004, TC-005 |
| NFR-001 | 回應時間 < 2 秒 | SLA Agreement | Must | Backlog | TC-P01 |

---

## Cheat Sheet：需求分析速查表

### 需求分析流程

\`\`\`
1. 理解商業背景 → Business Requirements
2. 識別利害關係人 → Stakeholder Analysis
3. 蒐集需求 → Interviews, Workshops, Surveys
4. 撰寫 User Stories → As a / I want / So that
5. 定義 Acceptance Criteria → Given / When / Then
6. 區分 FR vs NFR → FURPS+ 框架
7. 建立追蹤矩陣 → Traceability Matrix
8. 確認與簽核 → Review & Sign-off
\`\`\`

### 面試高頻問題速答

| 問題 | 關鍵回答要素 |
|------|------------|
| 如何蒐集需求？ | SPIN 訪談、Workshop、文件分析 |
| FR vs NFR 差異？ | FR = 系統做什麼；NFR = 系統品質屬性 |
| User Story 格式？ | As a / I want / So that + INVEST |
| 需求衝突怎麼辦？ | MoSCoW 排序 + Stakeholder 協商 |
| 如何確保需求完整？ | Traceability Matrix + Review Session |

### MoSCoW 優先級

\`\`\`
Must have    — 沒有就不能上線（60% 工作量）
Should have  — 重要但非必須（20%）
Could have   — 有最好（15%）
Won't have   — 這次不做（5%，記錄在 Backlog）
\`\`\`
`;

export default world27;
