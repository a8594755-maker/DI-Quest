const world56 = `
# World 56：採購與供應商管理

> **目標：** 從 Sourcing 到供應商評估，掌握現代採購的核心流程與策略
> **適用場景：** Procurement、Supplier Management、供應鏈面試
> **預估學習時間：** 4-5 小時

---

## 56-1：採購流程與文件

### RFI / RFQ / RFP 差異

| 文件 | 全名 | 目的 | 什麼時候用 |
|------|------|------|-----------|
| **RFI** | Request for Information | 了解市場和廠商能力 | 探索階段，不確定要什麼 |
| **RFP** | Request for Proposal | 請廠商提出完整方案 | 複雜服務、需要客製方案 |
| **RFQ** | Request for Quotation | 規格明確，只需報價 | 標準品採購、比價用 |

> **流程：** RFI（探索）→ RFP（提案）→ RFQ（比價）。實務中不一定每次走完三步。

### Sourcing 策略

| 策略 | 優點 | 缺點 | 適用 |
|------|------|------|------|
| **Single Source** | 價格低、關係深 | 風險極高 | 非關鍵品項 |
| **Dual Source** | 平衡成本與風險 | 管理稍複雜 | 關鍵零組件（主流選擇） |
| **Multi Source** | 風險最低 | 管理成本高 | 大宗原料、高風險區域 |

> 🆕 **2025-2026 趨勢：** COVID 後 Dual/Multi Sourcing 成為業界標準。**China+1 策略**（保留中國供應商但培養替代來源）和 **Nearshoring**（靠近消費市場生產）是全球供應鏈重組的主流方向。

### Procure-to-Pay (P2P) 流程

\`\`\`
PR（採購需求）→ Sourcing（選商議價）→ PO（採購訂單）
→ Receipt（收貨驗收）→ 3-Way Match → Payment（付款）
\`\`\`

**Three-Way Match：** PO 內容 + 收貨單 + 發票，三者核對一致才能付款。這是採購內控的關鍵步驟。

---

## 56-2：供應商評估與績效

### Supplier Scorecard（供應商計分卡）

標準維度 **QCD+S：**

| 維度 | 權重（例） | 常用指標 |
|------|-----------|----------|
| **Quality（品質）** | 30% | 不良率、退貨率 |
| **Cost（成本）** | 25% | 單價、TCO |
| **Delivery（交期）** | 25% | On-Time Delivery % |
| **Service（服務）** | 20% | 回應速度、配合度 |

> **進階：** 加入 Risk 和 Sustainability 維度。2025 年趨勢是 AI 自動化 Scoring，整合外部信號動態更新。

### 供應商績效管理流程

\`\`\`
Monitor（監控）→ Alert（警示）→ CAR（矯正行動要求）
→ Review（複查）→ Escalate / Exit（升級或退出）
\`\`\`

**CAR (Corrective Action Request)：** 正式通知供應商問題，要求提出根因分析和改善計畫。

### 2025-2026 採購新趨勢

1. **China+1 / Nearshoring** — 分散地緣風險（墨西哥、越南最熱門）
2. **EU CBAM（碳邊境調整機制）** — 碳排放高的供應商讓你付更多關稅
3. **AI-driven Supplier Risk** — ML 整合新聞、天氣、貿易政策即時評估風險
4. **Everstream Analytics 2026 預測：** 地緣政治碎片化風險 97%，極端天氣 93%

---

## 56-3：採購策略實戰

### Make vs Buy 決策

分析框架：
1. **直接成本比較** — 自製 vs 外包的年成本
2. **品質與交期** — 自製可控 vs 外包依賴
3. **核心能力** — 是公司核心業務嗎？
4. **風險評估** — 依賴外部 vs 投資回收
5. **策略彈性** — 未來擴充或收縮的靈活度

> **經驗法則：** 成本接近時，策略因素（品質、交期、彈性）是決定關鍵。

### BATNA（最佳替代方案）

**BATNA = Best Alternative to Negotiated Agreement**

談判前必須知道：如果談判破裂，你最好的替代方案是什麼？

- **有 BATNA** → 你有底氣，可以設定底線
- **沒 BATNA** → 你沒籌碼，容易被牽著走

> **談判技巧：** (1) 永遠帶 BATNA 上桌 (2) 用數據支持立場 (3) 強調長期合作 (4) 提出 win-win 方案

### ESG 供應鏈合規

2025 年起 **CSRD** 要求企業對整條供應鏈的人權和環保負責（含 Tier 2+）。

**行動步驟：**
1. 建立 Supplier Code of Conduct
2. 將 ESG 條款嵌入合約
3. 定期審計和持續監控
4. 備援方案以防改善失敗
`

export default world56
