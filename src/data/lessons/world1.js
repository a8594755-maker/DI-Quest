export default `
# World 1：JavaScript 基礎島

> **目標：** 學完後你能讀懂專案裡的 \`calculator.js\`，並自己從零寫出一個類似的模組
> **時間：** 約 4 天

---

## Day 1：變數、函式、條件判斷

### 1.1 什麼是程式？

程式就是一份「給電腦看的食譜」。你告訴電腦一步一步要做什麼，它照做。

打開你的終端機（Terminal），輸入 \`node\` 進入 JavaScript 互動模式。跟著打：

\`\`\`javascript
// 這是一行註解，電腦會忽略它。// 後面的文字是給人看的。
\`\`\`

---

### 1.2 變數 — 幫資料取名字

變數就是一個「名牌」，你把一個資料貼上名牌，之後就可以用名字找到它。

\`\`\`javascript
// 用 const 宣告一個「不會改變」的變數
const myName = 'Louis';
const age = 22;
const isStudent = true;

// 用 let 宣告一個「可能會改」的變數
let score = 85;
score = 90; // 可以改

// 印出來看看
console.log(myName);    // 印出: Louis
console.log(age);       // 印出: 22
console.log(score);     // 印出: 90
\`\`\`

**三種基本資料型別：**

| 型別 | 例子 | 說明 |
|------|------|------|
| \`string\` 字串 | \`'hello'\`、\`"世界"\` | 用引號包起來的文字 |
| \`number\` 數字 | \`42\`、\`3.14\`、\`-5\` | 整數或小數 |
| \`boolean\` 布林 | \`true\`、\`false\` | 只有兩個值：是 / 否 |

**為什麼有 const 和 let 兩種？**

\`const\` = constant（常數）。宣告之後**不能**再改它的值。適合用在「這個值不應該被改掉」的情況。

\`let\` = 可變的。宣告之後**可以**改。適合用在「這個值會在過程中改變」的情況，例如分數、計數器。

**經驗法則：** 預設用 \`const\`，除非你確定需要改值才用 \`let\`。

> **練習 1：** 宣告三個變數：你的名字、你的年齡、你是不是學生。然後用 \`console.log\` 印出來。

---

### 1.3 函式 — 可以重複使用的食譜

函式就是一段「打包好的程式碼」，你給它一些材料（參數），它做完事情後把結果還給你（回傳值）。

\`\`\`javascript
// 定義一個函式：計算兩個數字的加總
function add(a, b) {
  return a + b;
}

// 使用這個函式
const result = add(3, 5);
console.log(result); // 印出: 8

// 你可以重複使用它
console.log(add(10, 20)); // 印出: 30
console.log(add(1, 1));   // 印出: 2
\`\`\`

拆解一下：
- \`function\` — 告訴電腦「我要定義一個函式」
- \`add\` — 函式的名字
- \`(a, b)\` — 參數（材料），呼叫時傳進來的值
- \`return a + b\` — 回傳值（做出來的菜）
- \`add(3, 5)\` — 呼叫函式，把 3 和 5 傳進去

**沒有 return 會怎樣？** 函式會回傳 \`undefined\`（未定義）。這是新手最常犯的錯之一：

\`\`\`javascript
function badAdd(a, b) {
  a + b; // 算了但沒 return！
}
console.log(badAdd(3, 5)); // 印出: undefined（不是 8！）
\`\`\`

**另一種寫法（箭頭函式）：**

\`\`\`javascript
// 跟上面的 add 完全一樣，只是寫法不同
const add = (a, b) => {
  return a + b;
};

// 如果只有一行 return，可以更簡短
const add = (a, b) => a + b;
\`\`\`

箭頭函式在你的 DI 專案裡到處都是。兩種寫法效果一樣，箭頭函式比較簡潔。

**預設參數：**

\`\`\`javascript
// safetyStock 如果沒傳，預設是 0
function calculateDays(stock, demand, safetyStock = 0) {
  return (stock - safetyStock) / demand;
}

calculateDays(100, 10);     // safetyStock 用預設的 0 → 10
calculateDays(100, 10, 20); // safetyStock = 20 → 8
\`\`\`

你的專案 \`calculator.js\` 裡就用了這招：\`safetyStock = 0\`。

> **練習 2：** 寫一個函式 \`multiply(a, b)\`，回傳兩個數字的乘積。測試 \`multiply(4, 5)\` 應該得到 20。

---

### 1.4 條件判斷 — 讓程式做決定

\`\`\`javascript
function checkTemperature(temp) {
  if (temp > 37.5) {
    return '發燒了！';
  } else if (temp > 36) {
    return '體溫正常';
  } else {
    return '體溫偏低';
  }
}

console.log(checkTemperature(38));   // 印出: 發燒了！
console.log(checkTemperature(36.5)); // 印出: 體溫正常
console.log(checkTemperature(35));   // 印出: 體溫偏低
\`\`\`

拆解：
- \`if (條件)\` — 如果條件成立（true），就執行大括號裡的程式碼
- \`else if (另一個條件)\` — 否則，如果這個條件成立
- \`else\` — 以上都不成立時

**比較運算子：**

| 符號 | 意思 | 例子 |
|------|------|------|
| \`>\` | 大於 | \`5 > 3\` → true |
| \`<\` | 小於 | \`5 < 3\` → false |
| \`>=\` | 大於等於 | \`5 >= 5\` → true |
| \`<=\` | 小於等於 | \`4 <= 5\` → true |
| \`===\` | 等於 | \`5 === 5\` → true |
| \`!==\` | 不等於 | \`5 !== 3\` → true |

**三元運算子 — if/else 的簡寫：**

\`\`\`javascript
// 這一行
const label = days > 14 ? '安全' : '危險';

// 等同於這五行
let label;
if (days > 14) {
  label = '安全';
} else {
  label = '危險';
}
\`\`\`

> **練習 3：** 寫 \`gradeScore(score)\`，根據分數回傳 A/B/C/D/F。分數不在 0-100 之間回傳 \`"Invalid"\`。

---

### 1.5 物件 — 把相關資料打包在一起

\`\`\`javascript
// 一個庫存品項的資料（來自你專案的 inventory_snapshots.csv）
const item = {
  materialCode: 'COMP-001',
  currentStock: 500,
  dailyDemand: 50,
  safetyStock: 100,
};

// 取出資料
console.log(item.materialCode);  // 'COMP-001'
console.log(item.currentStock);  // 500
\`\`\`

**解構賦值 — 從物件中取出欄位的簡寫：**

\`\`\`javascript
// 完整寫法
const code = item.materialCode;
const stock = item.currentStock;

// 解構寫法（效果完全一樣，只是更簡潔）
const { materialCode, currentStock } = item;

// 函式參數也可以解構
function describe({ materialCode, currentStock }) {
  return materialCode + ': ' + currentStock + ' 個';
}
describe(item); // 'COMP-001: 500 個'
\`\`\`

**展開運算子（Spread Operator）— 複製物件：**

\`\`\`javascript
// 建立一個新物件，跟 item 一樣但 currentStock 不同
const updated = { ...item, currentStock: 450 };

// item 不會被改到（不可變性！）
console.log(item.currentStock);    // 還是 500
console.log(updated.currentStock); // 450
\`\`\`

這在 React 和你的專案裡**到處都是**。\`{ ...item, xxx: newValue }\` 表示「複製 item，但覆蓋 xxx」。

> **練習 4：** 建立一個物件代表 COMP-001。寫一個函式 \`daysUntilEmpty(item)\`，用解構取出 currentStock 和 dailyDemand，算出幾天後用完。

---

### 1.6 陣列 — 一堆資料的清單

\`\`\`javascript
const inventory = [
  { materialCode: 'COMP-001', currentStock: 500, dailyDemand: 50 },
  { materialCode: 'COMP-002', currentStock: 80,  dailyDemand: 30 },
  { materialCode: 'COMP-003', currentStock: 200, dailyDemand: 10 },
];

// 取第一筆
console.log(inventory[0].materialCode); // 'COMP-001'

// 陣列長度
console.log(inventory.length); // 3
\`\`\`

**三大陣列方法（你專案裡用最多的）：**

\`\`\`javascript
// filter — 過濾出符合條件的
const lowStock = inventory.filter(item => item.currentStock < 100);
// → [{ materialCode: 'COMP-002', ... }]

// map — 把每一筆轉換成新的格式
const codes = inventory.map(item => item.materialCode);
// → ['COMP-001', 'COMP-002', 'COMP-003']

// reduce — 把所有東西「折疊」成一個值
const totalStock = inventory.reduce((sum, item) => sum + item.currentStock, 0);
// → 780
\`\`\`

\`reduce\` 比較難懂，拆解一下：

\`\`\`javascript
inventory.reduce((累加器, 目前這筆) => 累加器 + 目前這筆.currentStock, 初始值);

// 第一輪：sum = 0,   item = COMP-001 → 0 + 500 = 500
// 第二輪：sum = 500,  item = COMP-002 → 500 + 80 = 580
// 第三輪：sum = 580,  item = COMP-003 → 580 + 200 = 780
// 結果：780
\`\`\`

**for 迴圈：**

\`\`\`javascript
for (const item of inventory) {
  console.log(item.materialCode + ': ' + item.currentStock);
}
\`\`\`

> **練習 5：** 用 \`filter\` 找出庫存天數低於 7 天的品項（用 currentStock / dailyDemand 算天數）。

---

### Day 1 總結

你學了六個概念：**變數、函式、條件判斷、物件、陣列、迴圈**。這就是 \`calculator.js\` 用到的全部基礎，沒有更多了。

---

## Day 2：讀懂 calculator.js

### 2.1 常數定義

\`\`\`javascript
// 來自你的專案 src/domains/inventory/calculator.js
export const RISK_THRESHOLDS = {
  CRITICAL_DAYS: 7,
  WARNING_DAYS: 14,
  HIGH_VOLATILITY: 0.2,
};
\`\`\`

**為什麼要把數字放在常數裡？** 假設老闆說「把緊急的標準從 7 天改成 5 天」，你只需要改 \`CRITICAL_DAYS: 5\`。如果直接寫 \`7\`，你得找遍所有出現 \`7\` 的地方——很容易漏改。

**\`export\` 是什麼？** 表示「允許其他檔案引入這個東西」。就像餐廳菜單上有的菜才能點。

**工廠函式（在 ERROR_MESSAGES 裡）：**

\`\`\`javascript
export const ERROR_MESSAGES = {
  INVALID_NUMBER: (name) => \\\`\\\${name} must be a valid number\\\`,
};

ERROR_MESSAGES.INVALID_NUMBER('currentStock')
// → "currentStock must be a valid number"
\`\`\`

一個模板就能產生各種錯誤訊息。

---

### 2.2 calculateDaysToStockout — 逐行解讀

**輸入驗證：**

\`\`\`javascript
if (typeof currentStock !== 'number' || isNaN(currentStock)) {
  throw new Error(ERROR_MESSAGES.INVALID_NUMBER('currentStock'));
}
\`\`\`

- \`typeof x !== 'number'\` → x 的型別不是數字
- \`||\` → 或者
- \`isNaN(x)\` → x 是 NaN（Not a Number）
- \`throw new Error(...)\` → 丟出錯誤，程式中斷

**為什麼要驗證？** 如果傳了 \`"abc"\`，\`"abc" / 10\` 得到 \`NaN\`。程式不會報錯但結果是錯的。有驗證就會直接告訴你問題在哪。

**邊界情況：**

\`\`\`javascript
if (currentStock < 0) return { days: 0, status: 'critical' };     // 負庫存 = 已經沒貨
if (currentStock < safetyStock) return { days: 0, status: 'critical' }; // 低於安全水位
if (dailyDemand <= 0) return { days: Infinity, status: 'ok' };    // 沒人用 = 永遠不斷
\`\`\`

**核心計算：**

\`\`\`javascript
const availableStock = currentStock - safetyStock;
const days = availableStock / dailyDemand;

let status;
if (days < RISK_THRESHOLDS.CRITICAL_DAYS) status = 'critical';
else if (days < RISK_THRESHOLDS.WARNING_DAYS) status = 'warning';
else status = 'ok';

return { days: Math.max(0, days), status };
\`\`\`

\`Math.max(0, days)\` 確保天數不是負數。

---

### 2.3 calculateInventoryRisk — 函式組合

\`\`\`javascript
export function calculateInventoryRisk(position) {
  const { currentStock, safetyStock, dailyDemand, leadTimeDays, demandVolatility } = position;

  const stockout = calculateDaysToStockout(currentStock, dailyDemand, safetyStock);
  const probability = calculateStockoutProbability(stockout.days, leadTimeDays, demandVolatility);
  const urgency = calculateUrgencyScore(stockout.days);

  return { daysToStockout: stockout.days, probability, urgencyScore: urgency, riskLevel: ... };
}
\`\`\`

這就是**函式組合**：每個小函式只做一件事，大函式把它們串起來。讀起來像自然語言：「先算天數，再算機率，再算緊迫度」。

---

## Day 3：自己動手寫

### 作業

1. 建立 \`my-practice/calculator.js\`
2. 自己實作 \`calculateDaysToStockout\`（不看原始碼）
3. 在 \`calculator.test.js\` 裡寫至少 10 個測試
4. 額外挑戰：自己寫 \`calculateEOQ\`（最佳訂購量）

---

## Day 4：BOM 展開 + 遞迴

### 什麼是 BOM？

BOM = Bill of Materials = 物料清單。

\`\`\`
腳踏車 (1台)
├── 車架 (1個)
│   ├── 鋼管 (3根)
│   └── 焊接件 (6個)
├── 前輪 (1個)
│   ├── 輪圈 (1個)
│   └── 輪胎 (1個)
└── 後輪 (1個)
    ├── 輪圈 (1個)
    └── 輪胎 (1個)
\`\`\`

BOM Explosion = 把這棵樹攤平，算出每個零件總共需要多少。

### 什麼是遞迴？

函式呼叫自己。先看階乘：

\`\`\`javascript
function factorial(n) {
  if (n <= 1) return 1;        // 終止條件
  return n * factorial(n - 1); // 遞迴
}
// factorial(5) = 5 × 4 × 3 × 2 × 1 = 120
\`\`\`

BOM 展開也是遞迴：「腳踏車需要什麼零件？」→ 看第一層 → 每個子件再問「它需要什麼？」→ 直到沒有子件。

### 循環偵測

如果 A 需要 B，B 又需要 A，遞迴會無限跑下去。解法：用 \`Set\` 記錄已走訪的品項。

\`\`\`javascript
function explode(item, qty, visited = new Set()) {
  if (visited.has(item)) return { error: 'CIRCULAR_REFERENCE' };
  visited.add(item);
  // ...遞迴展開...
}
\`\`\`

---

## 附錄：JavaScript 語法速查表

| 語法 | 例子 | 說明 |
|------|------|------|
| 變數 | \`const x = 10\` | 不可改 |
| 變數 | \`let y = 20\` | 可改 |
| 函式 | \`function f(a) { return a; }\` | 宣告函式 |
| 箭頭 | \`(a, b) => a + b\` | 簡寫 |
| 條件 | \`if (x > 0) {} else {}\` | 判斷 |
| 三元 | \`x > 0 ? 'yes' : 'no'\` | 簡寫 if |
| 物件 | \`{ name: 'a', age: 1 }\` | 鍵值對 |
| 解構 | \`const { name } = obj\` | 取值 |
| 展開 | \`{ ...obj, name: 'b' }\` | 複製+覆蓋 |
| 陣列 | \`[1, 2, 3]\` | 清單 |
| filter | \`arr.filter(x => x > 2)\` | 過濾 |
| map | \`arr.map(x => x * 2)\` | 轉換 |
| reduce | \`arr.reduce((s, x) => s + x, 0)\` | 折疊 |
| for of | \`for (const x of arr) {}\` | 迴圈 |
| typeof | \`typeof 42 → 'number'\` | 檢查型別 |
| Math | \`Math.max, Math.min, Math.round, Math.sqrt\` | 數學 |
`;
