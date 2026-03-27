export default `
# World 2：純函式神殿

> **目標：** 理解純函式、輸入驗證、邊界處理、函式組合、自動化測試，最後挑戰 BOM 遞迴展開
> **對應專案：** \`src/domains/inventory/calculator.js\`、\`src/domains/forecast/bomCalculator.js\`
> **學完後你能：** 寫出可測試、無副作用、能處理各種意外輸入的函式

---

## 2-1：什麼是純函式（Pure Function）

### 比喻：販賣機 vs 餐廳服務生

想像一台販賣機：你投 10 元硬幣、按「可樂」按鈕，它**永遠**給你一罐可樂。不會因為心情不好給你果汁，也不會偷偷拿走旁邊的零錢。這就是純函式。

相比之下，餐廳服務生可能會說「今天可樂賣完了，幫你換果汁」，還會把你的餐費記到帳單上。它的行為取決於外部狀態，還會改變外部狀態。這就是「不純」的函式。

### 兩條黃金規則

**規則 1：相同的輸入，永遠得到相同的輸出。**

\`\`\`javascript
// ✅ 純函式 — 同樣的輸入永遠回傳同樣的結果
function add(a, b) {
  return a + b;
}
add(3, 5); // 永遠是 8，今天是 8，明天也是 8

// ❌ 不純 — 結果取決於外部狀態
let bonus = 10;
function addWithBonus(a, b) {
  return a + b + bonus; // bonus 可能被別人改掉
}
addWithBonus(3, 5); // 現在是 18
bonus = 50;
addWithBonus(3, 5); // 變成 58 了！同樣的輸入，不同的結果
\`\`\`

**規則 2：不產生副作用（Side Effect）。**

副作用 = 修改外面的東西、存資料庫、發 API 請求、印東西到螢幕上、改傳進來的參數...

\`\`\`javascript
// ✅ 純函式 — 只算東西，不做別的
function classifyRisk(days) {
  if (days < 7) return 'critical';
  if (days < 14) return 'warning';
  return 'safe';
}

// ❌ 不純 — 修改了外部變數
let totalCritical = 0;
function classifyAndCount(days) {
  if (days < 7) {
    totalCritical++; // 副作用！改了外面的東西
    return 'critical';
  }
  return 'safe';
}

// ❌ 不純 — 修改了傳入的陣列
function addItem(arr, item) {
  arr.push(item); // 修改了原陣列！呼叫者的陣列被改了
  return arr;
}

// ✅ 改成純函式 — 回傳新陣列
function addItemPure(arr, item) {
  return [...arr, item]; // 不改原陣列，回傳新的
}
\`\`\`

### 常見的副作用陷阱

| 副作用類型 | 例子 | 為什麼不純 |
|-----------|------|-----------|
| 修改外部變數 | \`counter++\` | 函式外面的值被改了 |
| 修改輸入參數 | \`arr.push(x)\`、\`obj.name = 'new'\` | 呼叫者的資料被改了 |
| 呼叫 API | \`fetch('/api/data')\` | 結果取決於網路和伺服器狀態 |
| 讀取時間 | \`Date.now()\`、\`new Date()\` | 每次呼叫結果不同 |
| 隨機數 | \`Math.random()\` | 每次呼叫結果不同 |
| 印出東西 | \`console.log()\` | 嚴格說也是副作用 |
| 讀寫檔案 | \`fs.readFile()\` | 外部資源 |

### 為什麼純函式重要？

| 好處 | 說明 |
|------|------|
| 好測試 | 不需要準備環境，直接 input → output |
| 好理解 | 看函式簽名就知道它做什麼 |
| 好組合 | 小純函式可以像積木一樣拼成大函式 |
| 不怕並行 | 不修改共享狀態，不會有競爭條件 |
| 好快取 | 同樣的輸入一定同樣的輸出，可以存結果 |

### 真實專案：calculator.js

打開 \`src/domains/inventory/calculator.js\`，開頭就寫了：

> *所有函數都是 Pure Functions：給定相同的輸入就會產生相同的輸出，沒有任何副作用。*

這整個檔案裡的函式：
- 不存取資料庫
- 不呼叫 API
- 不修改全域變數
- 不讀取 \`Date.now()\` 或 \`Math.random()\`

所以它們非常容易測試和維護。你改了一個公式，跑一下測試就知道有沒有壞掉。

\`\`\`javascript
// calculator.js 裡的 classifyRisk 就是典型的純函式
function classifyRisk(days) {
  if (days < RISK_THRESHOLDS.CRITICAL_DAYS) return 'critical';
  if (days < RISK_THRESHOLDS.WARNING_DAYS) return 'warning';
  return 'ok';
}
// RISK_THRESHOLDS 是常數，不會被修改，所以仍然是純函式
\`\`\`

### 進階：常數引用算不算不純？

你可能會問：\`classifyRisk\` 讀了外部的 \`RISK_THRESHOLDS\`，算不算不純？

答案：如果那個外部值是**不會改變的常數**（用 \`const\` 宣告、永遠不被修改），那它在語意上等同於直接寫死在函式裡，仍然算純函式。真正的問題是**可變的**外部狀態。

> **練習（對應挑戰 1）：** 判斷以下哪些是純函式：
> 1. \`(a, b) => a + b\`
> 2. \`(arr) => { arr.push(1); return arr; }\`
> 3. \`(x) => Math.random() * x\`
> 4. \`(items) => items.filter(i => i > 0)\`
>
> 提示：\`push\` 會修改原陣列，\`filter\` 會回傳新陣列。

> **練習（對應挑戰 2）：** 把一個依賴外部變數的函式改成純函式——讓外部依賴變成參數：
> \`\`\`javascript
> // 不純的版本
> let taxRate = 0.05;
> function calculateTax(price) {
>   return price * taxRate; // 依賴外部 taxRate
> }
>
> // 改成純函式：
> function calculateTax(price, taxRate) {
>   return price * taxRate; // taxRate 從參數傳入
> }
> \`\`\`

---

## 2-2：輸入驗證（Input Validation）

### 為什麼要驗證？

JavaScript 是一個「寬容到危險」的語言。很多錯誤不會報錯，只會給你一個荒謬的結果：

\`\`\`javascript
function divide(a, b) {
  return a / b;
}

divide(10, 0);       // Infinity（不是你想要的）
divide(10, "hello"); // NaN（壞掉的數字，但不報錯！）
divide(null, 5);     // 0（null 被轉成 0）
divide(undefined, 5); // NaN
divide("10", "2");   // 5（字串居然可以除？JavaScript 幫你轉了）
\`\`\`

程式不報錯但結果是錯的——這是最危險的情況。想像你的庫存計算結果是 NaN，然後它被存到資料庫裡。等你發現問題的時候，可能已經過了三天。

**原則：寧可報錯也不要給錯的結果。**

### typeof 和 isNaN 的搭配使用

\`\`\`javascript
typeof 42         // 'number'
typeof 'hello'    // 'string'
typeof true       // 'boolean'
typeof undefined  // 'undefined'
typeof null       // 'object'（歷史遺留的 bug！）
typeof NaN        // 'number'（NaN 的 typeof 居然是 number！）
typeof []         // 'object'
typeof {}         // 'object'

isNaN(NaN)        // true
isNaN(42)         // false
isNaN('hello')    // true（會先嘗試轉換成數字）

Number.isNaN(NaN)     // true（更嚴格，推薦）
Number.isNaN('hello') // false（不會自動轉換）
\`\`\`

所以檢查一個值「是不是有效的數字」需要**兩個條件一起**：

\`\`\`javascript
// typeof !== 'number' → 排除字串、布林、null、undefined 等
// isNaN(x) → 排除 NaN（NaN 的 typeof 是 'number' 但它不是有效的數字）
function isValidNumber(x) {
  return typeof x === 'number' && !isNaN(x);
}

isValidNumber(42);        // true
isValidNumber(0);         // true
isValidNumber(-3.14);     // true
isValidNumber(NaN);       // false
isValidNumber('42');      // false
isValidNumber(undefined); // false
\`\`\`

### 真實專案：calculator.js 的驗證策略

\`\`\`javascript
// calculator.js 這樣做驗證
// 1. 檢查型別 + NaN
if (typeof currentStock !== 'number' || isNaN(currentStock)) {
  throw new Error('currentStock must be a valid number');
}

// 2. 檢查業務邏輯範圍
if (dailyDemand < 0) {
  throw new Error('dailyDemand cannot be negative');
}
\`\`\`

注意它用了 \`throw new Error(...)\`——直接丟出錯誤，程式中斷。這是因為型別錯誤是**程式設計錯誤**，不是使用者的錯，應該在開發階段就被發現。

### 驗證結果的兩種風格

| 風格 | 做法 | 適合場景 |
|------|------|---------|
| throw Error | 丟出錯誤，程式中斷 | 程式設計錯誤（傳錯型別） |
| 回傳錯誤物件 | \`{ error: '...', result: null }\` | 可預期的失敗（除以零、查無資料） |
| 預設值 | \`safetyStock = 0\` | 可以合理猜測的參數 |
| 靜默修正 | \`if (x < 0) x = 0\` | 不影響正確性的修正 |

在你的挑戰裡，\`safeDivide\` 就是用「回傳錯誤物件」的風格：

\`\`\`javascript
// 回傳物件而不是 throw，讓呼叫者可以優雅地處理錯誤
function safeDivide(a, b) {
  if (typeof a !== 'number' || isNaN(a) || typeof b !== 'number' || isNaN(b)) {
    return { error: 'invalid input', result: null };
  }
  if (b === 0) {
    return { error: 'division by zero', result: null };
  }
  return { error: null, result: a / b };
}

// 使用時：
const r = safeDivide(10, 0);
if (r.error) {
  console.log('出錯了：' + r.error);
} else {
  console.log('結果：' + r.result);
}
\`\`\`

### 常見錯誤

\`\`\`javascript
// ❌ 只檢查 typeof，漏掉 NaN
if (typeof x !== 'number') throw new Error('not a number');
// NaN 會通過這個檢查！

// ❌ 只檢查 isNaN，漏掉非數字型別
if (isNaN(x)) throw new Error('not a number');
// isNaN('hello') 是 true，但 isNaN(null) 是 false！
// null 被自動轉成 0，所以 isNaN(null) === false

// ✅ 兩個條件都要
if (typeof x !== 'number' || isNaN(x)) throw new Error('not a number');
\`\`\`

> **練習（對應挑戰 1）：** 寫 \`calculateDiscount(price, rate)\`，驗證 price 是正數、rate 在 0-1 之間。
>
> **練習（對應挑戰 2）：** 寫 \`safeDivide(a, b)\`，回傳 \`{ error, result }\` 物件而不是 throw。

---

## 2-3：邊界情況（Edge Cases）

### 什麼是邊界情況？

「不尋常但有可能發生」的輸入。正常情況只是冰山一角——水面下藏著各種奇怪的輸入。

想像你寫了一個計算庫存天數的函式。正常情況下，庫存 500、日需求 50，答案是 10 天。但現實世界會丟給你各種驚喜：

\`\`\`
正常情況：
  calculateDays(500, 50) → 10 天 ✅

邊界情況：
  calculateDays(0, 50)    → 0 天（庫存是零）
  calculateDays(-10, 50)  → ？（負庫存？退貨太多？）
  calculateDays(500, 0)   → ？（沒有需求？除以零！）
  calculateDays(500, -5)  → ？（負需求？客戶在退貨？）
  calculateDays(NaN, 50)  → ？（壞掉的輸入）
  calculateDays(50, 50)   → 1 天（剛好用完，明天就斷貨）
  calculateDays(Infinity, 50) → ？（無限庫存？系統錯誤？）
\`\`\`

### 邊界情況清單（通用）

| 類型 | 例子 | 你應該做什麼 |
|------|------|-------------|
| 零 | \`0\`, \`""\`, \`[]\` | 除以零？空陣列跑 reduce？ |
| 負數 | \`-1\`, \`-0.5\` | 業務上有意義嗎？ |
| 極大值 | \`Infinity\`, \`Number.MAX_SAFE_INTEGER\` | 會溢出嗎？ |
| 空值 | \`null\`, \`undefined\` | 忘了傳參數？ |
| 錯誤型別 | \`"abc"\`, \`true\`, \`{}\` | 型別檢查 |
| 邊界值 | 剛好等於門檻 | \`<\` vs \`<=\`，差一個bug |
| 特殊浮點數 | \`0.1 + 0.2 !== 0.3\` | 浮點數精度問題 |

### 真實專案：calculator.js 怎麼處理

\`\`\`javascript
// 負庫存 → 當作 0，已經沒貨了
if (currentStock < 0) return { days: 0, status: 'critical' };

// 庫存低於安全水位 → 也是 0
if (currentStock < safetyStock) return { days: 0, status: 'critical' };

// 零或負需求 → 永遠不會用完
if (dailyDemand <= 0) return { days: Infinity, status: 'ok' };
\`\`\`

注意它的**處理順序**很重要：先處理負庫存，再處理安全水位，最後處理零需求。如果順序反了，可能會漏掉某些情況。

### clamp 函式：一個經典的邊界處理範例

\`clamp\` 把一個值限制在 min 和 max 之間。看起來簡單，但有一個陷阱：

\`\`\`javascript
// 基本版
function clamp(value, min, max) {
  return Math.max(min, Math.min(max, value));
}

clamp(15, 0, 10);  // 10（超過上限，壓回來）
clamp(-5, 0, 10);  // 0（低於下限，拉上來）
clamp(5, 0, 10);   // 5（在範圍內，不動）

// 但是如果 min > max 呢？
clamp(5, 10, 0);   // ？這個行為是未定義的！
\`\`\`

健壯的版本應該處理 \`min > max\` 的情況：

\`\`\`javascript
function clamp(value, min, max) {
  if (min > max) {
    // 方法 1：交換
    [min, max] = [max, min];
    // 方法 2：丟錯誤
    // throw new Error('min must be <= max');
  }
  return Math.max(min, Math.min(max, value));
}
\`\`\`

### safeDivide：完整的邊界處理

挑戰裡你會遇到的 \`safeDivide\` 要處理：

\`\`\`javascript
function safeDivide(a, b) {
  // 邊界 1：型別檢查（NaN、字串、布林...）
  if (typeof a !== 'number' || isNaN(a)) return { error: 'invalid input', result: null };
  if (typeof b !== 'number' || isNaN(b)) return { error: 'invalid input', result: null };

  // 邊界 2：除以零
  if (b === 0) return { error: 'division by zero', result: null };

  // 正常路徑
  return { error: null, result: a / b };
}
\`\`\`

### 用「列表法」系統性地找邊界

寫任何函式之前，先列出一張表：

| 輸入 | 預期結果 | 為什麼 |
|------|---------|--------|
| \`(100, 10, 0)\` | \`{ days: 10 }\` | 正常情況 |
| \`(-5, 10, 0)\` | \`{ days: 0 }\` | 負庫存當作零 |
| \`(100, 0, 0)\` | \`{ days: Infinity }\` | 沒有需求 |
| \`(NaN, 10, 0)\` | \`{ error: "invalid" }\` | 無效輸入 |
| \`(50, 10, 100)\` | \`{ days: 0 }\` | 安全庫存比現有庫存多 |

這張表後面就是你的測試案例。

> **練習（對應挑戰）：** 寫 \`robustStockDays(stock, demand, safety = 0)\`，處理所有上面列的邊界情況。

---

## 2-4：函式組合（Function Composition）

### 小函式 → 大函式

函式組合的核心思想：**每個函式只做一件事，然後像積木一樣拼起來。**

\`\`\`javascript
// 三個小函式，各做一件事
function calculateDays(stock, demand) {
  return demand <= 0 ? Infinity : stock / demand;
}

function classifyRisk(days) {
  if (days < 7) return 'critical';
  if (days < 14) return 'warning';
  return 'safe';
}

function formatResult(days, risk) {
  return { daysRemaining: Math.round(days), risk };
}

// 一個大函式把它們串起來
function assessItem(item) {
  const days = calculateDays(item.currentStock, item.dailyDemand);
  const risk = classifyRisk(days);
  return formatResult(days, risk);
}
\`\`\`

好處：
- 每個小函式都可以**單獨測試**（不需要準備整個庫存物件）
- 改一個算法**不影響**其他部分（改風險門檻只動 classifyRisk）
- 讀起來像自然語言：「算天數、分級風險、格式化結果」

### 管線模式（Pipeline）

管線就是一連串的轉換，前一步的輸出是下一步的輸入。在 JavaScript 裡，陣列方法天然就是管線：

\`\`\`javascript
// 把多個轉換串在一起
const result = inventory
  .filter(item => item.dailyDemand > 0)              // 1. 過濾掉零需求
  .map(item => ({                                      // 2. 計算天數
    ...item,
    daysRemaining: item.currentStock / item.dailyDemand,
  }))
  .map(item => ({                                      // 3. 分類風險
    ...item,
    risk: item.daysRemaining < 7 ? 'critical'
        : item.daysRemaining < 14 ? 'warning'
        : 'safe',
  }))
  .filter(item => item.risk !== 'safe')               // 4. 只要有風險的
  .sort((a, b) => a.daysRemaining - b.daysRemaining); // 5. 按天數排序
\`\`\`

每一步都是一個純函式轉換，結果流向下一步。

### 自己寫一個 pipe 函式

pipe 是函式組合的通用工具——它接收多個函式，回傳一個新函式，依序執行：

\`\`\`javascript
function pipe(...fns) {
  return function(input) {
    let result = input;
    for (const fn of fns) {
      result = fn(result);
    }
    return result;
  };
}

// 使用
const double = x => x * 2;
const addTen = x => x + 10;
const toString = x => '結果：' + x;

const transform = pipe(double, addTen, toString);
transform(5); // '結果：20'  (5 → 10 → 20 → '結果：20')
\`\`\`

### 真實專案：calculator.js 的組合模式

\`\`\`javascript
// calculateInventoryRisk 就是把三個小函式組合起來
export function calculateInventoryRisk(position) {
  const { currentStock, safetyStock, dailyDemand, leadTimeDays, demandVolatility } = position;

  // 第一層：算天數
  const stockout = calculateDaysToStockout(currentStock, dailyDemand, safetyStock);
  // 第二層：算機率
  const probability = calculateStockoutProbability(stockout.days, leadTimeDays, demandVolatility);
  // 第三層：算緊迫度
  const urgency = calculateUrgencyScore(stockout.days);

  return { daysToStockout: stockout.days, probability, urgencyScore: urgency };
}
\`\`\`

每一層都可以單獨測試，改一個不影響其他。

### processInventory：你的挑戰預覽

挑戰會要求你寫一個 \`processInventory(items)\` 管線，包含 filter → map → map → sort。用上面學到的技巧：

\`\`\`javascript
function processInventory(items) {
  return items
    .filter(item => item.dailyDemand > 0)        // 過濾
    .map(item => ({                                // 計算天數
      ...item,
      daysRemaining: item.currentStock / item.dailyDemand,
    }))
    .map(item => ({                                // 加上風險分級
      ...item,
      risk: item.daysRemaining < 7 ? 'critical'
          : item.daysRemaining < 14 ? 'warning'
          : 'safe',
    }))
    .sort((a, b) => a.daysRemaining - b.daysRemaining);
}
\`\`\`

> **練習（對應挑戰）：** 自己寫 \`processInventory\`，處理空陣列和零需求的情況。

---

## 2-5：自動化測試

### 為什麼要寫測試？

你改了一個函式，怎麼確定沒有把別的東西弄壞？答案：跑測試。

手動測試的問題：
1. **慢** — 每次改完都要手動跑一遍
2. **容易漏** — 你只測了正常情況，忘了測邊界
3. **不可靠** — 你覺得「看起來對了」但其實漏了一個小數點

自動化測試的好處：一秒鐘跑完 100 個測試，每一個邊界情況都不會漏。

### 從零開始寫一個 assertEqual

不需要框架，最簡單的測試就是比較「實際值」和「期望值」：

\`\`\`javascript
function assertEqual(actual, expected) {
  // 用 JSON.stringify 比較，這樣可以比較物件和陣列
  return JSON.stringify(actual) === JSON.stringify(expected);
}

// 測試你的函式
assertEqual(1 + 1, 2);              // true
assertEqual('hello', 'hello');       // true
assertEqual({a: 1}, {a: 1});         // true（物件也能比！）
assertEqual([1, 2], [1, 2]);         // true
assertEqual({a: 1}, {a: 2});         // false
\`\`\`

**為什麼要用 JSON.stringify？**

\`\`\`javascript
// JavaScript 的物件比較是比「記憶體位置」，不是比「內容」
{a: 1} === {a: 1}  // false！兩個不同的物件
[1, 2] === [1, 2]  // false！

// JSON.stringify 把物件變成字串，就可以比內容了
JSON.stringify({a: 1}) === JSON.stringify({a: 1})  // true
// '{"a":1}' === '{"a":1}'
\`\`\`

**JSON.stringify 的限制（要知道的坑）：**

\`\`\`javascript
// 順序不同 → 結果不同
JSON.stringify({a: 1, b: 2}) // '{"a":1,"b":2}'
JSON.stringify({b: 2, a: 1}) // '{"b":2,"a":1}'  ← 不一樣！

// undefined 會被忽略
JSON.stringify({a: undefined}) // '{}'

// NaN 和 Infinity 會變成 null
JSON.stringify(NaN)       // 'null'
JSON.stringify(Infinity)  // 'null'
\`\`\`

對於大多數測試情境，JSON.stringify 夠用了。知道這些限制，碰到的時候不會困惑就好。

### 進階：createTestSuite

把多個測試包成一個套件，一次跑完：

\`\`\`javascript
function createTestSuite(name) {
  const tests = [];

  return {
    // 新增一個測試
    addTest(testName, fn) {
      tests.push({ name: testName, fn });
    },
    // 跑所有測試
    run() {
      let passed = 0;
      let failed = 0;
      const results = [];

      for (const test of tests) {
        try {
          const result = test.fn();
          if (result) {
            passed++;
            results.push({ name: test.name, status: 'pass' });
          } else {
            failed++;
            results.push({ name: test.name, status: 'fail' });
          }
        } catch (e) {
          failed++;
          results.push({ name: test.name, status: 'error', error: e.message });
        }
      }

      return { name, passed, failed, total: tests.length, results };
    },
  };
}

// 使用
const suite = createTestSuite('classifyRisk 測試');
suite.addTest('3天 = critical', () => assertEqual(classifyRisk(3), 'critical'));
suite.addTest('10天 = warning', () => assertEqual(classifyRisk(10), 'warning'));
suite.addTest('20天 = safe', () => assertEqual(classifyRisk(20), 'safe'));
suite.addTest('0天 = critical', () => assertEqual(classifyRisk(0), 'critical'));
suite.addTest('7天 = warning', () => assertEqual(classifyRisk(7), 'warning')); // 邊界！
suite.addTest('14天 = safe', () => assertEqual(classifyRisk(14), 'safe'));     // 邊界！

const report = suite.run();
// { name: 'classifyRisk 測試', passed: 6, failed: 0, total: 6, results: [...] }
\`\`\`

### 測試案例怎麼想？五大類型

| 類型 | 說明 | 例子 |
|------|------|------|
| 正常路徑 | 最常見的使用情況 | \`classifyRisk(3)\` → critical |
| 邊界值 | 剛好在門檻上 | \`classifyRisk(7)\` → 7 是 critical 還是 warning？ |
| 邊界情況 | 零、負數、空值 | \`classifyRisk(0)\`、\`classifyRisk(-1)\` |
| 錯誤情況 | 應該報錯的輸入 | \`calculateDiscount(-10, 0.5)\` 應該 throw |
| 組合情況 | 多個參數的特殊組合 | \`robustStockDays(50, 10, 100)\` 安全庫存 > 現有庫存 |

### 真實專案：calculator.test.js

\`\`\`javascript
// 專案裡的測試格式（Jest 框架）
describe('calculateDaysToStockout', () => {
  it('正常情況', () => {
    expect(calculateDaysToStockout(100, 10)).toEqual({
      days: 10, status: 'warning'
    });
  });

  it('零需求', () => {
    expect(calculateDaysToStockout(100, 0)).toEqual({
      days: Infinity, status: 'ok'
    });
  });

  it('負庫存', () => {
    expect(calculateDaysToStockout(-5, 10)).toEqual({
      days: 0, status: 'critical'
    });
  });
});
\`\`\`

你的挑戰裡會自己寫 \`assertEqual\`，它就是 \`expect(...).toEqual(...)\` 的簡化版。

> **練習（對應挑戰）：** 實作 \`assertEqual(actual, expected)\`，用 JSON.stringify 比較，回傳 true/false。然後用它測試 \`add(a, b)\`。

---

## 2-6（Boss）：BOM 遞迴展開

### 什麼是 BOM？

BOM = Bill of Materials = 物料清單。它描述「一個成品需要哪些零件，每個零件又需要哪些子零件」。

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

**BOM Explosion** = 把這棵樹攤平，算出每個零件總共需要多少。

一台腳踏車需要：鋼管 3 根、焊接件 6 個、輪圈 2 個、輪胎 2 個。

### 回顧遞迴三要素

1. **終止條件（Base Case）** — 什麼時候停下來？沒有子件的時候。
2. **縮小問題** — 每次遞迴都要往下一層。
3. **安全機制** — 最大深度、循環偵測。

先複習簡單的遞迴——階乘：

\`\`\`javascript
function factorial(n) {
  if (n <= 1) return 1;        // 終止條件
  return n * factorial(n - 1); // 遞迴：問題縮小
}
// factorial(5) → 5 * factorial(4) → 5 * 4 * factorial(3) → ... → 120
\`\`\`

BOM 展開也是遞迴：「腳踏車需要什麼？」→ 看子件 → 每個子件再問「它需要什麼？」→ 直到沒有子件。

### 資料結構：bomTable

\`\`\`javascript
// bomTable 是一個陣列，每一行是「父件 → 子件」的關係
const bomTable = [
  { parent: 'bike',  child: 'frame', qtyPer: 1 },
  { parent: 'bike',  child: 'wheel', qtyPer: 2 },
  { parent: 'frame', child: 'tube',  qtyPer: 3 },
  { parent: 'wheel', child: 'rim',   qtyPer: 1 },
  { parent: 'wheel', child: 'tire',  qtyPer: 1 },
];

// 1 台 bike → 1 個 frame + 2 個 wheel
// 1 個 frame → 3 根 tube
// 1 個 wheel → 1 個 rim + 1 個 tire
//
// 展開 1 台 bike：
//   tube: 1 * 1 * 3 = 3
//   rim:  1 * 2 * 1 = 2
//   tire: 1 * 2 * 1 = 2
\`\`\`

### 基本實作思路

\`\`\`javascript
function explodeBOM(item, qty, bomTable, depth = 0, visited = new Set()) {
  const result = new Map();

  // 1. 安全機制：最大深度
  if (depth > 10) throw new Error('max depth');

  // 2. 安全機制：循環偵測
  if (visited.has(item)) throw new Error('circular');
  visited.add(item);

  // 3. 找子件
  const children = bomTable.filter(row => row.parent === item);

  // 4. 終止條件：沒有子件 → 這就是最底層的原料
  if (children.length === 0) {
    result.set(item, qty);
    return result;
  }

  // 5. 遞迴展開每個子件
  for (const child of children) {
    const childQty = qty * child.qtyPer;
    const sub = explodeBOM(
      child.child,
      childQty,
      bomTable,
      depth + 1,
      new Set(visited)  // 重要：每個分支用自己的副本！
    );

    // 合併結果
    for (const [material, amount] of sub) {
      result.set(material, (result.get(material) || 0) + amount);
    }
  }

  return result;
}
\`\`\`

### 關鍵概念 1：為什麼 \`new Set(visited)\` 而不是直接用 \`visited\`？

因為 BOM 是一棵**樹**，不是一條線。同一個零件可以出現在不同的分支裡。

\`\`\`
腳踏車
├── 前輪
│   └── 輪圈 ← 這裡用到輪圈
└── 後輪
    └── 輪圈 ← 這裡也用到，不是循環！
\`\`\`

如果共享同一個 \`visited\` Set，前輪展開時加了「輪圈」，後輪展開時就會誤判為循環。**每個分支要用自己的副本**，只追蹤「從根到目前節點」的路徑。

真正的循環是：A 需要 B，B 需要 C，C 又需要 A。這時候路徑上 A 出現了兩次。

### 關鍵概念 2：報廢率（Scrap Rate）

在真實製造業裡，零件有報廢率。比如 5% 的螺絲在組裝時會壞掉，所以需求量要乘以 \`(1 + scrap_rate)\`：

\`\`\`javascript
// bomCalculator.js 的做法
const needed = quantity * child.qty_per * (1 + (child.scrap_rate || 0));
// 如果需要 100 個螺絲，報廢率 5%，實際要準備 105 個
\`\`\`

### 關鍵概念 3：Map 的使用

用 \`Map\` 來合併結果：同一個零件可能出現在多個地方（前輪的輪圈 + 後輪的輪圈），需求量要累加。

\`\`\`javascript
// Map 基本操作
const m = new Map();
m.set('tube', 3);          // 設定
m.get('tube');              // 3
m.has('tube');              // true
m.get('bolt') || 0;        // 0（不存在時用預設值）

// 累加技巧
m.set('tube', (m.get('tube') || 0) + 3); // tube 變成 6
\`\`\`

### 真實專案：bomCalculator.js 的完整版

\`\`\`javascript
const MAX_BOM_DEPTH = 50;

function explodeBOM(parentMaterial, quantity, bomIndex, opts = {}) {
  const visited = opts._visited || new Set();
  const depth = opts._depth || 0;

  // 安全機制 1：最大深度
  if (depth > MAX_BOM_DEPTH) {
    return { error: 'MAX_DEPTH_EXCEEDED', materials: [] };
  }
  // 安全機制 2：循環偵測
  if (visited.has(parentMaterial)) {
    return { error: 'CIRCULAR_REFERENCE', materials: [] };
  }
  visited.add(parentMaterial);

  const children = bomIndex[parentMaterial] || [];
  let results = [];
  for (const child of children) {
    const needed = quantity * child.qty_per * (1 + (child.scrap_rate || 0));
    results.push({ material: child.child_material, quantity: needed, depth });

    const sub = explodeBOM(child.child_material, needed, bomIndex, {
      _visited: new Set(visited), // 每個分支用自己的 visited 副本
      _depth: depth + 1,
    });
    if (sub.error) return sub;
    results = results.concat(sub.materials);
  }
  return { error: null, materials: results };
}
\`\`\`

注意專案版本和挑戰版本的差異：
- 專案用 \`bomIndex\`（物件，key 是父件名稱），挑戰用 \`bomTable\`（陣列，用 filter 找子件）
- 專案回傳 \`{ error, materials }\`，挑戰回傳 \`Map\`
- 專案包含 scrap_rate，挑戰簡化版可能不含

### 手動追蹤：explodeBOM('bike', 1, bomTable)

\`\`\`
第 1 層：item='bike', qty=1
  子件：frame(x1), wheel(x2)

  → explodeBOM('frame', 1)
      子件：tube(x3)
      → explodeBOM('tube', 3)
          沒有子件 → 回傳 Map { tube: 3 }
      ← 結果：Map { tube: 3 }

  → explodeBOM('wheel', 2)
      子件：rim(x1), tire(x1)
      → explodeBOM('rim', 2)
          沒有子件 → 回傳 Map { rim: 2 }
      → explodeBOM('tire', 2)
          沒有子件 → 回傳 Map { tire: 2 }
      ← 結果：Map { rim: 2, tire: 2 }

最終結果：Map { tube: 3, rim: 2, tire: 2 }
\`\`\`

### 常見錯誤

| 錯誤 | 後果 | 修正 |
|------|------|------|
| 忘記 \`new Set(visited)\` | 不同分支的同名零件被誤判為循環 | 每個遞迴分支都複製 Set |
| 忘記深度檢查 | 資料有循環時無限遞迴，瀏覽器當掉 | \`if (depth > MAX) throw\` |
| 合併 Map 時覆蓋而不是累加 | 輪圈只算到 1 個而不是 2 個 | 用 \`(m.get(k) || 0) + amount\` |
| 把中間件也計入結果 | frame 和 wheel 被算進去，但它們不是原料 | 只在沒有子件時才 \`result.set\` |

> **Boss 挑戰：** 自己實作 \`explodeBOM(item, qty, bomTable)\`，回傳 Map，要能正確處理多層 BOM、循環偵測、深度限制。

---

## 附錄：World 2 概念速查表

| 概念 | 核心重點 | 對應挑戰 |
|------|---------|---------|
| 純函式 | 同輸入同輸出 + 無副作用 | 2-1：判斷純函式、改成純函式 |
| 輸入驗證 | \`typeof\` + \`isNaN\` 雙重檢查 | 2-2：validateInput、safeDivide |
| 邊界情況 | 零、負、NaN、Infinity、型別錯誤 | 2-3：robustStockDays |
| 函式組合 | 小函式串成管線 | 2-4：processInventory 管線 |
| 自動化測試 | assertEqual + JSON.stringify | 2-5：assertEqual、createTestSuite |
| BOM 遞迴 | 終止條件 + 縮小問題 + 安全機制 | 2-6：explodeBOM + 循環偵測 |
`;
