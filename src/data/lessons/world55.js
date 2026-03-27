const world55 = `
# World 55：需求預測與庫存管理

> **目標：** 學會預測需求、計算安全庫存、掌握 EOQ 等庫存決策模型
> **適用場景：** Demand Planning、Inventory Management、供應鏈分析面試
> **預估學習時間：** 4-5 小時

---

## 55-1：需求預測基礎

### 預測方法分類

| 類別 | 方法 | 適用場景 | 代表方法 |
|------|------|----------|----------|
| **Quantitative（量化）** | 基於歷史數據 | 成熟產品、穩定需求 | Moving Average、Exponential Smoothing、ARIMA |
| **Qualitative（質化）** | 基於人的判斷 | 新產品、缺乏歷史數據 | Expert Opinion、Delphi Method、Market Research |
| **Causal（因果）** | 基於因果關係 | 需求受外部因素影響 | Regression Analysis |

> **選擇原則：** 有歷史數據 → Quantitative；沒數據 → Qualitative；兩者結合 = Consensus Forecasting（最佳實踐）

### Simple Moving Average（SMA）

SMA(N) = 最近 N 期數據的平均值

- **N 大** → 更穩定但更滯後（適合穩定需求）
- **N 小** → 更敏感但更波動（適合變動需求）

> **進階版本：** Weighted Moving Average（近期權重高）→ Exponential Smoothing（自動調整權重，用 α 參數控制）

### 預測準確度指標

| 指標 | 公式 | 用途 |
|------|------|------|
| **MAE** | Σ\\|預測-實際\\| / n | 絕對誤差平均，直觀 |
| **MAPE** | Σ(\\|預測-實際\\|/實際) / n × 100% | 百分比誤差，可跨品比較 |
| **Bias** | Σ(預測-實際) / n | 看偏差方向（正=高估，負=低估） |

> 🆕 **2025 趨勢：** Forecast Value Added (FVA) — 衡量每一步預測調整是否真的改善了準確度。AI Demand Sensing 結合 POS、社群、天氣等外部訊號做短期預測。

---

## 55-2：庫存控制模型

### Safety Stock（安全庫存）

**為什麼需要 Safety Stock？** 因為需求和交期都有波動。只備「平均需求 × 平均交期」的庫存，一旦需求突增或交期延遲就缺貨。

**公式概念：**
\`\`\`
Safety Stock = Z × σd × √LT

Z = 服務水準對應的 Z 值（90%→1.28, 95%→1.65, 99%→2.33）
σd = 需求的標準差
LT = Lead Time
\`\`\`

**Reorder Point（再訂購點）：**
\`\`\`
ROP = (Average Daily Demand × Lead Time) + Safety Stock
\`\`\`

### EOQ（經濟訂購量）

**核心問題：** 每次該訂多少？訂太多 → 庫存成本高；訂太少 → 訂購成本高。

**公式：**
\`\`\`
EOQ = √(2DS/H)

D = 年需求量
S = 每次訂購成本（下單、驗貨、入庫的固定成本）
H = 每件每年庫存持有成本
\`\`\`

> 在 EOQ 點，Ordering Cost = Holding Cost，總成本最低。

### ABC-XYZ 分析

**ABC（按價值分類）：**
- A 類：前 20% SKU，佔營收 80%（嚴格管控）
- B 類：中間 30%，佔營收 15%（中等管控）
- C 類：後 50%，佔營收 5%（簡化管理）

**XYZ（按波動性分類）：**
- X：需求穩定（CV < 0.5）
- Y：中等波動（0.5 < CV < 1.0）
- Z：高度波動（CV > 1.0）

> **組合策略：** AX = 高價值穩定 → 精確預測、JIT。CZ = 低價值高波動 → 較高安全庫存或轉為接單生產。

---

## 55-3：庫存策略與平衡

### Inventory Turnover（庫存周轉率）

\`\`\`
Inventory Turnover = COGS / Average Inventory
Days of Inventory (DOI) = 365 / Turnover
\`\`\`

- 高周轉 = 資金效率高、倉儲成本低
- 低周轉 = 可能有滯銷品或過度備貨
- **注意：** 跨產業比較無意義（超市 Turnover 10+ vs 家具店 2-3）

### Newsvendor Model（報童模型）

處理「一次性決策」的庫存問題（如季節性商品）：

\`\`\`
Critical Ratio = Cu / (Cu + Co)

Cu = 缺貨成本（Underage Cost）= 利潤損失 + 客戶流失
Co = 滯銷成本（Overage Cost）= 降價虧損 + 處分成本
\`\`\`

**決策規則：** 備貨量讓需求累積機率 ≥ Critical Ratio。

> **缺貨成本 > 滯銷成本 → 偏向多備；反之偏向少備。**

### 庫存改善優先級

1. **先修根因** — 更新安全庫存參數（很多公司幾年沒更新）
2. **救 A 類** — 高價值品項缺貨對營收衝擊最大
3. **清死庫存** — 釋放倉庫空間和資金
4. **優化策略** — 差異化管理（ABC-XYZ）
`

export default world55
