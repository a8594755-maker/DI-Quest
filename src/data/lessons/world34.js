const world34 = `
# World 34：專案管理基礎 (Project Management Basics)

> 不管是 Business Engineer 還是 Product Analyst，你都會參與專案。
> 理解專案管理的基本框架，能讓你在面試中展現「能落地執行」的能力。

好的分析和規劃如果無法管理執行，就只是紙上談兵。
這一章教你從範圍定義到 Sprint Planning 的完整專案管理基礎。

---

## 34-1：範圍定義 (Scope Definition)

### 專案三角 (Iron Triangle)

\`\`\`
        範圍 (Scope)
         /      \\
        /   品質  \\
       /  (Quality) \\
      /              \\
  時間 ————————————— 成本
 (Time)            (Cost)
\`\`\`

**核心觀念**：三者不可能同時最佳化，改變一個必然影響其他兩個。

### Scope 定義工具：WBS（Work Breakdown Structure）

\`\`\`
電商平台改版
├── 1. 前端改版
│   ├── 1.1 首頁 Redesign
│   ├── 1.2 商品頁改版
│   └── 1.3 購物車 UX 優化
├── 2. 後端開發
│   ├── 2.1 搜尋引擎升級
│   ├── 2.2 付款模組整合
│   └── 2.3 API 效能優化
├── 3. 測試
│   ├── 3.1 SIT
│   └── 3.2 UAT
└── 4. 上線
    ├── 4.1 資料遷移
    └── 4.2 正式部署
\`\`\`

### In Scope vs Out of Scope

| In Scope（範圍內） | Out of Scope（範圍外） |
|-------------------|---------------------|
| 前端 UI 改版 | App 開發 |
| 現有付款方式整合 | 新增虛擬貨幣付款 |
| 繁中介面 | 多語系支援 |
| 現有會員遷移 | 社群登入整合 |

### Scope Creep（範圍蔓延）

\`\`\`
常見情境：
客戶：「既然都改了，能不能順便加一個 XXX 功能？」
主管：「這個很簡單吧，加一下就好。」

應對方式：
1. 評估影響（時間、成本、風險）
2. 走正式的變更流程（Change Request）
3. 用數據說話：「增加這個功能需要多 2 週和 $50K」
4. 提供替代方案：「可以先做簡化版，後續版本再完善」
\`\`\`

### SMART 目標

| 要素 | 說明 | 好的範例 | 壞的範例 |
|------|------|---------|---------|
| Specific | 具體 | 將結帳流程從 5 步減為 3 步 | 改善用戶體驗 |
| Measurable | 可衡量 | 購物車轉換率提升 15% | 提升轉換率 |
| Achievable | 可達成 | 基於歷史數據推算可行 | 月營收翻 10 倍 |
| Relevant | 相關 | 與公司 Q2 目標一致 | 跟業務方向無關 |
| Time-bound | 有期限 | 2026/Q2 前完成 | 有空再做 |

---

## 34-2：時程與里程碑 (Timeline & Milestones)

### 甘特圖 (Gantt Chart) 基本概念

\`\`\`
任務             | W1 | W2 | W3 | W4 | W5 | W6 | W7 | W8 |
─────────────────┼────┼────┼────┼────┼────┼────┼────┼────┤
需求確認          |████|    |    |    |    |    |    |    |
UI 設計           |    |████|████|    |    |    |    |    |
前端開發          |    |    |████|████|████|    |    |    |
後端開發          |    |    |████|████|████|    |    |    |
SIT 測試          |    |    |    |    |    |████|    |    |
UAT 測試          |    |    |    |    |    |    |████|    |
上線部署          |    |    |    |    |    |    |    |████|
                  M1                  M2        M3   M4
M1: 需求凍結  M2: 開發完成  M3: UAT 通過  M4: 正式上線
\`\`\`

### 里程碑 (Milestone) 設定原則

- 里程碑是**可驗證的完成點**，不是進行中的活動
- 每 2-4 週應有一個里程碑（太長會失去控制感）
- 里程碑要有明確的 Deliverable（交付物）

### 關鍵路徑法 (Critical Path Method)

\`\`\`
A(3天) → C(5天) → E(2天)
                           ↘
                             G(3天) → 完成
                           ↗
B(2天) → D(4天) → F(3天)

關鍵路徑：A → C → E → G = 13 天
非關鍵路徑：B → D → F → G = 12 天

→ 專案最短完成時間 = 13 天
→ 路徑 B-D-F 有 1 天的 Buffer（浮動時間）
\`\`\`

### 估時方法

| 方法 | 做法 | 適用場景 |
|------|------|---------|
| Expert Judgment | 請有經驗的人估 | 類似專案做過 |
| Analogous | 參考類似專案 | 有歷史資料 |
| Three-point | (樂觀 + 4×最可能 + 悲觀) / 6 | 不確定性高 |
| Planning Poker | 團隊成員各自估，討論差異 | Agile 團隊 |
| T-shirt Sizing | S / M / L / XL 快速分類 | 早期粗略估計 |

### 估時範例：Three-point Estimation

\`\`\`
任務：付款模組整合
  樂觀 (O)：5 天
  最可能 (M)：8 天
  悲觀 (P)：15 天

  預期時間 = (5 + 4×8 + 15) / 6 = 8.7 天
  標準差 = (15 - 5) / 6 = 1.67 天

  → 預估 8-10 天完成（含 buffer）
\`\`\`

### Buffer 管理

\`\`\`
總時程 = 實際估計 + Buffer
Buffer 建議：
  - 低風險任務：+10-15%
  - 中風險任務：+20-30%
  - 高風險 / 從未做過：+50%

注意：不要在每個任務都加 Buffer（會膨脹）
建議：在專案層級加一個統一的 Buffer
\`\`\`

---

## 34-3：風險管理 (Risk Management)

### 風險矩陣

\`\`\`
影響程度 ↑
  高 │ 中風險  │ 高風險   │ 極高風險 │
     │ 監控    │ 準備方案 │ 立即處理 │
  中 │ 低風險  │ 中風險   │ 高風險   │
     │ 接受    │ 監控     │ 準備方案 │
  低 │ 極低風險│ 低風險   │ 中風險   │
     │ 忽略    │ 接受     │ 監控     │
     └────────┴─────────┴─────────┘
      低        中        高     → 發生機率
\`\`\`

### 風險登記表 (Risk Register)

| 風險 ID | 風險描述 | 機率 | 影響 | 等級 | 應對策略 | 負責人 |
|--------|---------|------|------|------|---------|--------|
| R-001 | 關鍵工程師離職 | 中 | 高 | 高 | 文件化 + 備援人力 | PM |
| R-002 | 第三方 API 不穩定 | 高 | 中 | 高 | 準備降級方案 | Tech Lead |
| R-003 | 需求變更頻繁 | 高 | 高 | 極高 | 凍結需求 + CR 流程 | PM |
| R-004 | 測試環境延遲 | 中 | 中 | 中 | 提早申請環境 | DevOps |
| R-005 | 使用者抗拒新系統 | 中 | 高 | 高 | 教育訓練 + 漸進上線 | BA |

### 四種風險應對策略

| 策略 | 說明 | 範例 |
|------|------|------|
| Avoid（迴避） | 改變計畫消除風險 | 不用不穩定的技術 |
| Mitigate（降低） | 降低機率或影響 | 增加 Code Review 降低 Bug |
| Transfer（轉移） | 把風險轉給別人 | 外包、買保險 |
| Accept（接受） | 承認風險，準備應變 | 低影響的風險直接接受 |

### RAID Log

\`\`\`
R - Risks（風險）：可能發生的壞事
A - Assumptions（假設）：我們假設為真的事
I - Issues（問題）：已經發生的壞事
D - Dependencies（依賴）：仰賴外部的事

範例：
Risk: 第三方付款 API 可能在雙 11 當機
Assumption: 業務方會在 3/15 前完成需求確認
Issue: 測試環境昨天掛了，今天 UAT 暫停
Dependency: 資料庫遷移需要 DBA 團隊支援
\`\`\`

---

## 34-4：優先順序與取捨 (Priority & Trade-offs)

### MoSCoW Method

| 等級 | 說明 | 比例建議 |
|------|------|---------|
| **Must Have** | 沒有就不能上線 | 60% |
| **Should Have** | 重要但非必須 | 20% |
| **Could Have** | 有更好，沒有也行 | 15% |
| **Won't Have** | 這次不做 | 5% |

### 範例：電商改版 MoSCoW

\`\`\`
Must Have：
  ✅ 商品瀏覽與搜尋
  ✅ 購物車與結帳
  ✅ 會員登入
  ✅ 訂單管理

Should Have：
  📌 商品推薦
  📌 願望清單
  📌 訂單追蹤

Could Have：
  💡 社群分享
  💡 商品比較
  💡 個人化首頁

Won't Have（this time）：
  ❌ 直播購物
  ❌ AR 試穿
  ❌ 跨境物流
\`\`\`

### Eisenhower Matrix（緊急重要矩陣）

\`\`\`
             緊急              不緊急
        ┌─────────────┬─────────────┐
  重要  │ DO           │ SCHEDULE     │
        │ 立即處理     │ 排入計畫     │
        │ 系統當機     │ 架構優化     │
        ├─────────────┼─────────────┤
不重要  │ DELEGATE     │ ELIMINATE    │
        │ 委託別人做   │ 不要做       │
        │ 日常報表     │ 過多的會議   │
        └─────────────┴─────────────┘
\`\`\`

### Trade-off 對話範例

\`\`\`
情境：客戶要求增加功能但不延後上線日期

錯誤回答：「好的，我們會想辦法。」（加班到死）

正確回答：
「我理解這個功能的重要性。讓我說明目前的狀況：
  - 增加此功能需要額外 3 週開發 + 1 週測試
  - 如果維持原訂上線日期，我們有三個選項：
    1. 移除 [其他 Should Have 功能] 來騰出時間
    2. 先上線核心功能，此功能排入第二階段（上線後 1 個月）
    3. 增加 2 位開發人員（需額外預算 $XXK）
  - 我的建議是選項 2，因為...」
\`\`\`

---

## 34-5：Agile / Scrum 基礎

### Waterfall vs Agile

| 面向 | Waterfall | Agile |
|------|-----------|-------|
| 流程 | 線性、依序執行 | 迭代、循環進行 |
| 需求 | 一開始就確定 | 持續調整 |
| 交付 | 最後一次交付 | 每個 Sprint 交付 |
| 變更 | 成本高、抗拒變更 | 擁抱變更 |
| 文件 | 完整文件 | 夠用就好 |
| 適用 | 需求明確的專案 | 需求模糊、快速變化 |

### Scrum 框架

\`\`\`
Product Backlog
      ↓
Sprint Planning → Sprint Backlog
      ↓
Sprint（2-4 週）
  ├── Daily Standup（每天 15 分鐘）
  ├── 開發 & 測試
  └── Sprint Review（展示成果）
      ↓
Sprint Retrospective（回顧改善）
      ↓
下一個 Sprint...
\`\`\`

### Scrum 角色

| 角色 | 職責 | 類比 |
|------|------|------|
| Product Owner (PO) | 決定做什麼、排優先順序 | 老闆 / 業務代表 |
| Scrum Master (SM) | 確保流程順暢、移除障礙 | 教練 / 引導者 |
| Development Team | 實際執行開發 | 球員 |

### Scrum Artifacts

| Artifact | 說明 |
|----------|------|
| Product Backlog | 所有待辦事項的清單（PO 管理） |
| Sprint Backlog | 這個 Sprint 要做的事（Team 承諾） |
| Increment | Sprint 結束時的可交付成果 |

### User Story 格式

\`\`\`
As a [角色],
I want to [做什麼],
So that [為什麼 / 價值].

範例：
As a 電商會員,
I want to 用信用卡結帳,
So that 我可以快速完成購買.

Acceptance Criteria（驗收標準）：
  - 支援 Visa、Mastercard、JCB
  - 付款成功後顯示訂單確認頁
  - 付款失敗顯示錯誤訊息並可重試
  - 交易紀錄保存於訂單系統
\`\`\`

### Story Point 估算

\`\`\`
Fibonacci 數列：1, 2, 3, 5, 8, 13, 21

1 point = 非常簡單，幾小時搞定
3 points = 一般任務，1-2 天
5 points = 有些複雜，2-3 天
8 points = 複雜，需要一週
13 points = 很複雜，可能要拆分
21 points = 太大了，一定要拆分

Team Velocity（團隊速度）：
  Sprint 1：完成 30 points
  Sprint 2：完成 35 points
  Sprint 3：完成 28 points
  平均 Velocity = 31 points / Sprint
\`\`\`

---

## 34-6：Sprint Planning 實戰

### Sprint Planning 流程

\`\`\`
1. PO 說明 Sprint Goal（5 分鐘）
   ↓
2. PO 介紹優先項目（20 分鐘）
   ↓
3. Team 估算 Story Points（30 分鐘）
   ↓
4. Team 承諾 Sprint Backlog（15 分鐘）
   ↓
5. 拆分為具體 Tasks（20 分鐘）
\`\`\`

### Sprint Planning 範例

\`\`\`
Sprint #5 Planning
Sprint Goal：完成結帳流程改版
Sprint Duration：2 週（10 個工作天）
Team Velocity：~30 points

Sprint Backlog：
┌────────────────────────────┬────────┬────────┐
│ User Story                 │ Points │ 負責人  │
├────────────────────────────┼────────┼────────┤
│ 信用卡付款流程              │ 8      │ Alice  │
│ 結帳頁 UI 改版              │ 5      │ Bob    │
│ 訂單確認 Email              │ 3      │ Carol  │
│ 付款失敗處理                │ 5      │ Alice  │
│ 結帳頁 RWD                  │ 5      │ Bob    │
│ 付款安全性檢查              │ 3      │ Dave   │
├────────────────────────────┼────────┼────────┤
│ 總計                       │ 29     │        │
└────────────────────────────┴────────┴────────┘
\`\`\`

### Daily Standup 模板

\`\`\`
每人 2 分鐘，回答三個問題：
1. 昨天完成了什麼？
2. 今天計畫做什麼？
3. 有什麼 Blocker？

範例：
「昨天我完成了信用卡付款的前端表單，
 今天要串接付款 API，
 目前被第三方 API 文件不完整卡住，
 需要 PM 協助聯繫對方技術窗口。」
\`\`\`

### Sprint Retrospective 框架

\`\`\`
三個問題：
1. What went well?（做得好的）
   - Daily standup 有效率
   - 提早發現 API 整合問題

2. What didn't go well?（需改善的）
   - 需求中途變更導致重工
   - 測試環境不穩定

3. Action items（具體改善行動）
   - 需求確認後發正式 Email 記錄 → Owner: PM
   - 建立自動化環境健康檢查 → Owner: DevOps
\`\`\`

### Kanban 看板

\`\`\`
┌──────────┬──────────┬──────────┬──────────┐
│ To Do    │ In Prog  │ Review   │ Done     │
├──────────┼──────────┼──────────┼──────────┤
│ 📋 Story5│ 🔧 Story1│ 👀 Story3│ ✅ Story4│
│ 📋 Story6│ 🔧 Story2│          │ ✅ Story7│
│          │          │          │          │
└──────────┴──────────┴──────────┴──────────┘
WIP Limit:      3         2
\`\`\`

### 面試實戰題

**Q：你的專案延遲了，你會怎麼做？**

\`\`\`
回答框架：
1. 分析原因
   - 哪些任務延遲了？為什麼？
   - 是估計不準？還是遇到意外風險？

2. 評估影響
   - 延遲多少？對後續里程碑的影響？
   - 是否影響其他團隊？

3. 提出方案（Trade-off 思維）
   - 選項 A：減少 Scope（移除 Should Have 功能）
   - 選項 B：延後上線日期（如果可接受）
   - 選項 C：增加資源（但要考慮 Ramp-up Time）
   - 選項 D：並行處理（調整任務依賴關係）

4. 溝通
   - 主動、透明、提供數據
   - 帶著方案去溝通，不是帶著問題去
\`\`\`

---

## 🔑 World 34 Cheat Sheet

### 專案管理核心觀念

\`\`\`
Iron Triangle：Scope / Time / Cost（三者互相牽制）

WBS：把大任務拆成小任務的樹狀結構
MoSCoW：Must / Should / Could / Won't（需求排優先）
Critical Path：決定專案最短完成時間的路徑

風險管理四策略：Avoid / Mitigate / Transfer / Accept

Scrum 三個角色：PO / SM / Team
Scrum 三個 Artifact：Product Backlog / Sprint Backlog / Increment
Scrum 四個會議：Planning / Daily / Review / Retro

User Story：As a [誰], I want [什麼], So that [為什麼]
Story Point：用 Fibonacci 數列估算相對複雜度
Velocity：團隊每個 Sprint 能完成的 Points 數

Scope Creep 防範：
  走正式 CR 流程 → 評估影響 → 用數據溝通

專案延遲處理：
  分析原因 → 評估影響 → 提出方案 → 主動溝通
\`\`\`

### 面試萬用框架

\`\`\`
任何專案管理問題：
1. 明確目標（SMART）
2. 拆解任務（WBS）
3. 排優先順序（MoSCoW）
4. 估時程（Three-point / Planning Poker）
5. 識別風險（Risk Matrix）
6. 持續溝通（Daily / Weekly）
7. 持續改善（Retro）
\`\`\`
`;

export default world34;
