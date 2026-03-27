const world59 = `
# World 59：供應鏈數據分析

> **目標：** 用數據驅動供應鏈決策：KPI Dashboard、分析方法、AI 應用
> **適用場景：** Supply Chain Analyst、BI Dashboard 設計、數據面試
> **預估學習時間：** 4-5 小時

---

## 59-1：供應鏈 KPI 與 Dashboard

### SCOR 模型

**SCOR (Supply Chain Operations Reference)** 是全球最廣泛使用的供應鏈績效框架，分五大流程：

| 流程 | 代表 KPI | 說明 |
|------|----------|------|
| **Plan** | Forecast Accuracy | 預測準確度 |
| **Source** | Supplier OTD | 供應商準時交付 |
| **Make** | Yield Rate | 生產良率 |
| **Deliver** | OTIF | 準時完整交付 |
| **Return** | Return Rate | 退貨率 |

**頂層指標：**
- Perfect Order Rate（完美訂單率）
- Cash-to-Cash Cycle Time（現金循環天數）
- Supply Chain Cost as % of Revenue

### Dashboard 設計原則

**分層設計（Information Architecture）：**

| 層級 | 對象 | KPI 數量 | 內容 |
|------|------|---------|------|
| **Executive** | 高管 | 5-7 個 | 紅黃綠燈 + 趨勢 |
| **Operational** | 經理 | 10-15 個 | Drill-down 細節 |
| **Tactical** | 分析師 | 按需 | 完整數據探索 |

**設計要訣：**
1. **趨勢 > 數字** — 「在變好還是變差」比「現在是多少」更重要
2. **紅黃綠分級** — 紅=需立即行動、黃=需注意、綠=正常
3. **Context** — 加入 Target 和 Benchmark 做比較
4. **5-7 Rule** — 每層不超過 7 個 KPI

> **工具：** Power BI、Tableau 是最主流的 Dashboard 工具。

### 數據驅動決策

數據驅動不是「只看數據」，而是「以數據為基礎做判斷」：

\`\`\`
1. 收集量化數據（歷史、趨勢、外部信號）
2. 加入質化因素（經驗、市場情報、特殊事件）
3. 做出決策並記錄理由
4. 事後回顧準確度（Forecast Value Added）
\`\`\`

> **Consensus Forecasting：** 用數據當基線，用人的判斷做調整。但調整要有根據，不是拍腦袋。

---

## 59-2：AI 驅動的供應鏈

### AI Control Tower

Supply Chain Control Tower 是 2025-2026 年最熱門的供應鏈技術。

**三大能力：**
1. **Visibility** — 整合 ERP + WMS + TMS + 外部數據的端到端可視性
2. **Predictive** — 預測中斷和影響（如偵測供應商所在地區的地震）
3. **Prescriptive** — 推薦最佳行動方案（改從哪個供應商調貨）

**演進路徑：**
\`\`\`
Reactive（出問題才處理）→ Proactive（預測問題）
→ Predictive（量化影響）→ Autonomous（自動處理）
\`\`\`

> 🆕 **2026 關鍵字：Agentic AI** — 不只推薦，還能自動執行低風險決策（如自動重新路由出貨）。BCG 數據顯示 Agentic AI 2025 年已佔 AI 總價值的 17%，預計 2028 年達 29%。

### Digital Supply Chain Twin

**Digital Twin = 整個供應鏈的虛擬複製品**

可以模擬各種 what-if 情境：
- 如果台灣晶圓廠停工 2 週，影響是什麼？
- 如果把 30% 產能從中國移到越南，成本怎麼變？
- 如果海運費漲 50%，應該調整哪些航線？

**核心價值：風險零成本模擬。** 在虛擬世界測試決策，在真實世界信心十足。

**建構基礎：**
- 統一的數據層（ERP + PLM + 市場情報）
- 語義模型
- 增量式建構（不要追求完美，先做再改）

### 分析師的價值鏈

\`\`\`
Data（收集數據）→ Insight（發現洞察）
→ Recommendation（提出建議）→ Impact Quantification（量化影響）
\`\`\`

> **你的競爭力：** Supply Chain（懂業務）+ Data（會分析）+ IT（懂系統）= 2030 年最搶手的供應鏈人才組合。
`

export default world59
