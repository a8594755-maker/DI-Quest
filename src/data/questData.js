/**
 * DI Quest — 關卡資料
 * 所有挑戰內容從 Decision-Intelligence 真實 codebase 抽出
 */

// ── 程式碼片段：來自真實 DI 專案 ────────────────────────────

export const CODE_SNIPPETS = {
  calculatorRiskThresholds: `// 來自 src/domains/inventory/calculator.js
const CRITICAL_DAYS = 7;
const WARNING_DAYS = 14;
const HIGH_VOLATILITY = 0.2;`,

  calculateDaysToStockout: `// 來自 src/domains/inventory/calculator.js
export function calculateDaysToStockout(currentStock, dailyDemand, safetyStock = 0) {
  if (typeof currentStock !== 'number' || typeof dailyDemand !== 'number') {
    return { days: null, status: 'error', message: '輸入必須是數字' };
  }
  if (currentStock < 0) currentStock = 0;
  if (dailyDemand <= 0) {
    return { days: Infinity, status: 'safe', message: '無需求，不會缺貨' };
  }
  const availableStock = Math.max(0, currentStock - safetyStock);
  const days = availableStock / dailyDemand;
  let status;
  if (days <= CRITICAL_DAYS) status = 'critical';
  else if (days <= WARNING_DAYS) status = 'warning';
  else status = 'safe';
  return { days: Math.round(days * 10) / 10, status, message: null };
}`,

  bomExplodeSnippet: `// 來自 src/domains/forecast/bomCalculator.js
const MAX_BOM_DEPTH = 50;

export function explodeBOM(parentMaterial, quantity, bomIndex, opts = {}) {
  const visited = opts._visited || new Set();
  const depth = opts._depth || 0;

  if (depth > MAX_BOM_DEPTH) {
    return { error: 'MAX_DEPTH_EXCEEDED', materials: [] };
  }
  if (visited.has(parentMaterial)) {
    return { error: 'CIRCULAR_REFERENCE', materials: [] };
  }
  visited.add(parentMaterial);

  const children = bomIndex[parentMaterial] || [];
  let results = [];
  for (const child of children) {
    const needed = quantity * child.qty_per * (1 + (child.scrap_rate || 0));
    results.push({ material: child.child_material, quantity: needed, depth });
    // 遞迴展開子組件
    const sub = explodeBOM(child.child_material, needed, bomIndex, {
      _visited: new Set(visited), _depth: depth + 1
    });
    if (sub.error) return sub;
    results = results.concat(sub.materials);
  }
  return { error: null, materials: results };
}`,

  eventBusSnippet: `// 來自 src/services/governance/eventBus.js
class EventBus {
  constructor() {
    this._listeners = new Map();
  }
  on(event, callback) {
    if (!this._listeners.has(event)) {
      this._listeners.set(event, new Set());
    }
    this._listeners.get(event).add(callback);
    return () => this.off(event, callback); // 回傳 unsubscribe
  }
  emit(event, payload) {
    const handlers = this._listeners.get(event);
    if (handlers) handlers.forEach(fn => fn(payload));
    // wildcard: 'agent:*' 匹配 'agent:start', 'agent:done' 等
    for (const [pattern, fns] of this._listeners) {
      if (pattern.endsWith('*') && event.startsWith(pattern.slice(0, -1))) {
        fns.forEach(fn => fn(payload));
      }
    }
  }
  off(event, callback) {
    this._listeners.get(event)?.delete(callback);
  }
}`,

  semaphoreSnippet: `// 來自 src/services/ai-infra/aiProxyService.js
class AsyncSemaphore {
  constructor(max) {
    this._max = max;
    this._active = 0;
    this._queue = [];
  }
  async acquire(signal) {
    if (this._active < this._max) {
      this._active++;
      return;
    }
    return new Promise((resolve, reject) => {
      const waiter = { resolve, reject };
      this._queue.push(waiter);
      signal?.addEventListener('abort', () => {
        const idx = this._queue.indexOf(waiter);
        if (idx !== -1) this._queue.splice(idx, 1);
        reject(new DOMException('Aborted', 'AbortError'));
      });
    });
  }
  release() {
    this._active--;
    if (this._queue.length > 0) {
      this._active++;
      this._queue.shift().resolve();
    }
  }
}`,

  circuitBreakerSnippet: `// 來自 src/services/ai-infra/aiProxyService.js
const STATE = { CLOSED: 'CLOSED', OPEN: 'OPEN', HALF_OPEN: 'HALF_OPEN' };

class CircuitBreaker {
  constructor({ failureThreshold = 3, cooldownMs = 60000, windowMs = 30000 } = {}) {
    this.state = STATE.CLOSED;
    this.failures = [];
    this.failureThreshold = failureThreshold;
    this.cooldownMs = cooldownMs;
    this.windowMs = windowMs;
    this.openedAt = null;
  }
  recordSuccess() {
    if (this.state === STATE.HALF_OPEN) {
      this.state = STATE.CLOSED;
      this.failures = [];
      this.cooldownMs = 60000; // reset
    }
  }
  recordFailure() {
    const now = Date.now();
    this.failures = this.failures.filter(t => now - t < this.windowMs);
    this.failures.push(now);
    if (this.failures.length >= this.failureThreshold) {
      this.state = STATE.OPEN;
      this.openedAt = now;
    }
  }
  canRequest() {
    if (this.state === STATE.CLOSED) return true;
    if (this.state === STATE.OPEN) {
      if (Date.now() - this.openedAt >= this.cooldownMs) {
        this.state = STATE.HALF_OPEN;
        return true; // 允許一次試探
      }
      return false;
    }
    return false; // HALF_OPEN 已有一個在飛
  }
}`,
}

// ── World 1: JavaScript 基礎島 ────────────────────────────

const WORLD_1_QUESTS = [
  {
    id: '1-1',
    name: '變數與型別',
    description: '學習 JavaScript 的 let / const / var 以及基本型別',
    xp: 50,
    challenges: [
      {
        id: 1,
        name: '宣告變數',
        type: 'fill-blank',
        difficulty: 'easy',
        instruction: '用 `let` 宣告一個變數 `productName`，值為 `"COMP-001"`；用 `const` 宣告 `safetyStock`，值為 `100`。',
        defaultCode: `// 宣告一個可以改變的變數 productName，值為 "COMP-001"\n_____ productName = "COMP-001";\n\n// 宣告一個不可改變的常數 safetyStock，值為 100\n_____ safetyStock = 100;\n\nconsole.log(productName, safetyStock);`,
        solution: `let productName = "COMP-001";\nconst safetyStock = 100;\nconsole.log(productName, safetyStock);`,
        example: {
          title: '範例：let 與 const 的用法',
          code: 'let city = "Taipei";\nconst PI = 3.14;\nconsole.log(city, PI);',
          output: 'Taipei 3.14',
          explanation: 'let 宣告可以改變的變數，const 宣告不可改變的常數。',
        },
        tests: [
          { description: 'productName 等於 "COMP-001"', fn: '(ctx) => ctx.productName === "COMP-001"' },
          { description: 'safetyStock 等於 100', fn: '(ctx) => ctx.safetyStock === 100' },
        ],
        returnVars: ['productName', 'safetyStock'],
      },
      {
        id: 2,
        name: '型別判斷',
        type: 'coding',
        difficulty: 'easy',
        instruction: '寫一個函式 `getType(value)`，回傳 value 的型別字串（用 `typeof`）。',
        defaultCode: `function getType(value) {\n  // 回傳 value 的型別\n  \n}\n\nconsole.log(getType(42));\nconsole.log(getType("hello"));\nconsole.log(getType(true));`,
        example: {
          title: '範例：typeof 運算子',
          code: 'let x = 100;\nconsole.log(typeof x);\nconsole.log(typeof "hello");',
          output: 'number\nstring',
          explanation: 'typeof 會回傳一個字串，告訴你該值的型別，例如 "number"、"string"、"boolean" 等。',
        },
        tests: [
          { description: 'getType(42) === "number"', fn: '(ctx) => ctx.getType(42) === "number"' },
          { description: 'getType("hi") === "string"', fn: '(ctx) => ctx.getType("hi") === "string"' },
          { description: 'getType(true) === "boolean"', fn: '(ctx) => ctx.getType(true) === "boolean"' },
          { description: 'getType(null) === "object"', fn: '(ctx) => ctx.getType(null) === "object"' },
          { description: 'getType(undefined) === "undefined"', fn: '(ctx) => ctx.getType(undefined) === "undefined"' },
        ],
        returnVars: ['getType'],
      },
      {
        id: 3,
        name: '型別轉換',
        type: 'coding',
        difficulty: 'medium',
        instruction: '寫一個函式 `parseStock(value)`，把字串或數字轉成整數。如果無法轉換回傳 `0`。',
        defaultCode: `function parseStock(value) {\n  // 把 value 轉成整數，無法轉換回傳 0\n  \n}\n\nconsole.log(parseStock("150"));  // 150\nconsole.log(parseStock("abc"));  // 0\nconsole.log(parseStock(42.7));   // 42`,
        example: {
          title: '範例：parseInt 轉換字串為整數',
          code: 'let result = parseInt("99");\nconsole.log(result);\nconsole.log(parseInt("xyz"));\nconsole.log(isNaN(parseInt("xyz")));',
          output: '99\nNaN\ntrue',
          explanation: 'parseInt 可以把字串轉成整數，如果無法轉換會回傳 NaN。可以用 isNaN() 來檢查是否轉換失敗。',
        },
        tests: [
          { description: 'parseStock("150") === 150', fn: '(ctx) => ctx.parseStock("150") === 150' },
          { description: 'parseStock("abc") === 0', fn: '(ctx) => ctx.parseStock("abc") === 0' },
          { description: 'parseStock(42.7) === 42', fn: '(ctx) => ctx.parseStock(42.7) === 42' },
          { description: 'parseStock("") === 0', fn: '(ctx) => ctx.parseStock("") === 0' },
          { description: 'parseStock(null) === 0', fn: '(ctx) => ctx.parseStock(null) === 0' },
        ],
        returnVars: ['parseStock'],
      },
    ],
  },
  {
    id: '1-2',
    name: '函式與 return',
    description: '學習如何定義函式、參數、以及 return 的重要性',
    xp: 50,
    challenges: [
      {
        id: 1,
        name: '第一個函式',
        type: 'coding',
        difficulty: 'easy',
        instruction: '寫一個函式 `add(a, b)` 回傳兩數相加的結果。',
        defaultCode: `function add(a, b) {\n  // 回傳 a + b\n  \n}`,
        example: {
          title: '範例：函式與 return',
          code: 'function multiply(a, b) {\n  return a * b;\n}\nconsole.log(multiply(3, 4));',
          output: '12',
          explanation: '函式用 return 把結果傳回去。如果沒寫 return，函式會回傳 undefined。',
        },
        tests: [
          { description: 'add(1, 2) === 3', fn: '(ctx) => ctx.add(1, 2) === 3' },
          { description: 'add(0, 0) === 0', fn: '(ctx) => ctx.add(0, 0) === 0' },
          { description: 'add(-5, 5) === 0', fn: '(ctx) => ctx.add(-5, 5) === 0' },
        ],
        returnVars: ['add'],
      },
      {
        id: 2,
        name: '預設參數',
        type: 'coding',
        difficulty: 'easy',
        instruction: '寫一個函式 `greet(name, greeting = "你好")`，回傳 `"你好, 小明"` 這樣的格式。',
        defaultCode: `function greet(name, greeting = "你好") {\n  // 回傳 greeting + ", " + name\n  \n}`,
        example: {
          title: '範例：預設參數',
          code: 'function introduce(name, role = "工程師") {\n  return name + " 是 " + role;\n}\nconsole.log(introduce("Amy"));\nconsole.log(introduce("Bob", "設計師"));',
          output: 'Amy 是 工程師\nBob 是 設計師',
          explanation: '參數可以給預設值，呼叫時沒傳就會用預設值，有傳就會覆蓋。',
        },
        tests: [
          { description: 'greet("小明") === "你好, 小明"', fn: '(ctx) => ctx.greet("小明") === "你好, 小明"' },
          { description: 'greet("DI", "嗨") === "嗨, DI"', fn: '(ctx) => ctx.greet("DI", "嗨") === "嗨, DI"' },
        ],
        returnVars: ['greet'],
      },
      {
        id: 3,
        name: '箭頭函式與解構',
        type: 'coding',
        difficulty: 'medium',
        instruction: '用箭頭函式寫 `getStockInfo`，接收一個物件 `{ materialCode, quantity, unit }`，回傳字串 `"COMP-001: 500 PCS"`。',
        defaultCode: `// 用箭頭函式 + 解構參數\nconst getStockInfo = () => {\n  // 你的程式碼\n};\n\nconsole.log(getStockInfo({ materialCode: "COMP-001", quantity: 500, unit: "PCS" }));`,
        example: {
          title: '範例：箭頭函式 + 解構參數',
          code: 'const getUserInfo = ({ name, age }) => {\n  return `${name} (${age}歲)`;\n};\nconsole.log(getUserInfo({ name: "Alice", age: 25 }));',
          output: 'Alice (25歲)',
          explanation: '箭頭函式的參數可以直接用 { } 解構物件，取出需要的屬性。搭配模板字串 `${}` 組合輸出。',
        },
        tests: [
          { description: '正常情況', fn: '(ctx) => ctx.getStockInfo({ materialCode: "COMP-001", quantity: 500, unit: "PCS" }) === "COMP-001: 500 PCS"' },
          { description: '不同資料', fn: '(ctx) => ctx.getStockInfo({ materialCode: "RM-002", quantity: 1000, unit: "KG" }) === "RM-002: 1000 KG"' },
        ],
        returnVars: ['getStockInfo'],
      },
    ],
  },
  {
    id: '1-3',
    name: '條件判斷',
    description: '學習 if/else 與條件運算子',
    xp: 50,
    challenges: [
      {
        id: 1,
        name: '風險等級分類',
        type: 'coding',
        difficulty: 'easy',
        instruction: '寫一個函式 `classifyRisk(days)`，依據庫存天數回傳風險等級：\n- days <= 7 → "critical"\n- days <= 14 → "warning"\n- 其他 → "safe"\n\n（這就是你真實專案 calculator.js 裡的邏輯！）',
        defaultCode: `// DI 專案裡的常數\nconst CRITICAL_DAYS = 7;\nconst WARNING_DAYS = 14;\n\nfunction classifyRisk(days) {\n  // 你的程式碼\n  \n}`,
        referenceCode: CODE_SNIPPETS.calculatorRiskThresholds,
        example: {
          title: '範例：if / else if / else',
          code: 'function getSize(weight) {\n  if (weight <= 5) return "S";\n  else if (weight <= 20) return "M";\n  else return "L";\n}\nconsole.log(getSize(3));\nconsole.log(getSize(15));',
          output: 'S\nM',
          explanation: '用 if/else if/else 依條件分支回傳不同的值。注意順序很重要，先判斷最小的範圍。',
        },
        tests: [
          { description: 'classifyRisk(3) === "critical"', fn: '(ctx) => ctx.classifyRisk(3) === "critical"' },
          { description: 'classifyRisk(7) === "critical"', fn: '(ctx) => ctx.classifyRisk(7) === "critical"' },
          { description: 'classifyRisk(10) === "warning"', fn: '(ctx) => ctx.classifyRisk(10) === "warning"' },
          { description: 'classifyRisk(14) === "warning"', fn: '(ctx) => ctx.classifyRisk(14) === "warning"' },
          { description: 'classifyRisk(30) === "safe"', fn: '(ctx) => ctx.classifyRisk(30) === "safe"' },
        ],
        returnVars: ['classifyRisk'],
      },
      {
        id: 2,
        name: '成績分級',
        type: 'coding',
        difficulty: 'medium',
        instruction: '寫 `gradeScore(score)`：90+ → "A", 80+ → "B", 70+ → "C", 60+ → "D", 其他 → "F"。分數 < 0 或 > 100 回傳 "Invalid"。',
        defaultCode: `function gradeScore(score) {\n  // 你的程式碼\n  \n}`,
        example: {
          title: '範例：多層條件判斷',
          code: 'function tempLabel(temp) {\n  if (temp < 0) return "freezing";\n  else if (temp < 15) return "cold";\n  else if (temp < 30) return "warm";\n  else return "hot";\n}\nconsole.log(tempLabel(25));',
          output: 'warm',
          explanation: '多個 else if 可以處理多個區間，從上到下依序判斷，第一個符合的就回傳。',
        },
        tests: [
          { description: 'gradeScore(95) === "A"', fn: '(ctx) => ctx.gradeScore(95) === "A"' },
          { description: 'gradeScore(82) === "B"', fn: '(ctx) => ctx.gradeScore(82) === "B"' },
          { description: 'gradeScore(71) === "C"', fn: '(ctx) => ctx.gradeScore(71) === "C"' },
          { description: 'gradeScore(60) === "D"', fn: '(ctx) => ctx.gradeScore(60) === "D"' },
          { description: 'gradeScore(45) === "F"', fn: '(ctx) => ctx.gradeScore(45) === "F"' },
          { description: 'gradeScore(-5) === "Invalid"', fn: '(ctx) => ctx.gradeScore(-5) === "Invalid"' },
          { description: 'gradeScore(105) === "Invalid"', fn: '(ctx) => ctx.gradeScore(105) === "Invalid"' },
        ],
        returnVars: ['gradeScore'],
      },
      {
        id: 3,
        name: '三元運算子',
        type: 'coding',
        difficulty: 'medium',
        instruction: '寫 `getStockLabel(qty, safetyStock)` 用三元運算子，若 qty > safetyStock 回傳 "充足"，否則 "不足"。',
        defaultCode: `function getStockLabel(qty, safetyStock) {\n  // 用三元運算子 (? :)\n  \n}`,
        example: {
          title: '範例：三元運算子 (? :)',
          code: 'let age = 20;\nlet label = age >= 18 ? "成人" : "未成年";\nconsole.log(label);',
          output: '成人',
          explanation: '三元運算子的格式是 條件 ? 值A : 值B。條件為 true 回傳值A，false 回傳值B。比 if/else 更簡潔。',
        },
        tests: [
          { description: '庫存充足', fn: '(ctx) => ctx.getStockLabel(500, 100) === "充足"' },
          { description: '庫存不足', fn: '(ctx) => ctx.getStockLabel(50, 100) === "不足"' },
          { description: '剛好等於', fn: '(ctx) => ctx.getStockLabel(100, 100) === "不足"' },
        ],
        returnVars: ['getStockLabel'],
      },
    ],
  },
  {
    id: '1-4',
    name: '物件與解構',
    description: '理解 JavaScript 物件，以及專案裡的資料結構',
    xp: 50,
    challenges: [
      {
        id: 1,
        name: '建立庫存物件',
        type: 'coding',
        difficulty: 'easy',
        instruction: '建立一個函式 `createInventoryItem(code, stock, demand)`，回傳物件 `{ materialCode, currentStock, dailyDemand }`。',
        defaultCode: `function createInventoryItem(code, stock, demand) {\n  // 回傳一個物件\n  \n}`,
        example: {
          title: '範例：建立並回傳物件',
          code: 'function createUser(name, age) {\n  return { userName: name, userAge: age };\n}\nconsole.log(createUser("Amy", 25));',
          output: '{ userName: "Amy", userAge: 25 }',
          explanation: '用 { key: value } 建立物件，函式參數可以當作 value 放進去。',
        },
        tests: [
          { description: '回傳正確物件', fn: '(ctx) => { const r = ctx.createInventoryItem("COMP-001", 500, 50); return r.materialCode === "COMP-001" && r.currentStock === 500 && r.dailyDemand === 50; }' },
        ],
        returnVars: ['createInventoryItem'],
      },
      {
        id: 2,
        name: '解構賦值',
        type: 'coding',
        difficulty: 'medium',
        instruction: '寫 `summarizeItem(item)` 接收 `{ materialCode, currentStock, dailyDemand, safetyStock }` 物件，用解構取出屬性，回傳字串 `"COMP-001: 庫存 500, 日需求 50, 安全庫存 100"`。',
        defaultCode: `function summarizeItem(item) {\n  // 用解構賦值取出屬性\n  \n}`,
        example: {
          title: '範例：解構賦值',
          code: 'const book = { title: "JS入門", price: 350 };\nconst { title, price } = book;\nconsole.log(`${title} 售價 ${price}元`);',
          output: 'JS入門 售價 350元',
          explanation: '解構賦值用 const { key1, key2 } = obj 從物件中取出屬性，變數名稱必須跟屬性名稱一樣。',
        },
        tests: [
          { description: '格式正確', fn: '(ctx) => ctx.summarizeItem({ materialCode: "COMP-001", currentStock: 500, dailyDemand: 50, safetyStock: 100 }) === "COMP-001: 庫存 500, 日需求 50, 安全庫存 100"' },
        ],
        returnVars: ['summarizeItem'],
      },
      {
        id: 3,
        name: '展開運算子',
        type: 'coding',
        difficulty: 'medium',
        instruction: '寫 `updateStock(item, newStock)` 用展開運算子 `{...item}` 回傳一個新物件，只更新 `currentStock`，不修改原物件。',
        defaultCode: `function updateStock(item, newStock) {\n  // 用 spread operator 建立新物件\n  \n}`,
        example: {
          title: '範例：展開運算子 {...}',
          code: 'const original = { name: "Amy", score: 80 };\nconst updated = { ...original, score: 95 };\nconsole.log(updated);\nconsole.log(original.score);',
          output: '{ name: "Amy", score: 95 }\n80',
          explanation: '{ ...obj, key: newValue } 會複製一份物件，再覆蓋指定的屬性。原物件不會被改變。',
        },
        tests: [
          { description: '更新庫存值', fn: '(ctx) => { const orig = { materialCode: "X", currentStock: 100 }; const updated = ctx.updateStock(orig, 200); return updated.currentStock === 200 && updated.materialCode === "X"; }' },
          { description: '不修改原物件', fn: '(ctx) => { const orig = { materialCode: "X", currentStock: 100 }; ctx.updateStock(orig, 200); return orig.currentStock === 100; }' },
        ],
        returnVars: ['updateStock'],
      },
    ],
  },
  {
    id: '1-5',
    name: '陣列與迴圈',
    description: '用 map, filter, reduce 處理庫存資料',
    xp: 50,
    challenges: [
      {
        id: 1,
        name: '過濾低庫存',
        type: 'coding',
        difficulty: 'easy',
        instruction: '寫 `filterLowStock(items, threshold)` 用 `.filter()` 回傳 `currentStock < threshold` 的物件陣列。',
        defaultCode: `function filterLowStock(items, threshold) {\n  // 用 .filter()\n  \n}\n\n// 測試資料（來自你專案的 inventory_snapshots.csv）\nconst inventory = [\n  { materialCode: "COMP-001", currentStock: 50 },\n  { materialCode: "COMP-002", currentStock: 500 },\n  { materialCode: "COMP-003", currentStock: 80 },\n];`,
        example: {
          title: '範例：.filter() 過濾陣列',
          code: 'const nums = [3, 8, 1, 12, 5];\nconst big = nums.filter(n => n > 5);\nconsole.log(big);',
          output: '[8, 12]',
          explanation: '.filter(fn) 會回傳一個新陣列，只留下讓 fn 回傳 true 的元素。原陣列不會改變。',
        },
        tests: [
          { description: '過濾出低庫存', fn: '(ctx) => { const r = ctx.filterLowStock([{materialCode:"A",currentStock:50},{materialCode:"B",currentStock:500}], 100); return r.length === 1 && r[0].materialCode === "A"; }' },
          { description: '全部都低', fn: '(ctx) => ctx.filterLowStock([{currentStock:1},{currentStock:2}], 10).length === 2' },
          { description: '沒有低庫存', fn: '(ctx) => ctx.filterLowStock([{currentStock:100}], 10).length === 0' },
        ],
        returnVars: ['filterLowStock'],
      },
      {
        id: 2,
        name: '加總庫存',
        type: 'coding',
        difficulty: 'medium',
        instruction: '寫 `totalStock(items)` 用 `.reduce()` 回傳所有 `currentStock` 的總和。',
        defaultCode: `function totalStock(items) {\n  // 用 .reduce() 加總 currentStock\n  \n}`,
        example: {
          title: '範例：.reduce() 加總數字',
          code: 'const prices = [30, 50, 20];\nconst total = prices.reduce((sum, p) => sum + p, 0);\nconsole.log(total);',
          output: '100',
          explanation: '.reduce(fn, 初始值) 把陣列「縮減」成一個值。fn 的第一個參數是累積值，第二個是當前元素。',
        },
        tests: [
          { description: '正常加總', fn: '(ctx) => ctx.totalStock([{currentStock:100},{currentStock:200},{currentStock:300}]) === 600' },
          { description: '空陣列', fn: '(ctx) => ctx.totalStock([]) === 0' },
        ],
        returnVars: ['totalStock'],
      },
      {
        id: 3,
        name: '轉換資料格式',
        type: 'coding',
        difficulty: 'medium',
        instruction: '寫 `toStockMap(items)` 用 `.reduce()` 把陣列轉成物件 `{ "COMP-001": 500, "COMP-002": 80 }`，key 是 materialCode，value 是 currentStock。',
        defaultCode: `function toStockMap(items) {\n  // 用 .reduce() 轉成 { code: stock } 格式\n  \n}`,
        example: {
          title: '範例：.reduce() 把陣列轉成物件',
          code: 'const fruits = [\n  { name: "apple", qty: 3 },\n  { name: "banana", qty: 5 }\n];\nconst map = fruits.reduce((obj, f) => {\n  obj[f.name] = f.qty;\n  return obj;\n}, {});\nconsole.log(map);',
          output: '{ apple: 3, banana: 5 }',
          explanation: '.reduce() 不只能加總數字，也能把陣列轉成物件。初始值給 {}，每次把元素的資料放進去。',
        },
        tests: [
          { description: '轉換正確', fn: '(ctx) => { const r = ctx.toStockMap([{materialCode:"A",currentStock:100},{materialCode:"B",currentStock:200}]); return r.A === 100 && r.B === 200; }' },
          { description: '空陣列', fn: '(ctx) => Object.keys(ctx.toStockMap([])).length === 0' },
        ],
        returnVars: ['toStockMap'],
      },
    ],
  },
  {
    id: '1-6',
    name: 'Boss: 讀懂 calculator.js',
    description: '閱讀你真實專案的 calculateDaysToStockout 函式，理解它的邏輯並自己重寫',
    xp: 200,
    isBoss: true,
    challenges: [
      {
        id: 1,
        name: '重寫 calculateDaysToStockout',
        type: 'coding',
        difficulty: 'hard',
        instruction: '參考右側的真實程式碼，自己重寫 `calculateDaysToStockout(currentStock, dailyDemand, safetyStock)`。\n\n規則：\n- 如果輸入不是數字 → `{ days: null, status: "error" }`\n- 如果 currentStock < 0 → 當作 0\n- 如果 dailyDemand <= 0 → `{ days: Infinity, status: "safe" }`\n- 否則算 `(currentStock - safetyStock) / dailyDemand`（不能是負的）\n- days <= 7 是 "critical"，<= 14 是 "warning"，其他是 "safe"',
        defaultCode: `const CRITICAL_DAYS = 7;\nconst WARNING_DAYS = 14;\n\nfunction calculateDaysToStockout(currentStock, dailyDemand, safetyStock = 0) {\n  // 你的程式碼\n  \n}`,
        referenceCode: CODE_SNIPPETS.calculateDaysToStockout,
        example: {
          title: '範例：結合驗證、條件分支與物件回傳',
          code: 'function checkBattery(level) {\n  if (typeof level !== "number") return { pct: null, status: "error" };\n  if (level <= 0) return { pct: 0, status: "dead" };\n  let status = level <= 20 ? "low" : "ok";\n  return { pct: level, status };\n}\nconsole.log(checkBattery(15));',
          output: '{ pct: 15, status: "low" }',
          explanation: '先做型別檢查，再處理邊界值，最後用條件決定 status。Boss 關的結構跟這個類似，但多了除法運算和預設參數。',
        },
        tests: [
          { description: '正常情況', fn: '(ctx) => { const r = ctx.calculateDaysToStockout(500, 50, 0); return r.days === 10 && r.status === "warning"; }' },
          { description: '扣除安全庫存', fn: '(ctx) => { const r = ctx.calculateDaysToStockout(500, 50, 100); return r.days === 8 && r.status === "warning"; }' },
          { description: '危急狀態', fn: '(ctx) => { const r = ctx.calculateDaysToStockout(100, 50, 0); return r.days === 2 && r.status === "critical"; }' },
          { description: '無需求', fn: '(ctx) => { const r = ctx.calculateDaysToStockout(100, 0); return r.days === Infinity && r.status === "safe"; }' },
          { description: '負庫存當作 0', fn: '(ctx) => { const r = ctx.calculateDaysToStockout(-10, 5); return r.days === 0 && r.status === "critical"; }' },
          { description: '輸入不是數字', fn: '(ctx) => { const r = ctx.calculateDaysToStockout("abc", 5); return r.days === null && r.status === "error"; }' },
          { description: '安全庫存大於現有庫存', fn: '(ctx) => { const r = ctx.calculateDaysToStockout(50, 10, 100); return r.days === 0 && r.status === "critical"; }' },
        ],
        returnVars: ['calculateDaysToStockout'],
      },
    ],
  },
]

// ── World 定義 ────────────────────────────────────────────

export const WORLDS = [
  {
    id: 1,
    name: 'JavaScript 基礎島',
    emoji: '🏝️',
    description: '在這座島上，你要學會用程式碼跟電腦溝通',
    color: 'from-emerald-500 to-teal-600',
    quests: WORLD_1_QUESTS,
  },
  {
    id: 2,
    name: '純函式神殿',
    emoji: '⛩️',
    description: '掌握寫出可測試、無副作用的程式碼的能力',
    color: 'from-blue-500 to-indigo-600',
    quests: [
      {
        id: '2-1', name: '什麼是純函式', description: '判斷並寫出純函式', xp: 50,
        challenges: [
          {
            id: 1, name: '判斷純函式', type: 'coding', difficulty: 'easy',
            instruction: '寫一個函式 `isPure(fn)`（概念題）。以下四個函式，寫一個 `answers` 陣列，標記哪些是純函式（true/false）。\n\n1. `(a, b) => a + b`\n2. `(arr) => { arr.push(1); return arr; }`（修改了傳入的陣列）\n3. `(x) => Math.random() * x`（用了 Math.random）\n4. `(items) => items.filter(i => i > 0)`（filter 不修改原陣列）',
            defaultCode: `// 回傳一個陣列，標記四個函式是否為純函式\nconst answers = [\n  // 1. (a, b) => a + b\n  undefined, // 改成 true 或 false\n  // 2. (arr) => { arr.push(1); return arr; }\n  undefined,\n  // 3. (x) => Math.random() * x\n  undefined,\n  // 4. (items) => items.filter(i => i > 0)\n  undefined,\n];`,
            example: {
              title: '範例：判斷是否為純函式',
              code: '// (x) => x * 2         → 純函式\n// (x) => Date.now() + x → 不是（依賴外部狀態）\nconst demo = [true, false];',
              output: '[true, false]',
              explanation: '純函式：不依賴外部狀態、不修改輸入、相同輸入永遠回傳相同輸出。',
            },
            tests: [
              { description: '函式1是純函式', fn: '(ctx) => ctx.answers[0] === true' },
              { description: '函式2不是純函式（修改了輸入）', fn: '(ctx) => ctx.answers[1] === false' },
              { description: '函式3不是純函式（用了隨機）', fn: '(ctx) => ctx.answers[2] === false' },
              { description: '函式4是純函式', fn: '(ctx) => ctx.answers[3] === true' },
            ],
            returnVars: ['answers'],
          },
          {
            id: 2, name: '改成純函式', type: 'coding', difficulty: 'medium',
            instruction: '下面這個函式不是純函式（依賴外部變數 taxRate）。把它改成純函式，讓 taxRate 變成參數。',
            defaultCode: `// 改成純函式：把 taxRate 變成參數\nfunction calculateTax(price, taxRate) {\n  // 回傳 price * taxRate\n  \n}`,
            example: {
              title: '範例：將不純函式改成純函式',
              code: '// 不純：const rate = 0.1; function fee(x) { return x * rate; }\n// 純：function fee(x, rate) { return x * rate; }\nfee(50, 0.1); // 5',
              output: '5',
              explanation: '把外部依賴的變數改成函式參數，就變成純函式了。',
            },
            tests: [
              { description: 'calculateTax(100, 0.05) === 5', fn: '(ctx) => ctx.calculateTax(100, 0.05) === 5' },
              { description: 'calculateTax(200, 0.1) === 20', fn: '(ctx) => ctx.calculateTax(200, 0.1) === 20' },
              { description: 'calculateTax(0, 0.05) === 0', fn: '(ctx) => ctx.calculateTax(0, 0.05) === 0' },
            ],
            returnVars: ['calculateTax'],
          },
        ],
      },
      {
        id: '2-2', name: '輸入驗證', description: '幫函式加上型別和範圍驗證', xp: 50,
        challenges: [
          {
            id: 1, name: '數字驗證', type: 'coding', difficulty: 'easy',
            instruction: '寫 `validateNumber(value)` — 如果 typeof value === "number" 且 !isNaN(value) 回傳 true，否則回傳 false。',
            defaultCode: `function validateNumber(value) {\n  // 檢查是否為有效數字\n  \n}`,
            example: {
              title: '範例：檢查字串是否為非空',
              code: 'function isNonEmpty(s) {\n  return typeof s === "string" && s.length > 0;\n}\nisNonEmpty("hi"); // true',
              output: 'true',
              explanation: '先用 typeof 確認型別，再檢查內容，兩個條件都滿足才回傳 true。',
            },
            tests: [
              { description: 'validateNumber(42) === true', fn: '(ctx) => ctx.validateNumber(42) === true' },
              { description: 'validateNumber("42") === false', fn: '(ctx) => ctx.validateNumber("42") === false' },
              { description: 'validateNumber(NaN) === false', fn: '(ctx) => ctx.validateNumber(NaN) === false' },
              { description: 'validateNumber(0) === true', fn: '(ctx) => ctx.validateNumber(0) === true' },
              { description: 'validateNumber(null) === false', fn: '(ctx) => ctx.validateNumber(null) === false' },
            ],
            returnVars: ['validateNumber'],
          },
          {
            id: 2, name: '驗證折扣函式', type: 'coding', difficulty: 'medium',
            instruction: '寫 `calculateDiscount(price, rate)`：\n- price 必須是正數（> 0），否則 throw Error("price must be positive")\n- rate 必須在 0-1 之間，否則 throw Error("rate must be between 0 and 1")\n- 回傳 `price * (1 - rate)`',
            defaultCode: `function calculateDiscount(price, rate) {\n  // 驗證 price 和 rate\n  // 回傳折扣後的價格\n  \n}`,
            example: {
              title: '範例：帶驗證的加法函式',
              code: 'function safeAdd(a, b) {\n  if (typeof a !== "number") throw Error("a must be number");\n  return a + b;\n}\nsafeAdd(3, 4); // 7',
              output: '7',
              explanation: '先驗證輸入，不合法就 throw Error，合法才計算回傳。',
            },
            tests: [
              { description: '正常折扣', fn: '(ctx) => ctx.calculateDiscount(100, 0.2) === 80' },
              { description: '無折扣', fn: '(ctx) => ctx.calculateDiscount(100, 0) === 100' },
              { description: '負價格報錯', fn: '(ctx) => { try { ctx.calculateDiscount(-10, 0.1); return false; } catch(e) { return e.message === "price must be positive"; } }' },
              { description: 'rate 超過 1 報錯', fn: '(ctx) => { try { ctx.calculateDiscount(100, 1.5); return false; } catch(e) { return e.message === "rate must be between 0 and 1"; } }' },
              { description: 'rate 負數報錯', fn: '(ctx) => { try { ctx.calculateDiscount(100, -0.1); return false; } catch(e) { return e.message === "rate must be between 0 and 1"; } }' },
            ],
            returnVars: ['calculateDiscount'],
          },
          {
            id: 3, name: '安全的除法', type: 'coding', difficulty: 'medium',
            instruction: '寫 `safeDivide(a, b)` — 如果 a 或 b 不是數字回傳 `{ error: "invalid input", result: null }`，如果 b 是 0 回傳 `{ error: "division by zero", result: null }`，否則回傳 `{ error: null, result: a/b }`。',
            defaultCode: `function safeDivide(a, b) {\n  // 你的程式碼\n  \n}`,
            example: {
              title: '範例：安全的平方根',
              code: 'function safeSqrt(x) {\n  if (typeof x !== "number") return { error: "not a number", result: null };\n  if (x < 0) return { error: "negative", result: null };\n  return { error: null, result: Math.sqrt(x) };\n}',
              output: '{ error: null, result: 3 }  // safeSqrt(9)',
              explanation: '用物件回傳錯誤資訊而非 throw，讓呼叫者能優雅處理錯誤。',
            },
            tests: [
              { description: '正常除法', fn: '(ctx) => { const r = ctx.safeDivide(10, 2); return r.error === null && r.result === 5; }' },
              { description: '除以零', fn: '(ctx) => ctx.safeDivide(10, 0).error === "division by zero"' },
              { description: '非數字輸入', fn: '(ctx) => ctx.safeDivide("a", 2).error === "invalid input"' },
            ],
            returnVars: ['safeDivide'],
          },
        ],
      },
      {
        id: '2-3', name: '邊界情況', description: '處理各種邊界情況', xp: 50,
        challenges: [
          {
            id: 1, name: '數值夾限', type: 'coding', difficulty: 'easy',
            instruction: '寫 `clamp(value, min, max)` — 把 value 限制在 min 到 max 之間。如果 value < min 回傳 min，如果 value > max 回傳 max，否則回傳 value。',
            defaultCode: `function clamp(value, min, max) {\n  // 把 value 限制在 min 到 max 之間\n  \n}`,
            example: {
              title: '範例：限制百分比在 0~100',
              code: 'function limitPercent(v) {\n  if (v < 0) return 0;\n  if (v > 100) return 100;\n  return v;\n}\nlimitPercent(120); // 100',
              output: '100',
              explanation: '超出上限回傳上限，低於下限回傳下限，範圍內直接回傳。',
            },
            tests: [
              { description: 'clamp(5, 0, 10) === 5', fn: '(ctx) => ctx.clamp(5, 0, 10) === 5' },
              { description: 'clamp(-3, 0, 10) === 0', fn: '(ctx) => ctx.clamp(-3, 0, 10) === 0' },
              { description: 'clamp(15, 0, 10) === 10', fn: '(ctx) => ctx.clamp(15, 0, 10) === 10' },
              { description: 'clamp(0, 0, 10) === 0', fn: '(ctx) => ctx.clamp(0, 0, 10) === 0' },
              { description: 'clamp(10, 0, 10) === 10', fn: '(ctx) => ctx.clamp(10, 0, 10) === 10' },
            ],
            returnVars: ['clamp'],
          },
          {
            id: 2, name: '健壯的庫存計算', type: 'coding', difficulty: 'hard',
            instruction: '寫 `robustStockDays(stock, demand, safety)`，處理所有邊界：\n- 任何參數不是 number 或是 NaN → `{ days: null, error: "invalid" }`\n- stock < 0 → 當作 0\n- demand <= 0 → `{ days: Infinity, error: null }`\n- safety 未傳 → 預設 0\n- 正常算 `Math.max(0, (stock - safety) / demand)` → `{ days: 結果, error: null }`',
            defaultCode: `function robustStockDays(stock, demand, safety = 0) {\n  // 處理所有邊界情況\n  \n}`,
            example: {
              title: '範例：安全的速度計算',
              code: 'function safeSpeed(dist, time) {\n  if (typeof dist !== "number" || isNaN(dist)) return { speed: null, error: "invalid" };\n  if (time <= 0) return { speed: Infinity, error: null };\n  return { speed: dist / time, error: null };\n}',
              output: '{ speed: 50, error: null }  // safeSpeed(100, 2)',
              explanation: '先檢查型別和 NaN，再處理除以零的邊界，最後正常計算。',
            },
            tests: [
              { description: '正常', fn: '(ctx) => { const r = ctx.robustStockDays(100, 10); return r.days === 10 && r.error === null; }' },
              { description: '負庫存', fn: '(ctx) => ctx.robustStockDays(-5, 10).days === 0' },
              { description: '零需求', fn: '(ctx) => ctx.robustStockDays(100, 0).days === Infinity' },
              { description: '非數字', fn: '(ctx) => ctx.robustStockDays("abc", 10).error === "invalid"' },
              { description: 'NaN', fn: '(ctx) => ctx.robustStockDays(NaN, 10).error === "invalid"' },
              { description: '安全庫存大於現有', fn: '(ctx) => ctx.robustStockDays(50, 10, 100).days === 0' },
            ],
            returnVars: ['robustStockDays'],
          },
        ],
      },
      {
        id: '2-4', name: '函式組合', description: '串接多個純函式', xp: 50,
        challenges: [
          {
            id: 1, name: '兩函式組合', type: 'coding', difficulty: 'easy',
            instruction: '寫 `compose2(f, g)` — 回傳一個新函式，執行時先呼叫 g(x)，再把結果傳給 f，也就是 f(g(x))。',
            defaultCode: `function compose2(f, g) {\n  // 回傳一個函式，做 f(g(x))\n  \n}`,
            example: {
              title: '範例：簡單的函式包裝',
              code: 'function wrap(fn) {\n  return (x) => fn(x);\n}\nconst abs = wrap(Math.abs);\nabs(-7); // 7',
              output: '7',
              explanation: '回傳一個新函式，內部呼叫傳入的函式 — 這就是高階函式的基本概念。',
            },
            tests: [
              { description: 'compose2(double, addOne)(3) === 8', fn: '(ctx) => { const double = x => x * 2; const addOne = x => x + 1; return ctx.compose2(double, addOne)(3) === 8; }' },
              { description: 'compose2(String, Math.abs)(-5) === "5"', fn: '(ctx) => ctx.compose2(String, Math.abs)(-5) === "5"' },
              { description: '回傳的是函式', fn: '(ctx) => typeof ctx.compose2(x=>x, x=>x) === "function"' },
            ],
            returnVars: ['compose2'],
          },
          {
            id: 2, name: '管線處理', type: 'coding', difficulty: 'medium',
            instruction: '給定庫存陣列，完成 `processInventory(items)` 函式：\n1. 過濾掉 dailyDemand <= 0 的\n2. 計算每個的 daysRemaining = currentStock / dailyDemand\n3. 加上 risk 欄位：< 7 是 "critical"，< 14 是 "warning"，其他 "safe"\n4. 按 daysRemaining 由小到大排序\n5. 回傳結果陣列',
            defaultCode: `function processInventory(items) {\n  // 用 .filter().map().sort() 管線處理\n  \n}`,
            example: {
              title: '範例：陣列管線 filter + map + sort',
              code: 'const nums = [3, -1, 4, -5, 2];\nconst result = nums\n  .filter(n => n > 0)\n  .map(n => n * 10)\n  .sort((a, b) => a - b);\n// [20, 30, 40]',
              output: '[20, 30, 40]',
              explanation: '用 .filter().map().sort() 串接，每一步都回傳新陣列，不修改原始資料。',
            },
            tests: [
              { description: '過濾+計算+排序', fn: `(ctx) => {
                const items = [
                  { code: "A", currentStock: 100, dailyDemand: 50 },
                  { code: "B", currentStock: 200, dailyDemand: 10 },
                  { code: "C", currentStock: 30, dailyDemand: 0 },
                ];
                const r = ctx.processInventory(items);
                return r.length === 2 && r[0].daysRemaining === 2 && r[0].risk === "critical" && r[1].risk === "safe";
              }` },
              { description: '空陣列', fn: '(ctx) => ctx.processInventory([]).length === 0' },
            ],
            returnVars: ['processInventory'],
          },
        ],
      },
      {
        id: '2-5', name: '寫測試', description: '用 assert 寫測試案例', xp: 50,
        challenges: [
          {
            id: 1, name: '基本相等比較', type: 'coding', difficulty: 'easy',
            instruction: '寫 `isEqual(a, b)` — 用 `===` 比較兩個值，回傳 true 或 false。',
            defaultCode: `function isEqual(a, b) {\n  // 用 === 比較\n  \n}`,
            example: {
              title: '範例：大於比較函式',
              code: 'function isGreater(a, b) {\n  return a > b;\n}\nisGreater(5, 3); // true\nisGreater(2, 7); // false',
              output: 'true, false',
              explanation: '用比較運算子直接回傳布林值，簡潔明瞭。',
            },
            tests: [
              { description: 'isEqual(1, 1) === true', fn: '(ctx) => ctx.isEqual(1, 1) === true' },
              { description: 'isEqual(1, 2) === false', fn: '(ctx) => ctx.isEqual(1, 2) === false' },
              { description: 'isEqual("a", "a") === true', fn: '(ctx) => ctx.isEqual("a", "a") === true' },
              { description: 'isEqual(1, "1") === false（嚴格比較）', fn: '(ctx) => ctx.isEqual(1, "1") === false' },
              { description: 'isEqual(null, undefined) === false', fn: '(ctx) => ctx.isEqual(null, undefined) === false' },
            ],
            returnVars: ['isEqual'],
          },
          {
            id: 2, name: '測試框架', type: 'coding', difficulty: 'medium',
            instruction: '實作一個簡易測試函式 `assertEqual(actual, expected)` — 如果相等回傳 true，不相等回傳 false。要能比較物件（用 JSON.stringify）。然後用它測試一個 `add(a,b)` 函式。',
            defaultCode: `function assertEqual(actual, expected) {\n  // 比較兩個值是否相等（支援物件比較）\n  \n}\n\nfunction add(a, b) { return a + b; }\n\n// 測試結果\nconst results = [\n  assertEqual(add(1, 2), 3),\n  assertEqual(add(0, 0), 0),\n  assertEqual(add(-1, 1), 0),\n];`,
            example: {
              title: '範例：簡易 check 函式',
              code: 'function check(actual, expected) {\n  return JSON.stringify(actual) === JSON.stringify(expected);\n}\ncheck([1,2], [1,2]); // true\ncheck({x:1}, {x:2}); // false',
              output: 'true, false',
              explanation: '用 JSON.stringify 把物件轉成字串再比較，就能比較物件內容是否相同。',
            },
            tests: [
              { description: '數字比較正確', fn: '(ctx) => ctx.assertEqual(3, 3) === true' },
              { description: '數字比較錯誤', fn: '(ctx) => ctx.assertEqual(3, 4) === false' },
              { description: '物件比較', fn: '(ctx) => ctx.assertEqual({a:1}, {a:1}) === true' },
              { description: '物件不同', fn: '(ctx) => ctx.assertEqual({a:1}, {a:2}) === false' },
              { description: '所有測試通過', fn: '(ctx) => ctx.results.every(r => r === true)' },
            ],
            returnVars: ['assertEqual', 'results'],
          },
        ],
      },
      {
        id: '2-6', name: 'Boss: BOM 遞迴展開', description: '自己實作遞迴 + 環形偵測', xp: 200, isBoss: true,
        challenges: [
          {
            id: 1, name: 'BOM 遞迴展開', type: 'coding', difficulty: 'hard',
            instruction: '實作 `explodeBOM(item, qty, bomTable)` 遞迴展開 BOM。\n\n- bomTable 是 `[{ parent, child, qtyPer }]` 陣列\n- 回傳 `Map<string, number>` — 零件名稱 → 總需求量\n- 如果偵測到循環引用，throw Error("circular")\n- 最大深度 10 層，超過 throw Error("max depth")',
            defaultCode: `function explodeBOM(item, qty, bomTable, depth = 0, visited = new Set()) {\n  const result = new Map();\n\n  // 1. 檢查深度\n  // 2. 檢查循環\n  // 3. 找子件：bomTable.filter(row => row.parent === item)\n  // 4. 如果沒有子件，記錄 result.set(item, qty)\n  // 5. 對每個子件遞迴展開，合併結果\n\n  return result;\n}\n\nconst bomTable = [\n  { parent: "bike", child: "frame", qtyPer: 1 },\n  { parent: "bike", child: "wheel", qtyPer: 2 },\n  { parent: "frame", child: "tube", qtyPer: 3 },\n  { parent: "wheel", child: "rim", qtyPer: 1 },\n  { parent: "wheel", child: "tire", qtyPer: 1 },\n];`,
            example: {
              title: '範例：遞迴計算資料夾大小',
              code: 'function totalSize(folder, tree) {\n  const children = tree[folder] || [];\n  if (children.length === 0) return 1;\n  return children.reduce((sum, c) => sum + totalSize(c, tree), 0);\n}\ntotalSize("root", { root: ["a","b"], a: [], b: ["c"], c: [] }); // 3',
              output: '3',
              explanation: '遞迴展開：沒有子節點回傳 1，有子節點就遞迴加總。BOM 展開邏輯類似。',
            },
            referenceCode: CODE_SNIPPETS.bomExplodeSnippet,
            tests: [
              { description: '展開 1 台 bike', fn: '(ctx) => { const r = ctx.explodeBOM("bike", 1, ctx.bomTable); return r.get("tube") === 3 && r.get("rim") === 2 && r.get("tire") === 2; }' },
              { description: '展開 2 台', fn: '(ctx) => { const r = ctx.explodeBOM("bike", 2, ctx.bomTable); return r.get("tube") === 6 && r.get("rim") === 4; }' },
              { description: '循環偵測', fn: '(ctx) => { try { ctx.explodeBOM("A", 1, [{parent:"A",child:"B",qtyPer:1},{parent:"B",child:"A",qtyPer:1}]); return false; } catch(e) { return e.message === "circular"; } }' },
              { description: '深度限制', fn: '(ctx) => { const deep = []; for(let i=0;i<15;i++) deep.push({parent:"L"+i,child:"L"+(i+1),qtyPer:1}); try { ctx.explodeBOM("L0", 1, deep); return false; } catch(e) { return e.message === "max depth"; } }' },
            ],
            returnVars: ['explodeBOM', 'bomTable'],
          },
        ],
      },
    ],
  },
  {
    id: 3,
    name: 'SQL 地下城',
    emoji: '🏰',
    description: '107 個 migration 構成了這個系統的記憶',
    color: 'from-purple-500 to-violet-600',
    quests: [
      {
        id: '3-1', name: 'SELECT 基礎', description: '學習用 JS 模擬 SQL 查詢', xp: 50,
        challenges: [
          {
            id: 1, name: '模擬 SELECT', type: 'coding', difficulty: 'easy',
            instruction: '寫 `selectColumns(rows, columns)` — 從物件陣列中只取出指定欄位。\n例如 `selectColumns([{a:1,b:2,c:3}], ["a","c"])` → `[{a:1,c:3}]`',
            defaultCode: `function selectColumns(rows, columns) {\n  // 用 .map() 只取指定欄位\n  \n}`,
            example: {
              title: '範例：從物件中挑選欄位',
              code: 'const row = {name: "Bob", age: 30, city: "TPE"};\nconst picked = {name: row.name};\n// picked → {name: "Bob"}',
              output: '{name: "Bob"}',
              explanation: '用指定的 key 從物件中取值，組成新物件。',
            },
            tests: [
              { description: '取出指定欄位', fn: '(ctx) => { const r = ctx.selectColumns([{a:1,b:2,c:3}],["a","c"]); return r[0].a === 1 && r[0].c === 3 && r[0].b === undefined; }' },
              { description: '多筆資料', fn: '(ctx) => ctx.selectColumns([{x:1,y:2},{x:3,y:4}],["x"]).length === 2' },
            ],
            returnVars: ['selectColumns'],
          },
          {
            id: 2, name: '模擬 ORDER BY', type: 'coding', difficulty: 'easy',
            instruction: '寫 `orderBy(rows, column, direction)` — direction 是 "ASC" 或 "DESC"。',
            defaultCode: `function orderBy(rows, column, direction = "ASC") {\n  // 排序（不修改原陣列）\n  \n}`,
            example: {
              title: '範例：陣列排序',
              code: 'const nums = [3, 1, 2];\nconst sorted = [...nums].sort((a, b) => a - b);\n// sorted → [1, 2, 3]',
              output: '[1, 2, 3]',
              explanation: '用 spread 複製陣列後再 sort，不會改到原本的。',
            },
            tests: [
              { description: '升冪排序', fn: '(ctx) => { const r = ctx.orderBy([{v:3},{v:1},{v:2}],"v","ASC"); return r[0].v === 1 && r[2].v === 3; }' },
              { description: '降冪排序', fn: '(ctx) => { const r = ctx.orderBy([{v:3},{v:1},{v:2}],"v","DESC"); return r[0].v === 3; }' },
              { description: '不修改原陣列', fn: '(ctx) => { const orig = [{v:3},{v:1}]; ctx.orderBy(orig,"v"); return orig[0].v === 3; }' },
            ],
            returnVars: ['orderBy'],
          },
        ],
      },
      {
        id: '3-2', name: 'WHERE + JOIN', description: '過濾與合併資料', xp: 50,
        challenges: [
          {
            id: 1, name: '模擬 WHERE', type: 'coding', difficulty: 'easy',
            instruction: '寫 `where(rows, conditionFn)` — 回傳符合條件的列。跟 filter 一樣但命名成 SQL 風格。',
            defaultCode: `function where(rows, conditionFn) {\n  // 過濾\n  \n}`,
            example: {
              title: '範例：用 filter 過濾陣列',
              code: 'const items = [1, 2, 3, 4, 5];\nconst big = items.filter(x => x > 3);\n// big → [4, 5]',
              output: '[4, 5]',
              explanation: 'filter 會回傳所有讓條件函式回傳 true 的元素。',
            },
            tests: [
              { description: '過濾', fn: '(ctx) => ctx.where([{stock:50},{stock:200}], r => r.stock < 100).length === 1' },
            ],
            returnVars: ['where'],
          },
          {
            id: 2, name: '模擬 INNER JOIN', type: 'coding', difficulty: 'medium',
            instruction: '寫 `innerJoin(left, right, leftKey, rightKey)` — 回傳兩邊都有配對的合併結果（用 spread 合併物件）。',
            defaultCode: `function innerJoin(left, right, leftKey, rightKey) {\n  // 對 left 每一筆，找 right 中 rightKey 相同的，合併\n  \n}`,
            example: {
              title: '範例：合併兩個物件',
              code: 'const a = {id: 1, name: "Alice"};\nconst b = {id: 1, score: 95};\nconst merged = {...a, ...b};\n// merged → {id: 1, name: "Alice", score: 95}',
              output: '{id: 1, name: "Alice", score: 95}',
              explanation: '用 spread 把兩個物件的欄位合在一起。',
            },
            tests: [
              { description: '正常 JOIN', fn: '(ctx) => { const r = ctx.innerJoin([{id:1,name:"A"}],[{id:1,price:10}],"id","id"); return r.length === 1 && r[0].name === "A" && r[0].price === 10; }' },
              { description: '沒配到的不出現', fn: '(ctx) => ctx.innerJoin([{id:1},{id:2}],[{id:1}],"id","id").length === 1' },
            ],
            returnVars: ['innerJoin'],
          },
        ],
      },
      {
        id: '3-3', name: 'GROUP BY + 聚合', description: '分組統計', xp: 50,
        challenges: [
          {
            id: 1, name: '計數分組', type: 'coding', difficulty: 'easy',
            instruction: '寫 `countBy(rows, key)` — 回傳一個物件，key 是分組值，value 是該組的數量。\n例如 `countBy([{type:"A"},{type:"B"},{type:"A"}], "type")` → `{A: 2, B: 1}`',
            defaultCode: `function countBy(rows, key) {\n  // 用 reduce 計算每個分組的數量\n  \n}`,
            example: {
              title: '範例：用 reduce 累加計數',
              code: 'const letters = ["a", "b", "a"];\nconst counts = letters.reduce((acc, l) => {\n  acc[l] = (acc[l] || 0) + 1; return acc;\n}, {});\n// counts → {a: 2, b: 1}',
              output: '{a: 2, b: 1}',
              explanation: 'reduce 逐一遍歷，用物件累計每個值出現的次數。',
            },
            tests: [
              { description: '計數正確', fn: '(ctx) => { const r = ctx.countBy([{t:"A"},{t:"B"},{t:"A"}],"t"); return r.A === 2 && r.B === 1; }' },
              { description: '空陣列', fn: '(ctx) => Object.keys(ctx.countBy([],"t")).length === 0' },
              { description: '單一分組', fn: '(ctx) => ctx.countBy([{x:"a"},{x:"a"},{x:"a"}],"x").a === 3' },
            ],
            returnVars: ['countBy'],
          },
          {
            id: 2, name: '模擬 GROUP BY', type: 'coding', difficulty: 'medium',
            instruction: '寫 `groupBy(rows, key)` — 回傳一個物件，key 是分組值，value 是該組的列陣列。\n例如 `groupBy([{type:"A",v:1},{type:"B",v:2},{type:"A",v:3}], "type")` → `{ A: [{...},{...}], B: [{...}] }`',
            defaultCode: `function groupBy(rows, key) {\n  // 用 reduce 分組\n  \n}`,
            example: {
              title: '範例：把陣列元素分組',
              code: 'const words = ["hi", "ok", "hey"];\nconst byLen = {};\nwords.forEach(w => {\n  const k = w.length;\n  byLen[k] = byLen[k] || [];\n  byLen[k].push(w);\n});\n// byLen → {2: ["hi", "ok"], 3: ["hey"]}',
              output: '{2: ["hi", "ok"], 3: ["hey"]}',
              explanation: '用 key 值當物件的屬性名，把相同 key 的元素放進同一個陣列。',
            },
            tests: [
              { description: '分組正確', fn: '(ctx) => { const r = ctx.groupBy([{t:"A",v:1},{t:"B",v:2},{t:"A",v:3}],"t"); return r.A.length === 2 && r.B.length === 1; }' },
              { description: '空陣列', fn: '(ctx) => Object.keys(ctx.groupBy([],"t")).length === 0' },
            ],
            returnVars: ['groupBy'],
          },
          {
            id: 3, name: '聚合函式', type: 'coding', difficulty: 'medium',
            instruction: '寫 `aggregate(rows, column, fn)` — fn 可以是 "SUM"、"AVG"、"COUNT"、"MAX"、"MIN"。',
            defaultCode: `function aggregate(rows, column, fn) {\n  const values = rows.map(r => r[column]);\n  // 根據 fn 計算\n  \n}`,
            example: {
              title: '範例：陣列求和與最大值',
              code: 'const vals = [5, 10, 15];\nconst sum = vals.reduce((a, b) => a + b, 0);\nconst max = Math.max(...vals);\n// sum → 30, max → 15',
              output: 'sum = 30, max = 15',
              explanation: '用 reduce 做加總，用 Math.max 找最大值。',
            },
            tests: [
              { description: 'SUM', fn: '(ctx) => ctx.aggregate([{v:10},{v:20},{v:30}],"v","SUM") === 60' },
              { description: 'AVG', fn: '(ctx) => ctx.aggregate([{v:10},{v:20},{v:30}],"v","AVG") === 20' },
              { description: 'COUNT', fn: '(ctx) => ctx.aggregate([{v:10},{v:20}],"v","COUNT") === 2' },
              { description: 'MAX', fn: '(ctx) => ctx.aggregate([{v:10},{v:30},{v:20}],"v","MAX") === 30' },
              { description: 'MIN', fn: '(ctx) => ctx.aggregate([{v:10},{v:30},{v:20}],"v","MIN") === 10' },
            ],
            returnVars: ['aggregate'],
          },
        ],
      },
      {
        id: '3-4', name: 'INSERT + UPDATE', description: '寫入與修改資料', xp: 50,
        challenges: [
          {
            id: 1, name: '插入資料', type: 'coding', difficulty: 'easy',
            instruction: '寫 `insertRow(table, row)` — table 是陣列（模擬資料表），row 是物件。回傳新的陣列（不修改原陣列），把 row 加到最後面，並自動加上 `id` 欄位（取目前最大 id + 1，若空表則 id=1）。',
            defaultCode: `function insertRow(table, row) {\n  // 不修改原陣列\n  // 自動加 id\n  \n}`,
            example: {
              title: '範例：不修改原陣列地新增元素',
              code: 'const arr = [1, 2];\nconst newArr = [...arr, 3];\n// arr → [1, 2]  newArr → [1, 2, 3]',
              output: '[1, 2, 3]',
              explanation: '用 spread 建立新陣列，原陣列不會被改動。',
            },
            tests: [
              { description: '插入後長度+1', fn: '(ctx) => ctx.insertRow([{id:1,name:"A"}],{name:"B"}).length === 2' },
              { description: '自動 id', fn: '(ctx) => ctx.insertRow([{id:1,name:"A"}],{name:"B"})[1].id === 2' },
              { description: '空表 id=1', fn: '(ctx) => ctx.insertRow([],{name:"C"})[0].id === 1' },
              { description: '不修改原陣列', fn: '(ctx) => { const t=[{id:1}]; ctx.insertRow(t,{name:"X"}); return t.length === 1; }' },
            ],
            returnVars: ['insertRow'],
          },
          {
            id: 2, name: '更新資料', type: 'coding', difficulty: 'medium',
            instruction: '寫 `updateRows(table, condition, updates)` — condition 是 `{field, value}` 表示哪些列要更新。updates 是物件表示要更新的欄位。回傳新的陣列（不修改原陣列）。',
            defaultCode: `function updateRows(table, condition, updates) {\n  // 找到符合 condition 的列，套用 updates\n  // 回傳新陣列\n  \n}`,
            example: {
              title: '範例：用 map 有條件地更新物件',
              code: 'const rows = [{id: 1, ok: false}, {id: 2, ok: true}];\nconst updated = rows.map(r =>\n  r.id === 1 ? {...r, ok: true} : r\n);\n// updated[0].ok → true',
              output: '[{id: 1, ok: true}, {id: 2, ok: true}]',
              explanation: '用 map 遍歷，符合條件的用 spread 產生新物件並覆蓋欄位。',
            },
            tests: [
              { description: '更新匹配的列', fn: '(ctx) => { const r = ctx.updateRows([{id:1,status:"pending"},{id:2,status:"done"}],{field:"status",value:"pending"},{status:"shipped"}); return r[0].status === "shipped" && r[1].status === "done"; }' },
              { description: '不修改原陣列', fn: '(ctx) => { const t=[{id:1,status:"A"}]; ctx.updateRows(t,{field:"status",value:"A"},{status:"B"}); return t[0].status === "A"; }' },
              { description: '無匹配不變', fn: '(ctx) => { const r = ctx.updateRows([{id:1,x:1}],{field:"x",value:99},{x:0}); return r[0].x === 1; }' },
            ],
            returnVars: ['updateRows'],
          },
        ],
      },
      {
        id: '3-5', name: 'RPC 函式', description: '理解 Supabase RPC', xp: 50,
        challenges: [
          {
            id: 1, name: '簡單函式呼叫', type: 'coding', difficulty: 'easy',
            instruction: '寫 `callFunction(name, fns)` — fns 是 `{fnName: fn}` 的物件。如果 name 存在於 fns 中，呼叫 fns[name]() 並回傳結果；否則回傳 null。',
            defaultCode: `function callFunction(name, fns) {\n  // 如果 fns 中有 name，呼叫並回傳結果，否則回傳 null\n  \n}`,
            example: {
              title: '範例：動態呼叫物件中的函式',
              code: 'const actions = { sayHi: () => "Hi!" };\nconst key = "sayHi";\nconst result = actions[key]();\n// result → "Hi!"',
              output: '"Hi!"',
              explanation: '用方括號語法從物件中取出函式並呼叫。',
            },
            tests: [
              { description: '呼叫存在的函式', fn: '(ctx) => ctx.callFunction("greet", {greet: () => "hello"}) === "hello"' },
              { description: '呼叫不存在的函式', fn: '(ctx) => ctx.callFunction("missing", {greet: () => "hello"}) === null' },
              { description: '回傳數字', fn: '(ctx) => ctx.callFunction("getNum", {getNum: () => 42}) === 42' },
            ],
            returnVars: ['callFunction'],
          },
          {
            id: 2, name: '模擬 RPC 呼叫', type: 'coding', difficulty: 'medium',
            instruction: '寫 `createRPC(functions)` — functions 是 `{fnName: fn}` 的物件。回傳一個 `rpc(name, params)` 函式：\n- 如果 name 不在 functions 裡，回傳 `{error: "FUNCTION_NOT_FOUND"}`\n- 否則呼叫對應函式並回傳 `{data: result}`',
            defaultCode: `function createRPC(functions) {\n  return function rpc(name, params) {\n    // 查找並呼叫\n    \n  };\n}`,
            example: {
              title: '範例：回傳函式的函式（閉包）',
              code: 'function makeGreeter(greeting) {\n  return (name) => greeting + " " + name;\n}\nconst hi = makeGreeter("Hello");\n// hi("World") → "Hello World"',
              output: '"Hello World"',
              explanation: '外層函式回傳內層函式，內層能存取外層的變數。',
            },
            tests: [
              { description: '呼叫存在的函式', fn: '(ctx) => { const rpc = ctx.createRPC({add: (p) => p.a + p.b}); return rpc("add",{a:3,b:4}).data === 7; }' },
              { description: '找不到函式', fn: '(ctx) => { const rpc = ctx.createRPC({}); return rpc("unknown",{}).error === "FUNCTION_NOT_FOUND"; }' },
              { description: '多個函式', fn: '(ctx) => { const rpc = ctx.createRPC({sum:(p)=>p.x+p.y, mul:(p)=>p.x*p.y}); return rpc("sum",{x:2,y:3}).data === 5 && rpc("mul",{x:2,y:3}).data === 6; }' },
            ],
            returnVars: ['createRPC'],
          },
          {
            id: 3, name: '帶驗證的 RPC', type: 'coding', difficulty: 'hard',
            instruction: '寫 `createSecureRPC(functions, allowList)` — allowList 是允許呼叫的函式名稱陣列。回傳 `rpc(name, params)`：\n- 如果 name 不在 allowList 中，回傳 `{error: "PERMISSION_DENIED"}`\n- 如果 name 不在 functions 中，回傳 `{error: "FUNCTION_NOT_FOUND"}`\n- 否則回傳 `{data: result}`',
            defaultCode: `function createSecureRPC(functions, allowList) {\n  return function rpc(name, params) {\n    \n  };\n}`,
            example: {
              title: '範例：用 includes 檢查權限',
              code: 'const allowed = ["read", "write"];\nconst action = "delete";\nconst ok = allowed.includes(action);\n// ok → false',
              output: 'false',
              explanation: '先用 includes 檢查是否在白名單中，再決定要不要執行。',
            },
            tests: [
              { description: '允許的函式', fn: '(ctx) => { const rpc = ctx.createSecureRPC({add:(p)=>p.a+p.b},["add"]); return rpc("add",{a:1,b:2}).data === 3; }' },
              { description: '未授權', fn: '(ctx) => { const rpc = ctx.createSecureRPC({secret:()=>42},[]); return rpc("secret",{}).error === "PERMISSION_DENIED"; }' },
              { description: '授權但不存在', fn: '(ctx) => { const rpc = ctx.createSecureRPC({},["ghost"]); return rpc("ghost",{}).error === "FUNCTION_NOT_FOUND"; }' },
            ],
            returnVars: ['createSecureRPC'],
          },
        ],
      },
      {
        id: '3-6', name: 'Boss: 即時查詢挑戰', description: '在 DuckDB 上跑真實查詢', xp: 200, isBoss: true,
        challenges: [
          {
            id: 1, name: '完整查詢引擎', type: 'coding', difficulty: 'hard',
            instruction: '寫一個 `query(table, options)` 函式，options 可以包含：\n- `select`: 欄位名稱陣列（預設全部）\n- `where`: `{field, op, value}` — op 可以是 "=", ">", "<", ">=", "<="\n- `orderBy`: `{field, direction}` — direction 是 "ASC" 或 "DESC"\n- `limit`: 數字\n\n全部組合起來使用！',
            defaultCode: `function query(table, options = {}) {\n  let result = [...table];\n  \n  // 1. WHERE 過濾\n  \n  // 2. ORDER BY 排序\n  \n  // 3. SELECT 投影\n  \n  // 4. LIMIT 限制\n  \n  return result;\n}`,
            referenceCode: `// 在真實專案中，這些邏輯由 DuckDB / Supabase 處理\n// 但理解底層原理能幫助你寫出更好的查詢`,
            example: {
              title: '範例：鏈式處理陣列',
              code: 'const data = [{n: 3}, {n: 1}, {n: 4}, {n: 1}];\nconst result = data\n  .filter(r => r.n > 1)\n  .sort((a, b) => a.n - b.n)\n  .slice(0, 2);\n// result → [{n: 3}, {n: 4}]',
              output: '[{n: 3}, {n: 4}]',
              explanation: '先 filter 過濾、再 sort 排序、最後 slice 限制筆數，就像 SQL 的 WHERE + ORDER BY + LIMIT。',
            },
            tests: [
              { description: 'WHERE 過濾', fn: '(ctx) => { const t=[{id:1,v:10},{id:2,v:20},{id:3,v:30}]; return ctx.query(t,{where:{field:"v",op:">",value:15}}).length === 2; }' },
              { description: 'ORDER BY DESC', fn: '(ctx) => { const t=[{id:1,v:10},{id:2,v:30},{id:3,v:20}]; const r=ctx.query(t,{orderBy:{field:"v",direction:"DESC"}}); return r[0].v===30 && r[1].v===20; }' },
              { description: 'SELECT 投影', fn: '(ctx) => { const t=[{id:1,name:"A",v:10}]; const r=ctx.query(t,{select:["name"]}); return r[0].name==="A" && r[0].id===undefined; }' },
              { description: 'LIMIT', fn: '(ctx) => ctx.query([{id:1},{id:2},{id:3}],{limit:2}).length === 2' },
              { description: '組合查詢', fn: '(ctx) => { const t=[{id:1,v:10},{id:2,v:30},{id:3,v:20},{id:4,v:40}]; const r=ctx.query(t,{where:{field:"v",op:">=",value:20},orderBy:{field:"v",direction:"ASC"},select:["v"],limit:2}); return r.length===2 && r[0].v===20 && r[1].v===30; }' },
            ],
            returnVars: ['query'],
          },
        ],
      },
    ],
  },
  {
    id: 4,
    name: 'React 前線',
    emoji: '⚔️',
    description: '199 個 component 構成了使用者看到的一切',
    color: 'from-cyan-500 to-blue-600',
    quests: [
      {
        id: '4-1', name: 'JSX 基礎', description: '讀懂 component 結構', xp: 50,
        challenges: [
          {
            id: 1, name: '建立元素', type: 'coding', difficulty: 'easy',
            instruction: '寫 `createElement(tag, props, children)` — 模擬 React.createElement。回傳 `{type: tag, props: {...props, children}}`。如果 children 是 undefined 就不加。',
            defaultCode: `function createElement(tag, props, children) {\n  const element = { type: tag, props: { ...props } };\n  if (children !== undefined) {\n    element.props.children = children;\n  }\n  return element;\n}`,
            example: {
              title: '範例：建立簡單物件結構',
              code: 'function makeNode(name, value) {\n  return { name, data: value };\n}\nconsole.log(makeNode("p", 42));',
              output: '{ name: "p", data: 42 }',
              explanation: '函式接收參數，組合成物件後回傳，概念與 createElement 相同。',
            },
            tests: [
              { description: '建立 div', fn: '(ctx) => { const e = ctx.createElement("div",{className:"card"},"Hello"); return e.type==="div" && e.props.className==="card" && e.props.children==="Hello"; }' },
              { description: '無 children', fn: '(ctx) => ctx.createElement("br",{}).props.children === undefined' },
              { description: '巢狀結構', fn: '(ctx) => { const child = ctx.createElement("span",{},"text"); const parent = ctx.createElement("div",{},child); return parent.props.children.type === "span"; }' },
            ],
            returnVars: ['createElement'],
          },
          {
            id: 2, name: '解析 JSX 結構', type: 'coding', difficulty: 'medium',
            instruction: '寫 `countElements(tree)` — 遞迴計算虛擬 DOM 樹中有多少個元素節點。tree 是 `{type, props: {children}}` 結構，children 可以是：物件（單個子元素）、陣列（多個子元素）、字串（文字節點，不算）、或 undefined。',
            defaultCode: `function countElements(tree) {\n  if (!tree || typeof tree === "string") return 0;\n  let count = 1; // 自己\n  const children = tree.props?.children;\n  // 遞迴計算子元素\n  \n  return count;\n}`,
            example: {
              title: '範例：遞迴計算巢狀深度',
              code: 'function depth(node) {\n  if (!node || !node.child) return 1;\n  return 1 + depth(node.child);\n}\nconsole.log(depth({child:{child:null}}));',
              output: '2',
              explanation: '遞迴走訪巢狀結構並計數，與遍歷虛擬 DOM 樹的概念類似。',
            },
            tests: [
              { description: '單一元素', fn: '(ctx) => ctx.countElements({type:"div",props:{}}) === 1' },
              { description: '有子元素', fn: '(ctx) => ctx.countElements({type:"div",props:{children:{type:"span",props:{}}}}) === 2' },
              { description: '陣列子元素', fn: '(ctx) => ctx.countElements({type:"div",props:{children:[{type:"p",props:{}},{type:"p",props:{}}]}}) === 3' },
              { description: '文字節點不算', fn: '(ctx) => ctx.countElements({type:"div",props:{children:"hello"}}) === 1' },
            ],
            returnVars: ['countElements'],
          },
        ],
      },
      {
        id: '4-2', name: 'Props 與 State', description: '改一個 component 的行為', xp: 50,
        challenges: [
          {
            id: 1, name: 'Props 合併', type: 'coding', difficulty: 'easy',
            instruction: '寫 `mergeProps(defaultProps, userProps)` — 用 userProps 覆蓋 defaultProps 中同名的屬性。回傳新物件，不修改原物件。',
            defaultCode: `function mergeProps(defaultProps, userProps) {\n  \n}`,
            example: {
              title: '範例：用 spread 合併物件',
              code: 'const a = { x: 1, y: 2 };\nconst b = { y: 3, z: 4 };\nconsole.log({ ...a, ...b });',
              output: '{ x: 1, y: 3, z: 4 }',
              explanation: '後面的物件會覆蓋前面同名的屬性，這就是 Props 合併的核心概念。',
            },
            tests: [
              { description: '覆蓋預設值', fn: '(ctx) => { const r = ctx.mergeProps({size:"md",color:"blue"},{color:"red"}); return r.size==="md" && r.color==="red"; }' },
              { description: '不修改原物件', fn: '(ctx) => { const d={a:1}; ctx.mergeProps(d,{a:2}); return d.a === 1; }' },
              { description: '新增屬性', fn: '(ctx) => ctx.mergeProps({a:1},{b:2}).b === 2' },
            ],
            returnVars: ['mergeProps'],
          },
          {
            id: 2, name: '模擬 useState', type: 'coding', difficulty: 'medium',
            instruction: '寫 `createState(initialValue)` — 回傳 `[getter, setter]`。getter() 回傳目前的值，setter(newValue) 更新值。',
            defaultCode: `function createState(initialValue) {\n  let value = initialValue;\n  function getter() {\n    // 回傳目前值\n  }\n  function setter(newValue) {\n    // 更新值\n  }\n  return [getter, setter];\n}`,
            example: {
              title: '範例：閉包保存狀態',
              code: 'function makeCounter() {\n  let n = 0;\n  return { get: () => n, inc: () => n++ };\n}\nconst c = makeCounter();\nc.inc(); console.log(c.get());',
              output: '1',
              explanation: '用閉包把變數藏在函式內部，外部透過方法存取，與 useState 原理相同。',
            },
            tests: [
              { description: '取得初始值', fn: '(ctx) => { const [get] = ctx.createState(42); return get() === 42; }' },
              { description: '更新值', fn: '(ctx) => { const [get, set] = ctx.createState(0); set(10); return get() === 10; }' },
              { description: '多次更新', fn: '(ctx) => { const [get, set] = ctx.createState("a"); set("b"); set("c"); return get() === "c"; }' },
            ],
            returnVars: ['createState'],
          },
        ],
      },
      {
        id: '4-3', name: 'useEffect 與生命週期', description: '修復一個 bug', xp: 50,
        challenges: [
          {
            id: 1, name: '淺比較陣列', type: 'coding', difficulty: 'easy',
            instruction: '寫 `shallowEqual(arr1, arr2)` — 比較兩個陣列是否長度相同且每個元素用 === 比較都相等。回傳 true 或 false。',
            defaultCode: `function shallowEqual(arr1, arr2) {\n  // 比較兩個陣列是否淺相等\n  \n}`,
            example: {
              title: '範例：比較兩個字串是否相同',
              code: 'function eq(a, b) {\n  return a === b;\n}\nconsole.log(eq("hi", "hi"), eq("hi", "ho"));',
              output: 'true false',
              explanation: '用 === 嚴格比較兩個值；淺比較陣列就是對每個元素做一樣的事。',
            },
            tests: [
              { description: '相同陣列', fn: '(ctx) => ctx.shallowEqual([1,2,3], [1,2,3]) === true' },
              { description: '不同長度', fn: '(ctx) => ctx.shallowEqual([1,2], [1,2,3]) === false' },
              { description: '不同元素', fn: '(ctx) => ctx.shallowEqual([1,2,3], [1,2,4]) === false' },
              { description: '空陣列', fn: '(ctx) => ctx.shallowEqual([], []) === true' },
              { description: '嚴格比較', fn: '(ctx) => ctx.shallowEqual([1], ["1"]) === false' },
            ],
            returnVars: ['shallowEqual'],
          },
          {
            id: 2, name: '模擬 useEffect', type: 'coding', difficulty: 'hard',
            instruction: '寫 `createEffect(callback, deps)` — 模擬 useEffect 的依賴比較：\n- 回傳 `{shouldRun, cleanup}` 物件\n- 第一次呼叫永遠 shouldRun=true\n- 之後比較 deps 陣列（淺比較），有改變才 shouldRun=true\n- 如果 deps 是 undefined，每次都 shouldRun=true\n- 如果 deps 是空陣列 []，只有第一次 shouldRun=true',
            defaultCode: `function createEffectTracker() {\n  let prevDeps = undefined;\n  let isFirst = true;\n  \n  return function check(deps) {\n    if (isFirst) {\n      isFirst = false;\n      prevDeps = deps;\n      return { shouldRun: true };\n    }\n    \n    // 沒給 deps → 每次都執行\n    if (deps === undefined) {\n      return { shouldRun: true };\n    }\n    \n    // 空陣列 → 只執行一次\n    // 比較每個 dep\n    \n    prevDeps = deps;\n    return { shouldRun: false };\n  };\n}`,
            example: {
              title: '範例：追蹤值是否改變',
              code: 'let prev = null;\nfunction changed(val) {\n  const diff = val !== prev;\n  prev = val;\n  return diff;\n}\nconsole.log(changed(1), changed(1), changed(2));',
              output: 'true false true',
              explanation: '記住上次的值，跟新值比較決定是否有變化，這就是 useEffect 依賴追蹤的核心。',
            },
            tests: [
              { description: '首次執行', fn: '(ctx) => { const check = ctx.createEffectTracker(); return check([1]).shouldRun === true; }' },
              { description: 'deps 不變→不執行', fn: '(ctx) => { const check = ctx.createEffectTracker(); check([1,2]); return check([1,2]).shouldRun === false; }' },
              { description: 'deps 變了→執行', fn: '(ctx) => { const check = ctx.createEffectTracker(); check([1]); return check([2]).shouldRun === true; }' },
              { description: '無 deps→每次執行', fn: '(ctx) => { const check = ctx.createEffectTracker(); check(); return check().shouldRun === true; }' },
              { description: '空陣列→只一次', fn: '(ctx) => { const check = ctx.createEffectTracker(); check([]); return check([]).shouldRun === false; }' },
            ],
            returnVars: ['createEffectTracker'],
          },
        ],
      },
      {
        id: '4-4', name: 'Context 與全域狀態', description: '追蹤資料流', xp: 50,
        challenges: [
          {
            id: 1, name: '閉包盒子', type: 'coding', difficulty: 'easy',
            instruction: '寫 `createBox(value)` — 用閉包回傳一個物件 `{get(), set(v)}`。get() 回傳目前值，set(v) 更新值。',
            defaultCode: `function createBox(value) {\n  // 用閉包保存 value\n  return {\n    get() {\n      // 回傳目前值\n    },\n    set(v) {\n      // 更新值\n    }\n  };\n}`,
            example: {
              title: '範例：閉包封裝私有變數',
              code: 'function secret(val) {\n  return { peek: () => val };\n}\nconsole.log(secret(99).peek());',
              output: '99',
              explanation: '閉包讓函式記住建立時的變數，外部只能透過回傳的方法存取。',
            },
            tests: [
              { description: '取得初始值', fn: '(ctx) => ctx.createBox(42).get() === 42' },
              { description: '更新值', fn: '(ctx) => { const box = ctx.createBox(1); box.set(2); return box.get() === 2; }' },
              { description: '多次更新', fn: '(ctx) => { const box = ctx.createBox("a"); box.set("b"); box.set("c"); return box.get() === "c"; }' },
              { description: '獨立實例', fn: '(ctx) => { const b1 = ctx.createBox(1); const b2 = ctx.createBox(2); return b1.get() === 1 && b2.get() === 2; }' },
            ],
            returnVars: ['createBox'],
          },
          {
            id: 2, name: '模擬 Context', type: 'coding', difficulty: 'medium',
            instruction: '寫 `createContext(defaultValue)` — 回傳一個物件 `{Provider, useContext}`：\n- `Provider(value)` 設定 context 的當前值\n- `useContext()` 取得當前值，如果沒有 Provider 設過值就回傳 defaultValue',
            defaultCode: `function createContext(defaultValue) {\n  let current = defaultValue;\n  return {\n    Provider(value) {\n      // 設定值\n    },\n    useContext() {\n      // 取得值\n    }\n  };\n}`,
            example: {
              title: '範例：全域變數讀寫',
              code: 'let theme = "light";\nfunction setTheme(t) { theme = t; }\nfunction getTheme() { return theme; }\nsetTheme("dark");\nconsole.log(getTheme());',
              output: 'dark',
              explanation: '用函式包裝全域變數的讀寫，與 Context 的 Provider/useContext 模式相似。',
            },
            tests: [
              { description: '預設值', fn: '(ctx) => { const c = ctx.createContext("default"); return c.useContext() === "default"; }' },
              { description: 'Provider 設值', fn: '(ctx) => { const c = ctx.createContext(0); c.Provider(42); return c.useContext() === 42; }' },
              { description: '多次更新', fn: '(ctx) => { const c = ctx.createContext("a"); c.Provider("b"); c.Provider("c"); return c.useContext() === "c"; }' },
            ],
            returnVars: ['createContext'],
          },
          {
            id: 3, name: '模擬 useReducer', type: 'coding', difficulty: 'hard',
            instruction: '寫 `createStore(reducer, initialState)` — reducer 是 `(state, action) => newState`。回傳 `{getState, dispatch}`：\n- `getState()` 回傳目前 state\n- `dispatch(action)` 用 reducer 計算新 state 並更新',
            defaultCode: `function createStore(reducer, initialState) {\n  let state = initialState;\n  return {\n    getState() {\n      \n    },\n    dispatch(action) {\n      \n    }\n  };\n}`,
            example: {
              title: '範例：用函式計算新狀態',
              code: 'function apply(state, fn) {\n  return fn(state);\n}\nconsole.log(apply(5, s => s * 2));',
              output: '10',
              explanation: '把「如何更新狀態」交給外部函式決定，這就是 reducer 的核心概念。',
            },
            tests: [
              { description: '初始狀態', fn: '(ctx) => { const s = ctx.createStore((s,a)=>s, {count:0}); return s.getState().count === 0; }' },
              { description: 'dispatch 更新', fn: '(ctx) => { const s = ctx.createStore((s,a)=>a.type==="INC"?{count:s.count+1}:s, {count:0}); s.dispatch({type:"INC"}); return s.getState().count === 1; }' },
              { description: '多次 dispatch', fn: '(ctx) => { const s = ctx.createStore((s,a)=>({count:s.count+a.payload}), {count:0}); s.dispatch({payload:5}); s.dispatch({payload:3}); return s.getState().count === 8; }' },
            ],
            returnVars: ['createStore'],
          },
        ],
      },
      {
        id: '4-5', name: '條件渲染與列表', description: '寫一個風險列表 component', xp: 50,
        challenges: [
          {
            id: 1, name: '條件渲染邏輯', type: 'coding', difficulty: 'easy',
            instruction: '寫 `renderStatus(item)` — item 有 `{name, stock, threshold}` 欄位。回傳：\n- stock <= 0 → `{text: "缺貨", level: "critical"}`\n- stock <= threshold → `{text: "低庫存", level: "warning"}`\n- 否則 → `{text: "正常", level: "safe"}`',
            defaultCode: `function renderStatus(item) {\n  \n}`,
            example: {
              title: '範例：根據溫度回傳狀態',
              code: 'function tempLabel(t) {\n  if (t > 35) return "hot";\n  if (t > 20) return "warm";\n  return "cold";\n}\nconsole.log(tempLabel(40));',
              output: 'hot',
              explanation: '用 if/else 根據數值區間回傳不同標籤，跟條件渲染邏輯一模一樣。',
            },
            tests: [
              { description: '缺貨', fn: '(ctx) => { const r = ctx.renderStatus({name:"A",stock:0,threshold:10}); return r.text==="缺貨" && r.level==="critical"; }' },
              { description: '低庫存', fn: '(ctx) => { const r = ctx.renderStatus({name:"B",stock:5,threshold:10}); return r.text==="低庫存" && r.level==="warning"; }' },
              { description: '正常', fn: '(ctx) => { const r = ctx.renderStatus({name:"C",stock:100,threshold:10}); return r.text==="正常" && r.level==="safe"; }' },
            ],
            returnVars: ['renderStatus'],
          },
          {
            id: 2, name: '列表處理', type: 'coding', difficulty: 'medium',
            instruction: '寫 `renderList(items, filterLevel)` — items 是 `[{name, stock, threshold}]` 陣列。filterLevel 可以是 "all", "warning", "critical"。回傳：\n- "all" → 全部項目加上狀態\n- "warning" → 只回傳 warning 和 critical\n- "critical" → 只回傳 critical\n\n每項回傳 `{name, ...renderStatus(item)}`',
            defaultCode: `function renderStatus(item) {\n  if (item.stock <= 0) return { text: "缺貨", level: "critical" };\n  if (item.stock <= item.threshold) return { text: "低庫存", level: "warning" };\n  return { text: "正常", level: "safe" };\n}\n\nfunction renderList(items, filterLevel) {\n  // 加上狀態後過濾\n  \n}`,
            example: {
              title: '範例：過濾陣列再加工',
              code: 'const nums = [1, 2, 3, 4, 5];\nconst big = nums.filter(n => n > 3).map(n => n * 10);\nconsole.log(big);',
              output: '[40, 50]',
              explanation: '先 filter 篩選，再 map 轉換，這是列表處理的標準流程。',
            },
            tests: [
              { description: 'all 回傳全部', fn: '(ctx) => ctx.renderList([{name:"A",stock:100,threshold:10},{name:"B",stock:5,threshold:10}],"all").length === 2' },
              { description: 'warning 過濾', fn: '(ctx) => { const r = ctx.renderList([{name:"A",stock:100,threshold:10},{name:"B",stock:5,threshold:10},{name:"C",stock:0,threshold:10}],"warning"); return r.length === 2; }' },
              { description: 'critical 過濾', fn: '(ctx) => { const r = ctx.renderList([{name:"A",stock:100,threshold:10},{name:"B",stock:5,threshold:10},{name:"C",stock:0,threshold:10}],"critical"); return r.length === 1 && r[0].name === "C"; }' },
            ],
            returnVars: ['renderList'],
          },
        ],
      },
      {
        id: '4-6', name: 'Boss: 從零寫 Dashboard Card', description: '完整 component + 樣式', xp: 200, isBoss: true,
        challenges: [
          {
            id: 1, name: '完整 Dashboard 資料處理', type: 'coding', difficulty: 'hard',
            instruction: '寫 `createDashboard(inventoryData)` — inventoryData 是 `[{name, stock, dailyDemand, threshold, unitCost}]`。回傳：\n```\n{\n  totalItems: 總品項數,\n  totalValue: 總庫存價值 (stock × unitCost 的加總),\n  criticalItems: 缺貨品項名稱陣列,\n  warningItems: 低庫存品項名稱陣列 (stock <= threshold 但 > 0),\n  avgDaysToStockout: 平均可用天數 (stock / dailyDemand，忽略 dailyDemand=0 的品項)，四捨五入到小數第一位,\n  riskScore: criticalItems 數量 / totalItems 的百分比，四捨五入到整數\n}\n```',
            defaultCode: `function createDashboard(inventoryData) {\n  const result = {\n    totalItems: 0,\n    totalValue: 0,\n    criticalItems: [],\n    warningItems: [],\n    avgDaysToStockout: 0,\n    riskScore: 0,\n  };\n  \n  // 你的程式碼\n  \n  return result;\n}`,
            referenceCode: `// 在真實 DI 專案中，InventoryDashboard.jsx 會呼叫\n// calculator.js 的函式來取得這些資料\n// 這裡你要自己實作底層邏輯`,
            example: {
              title: '範例：統計陣列基本資訊',
              code: 'const prices = [10, 20, 30];\nconst total = prices.reduce((s, p) => s + p, 0);\nconst avg = total / prices.length;\nconsole.log(total, avg);',
              output: '60 20',
              explanation: '用 reduce 加總、算平均，Dashboard 就是把這些統計組合在一起。',
            },
            tests: [
              { description: '基本統計', fn: '(ctx) => { const d = ctx.createDashboard([{name:"A",stock:100,dailyDemand:10,threshold:20,unitCost:50},{name:"B",stock:0,dailyDemand:5,threshold:10,unitCost:100}]); return d.totalItems === 2 && d.totalValue === 5000; }' },
              { description: '缺貨分類', fn: '(ctx) => { const d = ctx.createDashboard([{name:"A",stock:0,dailyDemand:10,threshold:20,unitCost:50},{name:"B",stock:5,dailyDemand:5,threshold:10,unitCost:100}]); return d.criticalItems[0]==="A" && d.warningItems[0]==="B"; }' },
              { description: '平均天數', fn: '(ctx) => { const d = ctx.createDashboard([{name:"A",stock:100,dailyDemand:10,threshold:20,unitCost:50},{name:"B",stock:50,dailyDemand:5,threshold:10,unitCost:100}]); return d.avgDaysToStockout === 10; }' },
              { description: '風險分數', fn: '(ctx) => { const d = ctx.createDashboard([{name:"A",stock:0,dailyDemand:10,threshold:20,unitCost:50},{name:"B",stock:100,dailyDemand:5,threshold:10,unitCost:100}]); return d.riskScore === 50; }' },
            ],
            returnVars: ['createDashboard'],
          },
        ],
      },
    ],
  },
  {
    id: 5,
    name: 'Agent 深淵',
    emoji: '🌀',
    description: 'AI Agent 怎麼思考和行動',
    color: 'from-orange-500 to-red-600',
    quests: [
      {
        id: '5-1', name: 'Async/Await', description: '理解非同步程式設計', xp: 50,
        challenges: [
          {
            id: 1, name: 'Promise 基礎', type: 'coding', difficulty: 'easy',
            instruction: '寫 `delay(ms)` 回傳一個 Promise，在 ms 毫秒後 resolve 字串 "done"。',
            defaultCode: `function delay(ms) {\n  // 回傳一個 Promise\n  return new Promise((resolve) => {\n    // 你的程式碼\n  });\n}`,
            example: {
              title: '範例：建立一個立即 resolve 的 Promise',
              code: 'const p = new Promise(resolve => resolve("hi"));\np.then(v => console.log(v));',
              output: 'hi',
              explanation: 'Promise 建構時傳入 resolve 函式，呼叫它就會把值傳給 .then()。',
            },
            tests: [
              { description: '回傳 Promise', fn: '(ctx) => ctx.delay(10) instanceof Promise' },
              { description: 'resolve "done"', fn: '(ctx) => ctx.delay(10).then(v => v === "done")' },
            ],
            returnVars: ['delay'],
          },
          {
            id: 2, name: '執行順序', type: 'coding', difficulty: 'medium',
            instruction: '寫 `getOrder()` — 模擬非同步執行順序。回傳一個陣列記錄執行順序。\n\n規則：同步程式碼先執行，Promise.resolve().then() 裡的後執行。',
            defaultCode: `function getOrder() {\n  const order = [];\n  order.push("sync1");\n  Promise.resolve().then(() => order.push("micro"));\n  order.push("sync2");\n  // 回傳的是「同步程式碼跑完後」的順序\n  return order;\n}`,
            example: {
              title: '範例：同步 vs 非同步順序',
              code: 'console.log("A");\nsetTimeout(() => console.log("B"), 0);\nconsole.log("C");',
              output: 'A\nC\nB',
              explanation: '同步程式碼（A、C）一定先跑完，非同步回呼（B）排在後面。',
            },
            tests: [
              { description: '同步先執行', fn: '(ctx) => { const r = ctx.getOrder(); return r[0] === "sync1" && r[1] === "sync2"; }' },
              { description: '微任務還沒跑', fn: '(ctx) => ctx.getOrder().length === 2' },
            ],
            returnVars: ['getOrder'],
          },
        ],
      },
      {
        id: '5-2', name: 'Pub/Sub 模式', description: '自己寫 EventBus', xp: 50,
        challenges: [
          {
            id: 1, name: '回呼清單', type: 'coding', difficulty: 'easy',
            instruction: '寫 `createCallbackList()` — 回傳一個物件 `{add(fn), run(data)}`。add(fn) 把函式加到內部陣列，run(data) 依序呼叫所有已加入的函式並傳入 data。',
            defaultCode: `function createCallbackList() {\n  const callbacks = [];\n  return {\n    add(fn) {\n      // 把 fn 加入 callbacks\n    },\n    run(data) {\n      // 依序呼叫所有 callback\n    }\n  };\n}`,
            example: {
              title: '範例：陣列存函式並依序呼叫',
              code: 'const fns = [x => x + 1, x => x * 2];\nfns.forEach(fn => console.log(fn(5)));',
              output: '6\n10',
              explanation: '把函式存進陣列，之後遍歷呼叫，這就是回呼清單的基本原理。',
            },
            tests: [
              { description: '加入並執行', fn: '(ctx) => { const list = ctx.createCallbackList(); let result = 0; list.add(d => result = d); list.run(42); return result === 42; }' },
              { description: '多個 callback', fn: '(ctx) => { const list = ctx.createCallbackList(); let a=0,b=0; list.add(d => a=d); list.add(d => b=d*2); list.run(5); return a===5 && b===10; }' },
              { description: '無 callback 不報錯', fn: '(ctx) => { const list = ctx.createCallbackList(); list.run(1); return true; }' },
            ],
            returnVars: ['createCallbackList'],
          },
          {
            id: 2, name: '實作 EventBus', type: 'coding', difficulty: 'medium',
            instruction: '實作一個 EventBus class，支援：\n- `on(event, callback)` — 訂閱，回傳取消訂閱函式\n- `emit(event, data)` — 發送事件\n- `off(event, callback)` — 取消訂閱',
            defaultCode: `class EventBus {\n  constructor() {\n    this._listeners = new Map();\n  }\n  on(event, callback) {\n    // 訂閱事件，回傳 unsubscribe 函式\n    \n  }\n  emit(event, data) {\n    // 觸發所有訂閱者\n    \n  }\n  off(event, callback) {\n    // 取消訂閱\n    \n  }\n}`,
            referenceCode: CODE_SNIPPETS.eventBusSnippet,
            example: {
              title: '範例：用 Map 儲存多組回呼',
              code: 'const m = new Map();\nm.set("click", [() => console.log("clicked")]);\nm.get("click").forEach(fn => fn());',
              output: 'clicked',
              explanation: '用事件名稱當 key、回呼陣列當 value，就是 EventBus 的儲存方式。',
            },
            tests: [
              { description: '基本訂閱+發送', fn: '(ctx) => { const bus = new ctx.EventBus(); let received = null; bus.on("test", d => received = d); bus.emit("test", 42); return received === 42; }' },
              { description: '取消訂閱', fn: '(ctx) => { const bus = new ctx.EventBus(); let count = 0; const unsub = bus.on("x", () => count++); bus.emit("x"); unsub(); bus.emit("x"); return count === 1; }' },
              { description: '多個訂閱者', fn: '(ctx) => { const bus = new ctx.EventBus(); let a=0,b=0; bus.on("e",()=>a++); bus.on("e",()=>b++); bus.emit("e"); return a===1 && b===1; }' },
              { description: 'off 取消', fn: '(ctx) => { const bus = new ctx.EventBus(); let c=0; const fn=()=>c++; bus.on("e",fn); bus.off("e",fn); bus.emit("e"); return c===0; }' },
            ],
            returnVars: ['EventBus'],
          },
        ],
      },
      {
        id: '5-3', name: 'Semaphore 並發控制', description: '限制同時執行的數量', xp: 50,
        challenges: [
          {
            id: 1, name: '計數器', type: 'coding', difficulty: 'easy',
            instruction: '寫 `createCounter(max)` — 回傳物件 `{increment(), decrement(), isFull()}`。increment() 讓計數 +1（不超過 max），decrement() 讓計數 -1（不低於 0），isFull() 回傳計數是否已達 max。',
            defaultCode: `function createCounter(max) {\n  let count = 0;\n  return {\n    increment() {\n      // count + 1，但不超過 max\n    },\n    decrement() {\n      // count - 1，但不低於 0\n    },\n    isFull() {\n      // 是否達到 max\n    }\n  };\n}`,
            example: {
              title: '範例：簡單的上下限數值',
              code: 'let n = 0;\nfunction up() { n = Math.min(n + 1, 3); }\nfunction down() { n = Math.max(n - 1, 0); }\nup(); up(); console.log(n);',
              output: '2',
              explanation: '用 Math.min/max 限制數值範圍，計數器就是用這個技巧。',
            },
            tests: [
              { description: '初始不滿', fn: '(ctx) => ctx.createCounter(3).isFull() === false' },
              { description: '增到滿', fn: '(ctx) => { const c = ctx.createCounter(2); c.increment(); c.increment(); return c.isFull() === true; }' },
              { description: '不超過 max', fn: '(ctx) => { const c = ctx.createCounter(1); c.increment(); c.increment(); c.decrement(); return c.isFull() === false; }' },
              { description: '不低於 0', fn: '(ctx) => { const c = ctx.createCounter(3); c.decrement(); c.increment(); return c.isFull() === false; }' },
            ],
            returnVars: ['createCounter'],
          },
          {
            id: 2, name: '實作 Semaphore', type: 'coding', difficulty: 'medium',
            instruction: '實作 `AsyncSemaphore` class：\n- `constructor(max)` — 最大並發數\n- `async acquire()` — 取得位子（如果滿了就等）\n- `release()` — 釋放位子',
            defaultCode: `class AsyncSemaphore {\n  constructor(max) {\n    this._max = max;\n    this._active = 0;\n    this._queue = [];\n  }\n  async acquire() {\n    // 如果 _active < _max，直接 _active++ 回傳\n    // 否則 new Promise 等待\n    \n  }\n  release() {\n    // _active--，如果有人在等就讓下一個進\n    \n  }\n}`,
            referenceCode: CODE_SNIPPETS.semaphoreSnippet,
            example: {
              title: '範例：用 Promise 排隊',
              code: 'let busy = false;\nasync function enter() {\n  if (!busy) { busy = true; return; }\n  // 否則等待...\n}\nenter(); console.log(busy);',
              output: 'true',
              explanation: '用旗標記錄是否有空位，沒有空位就等待，這是 Semaphore 的簡化版。',
            },
            tests: [
              { description: '基本 acquire/release', fn: '(ctx) => { const s = new ctx.AsyncSemaphore(2); s.acquire(); s.acquire(); return s._active === 2; }' },
              { description: 'release 後 active 減少', fn: '(ctx) => { const s = new ctx.AsyncSemaphore(1); s.acquire(); s.release(); return s._active === 0; }' },
            ],
            returnVars: ['AsyncSemaphore'],
          },
        ],
      },
      {
        id: '5-4', name: 'Circuit Breaker', description: '實作三態熔斷器', xp: 50,
        challenges: [
          {
            id: 1, name: '簡易狀態機', type: 'coding', difficulty: 'easy',
            instruction: '寫 `createStateMachine(initialState, transitions)` — transitions 是 `{state: {action: nextState}}` 格式。回傳 `{getState(), transition(action)}`。transition 根據目前狀態和 action 切換到下一個狀態；如果找不到對應的 transition 就不變。',
            defaultCode: `function createStateMachine(initialState, transitions) {\n  let state = initialState;\n  return {\n    getState() {\n      // 回傳目前狀態\n    },\n    transition(action) {\n      // 根據 transitions 切換狀態\n    }\n  };\n}`,
            example: {
              title: '範例：用物件定義轉換規則',
              code: 'const rules = { red: { next: "green" }, green: { next: "red" } };\nlet s = "red";\ns = rules[s].next;\nconsole.log(s);',
              output: 'green',
              explanation: '用物件描述「在某狀態下，某動作會轉到哪個新狀態」，這就是狀態機。',
            },
            tests: [
              { description: '初始狀態', fn: '(ctx) => ctx.createStateMachine("idle", {}).getState() === "idle"' },
              { description: '狀態轉換', fn: '(ctx) => { const sm = ctx.createStateMachine("idle", {idle:{start:"running"}, running:{stop:"idle"}}); sm.transition("start"); return sm.getState() === "running"; }' },
              { description: '無效 action 不變', fn: '(ctx) => { const sm = ctx.createStateMachine("idle", {idle:{start:"running"}}); sm.transition("invalid"); return sm.getState() === "idle"; }' },
              { description: '連續轉換', fn: '(ctx) => { const sm = ctx.createStateMachine("a", {a:{go:"b"},b:{go:"c"}}); sm.transition("go"); sm.transition("go"); return sm.getState() === "c"; }' },
            ],
            returnVars: ['createStateMachine'],
          },
          {
            id: 2, name: '三態狀態機', type: 'coding', difficulty: 'medium',
            instruction: '實作 CircuitBreaker class：\n- 初始狀態 CLOSED\n- `recordFailure()` — 記錄失敗，3 次失敗進入 OPEN\n- `recordSuccess()` — 如果在 HALF_OPEN 狀態，回到 CLOSED\n- `canRequest()` — CLOSED 回 true；OPEN 且冷卻時間到了進 HALF_OPEN 回 true；否則 false',
            defaultCode: `class CircuitBreaker {\n  constructor(threshold = 3) {\n    this.state = "CLOSED";\n    this.failures = 0;\n    this.threshold = threshold;\n  }\n  recordFailure() {\n    // 記錄失敗\n    \n  }\n  recordSuccess() {\n    // HALF_OPEN → CLOSED\n    \n  }\n  canRequest() {\n    // 判斷能不能發請求\n    \n  }\n}`,
            referenceCode: CODE_SNIPPETS.circuitBreakerSnippet,
            example: {
              title: '範例：累計失敗次數切換狀態',
              code: 'let fails = 0;\nlet open = false;\nfunction fail() { fails++; if (fails >= 3) open = true; }\nfail(); fail(); fail();\nconsole.log(open);',
              output: 'true',
              explanation: '累計失敗超過門檻就「斷開」，這就是 Circuit Breaker 的核心邏輯。',
            },
            tests: [
              { description: '初始是 CLOSED', fn: '(ctx) => new ctx.CircuitBreaker().state === "CLOSED"' },
              { description: '3 次失敗變 OPEN', fn: '(ctx) => { const cb = new ctx.CircuitBreaker(3); cb.recordFailure(); cb.recordFailure(); cb.recordFailure(); return cb.state === "OPEN"; }' },
              { description: 'OPEN 時 canRequest 是 false', fn: '(ctx) => { const cb = new ctx.CircuitBreaker(1); cb.recordFailure(); return cb.canRequest() === false; }' },
              { description: 'CLOSED 時 canRequest 是 true', fn: '(ctx) => new ctx.CircuitBreaker().canRequest() === true' },
            ],
            returnVars: ['CircuitBreaker'],
          },
        ],
      },
      {
        id: '5-5', name: 'ReAct Loop', description: '理解思考行動觀察迴圈', xp: 50,
        challenges: [
          {
            id: 1, name: '解析工具呼叫', type: 'coding', difficulty: 'easy',
            instruction: '寫 `parseToolCalls(text)` — 找出 text 中所有 `[toolName]` 格式的工具名稱，回傳一個工具名稱的陣列。例如 `parseToolCalls("用 [search] 和 [calc] 處理")` → `["search", "calc"]`。',
            defaultCode: `function parseToolCalls(text) {\n  // 找出所有 [toolName] 並回傳名稱陣列\n  \n}`,
            example: {
              title: '範例：用正則取出中括號內容',
              code: 'const text = "use [search] here";\nconst m = text.match(/\\[(\\w+)\\]/g);\nconsole.log(m);',
              output: '["[search]"]',
              explanation: '用正則表達式 /\\[\\w+\\]/g 匹配方括號中的文字，再擷取名稱。',
            },
            tests: [
              { description: '找到工具', fn: '(ctx) => { const r = ctx.parseToolCalls("用 [search] 找資料"); return r.length === 1 && r[0] === "search"; }' },
              { description: '多個工具', fn: '(ctx) => { const r = ctx.parseToolCalls("[fetch] 然後 [calc]"); return r.length === 2 && r[0] === "fetch" && r[1] === "calc"; }' },
              { description: '沒有工具', fn: '(ctx) => ctx.parseToolCalls("沒有工具標記").length === 0' },
            ],
            returnVars: ['parseToolCalls'],
          },
          {
            id: 2, name: '思考-行動-觀察', type: 'coding', difficulty: 'medium',
            instruction: '寫 `reactStep(state, tools)` — 模擬 ReAct 迴圈的一步：\n- state 有 `{goal, observations, history}` — observations 是上次行動的結果字串\n- tools 是 `{toolName: fn}` 物件\n- 回傳 `{thought, action, result}`\n\n規則：\n- thought: 如果 observations 包含 goal 中的關鍵資訊，thought = "找到答案了"\n- action: 如果還沒找到答案，呼叫 tools 中第一個工具（按 Object.keys 順序）\n- result: 工具回傳的值，或如果已找到答案則為 observations',
            defaultCode: `function reactStep(state, tools) {\n  const { goal, observations, history } = state;\n  \n  // 判斷是否已經找到答案\n  // 如果 observations 包含 "ANSWER:" 就表示找到了\n  \n  // 還沒找到 → 呼叫工具\n  const toolNames = Object.keys(tools);\n  \n  return {\n    thought: "",\n    action: "",\n    result: ""\n  };\n}`,
            example: {
              title: '範例：根據條件選擇動作',
              code: 'function decide(info) {\n  if (info.includes("ANSWER:")) return "done";\n  return "keep_searching";\n}\nconsole.log(decide("ANSWER: 42"));',
              output: 'done',
              explanation: '根據觀察結果判斷下一步動作，這就是 ReAct 迴圈中「思考」的簡化版。',
            },
            tests: [
              { description: '呼叫工具', fn: '(ctx) => { const r = ctx.reactStep({goal:"找庫存",observations:"",history:[]},{search:()=>"庫存: 100"}); return r.action === "search" && r.result === "庫存: 100"; }' },
              { description: '找到答案', fn: '(ctx) => { const r = ctx.reactStep({goal:"找庫存",observations:"ANSWER: 100",history:[]},{search:()=>"x"}); return r.thought === "找到答案了"; }' },
              { description: '結果傳遞', fn: '(ctx) => { const r = ctx.reactStep({goal:"x",observations:"ANSWER: done",history:[]},{}); return r.result === "ANSWER: done"; }' },
            ],
            returnVars: ['reactStep'],
          },
        ],
      },
      {
        id: '5-6', name: 'Boss: 自己寫一個 Mini Agent', description: '完整的 tool-calling agent', xp: 200, isBoss: true,
        challenges: [
          {
            id: 1, name: '工具調度 Agent', type: 'coding', difficulty: 'hard',
            instruction: '寫 `createAgent(tools)` — tools 是 `{name: fn}` 物件。回傳一個 `run(task)` 函式：\n\n`run(task)` 的邏輯：\n1. 解析 task 字串，找出其中提到的工具名稱（task 會包含 `[toolName]` 格式）\n2. 按順序呼叫找到的工具，每個工具的輸入是 task\n3. 收集所有結果到陣列\n4. 回傳 `{task, steps: [{tool, result}], finalAnswer}` — finalAnswer 是最後一個工具的結果',
            defaultCode: `function createAgent(tools) {\n  const toolNames = Object.keys(tools);\n  \n  return function run(task) {\n    const steps = [];\n    \n    // 找出 task 中提到的 [toolName]\n    // 按順序呼叫，收集結果\n    \n    return {\n      task,\n      steps,\n      finalAnswer: steps.length > 0 ? steps[steps.length - 1].result : null\n    };\n  };\n}`,
            referenceCode: CODE_SNIPPETS.reactLoopSnippet,
            example: {
              title: '範例：從字典呼叫函式',
              code: 'const tools = { add: (a, b) => a + b };\nconst name = "add";\nconsole.log(tools[name](3, 4));',
              output: '7',
              explanation: '用字串當 key 查找並呼叫對應函式，Agent 的工具調度就是這個模式。',
            },
            tests: [
              { description: '單工具呼叫', fn: '(ctx) => { const agent = ctx.createAgent({search:(t)=>"found:42"}); const r = agent.run("請用 [search] 找資料"); return r.steps.length === 1 && r.steps[0].tool === "search" && r.finalAnswer === "found:42"; }' },
              { description: '多工具呼叫', fn: '(ctx) => { const agent = ctx.createAgent({fetch:(t)=>"data",calc:(t)=>"result"}); const r = agent.run("[fetch] 然後 [calc]"); return r.steps.length === 2 && r.finalAnswer === "result"; }' },
              { description: '無匹配工具', fn: '(ctx) => { const agent = ctx.createAgent({search:()=>"x"}); const r = agent.run("沒有工具標記"); return r.steps.length === 0 && r.finalAnswer === null; }' },
              { description: 'task 保留', fn: '(ctx) => { const agent = ctx.createAgent({}); return agent.run("hello").task === "hello"; }' },
            ],
            returnVars: ['createAgent'],
          },
        ],
      },
    ],
  },
  {
    id: 6,
    name: '供應鏈商業案例',
    emoji: '📊',
    description: '技術只是手段，理解業務才是價值所在',
    color: 'from-amber-500 to-orange-600',
    quests: [
      {
        id: '6-1', name: '需求預測', description: '實作移動平均預測', xp: 50,
        challenges: [
          {
            id: 1, name: '移動平均', type: 'coding', difficulty: 'easy',
            instruction: '寫 `movingAverage(data, window)` — 取最後 window 筆資料的平均值。',
            defaultCode: `function movingAverage(data, window) {\n  // 取最後 window 筆的平均\n  \n}`,
            example: {
              title: '範例：取陣列最後 N 個元素的平均',
              code: 'const arr = [10, 20, 30, 40];\nconst last2 = arr.slice(-2);\nconsole.log(last2.reduce((a,b) => a+b, 0) / last2.length);',
              output: '35',
              explanation: '用 slice(-N) 取最後 N 個，再加總除以數量就是平均，移動平均的核心。',
            },
            tests: [
              { description: '4 期平均', fn: '(ctx) => ctx.movingAverage([100,120,90,110], 4) === 105' },
              { description: '2 期平均', fn: '(ctx) => ctx.movingAverage([100,120,90,110], 2) === 100' },
              { description: '單期', fn: '(ctx) => ctx.movingAverage([100,120,90,110], 1) === 110' },
            ],
            returnVars: ['movingAverage'],
          },
          {
            id: 2, name: '預測誤差', type: 'coding', difficulty: 'medium',
            instruction: '寫 `mae(actual, predicted)` — 計算 Mean Absolute Error（平均絕對誤差）。',
            defaultCode: `function mae(actual, predicted) {\n  // |actual[0]-predicted[0]| + ... / n\n  \n}`,
            example: {
              title: '範例：計算兩數差的絕對值',
              code: 'const actual = 10;\nconst predicted = 13;\nconsole.log(Math.abs(actual - predicted));',
              output: '3',
              explanation: 'Math.abs 取絕對值，MAE 就是把所有差的絕對值加起來再平均。',
            },
            tests: [
              { description: '完全準確', fn: '(ctx) => ctx.mae([10,20,30],[10,20,30]) === 0' },
              { description: '有誤差', fn: '(ctx) => ctx.mae([10,20,30],[12,18,33]) === 3' },
            ],
            returnVars: ['mae'],
          },
        ],
      },
      {
        id: '6-2', name: '安全庫存策略', description: '計算最佳安全庫存', xp: 50,
        challenges: [
          {
            id: 1, name: '標準差', type: 'coding', difficulty: 'easy',
            instruction: '寫 `stdDev(data)` — 計算母體標準差。公式：先算平均值 μ，再算每個值與 μ 的差的平方的平均，最後開根號。結果四捨五入到小數第二位。',
            defaultCode: `function stdDev(data) {\n  // 1. 算平均值\n  // 2. 算方差（每個值與平均的差的平方的平均）\n  // 3. 開根號\n  // 4. 四捨五入到小數第二位\n  \n}`,
            example: {
              title: '範例：計算方差',
              code: 'const data = [4, 6];\nconst mean = (4 + 6) / 2; // 5\nconst variance = ((4-5)**2 + (6-5)**2) / 2;\nconsole.log(variance);',
              output: '1',
              explanation: '方差是每個值與平均的差的平方的平均；標準差就是方差開根號。',
            },
            tests: [
              { description: '基本計算', fn: '(ctx) => ctx.stdDev([2, 4, 4, 4, 5, 5, 7, 9]) === 2' },
              { description: '全部相同', fn: '(ctx) => ctx.stdDev([5, 5, 5, 5]) === 0' },
              { description: '兩個值', fn: '(ctx) => ctx.stdDev([0, 10]) === 5' },
            ],
            returnVars: ['stdDev'],
          },
          {
            id: 2, name: '安全庫存公式', type: 'coding', difficulty: 'medium',
            instruction: '寫 `safetyStock(zScore, demandStdDev, leadTimeDays)` — 公式：`z × σ × √LT`。結果四捨五入到整數。',
            defaultCode: `function safetyStock(zScore, demandStdDev, leadTimeDays) {\n  // z × σ × √LT，四捨五入\n  \n}`,
            example: {
              title: '範例：簡單的乘法公式',
              code: 'const z = 1.65;\nconst sigma = 10;\nconst lt = 4;\nconsole.log(Math.round(z * sigma * Math.sqrt(lt)));',
              output: '33',
              explanation: 'z x sigma x sqrt(LT) 就是安全庫存公式，最後四捨五入。',
            },
            tests: [
              { description: '95% 服務水準', fn: '(ctx) => ctx.safetyStock(1.65, 20, 7) === 87' },
              { description: '99% 服務水準', fn: '(ctx) => ctx.safetyStock(2.33, 20, 7) === 123' },
              { description: '短前置時間', fn: '(ctx) => ctx.safetyStock(1.65, 10, 1) === 17' },
            ],
            returnVars: ['safetyStock'],
          },
        ],
      },
      {
        id: '6-3', name: 'BOM 成本分析', description: '展開 BOM 算總成本', xp: 50,
        challenges: [
          {
            id: 1, name: '點積', type: 'coding', difficulty: 'easy',
            instruction: '寫 `sumProducts(quantities, prices)` — 計算兩個等長陣列的點積（dot product），也就是 quantities[0]*prices[0] + quantities[1]*prices[1] + ...。',
            defaultCode: `function sumProducts(quantities, prices) {\n  // 計算點積\n  \n}`,
            example: {
              title: '範例：兩個陣列對應相乘再加總',
              code: 'const a = [2, 3];\nconst b = [5, 10];\nconsole.log(a[0]*b[0] + a[1]*b[1]);',
              output: '40',
              explanation: '對應位置相乘後加總就是點積，可以用 reduce 簡化。',
            },
            tests: [
              { description: '基本計算', fn: '(ctx) => ctx.sumProducts([3, 2], [10, 20]) === 70' },
              { description: '空陣列', fn: '(ctx) => ctx.sumProducts([], []) === 0' },
              { description: '單一元素', fn: '(ctx) => ctx.sumProducts([5], [10]) === 50' },
            ],
            returnVars: ['sumProducts'],
          },
          {
            id: 2, name: '產品成本計算', type: 'coding', difficulty: 'medium',
            instruction: '寫 `productCost(components, priceMap)` — components 是 `[{material, quantity}]`，priceMap 是 `{material: unitPrice}`。回傳總成本。',
            defaultCode: `function productCost(components, priceMap) {\n  // 加總每個零件的 quantity × unitPrice\n  \n}`,
            example: {
              title: '範例：查表計算總價',
              code: 'const items = [{name:"A", qty:2}];\nconst prices = {A: 15};\nconsole.log(items[0].qty * prices[items[0].name]);',
              output: '30',
              explanation: '從價格表查出單價再乘以數量，對所有零件做一遍就是產品成本。',
            },
            tests: [
              { description: '計算正確', fn: '(ctx) => ctx.productCost([{material:"A",quantity:3},{material:"B",quantity:2}],{A:10,B:20}) === 70' },
              { description: '空零件', fn: '(ctx) => ctx.productCost([],{}) === 0' },
              { description: '找不到價格當 0', fn: '(ctx) => ctx.productCost([{material:"X",quantity:5}],{}) === 0' },
            ],
            returnVars: ['productCost'],
          },
        ],
      },
      {
        id: '6-4', name: '風險量化', description: '用機率算風險分數', xp: 50,
        challenges: [
          {
            id: 1, name: '風險分數', type: 'coding', difficulty: 'easy',
            instruction: '寫 `riskScore(probability, impactAmount)` — 回傳 probability × impactAmount。',
            defaultCode: `function riskScore(probability, impactAmount) {\n  \n}`,
            example: {
              title: '範例：機率乘以影響',
              code: 'const prob = 0.5;\nconst impact = 200;\nconsole.log(prob * impact);',
              output: '100',
              explanation: '風險分數 = 發生機率 x 影響金額，概念很直觀。',
            },
            tests: [
              { description: '基本計算', fn: '(ctx) => ctx.riskScore(0.3, 500000) === 150000' },
              { description: '零機率', fn: '(ctx) => ctx.riskScore(0, 1000000) === 0' },
            ],
            returnVars: ['riskScore'],
          },
          {
            id: 2, name: '風險排序', type: 'coding', difficulty: 'medium',
            instruction: '寫 `rankRisks(items)` — items 是 `[{name, probability, impact}]`，回傳按風險分數（probability × impact）由高到低排序的陣列，每項加上 `riskScore` 欄位。',
            defaultCode: `function rankRisks(items) {\n  // 加上 riskScore 並排序\n  \n}`,
            example: {
              title: '範例：依分數排序物件',
              code: 'const arr = [{n:"X",s:30},{n:"Y",s:50}];\narr.sort((a,b) => b.s - a.s);\nconsole.log(arr[0].n);',
              output: 'Y',
              explanation: '用 sort 依照分數由高到低排序，風險排序就是先算分再排。',
            },
            tests: [
              { description: '排序正確', fn: '(ctx) => { const r = ctx.rankRisks([{name:"A",probability:0.1,impact:1000},{name:"B",probability:0.5,impact:500}]); return r[0].name === "B" && r[0].riskScore === 250; }' },
            ],
            returnVars: ['rankRisks'],
          },
        ],
      },
      {
        id: '6-5', name: '場景模擬', description: '如果原料漲價 20%...', xp: 50,
        challenges: [
          {
            id: 1, name: '克隆並修改', type: 'coding', difficulty: 'easy',
            instruction: '寫 `cloneAndModify(obj, key, newValue)` — 回傳一個新物件，跟 obj 一樣但把 key 對應的值改成 newValue。不修改原物件。',
            defaultCode: `function cloneAndModify(obj, key, newValue) {\n  // 回傳新物件，修改 key 的值\n  \n}`,
            example: {
              title: '範例：用 spread 複製再修改',
              code: 'const obj = { a: 1, b: 2 };\nconst copy = { ...obj, a: 99 };\nconsole.log(copy, obj.a);',
              output: '{ a: 99, b: 2 } 1',
              explanation: '展開運算子建立淺拷貝，修改不影響原物件。',
            },
            tests: [
              { description: '修改值', fn: '(ctx) => { const r = ctx.cloneAndModify({a:1, b:2}, "a", 10); return r.a === 10 && r.b === 2; }' },
              { description: '不修改原物件', fn: '(ctx) => { const orig = {x:1}; ctx.cloneAndModify(orig, "x", 2); return orig.x === 1; }' },
              { description: '新增欄位', fn: '(ctx) => ctx.cloneAndModify({a:1}, "b", 2).b === 2' },
            ],
            returnVars: ['cloneAndModify'],
          },
          {
            id: 2, name: 'What-If 分析', type: 'coding', difficulty: 'medium',
            instruction: '寫 `whatIf(base, changes)` — base 是 `{dailyDemand, unitPrice, leadTimeDays}`，changes 是 `[{field, percentage}]`。回傳調整後的新物件（不修改原物件）。percentage 表示增減百分比，例如 20 表示 +20%。',
            defaultCode: `function whatIf(base, changes) {\n  // 複製 base，套用 changes\n  \n}`,
            example: {
              title: '範例：按百分比調整數值',
              code: 'let price = 100;\nconst pct = 20; // +20%\nprice = price * (1 + pct / 100);\nconsole.log(price);',
              output: '120',
              explanation: '百分比調整公式：原值 x (1 + percentage/100)，What-If 就是套用多個這樣的調整。',
            },
            tests: [
              { description: '需求增加 50%', fn: '(ctx) => { const r = ctx.whatIf({dailyDemand:100,unitPrice:10,leadTimeDays:7},[{field:"dailyDemand",percentage:50}]); return r.dailyDemand === 150; }' },
              { description: '價格降低 20%', fn: '(ctx) => { const r = ctx.whatIf({dailyDemand:100,unitPrice:10,leadTimeDays:7},[{field:"unitPrice",percentage:-20}]); return r.unitPrice === 8; }' },
              { description: '不修改原物件', fn: '(ctx) => { const b = {dailyDemand:100,unitPrice:10,leadTimeDays:7}; ctx.whatIf(b,[{field:"dailyDemand",percentage:50}]); return b.dailyDemand === 100; }' },
              { description: '多個調整', fn: '(ctx) => { const r = ctx.whatIf({dailyDemand:100,unitPrice:10,leadTimeDays:7},[{field:"dailyDemand",percentage:50},{field:"unitPrice",percentage:20}]); return r.dailyDemand === 150 && r.unitPrice === 12; }' },
            ],
            returnVars: ['whatIf'],
          },
        ],
      },
      {
        id: '6-6', name: 'Boss: 完整商業簡報', description: '給數據分析做決策建議', xp: 200, isBoss: true,
        challenges: [
          {
            id: 1, name: '商業決策報告', type: 'coding', difficulty: 'hard',
            instruction: '寫 `generateReport(data)` — data 是：\n```\n{\n  products: [{name, stock, dailyDemand, unitCost, threshold, leadTimeDays}],\n  budget: 可用預算\n}\n```\n回傳決策報告物件：\n```\n{\n  summary: { totalProducts, totalValue, avgDaysToStockout },\n  critical: [缺貨品項名稱],\n  recommendations: [{product, action, reason, cost}],\n  totalCost: 建議方案的總成本\n}\n```\n\n建議規則：\n- stock=0 的品項 → action:"緊急補貨", reason:"已缺貨", cost = dailyDemand × leadTimeDays × unitCost\n- stock <= threshold 的品項 → action:"補貨", reason:"低於安全庫存", cost = threshold × unitCost\n- 如果 totalCost > budget，只保留成本最低的建議直到預算內',
            defaultCode: `function generateReport(data) {\n  const { products, budget } = data;\n  \n  const summary = {\n    totalProducts: products.length,\n    totalValue: 0,\n    avgDaysToStockout: 0\n  };\n  \n  const critical = [];\n  let recommendations = [];\n  \n  // 分析每個產品\n  \n  // 如果超出預算，按成本排序只保留預算內的\n  \n  let totalCost = recommendations.reduce((s, r) => s + r.cost, 0);\n  \n  return { summary, critical, recommendations, totalCost };\n}`,
            referenceCode: `// 在真實 DI 專案中，這類報告由 AI Agent 根據\n// calculator.js 和 bomCalculator.js 的結果自動生成\n// 你正在學習背後的決策邏輯`,
            example: {
              title: '範例：彙整陣列成摘要物件',
              code: 'const items = [{v:10},{v:20},{v:30}];\nconst summary = {\n  count: items.length,\n  total: items.reduce((s,i) => s + i.v, 0)\n};\nconsole.log(summary);',
              output: '{ count: 3, total: 60 }',
              explanation: '遍歷資料算出各種統計，組合成報告物件，商業決策報告就是更完整的版本。',
            },
            tests: [
              { description: '基本統計', fn: '(ctx) => { const r = ctx.generateReport({products:[{name:"A",stock:100,dailyDemand:10,unitCost:5,threshold:20,leadTimeDays:3},{name:"B",stock:0,dailyDemand:5,unitCost:10,threshold:10,leadTimeDays:5}],budget:10000}); return r.summary.totalProducts === 2; }' },
              { description: '識別缺貨', fn: '(ctx) => { const r = ctx.generateReport({products:[{name:"X",stock:0,dailyDemand:10,unitCost:5,threshold:20,leadTimeDays:3}],budget:10000}); return r.critical.includes("X"); }' },
              { description: '緊急補貨建議', fn: '(ctx) => { const r = ctx.generateReport({products:[{name:"X",stock:0,dailyDemand:10,unitCost:5,threshold:20,leadTimeDays:3}],budget:10000}); return r.recommendations[0].action === "緊急補貨" && r.recommendations[0].cost === 150; }' },
              { description: '預算限制', fn: '(ctx) => { const r = ctx.generateReport({products:[{name:"A",stock:0,dailyDemand:100,unitCost:100,threshold:50,leadTimeDays:10},{name:"B",stock:5,dailyDemand:1,unitCost:10,threshold:10,leadTimeDays:3}],budget:200}); return r.totalCost <= 200; }' },
            ],
            returnVars: ['generateReport'],
          },
        ],
      },
    ],
  },
]

// ── 工具函式 ──────────────────────────────────────────────

export function getWorld(worldId) {
  return WORLDS.find(w => w.id === Number(worldId))
}

export function getQuest(questId) {
  for (const world of WORLDS) {
    const quest = world.quests.find(q => q.id === questId)
    if (quest) return quest
  }
  return null
}

export function getChallenge(questId, challengeId) {
  const quest = getQuest(questId)
  if (!quest) return null
  return quest.challenges.find(c => c.id === Number(challengeId)) || null
}
