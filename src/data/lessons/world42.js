const world42 = `
# World 42：Business Systems

> 企業系統是組織運作的骨幹。ERP、CRM、Workflow 系統決定了公司如何管理資源、服務客戶、自動化流程。
> 作為 BA，你需要理解這些系統的架構、選型邏輯，以及如何推動組織成功導入。

面試常見問題：「你用過什麼企業系統？」「如何評估系統選型？」「導入新系統時最大的挑戰是什麼？」
這一章讓你系統性地掌握企業系統的核心知識。

---

## 42-1：ERP 概念與模組

### 什麼是 ERP？

ERP（Enterprise Resource Planning）是整合企業核心業務流程的系統平台。

\`\`\`
ERP 核心概念：
Single Source of Truth — 統一資料來源
Cross-functional Integration — 跨部門整合
Real-time Visibility — 即時可視化
Process Standardization — 流程標準化
\`\`\`

### ERP 核心模組

| 模組 | 功能 | 關鍵指標 |
|------|------|---------|
| Finance (FI) | 總帳、應收帳款、應付帳款 | DSO、DPO、Cash Cycle |
| Controlling (CO) | 成本中心、利潤中心分析 | Cost Variance、Margin |
| Sales & Distribution (SD) | 訂單管理、定價、出貨 | Order-to-Cash Cycle |
| Materials Management (MM) | 採購、庫存、MRP | Inventory Turnover |
| Production Planning (PP) | 生產排程、BOM、產能 | OEE、Throughput |
| Human Capital (HCM) | 薪資、考勤、績效 | Headcount、Turnover Rate |

### 常見 ERP 平台比較

| 平台 | 適用規模 | 部署模式 | 特色 |
|------|---------|---------|------|
| SAP S/4HANA | 大型企業 | Cloud / On-Premise | 模組最完整、產業方案豐富 |
| Oracle Fusion | 大型企業 | Cloud | 強資料庫整合、AI 內建 |
| Microsoft Dynamics 365 | 中大型 | Cloud | 與 Office 365 深度整合 |
| NetSuite | 中小型 | Cloud-native | 快速導入、SaaS 訂閱制 |
| Odoo | 小型 / 新創 | Cloud / Self-hosted | 開源、模組化、成本低 |

### ERP 導入方法論

\`\`\`
Big Bang — 一次性全面上線
  優點：一步到位、資料一致
  風險：高風險、全公司受影響

Phased Rollout — 分階段上線
  優點：風險分散、逐步學習
  缺點：過渡期需維護兩套系統

Parallel Run — 新舊系統並行
  優點：有 fallback、可驗證
  缺點：雙倍工作量、成本高
\`\`\`

### 面試考點

> 「你如何決定 ERP 的導入策略？」

回答框架：
1. 評估企業規模和風險承受度
2. 考慮資料遷移複雜度
3. 分析使用者準備度（Change Readiness）
4. 建議策略 + 理由

---

## 42-2：CRM 系統設計

### CRM 的三大類型

\`\`\`
Operational CRM — 自動化銷售、行銷、客服流程
  → Salesforce Sales Cloud、HubSpot

Analytical CRM — 分析客戶資料、行為洞察
  → Salesforce Einstein、Power BI 整合

Collaborative CRM — 跨部門共享客戶資訊
  → Slack + CRM 整合、共享客戶 360 視圖
\`\`\`

### CRM 核心功能模組

| 模組 | 功能 | BA 關注點 |
|------|------|----------|
| Lead Management | 潛在客戶追蹤、評分 | Lead Scoring Model 設計 |
| Opportunity Management | 銷售管線、成交預測 | Pipeline Stages 定義 |
| Contact Management | 客戶 360 度視圖 | 資料整合、去重邏輯 |
| Campaign Management | 行銷活動管理 | ROI 追蹤、A/B 測試 |
| Service Management | 客服工單、SLA | Escalation Rules 設計 |
| Analytics & Reporting | 儀表板、預測分析 | KPI 定義、Dashboard 設計 |

### CRM Pipeline 設計

\`\`\`
B2B 銷售 Pipeline 範例：

Stage 1: Lead（潛在客戶）
  → 進入條件：填寫表單 / 參加活動
  → 轉換率基準：30%

Stage 2: Qualified（合格商機）
  → 進入條件：BANT 確認（Budget/Authority/Need/Timeline）
  → 轉換率基準：50%

Stage 3: Proposal（提案中）
  → 進入條件：已提交報價 / 方案
  → 轉換率基準：60%

Stage 4: Negotiation（談判中）
  → 進入條件：客戶有回覆 / 議價
  → 轉換率基準：70%

Stage 5: Closed Won / Closed Lost
  → Win Rate 目標：20-30%
\`\`\`

### Salesforce 物件模型（BA 必知）

\`\`\`
Account（公司）
  └── Contact（聯絡人）
  └── Opportunity（商機）
        └── Quote（報價）
        └── Product（產品）
  └── Case（客服工單）
  └── Activity（活動紀錄）
\`\`\`

### 面試題練習

> 「你如何設計一個 B2B SaaS 公司的 CRM 系統？」

思考框架：
1. 銷售流程分析（Pipeline Stages）
2. 客戶分級（Customer Segmentation）
3. 資料整合需求（Marketing + Sales + CS）
4. 自動化規則（Lead Assignment、Alert）
5. 成功指標（Win Rate、CAC、LTV）

---

## 42-3：Workflow & Approval Systems

### Workflow 系統的核心概念

\`\`\`
Workflow Engine 四要素：

1. Trigger（觸發條件）
   → 事件驅動：表單提交、狀態變更
   → 時間驅動：每日排程、到期提醒

2. Condition（判斷邏輯）
   → IF-THEN 規則、Business Rules
   → 金額門檻、角色權限

3. Action（執行動作）
   → 通知、指派、更新欄位
   → 呼叫 API、觸發子流程

4. Routing（流程路由）
   → Sequential（依序）
   → Parallel（同時）
   → Conditional（條件分支）
\`\`\`

### 常見 Approval Flow 設計

| 類型 | 說明 | 適用場景 |
|------|------|---------|
| Linear | A → B → C 依序簽核 | 簡單報銷、請假 |
| Parallel | A + B 同時簽核 | 跨部門預算審批 |
| Conditional | 依金額/類別走不同路線 | 採購：< $5K 主管簽 / > $5K VP 簽 |
| Hierarchical | 依組織層級逐層上報 | 大型企業的多層審批 |
| Round-Robin | 輪流指派 | 客服工單分配 |

### 採購審批流程設計範例

\`\`\`
Purchase Request Approval Flow:

[申請人提交]
    ↓
[系統檢查金額]
    ├── < $1,000 → [直屬主管審批] → [自動核准 PO]
    ├── $1,000 - $10,000 → [直屬主管] → [部門主管] → [採購部]
    └── > $10,000 → [直屬主管] → [部門主管] → [CFO] → [採購部]

每層審批：
- 48 小時未處理 → 自動 escalation
- 退回 → 回到申請人修改
- 核准 → 進入下一層 / 產生 PO
\`\`\`

### Workflow 平台比較

| 平台 | 類型 | 適用場景 |
|------|------|---------|
| ServiceNow | Enterprise ITSM | IT 服務管理、大型企業流程 |
| Jira + Automation | 開發團隊 | Agile workflow、DevOps |
| Power Automate | 微軟生態系 | Office 365 自動化 |
| Zapier / Make | No-code | 跨 SaaS 整合、小團隊 |
| Camunda / Temporal | Developer Platform | 複雜業務流程、微服務編排 |

### 面試考點

> 「設計一個請假審批流程，考慮各種邊界情況。」

要考慮的邊界條件：
- 主管不在（代理人機制）
- 跨年假期（額度計算）
- 緊急請假（事後補簽）
- 連續假期 > 5 天（需更高主管審批）

---

## 42-4：Internal Tools Design

### 內部工具的設計原則

\`\`\`
Internal Tools 設計思維：

1. Efficiency First（效率優先）
   → 減少 click 數、自動填充
   → Keyboard shortcuts、Batch operations

2. Context-Rich（資訊豐富）
   → 把相關資訊放在同一畫面
   → 減少頁面跳轉

3. Error-Proof（防呆設計）
   → 輸入驗證、確認對話框
   → Undo / Rollback 機制

4. Role-Based（角色區分）
   → 不同角色看到不同功能
   → 權限控制 + Audit Trail
\`\`\`

### Admin Panel 功能規劃

| 功能區塊 | 核心功能 | BA 關注點 |
|----------|---------|----------|
| User Management | CRUD、角色指派、權限 | RBAC vs ABAC 模型 |
| Content Management | 商品/文章 CRUD、排程發布 | Workflow（草稿→審核→發布） |
| Order Management | 搜尋、篩選、狀態更新、退款 | 狀態機設計、操作日誌 |
| Analytics Dashboard | 即時指標、趨勢圖、Alert | KPI 定義、刷新頻率 |
| Configuration | Feature Flags、系統參數 | 變更管理、影響範圍 |
| Audit & Compliance | 操作日誌、資料匯出 | 保留期限、隱私合規 |

### 內部工具 Build vs Buy 決策框架

\`\`\`
Build vs Buy 評估矩陣：

                    低差異化          高差異化
                ┌──────────────┬──────────────┐
  高複雜度     │   Buy + 客製   │   Build      │
                │  （ERP、CRM）  │ （核心競爭力）  │
                ├──────────────┼──────────────┤
  低複雜度     │   Buy (SaaS)  │ Low-code/    │
                │  （HR、會計）   │  No-code     │
                └──────────────┴──────────────┘

決策問題：
1. 是否為核心競爭力？→ Yes = Build
2. 市場有成熟方案嗎？→ Yes = Buy
3. 客製化需求 > 30%？→ Yes = Build
4. 團隊有能力維護嗎？→ No = Buy
\`\`\`

### 內部工具技術趨勢

| 趨勢 | 說明 | 代表工具 |
|------|------|---------|
| Low-code / No-code | 非工程師也能建 App | Retool、Appsmith、Budibase |
| API-first | 前後端分離、可整合 | Headless CMS、Microservices |
| AI-assisted | 自然語言查詢、自動分類 | Copilot、ChatGPT 整合 |
| Composable | 模組化組合、可替換 | 微前端、Plugin 架構 |

### 面試題練習

> 「客服團隊需要一個內部工具來處理退款，你會怎麼設計？」

回答框架：
1. 使用者角色和流程（客服→主管→財務）
2. 核心功能（搜尋訂單、申請退款、審批、執行）
3. 資料整合（訂單系統、支付系統、CRM）
4. 防呆機制（金額上限、重複退款檢查）
5. 報表（退款趨勢、處理時效）

---

## 42-5：System Adoption & Change Management

### 為什麼系統導入常失敗？

\`\`\`
系統導入失敗原因統計：

#1 用戶抗拒改變（Resistance to Change）    — 39%
#2 管理層支持不足（Lack of Executive Support）— 33%
#3 需求不明確（Unclear Requirements）        — 31%
#4 培訓不足（Insufficient Training）         — 29%
#5 資料遷移問題（Data Migration Issues）     — 25%
#6 低估複雜度（Underestimated Complexity）   — 23%
\`\`\`

### ADKAR 變革管理模型

\`\`\`
A — Awareness（認知）
  → 為什麼要改？目前的問題是什麼？
  → 方法：Town Hall、Email 公告、FAQ

D — Desire（意願）
  → 我為什麼要支持這個改變？WIIFM?
  → 方法：Champion Network、激勵機制

K — Knowledge（知識）
  → 我怎麼用新系統？
  → 方法：培訓課程、操作手冊、影片教學

A — Ability（能力）
  → 我能在實際工作中用嗎？
  → 方法：Sandbox 練習、Buddy System、Office Hours

R — Reinforcement（強化）
  → 如何確保不會退回舊方式？
  → 方法：KPI 追蹤、Success Stories、舊系統下線
\`\`\`

### 系統導入 Rollout 策略

| 策略 | 做法 | 適用場景 |
|------|------|---------|
| Pilot | 先在一個部門/據點試用 | 高風險、大規模導入 |
| Phased | 按模組/區域分批上線 | 多模組 ERP、全球部署 |
| Big Bang | 全面同時切換 | 小團隊、緊急需求 |
| Feature Flag | 逐步開放功能 | SaaS、線上產品 |

### 培訓計畫設計

\`\`\`
Training Plan Framework:

1. 分級培訓（Tiered Training）
   ├── Level 1: 基礎操作（全員）— 2 小時
   ├── Level 2: 進階功能（Power Users）— 4 小時
   └── Level 3: 管理者報表（Managers）— 2 小時

2. 多元管道
   ├── 現場培訓（Instructor-led）
   ├── 線上影片（Self-paced）
   ├── Quick Reference Card（隨身卡片）
   └── Sandbox 環境（自由練習）

3. 支援機制
   ├── Super Users / Champions（各部門 1-2 人）
   ├── Help Desk（前 3 個月加強）
   └── Office Hours（每週固定答疑時間）
\`\`\`

### Adoption 衡量指標

| 指標 | 定義 | 目標值 |
|------|------|--------|
| Login Rate | 有帳號的人中，實際登入比例 | > 90% (Month 3) |
| Feature Usage | 核心功能的使用率 | > 70% |
| Process Compliance | 按新流程操作的比例 | > 85% |
| Support Tickets | 系統相關求助單 | 逐月下降 |
| User Satisfaction | 滿意度調查 | > 4.0/5.0 |

### 面試考點

> 「導入新系統時，你如何處理用戶抗拒？」

回答框架（ADKAR）：
1. **Awareness** — 讓用戶理解改變的原因
2. **Desire** — 找到 WIIFM，建立 Champion
3. **Knowledge** — 提供充足培訓
4. **Ability** — 給予練習和支援
5. **Reinforcement** — 追蹤、獎勵、強化

---

## 42-6：System Selection Case（Boss）

### 系統選型完整流程

\`\`\`
System Selection Lifecycle:

Phase 1: Define Requirements
  → Business Requirements Document
  → Functional / Non-Functional Requirements
  → Must-have vs Nice-to-have

Phase 2: Market Research
  → Gartner Magic Quadrant / G2 Reviews
  → Vendor Shortlist (3-5 candidates)
  → Initial Screening

Phase 3: RFP / RFI
  → Request for Information（初步了解）
  → Request for Proposal（正式邀標）
  → 評分標準（Scoring Criteria）

Phase 4: Vendor Evaluation
  → Product Demo（實際操作展示）
  → Proof of Concept（小範圍試用）
  → Reference Check（訪問現有客戶）

Phase 5: Decision & Negotiation
  → Total Cost of Ownership (TCO) 分析
  → Contract Negotiation
  → Implementation Plan
\`\`\`

### 系統選型評分矩陣

\`\`\`
Vendor Scoring Matrix:

評估維度         權重    Vendor A  Vendor B  Vendor C
────────────────────────────────────────────────────
功能完整度        30%      8         7         9
易用性           15%      9         6         7
整合能力         15%      7         9         8
擴展性           10%      6         8         9
供應商穩定性      10%      9         7         8
TCO (3年)        15%      7         8         6
實施時程          5%       8         7         7
────────────────────────────────────────────────────
加權總分         100%     7.8       7.4       7.8
\`\`\`

### TCO（Total Cost of Ownership）分析

| 成本項目 | 一次性成本 | 年度成本 | 3 年 TCO |
|----------|----------|---------|---------|
| 授權費 | $50K | $20K/yr | $110K |
| 實施顧問 | $80K | — | $80K |
| 客製開發 | $30K | $10K/yr | $60K |
| 資料遷移 | $20K | — | $20K |
| 培訓 | $15K | $5K/yr | $30K |
| 維運人力 | — | $40K/yr | $120K |
| **合計** | **$195K** | **$75K/yr** | **$420K** |

### RFP 核心章節

\`\`\`
RFP 結構：

1. Company Overview（公司簡介）
2. Project Background（專案背景）
3. Scope of Work（工作範圍）
4. Functional Requirements（功能需求表）
5. Non-Functional Requirements（技術需求）
6. Integration Requirements（整合需求）
7. Data Migration Requirements（資料遷移）
8. Timeline（時程要求）
9. Pricing Structure（報價格式）
10. Evaluation Criteria（評分標準）
11. Terms & Conditions（合約條款）
\`\`\`

### 面試終極挑戰

> 「你的公司要從 Excel 管理切換到一套正式系統，從頭到尾你會怎麼做？」

端到端回答框架：
1. 現況分析（Pain Points、量化問題）
2. 需求定義（Stakeholder 訪談、FR/NFR）
3. Build vs Buy 決策
4. Vendor 評估（Scoring Matrix）
5. TCO 分析
6. 導入策略（Pilot → Rollout）
7. Change Management（ADKAR）
8. Success Metrics

---

## Cheat Sheet：Business Systems 速查表

### 系統類型速查

| 系統 | 核心目的 | 主要使用者 | 代表產品 |
|------|---------|----------|---------|
| ERP | 整合內部營運 | 財務、供應鏈、HR | SAP、Oracle、Dynamics |
| CRM | 管理客戶關係 | 銷售、行銷、客服 | Salesforce、HubSpot |
| WMS | 倉儲管理 | 倉管、物流 | Manhattan、Blue Yonder |
| ITSM | IT 服務管理 | IT 團隊 | ServiceNow、Jira SM |
| HRM | 人力資源管理 | HR、員工 | Workday、BambooHR |

### 面試高頻問題速答

| 問題 | 關鍵回答要素 |
|------|------------|
| ERP 是什麼？ | 整合企業核心流程的單一平台、Single Source of Truth |
| CRM 設計重點？ | Pipeline Design、Customer 360、Automation Rules |
| Workflow 設計？ | Trigger-Condition-Action-Routing 四要素 |
| Build vs Buy？ | 核心競爭力 → Build / 通用需求 → Buy / 客製 < 30% → Buy |
| 用戶抗拒怎麼辦？ | ADKAR：Awareness → Desire → Knowledge → Ability → Reinforcement |
| 系統選型？ | 需求定義 → RFP → Vendor Evaluation → TCO → Decision |

### 關鍵框架速記

\`\`\`
ERP 導入：Big Bang / Phased / Parallel
CRM Pipeline：Lead → Qualified → Proposal → Negotiation → Closed
Workflow：Trigger → Condition → Action → Routing
Build vs Buy：差異化 × 複雜度矩陣
Change Management：ADKAR（Awareness-Desire-Knowledge-Ability-Reinforcement）
System Selection：Requirements → RFP → Evaluation → TCO → Decision
\`\`\`
`;

export default world42;
