export default `
# World 6：供應鏈商業案例

> **目標：** 用前面學的技術理解供應鏈管理的核心問題
> **重點：** 技術是手段，理解業務才是價值所在
> **資料來源：** DI 專案的 inventory_snapshots.csv、fg_financials.csv、bom_edge.csv、price_history.csv

---

## 6-1：需求預測（Demand Forecasting）

### 為什麼需要預測？

工廠不能等客戶下單才開始做——來不及。從原料採購到成品出貨，通常需要 4～12 週。所以必須**提前預測**未來的需求，先備好原料。

預測太多 → 原料堆在倉庫裡變成成本（倉儲費、資金積壓、過期報廢）
預測太少 → 交不出貨，客戶跑掉（失去訂單、商譽受損）

在 DI 專案中，\`inventory_snapshots.csv\` 記錄了每日庫存快照，\`demand_fg.csv\` 記錄了成品需求。我們的目標是用歷史資料預測未來需求。

### 基本方法：移動平均（Moving Average）

移動平均的概念很簡單——用最近 N 期的平均值來預測下一期。N 就是「窗口大小（window）」。

\`\`\`javascript
// 過去 6 週的出貨需求量
const demand = [100, 120, 90, 110, 130, 95];

// 簡單移動平均（Simple Moving Average）
function movingAverage(data, window) {
  // slice(-window) 取出最後 window 個元素
  const recent = data.slice(-window);
  // reduce 加總後除以個數
  return recent.reduce((sum, x) => sum + x, 0) / recent.length;
}
\`\`\`

#### 逐步拆解 slice(-window)

\`slice(-window)\` 是這個函式的核心技巧。負數索引從陣列尾端開始計算：

\`\`\`javascript
const data = [100, 120, 90, 110, 130, 95];

data.slice(-3);  // → [110, 130, 95]  取最後 3 個
data.slice(-4);  // → [90, 110, 130, 95]  取最後 4 個
data.slice(-6);  // → [100, 120, 90, 110, 130, 95]  全部
\`\`\`

#### 逐步拆解 reduce 加總

\`\`\`javascript
const recent = [110, 130, 95];

// reduce 的運作過程：
// 第 1 輪：sum=0,   x=110 → 0+110   = 110
// 第 2 輪：sum=110, x=130 → 110+130 = 240
// 第 3 輪：sum=240, x=95  → 240+95  = 335
// 最後：335 / 3 = 111.67

recent.reduce((sum, x) => sum + x, 0) / recent.length; // 111.67
\`\`\`

#### 窗口大小怎麼選？

| 窗口大小 | 優點 | 缺點 | 適用情境 |
|----------|------|------|----------|
| 小（2-3） | 反應快，能跟上趨勢 | 波動大，容易受極端值影響 | 需求變化快的短週期產品 |
| 中（4-6） | 平衡穩定性與反應性 | 中等延遲 | 大多數情況的合理選擇 |
| 大（8-12） | 很穩定，過濾雜訊 | 反應慢，跟不上趨勢 | 需求穩定的成熟產品 |

#### 完整範例：用 DI 專案資料做預測

\`\`\`javascript
// DI 專案中 FG-001 過去 8 週的出貨量
const fg001Demand = [450, 520, 480, 510, 490, 530, 500, 540];

// 用 3 週窗口預測第 9 週
const forecast3 = movingAverage(fg001Demand, 3);
// slice(-3) → [500, 530, 540]
// (500 + 530 + 540) / 3 = 523.33

// 用 5 週窗口預測第 9 週
const forecast5 = movingAverage(fg001Demand, 5);
// slice(-5) → [490, 530, 500, 540, 510] — 不對，讓我重新算
// slice(-5) → [490, 530, 500, 540] — 還是不對
// 正確：slice(-5) → [510, 490, 530, 500, 540]
// (510 + 490 + 530 + 500 + 540) / 5 = 514.00
\`\`\`

### 預測的評估指標：MAE

光做預測不夠，還要衡量預測**準不準**。MAE（Mean Absolute Error，平均絕對誤差）是最直觀的指標。

| 指標 | 公式 | 說明 |
|------|------|------|
| MAE | Σ|actual - predicted| / n | 預測值和實際值的平均差距 |
| MAPE | Σ(|actual - predicted| / actual) / n × 100% | 用百分比表示，跨品項可比較 |
| Bias | Σ(actual - predicted) / n | 正值=持續低估，負值=持續高估 |

\`\`\`javascript
function mae(actual, predicted) {
  // 對每一期：算出 |實際值 - 預測值|
  const errors = actual.map((a, i) => Math.abs(a - predicted[i]));
  // 加總所有絕對誤差，再除以期數
  return errors.reduce((s, e) => s + e, 0) / errors.length;
}
\`\`\`

#### 逐步拆解 MAE 計算

\`\`\`javascript
const actual    = [500, 530, 510, 540];
const predicted = [480, 520, 530, 510];

// Step 1: 算每期的絕對誤差
// |500-480| = 20
// |530-520| = 10
// |510-530| = 20
// |540-510| = 30
const errors = [20, 10, 20, 30];

// Step 2: 加總並取平均
// (20 + 10 + 20 + 30) / 4 = 20
// MAE = 20，表示平均每期預測偏差 20 個單位
\`\`\`

MAE 越小越好。在 DI 專案中，如果 FG-001 每週出貨約 500 台，MAE = 20 代表約 4% 的誤差率，算是不錯的預測。

### 練習

1. 給定 12 個月的銷量 \`[300, 320, 280, 340, 310, 350, 330, 360, 340, 370, 350, 380]\`，用 3 個月移動平均預測第 13 個月。
2. 回頭驗證：用移動平均預測第 4～12 個月，和實際值比較，算出 MAE。

---

## 6-2：安全庫存策略

### 什麼是安全庫存？

安全庫存 = 「額外多準備的庫存」，用來應對兩種不確定性：

1. **需求不確定性** — 客戶的訂單量每天都不一樣
2. **供應不確定性** — 供應商可能延遲交貨

\`\`\`
正常需求 = 每天 50 個 × 前置時間 14 天 = 700 個
安全庫存 = 額外準備 200 個（應對波動）
實際需要備貨 = 700 + 200 = 900 個
\`\`\`

在 DI 專案的 \`calculator.js\` 中，\`calculateDaysToStockout\` 會從 currentStock 扣除 safetyStock，因為安全庫存是「保護庫存」——正常情況下不該動用。

### 安全庫存公式

\`\`\`
Safety Stock = Z × σ_demand × √LT
\`\`\`

其中：
- **Z** = 服務水準對應的 Z 分數（查表得到）
- **σ_demand** = 每日需求的標準差（需求波動程度）
- **LT** = 前置時間（Lead Time，天數）

\`\`\`javascript
function safetyStock(zScore, demandStdDev, leadTimeDays) {
  return Math.round(zScore * demandStdDev * Math.sqrt(leadTimeDays));
}
\`\`\`

#### 為什麼要 Math.round？

庫存量必須是整數（你不能備 87.3 個零件），所以最後要用 \`Math.round()\` 四捨五入成整數。

#### 為什麼要 Math.sqrt(LT)？

前置時間越長，不確定性越大——但不是線性增長，而是根號關係。這來自統計學中「獨立隨機變數的標準差」規則：如果每天需求的標準差是 σ，那 n 天累計需求的標準差是 σ × √n。

### Z 分數速查表

| 服務水準 | Z 值 | 缺貨機率 | 典型應用 |
|----------|------|----------|----------|
| 85% | 1.04 | 15% | 低重要性零件 |
| 90% | 1.28 | 10% | 一般零件 |
| 95% | 1.65 | 5% | 重要零件（最常用） |
| 97% | 1.88 | 3% | 關鍵零件 |
| 99% | 2.33 | 1% | 不能斷料的核心零件 |
| 99.9% | 3.09 | 0.1% | 安全相關或極高價值零件 |

### 逐步計算範例

\`\`\`javascript
// COMP-001：前置時間 10 天，日需求標準差 15，目標 95% 服務水準

// Step 1: 查表得 Z = 1.65
const z = 1.65;

// Step 2: 代入公式
// SS = 1.65 × 15 × √10
// SS = 1.65 × 15 × 3.162
// SS = 78.26

// Step 3: 四捨五入
const ss = safetyStock(1.65, 15, 10);
// Math.round(78.26) = 78 個

// 再算一個：COMP-002，前置時間 21 天，標準差 25，目標 99%
const ss2 = safetyStock(2.33, 25, 21);
// 2.33 × 25 × √21 = 2.33 × 25 × 4.583 = 267.0
// Math.round(267.0) = 267 個
\`\`\`

### 服務水準 vs 成本的取捨

提高服務水準 = 增加安全庫存 = 更多資金被綁在倉庫裡。

\`\`\`javascript
// 同樣的零件（σ=15, LT=10），不同服務水準需要的安全庫存：
safetyStock(1.28, 15, 10); // 90%: 61 個
safetyStock(1.65, 15, 10); // 95%: 78 個
safetyStock(2.33, 15, 10); // 99%: 111 個
safetyStock(3.09, 15, 10); // 99.9%: 147 個

// 從 95% 提升到 99%，安全庫存增加 42%
// 從 99% 提升到 99.9%，安全庫存再增加 32%
// 邊際成本越來越高！
\`\`\`

### 練習

1. 算 COMP-003 的安全庫存（日需求標準差 30，前置時間 7 天，目標 95%）。
2. 如果服務水準從 95% 提高到 99%，安全庫存增加多少個？增加百分比是多少？

---

## 6-3：BOM 成本分析

### 什麼是 BOM？

BOM（Bill of Materials，物料清單）描述了「一個成品由哪些零件組成、各需要幾個」。它像一份食譜——告訴你做一台筆電需要哪些原料和數量。

\`\`\`
FG-001（筆記型電腦）
├── CPU × 1          單價 $120
├── 記憶體 × 2       單價 $35
├── SSD × 1          單價 $55
├── 螢幕 × 1         單價 $80
├── 鍵盤 × 1         單價 $15
└── 電池 × 1         單價 $40
\`\`\`

### 成本加總的基本邏輯

\`\`\`javascript
function productCost(components, priceMap) {
  let total = 0;
  for (const comp of components) {
    // 從 priceMap 查價格，如果查不到（缺資料）就用 0
    const unitPrice = priceMap[comp.material] || 0;
    total += comp.quantity * unitPrice;
  }
  return total;
}
\`\`\`

#### 為什麼 missing price = 0？

實務上，並非所有零件都有即時報價。可能是新零件還沒建檔，或是價格系統還沒同步。用 \`|| 0\` 確保程式不會因為 \`undefined × quantity = NaN\` 而崩潰。但要記住：**結果會偏低**，後續分析要留意。

#### 逐步計算範例

\`\`\`javascript
const components = [
  { material: "CPU-A1",     quantity: 1 },
  { material: "RAM-B2",     quantity: 2 },
  { material: "SSD-C3",     quantity: 1 },
  { material: "SCREEN-D4",  quantity: 1 },
  { material: "KB-E5",      quantity: 1 },
  { material: "BATT-F6",    quantity: 1 }
];

const priceMap = {
  "CPU-A1":    120,
  "RAM-B2":    35,
  "SSD-C3":    55,
  "SCREEN-D4": 80,
  "KB-E5":     15
  // 注意：BATT-F6 沒有價格資料！
};

const cost = productCost(components, priceMap);

// 計算過程：
// CPU-A1:    1 × 120 = 120
// RAM-B2:    2 × 35  = 70
// SSD-C3:    1 × 55  = 55
// SCREEN-D4: 1 × 80  = 80
// KB-E5:     1 × 15  = 15
// BATT-F6:   1 × 0   = 0   ← 價格缺失，用 0
// 合計：120 + 70 + 55 + 80 + 15 + 0 = 340
\`\`\`

### DI 專案中的 fg_financials.csv

\`\`\`
material_code | unit_margin | unit_price
FG-001        | 0.25        | 150.00
FG-002        | 0.35        | 280.00
FG-003        | 0.20        | 95.00
\`\`\`

\`unit_margin = 0.25\` 表示 25% 毛利率：
- 售價 = $150.00
- 成本 = 150 × (1 - 0.25) = $112.50
- 毛利 = 150 × 0.25 = $37.50

### 成本分析的商業價值

| 應用場景 | 做法 | 目標 |
|----------|------|------|
| 定價決策 | 成本 + 目標利潤 = 售價 | 確保每台賺錢 |
| 降本優先排序 | 找出佔成本比例最高的零件 | 用力談判最貴的零件 |
| 供應商比價 | 同一零件比較不同供應商報價 | 選最划算的來源 |
| 替代料評估 | 比較替代零件的成本差異 | 在不影響品質下降本 |

### 練習

1. 給定 components 陣列和 priceMap，用 \`productCost\` 算出總成本。
2. 如果某個零件漲價 15%，重新算成本，看影響多少。

---

## 6-4：風險量化

### 為什麼要量化風險？

供應鏈每天面對各種風險。光說「這個供應商有風險」沒用——要用**數字**表達風險的大小，才能：

1. 比較不同風險的嚴重程度
2. 決定優先處理哪個
3. 說服主管撥預算來處理

### 供應鏈風險的種類

| 風險類型 | 例子 | 影響 |
|----------|------|------|
| 供應風險 | 供應商倒閉、工廠大火、原料短缺 | 拿不到原料，產線停擺 |
| 需求風險 | 需求暴增或暴跌、季節波動 | 缺貨或庫存過多 |
| 價格風險 | 原料價格飆升、匯率波動 | 利潤減少甚至虧損 |
| 品質風險 | 來料不良率上升、規格變更 | 產線停工、重工成本 |
| 物流風險 | 船期延遲、港口塞車、天災 | 交期延誤、客戶罰款 |

### 風險分數公式

\`\`\`
Risk Score = Probability × Impact Amount
\`\`\`

\`\`\`javascript
function riskScore(probability, impactAmount) {
  return probability * impactAmount;
}
\`\`\`

#### 計算範例

\`\`\`javascript
// COMP-001：30% 機率缺貨，影響金額 $500,000
riskScore(0.3, 500000);  // → 150,000

// COMP-002：5% 機率缺貨，影響金額 $2,000,000
riskScore(0.05, 2000000); // → 100,000

// COMP-003：80% 機率延遲，影響金額 $50,000
riskScore(0.8, 50000);    // → 40,000

// 結論：COMP-001 的期望損失最高（$150,000），應優先處理
// 雖然 COMP-002 的影響金額更大，但機率低，所以期望損失較小
\`\`\`

### 排序風險：rankRisks

當有很多品項時，需要自動排序——風險最高的排最前面。

\`\`\`javascript
function rankRisks(items) {
  // Step 1: 為每個 item 加上 riskScore 欄位
  const scored = items.map(item => ({
    ...item,
    riskScore: item.probability * item.impactAmount
  }));

  // Step 2: 按 riskScore 從高到低排序（降冪 DESC）
  scored.sort((a, b) => b.riskScore - a.riskScore);

  return scored;
}
\`\`\`

#### 排序比較函式 (a, b) => b.riskScore - a.riskScore 的原理

\`sort()\` 的比較函式規則：
- 回傳**負數** → a 排前面
- 回傳**正數** → b 排前面
- 回傳 0 → 順序不變

\`b.riskScore - a.riskScore\`：
- 如果 b 比 a 大 → 正數 → b 排前面 → **大的在前**（降冪排序）

如果改成 \`a.riskScore - b.riskScore\` 就是升冪排序。

#### 完整範例

\`\`\`javascript
const riskItems = [
  { code: "COMP-001", probability: 0.3,  impactAmount: 500000 },
  { code: "COMP-002", probability: 0.05, impactAmount: 2000000 },
  { code: "COMP-003", probability: 0.8,  impactAmount: 50000 },
  { code: "COMP-004", probability: 0.15, impactAmount: 800000 },
  { code: "COMP-005", probability: 0.6,  impactAmount: 300000 }
];

const ranked = rankRisks(riskItems);

// 排序結果：
// 1. COMP-005: 0.6  × 300,000  = 180,000
// 2. COMP-001: 0.3  × 500,000  = 150,000
// 3. COMP-004: 0.15 × 800,000  = 120,000
// 4. COMP-002: 0.05 × 2,000,000 = 100,000
// 5. COMP-003: 0.8  × 50,000   = 40,000
\`\`\`

### DI 專案中的風險分析

\`src/domains/risk/riskScore.js\` 和 \`profitAtRiskCalculator.js\` 計算的是「Profit at Risk」——如果這個風險發生，會損失多少利潤。這正是 \`riskScore\` 函式的應用。

### 練習

1. 給定 5 個零件的機率和影響金額，用 \`rankRisks\` 排序。
2. 如果 COMP-003 的機率從 80% 降到 10%（風險緩解措施生效），重新排序，看排名變化。

---

## 6-5：場景模擬（What-If Analysis）

### 什麼是場景模擬？

場景模擬是管理者最常用的決策工具。「如果 X 發生，會怎樣？」

\`\`\`
場景 1：供應商 A 交貨延遲 2 週
  → 哪些產品會缺料？損失金額是多少？

場景 2：原料價格上漲 20%
  → 毛利率變多少？哪些產品會虧錢？

場景 3：需求突然增加 50%
  → 庫存能撐幾天？需要提前多少天下單？
\`\`\`

### 不可變性原則（Immutability）

場景模擬的第一條規則：**不能修改原始資料**。你要的是「如果」的結果，不是真的改了現況。

\`\`\`javascript
// ❌ 錯誤：直接修改原始物件
function badWhatIf(base, changes) {
  for (const key of Object.keys(changes)) {
    base[key] *= (1 + changes[key] / 100); // 原始資料被改了！
  }
  return base;
}

// ✅ 正確：先複製，再修改副本
function whatIf(base, changes) {
  // 用 spread operator 淺拷貝
  const scenario = { ...base };

  // 套用百分比變更到指定欄位
  for (const key of Object.keys(changes)) {
    scenario[key] = base[key] * (1 + changes[key] / 100);
  }

  return scenario;
}
\`\`\`

#### Spread operator { ...base } 的作用

\`{ ...base }\` 會建立一個**全新的物件**，把 base 的所有屬性複製過去。修改新物件不會影響原始物件。

\`\`\`javascript
const original = { demand: 500, price: 120, leadTime: 14 };
const copy = { ...original };

copy.demand = 999;
console.log(original.demand); // 500 — 原始物件沒變
console.log(copy.demand);     // 999 — 只有副本被修改
\`\`\`

### 逐步計算範例

\`\`\`javascript
const base = {
  demand: 500,
  unitPrice: 120,
  leadTime: 14,
  safetyStock: 78
};

// 場景：需求增加 30%，價格上漲 15%
const changes = {
  demand: 30,      // +30%
  unitPrice: 15    // +15%
};

const result = whatIf(base, changes);

// 計算過程：
// 1. 複製 base → scenario = { demand: 500, unitPrice: 120, leadTime: 14, safetyStock: 78 }
// 2. changes 有 "demand" → scenario.demand = 500 × (1 + 30/100) = 500 × 1.3 = 650
// 3. changes 有 "unitPrice" → scenario.unitPrice = 120 × (1 + 15/100) = 120 × 1.15 = 138
// 4. leadTime 和 safetyStock 沒在 changes 裡，保持不變

// result = { demand: 650, unitPrice: 138, leadTime: 14, safetyStock: 78 }
\`\`\`

#### 用負數表示下降

\`\`\`javascript
// 場景：需求下降 20%，前置時間縮短 50%
const changes2 = {
  demand: -20,     // -20%
  leadTime: -50    // -50%
};

const result2 = whatIf(base, changes2);
// demand = 500 × (1 + (-20)/100) = 500 × 0.8 = 400
// leadTime = 14 × (1 + (-50)/100) = 14 × 0.5 = 7
\`\`\`

### 結合其他函式做完整分析

場景模擬最有價值的地方是可以把結果丟進其他函式：

\`\`\`javascript
// 基礎情境
const base = { demand: 500, unitPrice: 120, leadTime: 14 };

// 模擬漲價 20%
const scenario = whatIf(base, { unitPrice: 20 });

// 用模擬結果重新算安全庫存
const baseSS = safetyStock(1.65, 15, base.leadTime);       // 93
const scenarioSS = safetyStock(1.65, 15, scenario.leadTime); // 93（沒變，因為沒改 leadTime）

// 用模擬結果重新算成本
const baseCost = base.demand * base.unitPrice;       // 60,000
const scenarioCost = scenario.demand * scenario.unitPrice; // 72,000
// 成本增加 12,000（+20%），因為只改了單價
\`\`\`

### DI 專案中的場景模擬

\`src/domains/risk/whatIfEngine.js\` 讓用戶在 Dashboard 上拖動滑桿調整參數（需求變化、價格變化、交期延遲），即時看到風險分數和庫存天數的變化。核心就是 \`whatIf\` 函式的概念。

### 練習

1. 寫 \`whatIf\` 函式，模擬「原料漲價 20% + 需求增加 15%」的組合場景。
2. 比較基礎情境和模擬情境的總成本差異。
3. 思考：如果要模擬「需求增加 50%」，安全庫存要不要跟著調整？為什麼？

---

## 6-6（Boss）：完整商業簡報

### 情境

你是 DI 系統的供應鏈分析師。主管要你根據一組資料，產出完整的決策報告。

**資料來源：** inventory_snapshots、demand_fg、bom_edge、po_open_lines、fg_financials、price_history

### 報告需要包含什麼？

\`\`\`javascript
function generateReport(data) {
  // 最終要回傳這個結構
  return {
    summary: "...",           // 一段文字摘要
    critical: [...],          // 陣列：critical 狀態的品項
    recommendations: [...],   // 陣列：建議行動
    totalCost: 0              // 數字：影響的總金額
  };
}
\`\`\`

### Step 1：摘要（summary）

用一句話概括全局，讓主管 5 秒內抓到重點。

\`\`\`javascript
// 範例
summary: "5 個成品中有 2 個處於 critical 狀態，預估影響金額 $850,000"
\`\`\`

### Step 2：找出 critical 品項

所謂「critical」通常指：庫存低於安全水位、供應商交期延遲、風險分數超過門檻。

\`\`\`javascript
// 從 data 中篩選 critical 品項
const critical = data.items.filter(item => item.status === "critical");

// 或者用更精確的商業邏輯
const critical = data.items.filter(item =>
  item.daysToStockout < 7 ||
  item.riskScore > 100000
);
\`\`\`

### Step 3：建議（recommendations）

每個 critical 品項都需要對應的建議行動：

\`\`\`javascript
const recommendations = critical.map(item => {
  if (item.daysToStockout < 3) {
    return { code: item.code, action: "緊急催貨", priority: "HIGH" };
  } else if (item.daysToStockout < 7) {
    return { code: item.code, action: "加速交貨", priority: "MEDIUM" };
  } else {
    return { code: item.code, action: "持續監控", priority: "LOW" };
  }
});
\`\`\`

### Step 4：計算 totalCost（含預算限制）

報告要算出處理所有問題的總成本，並在有預算限制時做取捨。

\`\`\`javascript
// 計算總影響金額
const totalCost = critical.reduce((sum, item) => sum + item.impactAmount, 0);

// 如果有預算限制，只選到預算用完為止
function selectWithinBudget(items, budget) {
  // 先按優先順序排序（風險高的先處理）
  const sorted = items.sort((a, b) => b.riskScore - a.riskScore);

  const selected = [];
  let remaining = budget;

  for (const item of sorted) {
    if (item.cost <= remaining) {
      selected.push(item);
      remaining -= item.cost;
    }
  }

  return selected;
}
\`\`\`

### 完整的 generateReport 範例

\`\`\`javascript
function generateReport(data) {
  // 1. 找出 critical 品項
  const critical = data.items.filter(item =>
    item.status === "critical" || item.daysToStockout < 7
  );

  // 2. 計算總影響金額
  const totalCost = critical.reduce(
    (sum, item) => sum + item.impactAmount, 0
  );

  // 3. 產出建議
  const recommendations = critical.map(item => ({
    code: item.code,
    action: item.daysToStockout < 3 ? "緊急催貨" : "加速交貨",
    estimatedCost: item.impactAmount
  }));

  // 4. 如果有預算限制，只保留預算內的建議
  if (data.budget) {
    let remaining = data.budget;
    const filtered = [];
    for (const rec of recommendations) {
      if (rec.estimatedCost <= remaining) {
        filtered.push(rec);
        remaining -= rec.estimatedCost;
      }
    }
    return {
      summary: critical.length + " 個品項處於 critical 狀態，" +
        "預估影響 $" + totalCost.toLocaleString() + "，" +
        "預算限制下可處理 " + filtered.length + " 個",
      critical,
      recommendations: filtered,
      totalCost
    };
  }

  // 5. 沒有預算限制的完整報告
  return {
    summary: critical.length + " 個品項處於 critical 狀態，" +
      "預估影響金額 $" + totalCost.toLocaleString(),
    critical,
    recommendations,
    totalCost
  };
}
\`\`\`

### 報告評分維度

| 維度 | 權重 | 重點 |
|------|------|------|
| 數據正確性 | 30% | 數字有沒有算對？篩選邏輯對不對？ |
| 分析深度 | 25% | 有沒有考慮多個面向（成本、風險、時效）？ |
| 建議可行性 | 25% | 方案能不能實際執行？有沒有考慮預算？ |
| 表達清晰度 | 20% | 主管能不能 30 秒內抓到重點？ |

### 主管可能的追問

準備好回答這些問題：

1. **「為什麼選這個方案而不是那個？」** — 用風險分數和成本效益比來解釋
2. **「如果供應商倒了怎麼辦？」** — 場景模擬的結果 + 備援方案
3. **「預算只有一半怎麼辦？」** — 用 rankRisks 排序，先處理風險最高的
4. **「這個預測準嗎？」** — 用 MAE 數字來回答，並說明信心區間

這就是 DI 專案最終要達成的目標——用 AI + 資料，幫供應鏈管理者做出更好、更快的決策。

### 練習

1. 給定一組包含 5 個品項的資料，寫出完整的 \`generateReport\` 函式。
2. 加上預算限制 $500,000，看看報告輸出有什麼變化。
3. 把前面學的 \`movingAverage\`、\`safetyStock\`、\`riskScore\`、\`whatIf\` 全部整合到報告裡。

---

## 供應鏈術語速查表

| 術語 | 英文 | 說明 | 相關函式 |
|------|------|------|----------|
| 移動平均 | Moving Average | 用近 N 期平均值預測下一期 | \`movingAverage(data, window)\` |
| 平均絕對誤差 | MAE (Mean Absolute Error) | 衡量預測準確度的指標 | \`mae(actual, predicted)\` |
| 安全庫存 | Safety Stock | 額外備貨，應對需求和供應的波動 | \`safetyStock(z, σ, LT)\` |
| 前置時間 | Lead Time | 下單到收貨的時間 | — |
| BOM | Bill of Materials | 物料清單（成品的零件組成） | \`productCost(comps, priceMap)\` |
| 風險分數 | Risk Score | 機率 × 影響金額 = 期望損失 | \`riskScore(p, impact)\` |
| 場景模擬 | What-If Analysis | 假設某參數改變，看結果如何 | \`whatIf(base, changes)\` |
| MOQ | Minimum Order Quantity | 供應商要求的最小訂購量 | — |
| EOQ | Economic Order Quantity | 總成本最低的最佳訂購量 | — |
| 服務水準 | Service Level | 不缺貨的機率（如 95%） | Z 分數查表 |
| Z 分數 | Z-Score | 標準常態分佈的分位數值 | 90%→1.28, 95%→1.65, 99%→2.33 |
| 良率 | Yield Rate | 生產出來合格品的比例 | — |
| 報廢率 | Scrap Rate | 生產過程中損耗的比例 | — |
| 在途庫存 | In-Transit Stock | 已下單但還沒到的庫存 | — |
| 可用庫存 | Available Stock | 在手庫存 - 已配額 - 安全庫存 | — |
| 毛利率 | Gross Margin | (售價 - 成本) / 售價 | fg_financials.csv 的 unit_margin |
| 期望損失 | Expected Loss | 風險發生的機率 × 損失金額 | 同 Risk Score |
`;
