const world60 = `
# World 60：流程改善與營運管理

> **目標：** 從 Process Mapping 到 Lean/Six Sigma，學會發現問題、改善流程
> **適用場景：** Operations、Process Improvement、面試「你怎麼改善流程？」
> **預估學習時間：** 4-5 小時

---

## 60-1：流程分析工具

### Process Mapping（流程圖）

改善的第一步：**把流程畫出來。**

畫出每個步驟後，標記三種類型：
- **VA（Value-Added）** — 客戶願意付錢的活動（如：組裝產品）
- **BNVA（Business Non-Value-Added）** — 不加值但必要的（如：品質檢驗）
- **NVA（Non-Value-Added）** — 純浪費（如：等待審批 3 小時）

> **驚人事實：** 典型流程中，實際加值時間通常只佔總時間的 **5-10%**，其餘都是等待、搬運、重工。

**Value Stream Mapping (VSM)：** 進階版流程圖，清楚標示每個步驟的時間、等待時間、庫存量，讓浪費一目了然。

### Root Cause Analysis（根因分析）

#### 5 Whys（五個為什麼）

連問五次「為什麼」，從症狀追到根因：

\`\`\`
問題：出貨錯誤率上升
Why 1：揀貨員拿錯商品 ← 症狀
Why 2：兩款新商品包裝很像
Why 3：設計時沒考慮倉庫辨識需求
Why 4：包裝設計流程沒有倉庫團隊參與
Why 5：公司沒有跨部門設計審查流程 ← 根因！
\`\`\`

> **原則：** 根因通常是流程/系統問題，不是人的問題。「揀貨員不用心」不是根因。

#### Fishbone Diagram（魚骨圖）

從 6 個維度分析可能原因：**Man / Machine / Method / Material / Measurement / Environment**

#### Pareto Chart（帕雷托圖）

用 80/20 法則找出最主要的原因——通常 20% 的原因造成 80% 的問題。

### Lean 七大浪費（TIMWOOD）

| 浪費 | 英文 | 例子 | 消除方法 |
|------|------|------|----------|
| **T** 搬運 | Transport | 多餘的搬運路線 | 改善佈局 |
| **I** 庫存 | Inventory | 堆積未處理的退貨 | JIT、Kanban |
| **M** 動作 | Motion | 揀貨員重複走同路線 | Batch Picking |
| **W** 等待 | Waiting | 等審批 3 小時 | 自動審批規則 |
| **O** 過度生產 | Over-production | 生產超過訂單量 | Pull 系統 |
| **O** 過度加工 | Over-processing | 重複檢查兩次 | 合併檢查點 |
| **D** 瑕疵 | Defects | 不良品需重工 | Poka-Yoke 防錯 |

> 有人加 **S = Skills waste**（人才浪費），變成 **TIMWOODS**。

---

## 60-2：KPI 設計與持續改善

### SMART KPI 設計

好的 KPI 要符合 SMART 原則：

| 字母 | 原則 | 反例 | 正例 |
|------|------|------|------|
| **S** | Specific（具體） | 提升效率 | 訂單處理時間降到 4 小時 |
| **M** | Measurable（可衡量） | 改善品質 | 不良率降到 0.5% 以下 |
| **A** | Achievable（可達成） | 零缺陷 | 從 3% 降到 1% |
| **R** | Relevant（相關） | 追蹤天氣 | 追蹤 OTIF |
| **T** | Time-bound（有期限） | 盡快改善 | Q3 前達成 |

**KPI 六要素：** What（衡量什麼）+ How（怎麼計算）+ Target（目標值）+ When（期限）+ Who（負責人）+ Source（數據來源）

### DMAIC（Six Sigma 改善方法）

\`\`\`
D = Define（定義問題和目標）
M = Measure（收集數據建立 baseline）
A = Analyze（用數據找根因）
I = Improve（實施改善方案）
C = Control（建立監控確保持續）
\`\`\`

> **C（Control）最常被忽略** — 很多專案改善完就沒人追蹤，問題又慢慢回來。用 Control Chart 持續監控。

### Lean Six Sigma 結合

- **Lean：** 消除浪費（做對的事）
- **Six Sigma：** 減少變異（把事做對）
- **結合：** 又快又穩的流程

### 面試萬用框架

面試官問：「你的前 90 天會怎麼做？」

\`\`\`
第 1-30 天（了解和量測）：
- 分解問題的各個組成指標
- 訪談關鍵利害關係人
- 建立 baseline

第 30-60 天（分析和規劃）：
- 用 Pareto 找出 Top 3 根因
- 設計改善方案
- 量化預期 ROI

第 60-90 天（執行快贏）：
- 先做 Quick Wins（低成本高影響）
- 建立 Dashboard 追蹤進度
- 展示 early results 建立信任
\`\`\`
`

export default world60
