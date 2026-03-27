const world61 = `
# World 61：風險管理與永續

> **目標：** 供應鏈風險類型、韌性策略、ESG 合規與永續採購
> **適用場景：** Risk Management、ESG Compliance、供應鏈策略面試
> **預估學習時間：** 4-5 小時

---

## 61-1：供應鏈風險管理

### 風險類型

| 類型 | 例子 | 應對策略 |
|------|------|----------|
| **Natural Disasters** | 地震、颱風、洪水 | 備援地點、安全庫存 |
| **Geopolitical** | 關稅、制裁、戰爭 | 分散採購區域 |
| **Supplier Risk** | 供應商倒閉、品質問題 | Dual Sourcing、定期評估 |
| **Climate Risk** | 極端天氣、水資源短缺 | 替代運輸路線、氣候監控 |
| **Cyber Risk** | 駭客攻擊、勒索軟體 | IT 防護、資料備份 |
| **Demand Risk** | 需求暴漲或暴跌 | 彈性產能、需求感測 |
| **Regulatory Risk** | 法規變更（CSRD、CBAM） | 合規團隊、持續監控 |

> 🆕 **2026 風險等級（Everstream Analytics）：** 地緣政治碎片化 97%、極端天氣 93%。全球供應鏈中斷平均成本：每次 $184M（McKinsey）。

### 風險評估矩陣

\`\`\`
風險優先級 = Probability（機率）× Impact（影響）× Actionability（可行動性）
\`\`\`

| | 影響低 | 影響中 | 影響高 |
|--|--------|--------|--------|
| **機率高** | 監控 | 改善 | 立即行動 |
| **機率中** | 接受 | 監控 | 優先準備 |
| **機率低** | 接受 | 接受 | 備援計畫 |

> **重點：** 不只看機率×影響的分數，還要看你「能做什麼」。有具體行動方案的風險（如 Dual Sourcing）比難以預防的風險（如疫情）更值得投資。

### 韌性策略（Resilience）

**Supply Chain Resilience 框架：**

\`\`\`
Anticipate（預測）→ Prepare（準備）→ Respond（回應）
→ Recover（恢復）→ Learn（學習）
\`\`\`

**四層韌性防護：**
1. **Dual/Multi Sourcing** — 分散供應風險
2. **Control Tower** — 即時可視性和預警
3. **彈性庫存策略** — 關鍵零件增加 SS，非關鍵維持精實
4. **Scenario Planning / Digital Twin** — 模擬極端情境，預先準備

> **Resilience by Design** — 韌性不是意外發生後才想，而是設計進供應鏈架構中。

---

## 61-2：ESG 與永續供應鏈

### ESG 基礎

**ESG = Environmental（環境）+ Social（社會）+ Governance（治理）**

- **E：** 碳排放、能源使用、廢棄物、水資源
- **S：** 勞工權益、工作安全、社區影響
- **G：** 企業透明度、反貪腐、數據隱私

### Scope 1 / 2 / 3 排放

| Scope | 定義 | 佔比 | 可控度 |
|-------|------|------|--------|
| **Scope 1** | 公司直接排放（自有工廠、車輛） | ~10% | 高 |
| **Scope 2** | 間接排放（購買的電力） | ~10-20% | 中 |
| **Scope 3** | 價值鏈排放（供應商、運輸、使用、廢棄） | **70-90%** | 低 |

> **Scope 3 是最大挑戰：** 數據在供應商手上，很多供應商（尤其 Tier 2、3）沒有碳排追蹤能力。

### 2025 年 ESG 法規

| 法規 | 地區 | 要求 |
|------|------|------|
| **CSRD** | 歐盟 | 強制揭露完整 ESG 數據（含 Scope 3） |
| **SEC Climate Disclosure** | 美國 | 上市公司強制氣候揭露 |
| **LkSG** | 德國 | 企業對供應鏈人權負法律責任 |
| **CBAM** | 歐盟 | 碳邊境調整機制（碳關稅） |

**四大 ESG 報告框架：**
- **GRI** — 最廣泛使用
- **SASB** — 產業專屬的財務重大 ESG 因素
- **TCFD** — 聚焦氣候風險和財務影響
- **ISSB** — 新的全球統一標準

### 永續供應鏈實務

**五步框架：**
\`\`\`
Measure（測量碳排基線）→ Integrate（嵌入採購流程）
→ Collaborate（與供應商協同減碳）→ Report（合規報告）
→ Improve（持續改善）
\`\`\`

**Scope 3 策略：**
- 大型供應商 → 要求提供實際碳排數據
- 中小供應商 → 用產業平均值估算
- 所有供應商 → 將碳排要求嵌入 RFQ 和合約

> **重要：** 與供應商「協同」比「施壓」的減碳效果高 3-5 倍。Apple 要求前 200 大供應商 2030 年前碳中和，並提供技術和資金支援。

### 2030 供應鏈願景

三大支柱互相強化：

**1. Intelligent（智慧）**
- Agentic AI 自主處理 80% 常規決策
- Digital Twin 即時模擬
- Control Tower 預測性管理

**2. Resilient（韌性）**
- 多元化供應網絡（Nearshoring + Multi-sourcing）
- 彈性產能、即時可視性
- 風險不是要避免，而是能快速恢復

**3. Sustainable（永續）**
- 碳中和是基線不是目標
- 碳排成為成本的一部分（CBAM）
- 循環經濟（Circular Economy）

> **你的定位：** Supply Chain + Data + IT 的交叉——這是 2030 年供應鏈最需要的人才組合。
`

export default world61
