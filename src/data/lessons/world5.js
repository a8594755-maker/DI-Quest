export default `
# World 5：Agent 深淵

> **目標：** 理解非同步、設計模式、AI Agent 的核心架構
> **對應專案：** \`src/services/agent-core/\`、\`src/services/ai-infra/\`、\`src/services/governance/\`

---

## 5-1：Async/Await — 非同步程式設計

### 為什麼需要非同步？

JavaScript 是**單執行緒**的——同一時間只能做一件事。

想像你在餐廳點餐：同步模式就像你站在櫃檯前一動不動等廚房做完，後面的人全部排隊等你。非同步模式就像你拿了號碼牌回座位等，其他人可以繼續點餐。

如果呼叫 API 要等 3 秒，同步程式碼會「卡住」整個畫面——使用者什麼都不能做。非同步讓你「先去做別的事，API 回來再處理」。

### Promise — 非同步的基礎磚塊

Promise 是一個**物件**，代表「一個未來才會完成的操作」。它有三種狀態：

\`\`\`
  ┌─────────┐     resolve(value)     ┌───────────┐
  │ pending │ ──────────────────────→ │ fulfilled │
  │ (等待中) │                         │  (成功)    │
  └─────────┘                         └───────────┘
       │
       │        reject(error)         ┌───────────┐
       └────────────────────────────→ │ rejected  │
                                      │  (失敗)    │
                                      └───────────┘
\`\`\`

**手動建立 Promise：**

\`\`\`javascript
// Promise 接受一個函式，函式有兩個參數：resolve 和 reject
const myPromise = new Promise((resolve, reject) => {
  // 做某件事...
  // 成功就呼叫 resolve(值)
  // 失敗就呼叫 reject(錯誤)
});
\`\`\`

**一個最簡單的例子——delay 函式：**

\`\`\`javascript
function delay(ms) {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve("done");  // ms 毫秒後，Promise 狀態變成 fulfilled，值是 "done"
    }, ms);
  });
}

// 使用
delay(1000).then(value => console.log(value)); // 1 秒後印出 "done"
\`\`\`

這裡有幾個關鍵點：
1. \`delay\` 函式**立刻回傳**一個 Promise 物件（不會等 1 秒）
2. \`setTimeout\` 在背景計時
3. 時間到了，呼叫 \`resolve("done")\`，Promise 狀態變成 fulfilled
4. \`.then()\` 裡的 callback 被觸發，拿到 "done"

### Event Loop — JavaScript 的執行順序

這是非同步最容易搞混的地方。JavaScript 引擎有一個 **Event Loop（事件迴圈）**，它決定程式碼的執行順序：

\`\`\`
  ┌─────────────────────┐
  │    Call Stack        │ ← 同步程式碼在這裡跑
  │   （呼叫堆疊）        │
  └──────────┬──────────┘
             │ 堆疊清空後
             ↓
  ┌─────────────────────┐
  │  Microtask Queue    │ ← Promise.then()、async/await 在這裡排隊
  │  （微任務佇列）       │    優先執行！
  └──────────┬──────────┘
             │ 微任務清空後
             ↓
  ┌─────────────────────┐
  │  Macrotask Queue    │ ← setTimeout、setInterval 在這裡排隊
  │  （巨任務佇列）       │
  └─────────────────────┘
\`\`\`

**執行順序規則：**
1. 先跑完所有**同步程式碼**（Call Stack）
2. 再跑所有**微任務**（Microtask Queue）——Promise.then()、await 後面的程式碼
3. 最後跑**巨任務**（Macrotask Queue）——setTimeout 等

\`\`\`javascript
function getOrder() {
  const order = [];

  order.push("sync1");                              // 1. 同步，立刻執行
  Promise.resolve().then(() => order.push("micro")); // 排入微任務佇列，等同步跑完
  order.push("sync2");                              // 2. 同步，立刻執行

  return order;
  // 函式 return 時，同步程式碼跑完了
  // order 裡面只有 ["sync1", "sync2"]
  // "micro" 還在微任務佇列裡，還沒執行！
}

const result = getOrder();
console.log(result);         // ["sync1", "sync2"]  ← 只有 2 個元素
console.log(result.length);  // 2
// ⚠️ "micro" 要等目前的同步程式碼全部跑完才會執行
\`\`\`

**為什麼 "micro" 不在陣列裡？** 因為 \`Promise.resolve().then()\` 會把 callback 放進微任務佇列，而微任務要等 Call Stack 清空才會執行。\`return order\` 是同步的，在微任務之前就回傳了。

### async/await — 更好讀的 Promise 寫法

\`\`\`javascript
async function fetchData() {
  try {
    const response = await fetch('https://api.example.com/data');
    const data = await response.json();
    console.log(data);
  } catch (error) {
    console.error('出錯了:', error);
  }
}
\`\`\`

\`async/await\` 和 \`.then()\` 做的事**完全一樣**，只是語法糖，更像同步程式碼。

**重要觀念：** \`await\` 只暫停**這個 async 函式本身**，不暫停整個程式。外面的程式碼繼續跑：

\`\`\`javascript
console.log('1. 開始');

async function demo() {
  console.log('2. 進入函式');
  await new Promise(resolve => setTimeout(resolve, 1000));
  console.log('4. 等了 1 秒');
}

demo();  // 啟動但不等它完成
console.log('3. 函式啟動了但還沒完成');

// 印出順序：1, 2, 3, (等 1 秒), 4
\`\`\`

### DI 專案怎麼用 — aiProxyService.js

\`\`\`javascript
// 來自 src/services/ai-infra/aiProxyService.js
async function invokeAiProxy(payload, options = {}) {
  const response = await fetch(edgeFunctionUrl, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': \\\`Bearer \\\${apiKey}\\\`,
    },
    body: JSON.stringify(payload),
  });

  if (!response.ok) {
    throw new Error(\\\`AI Proxy 呼叫失敗: \\\${response.status}\\\`);
  }

  return response.json(); // 回傳 Promise
}
\`\`\`

### 常見錯誤

**錯誤 1：忘記 await**
\`\`\`javascript
// 錯誤：result 是 Promise 物件，不是結果值
const result = fetchData();
console.log(result); // Promise { <pending> }

// 正確：
const result = await fetchData();
\`\`\`

**錯誤 2：在非 async 函式裡用 await**
\`\`\`javascript
// 錯誤：SyntaxError
function doSomething() {
  const data = await fetchData(); // ← 不行！
}

// 正確：加上 async
async function doSomething() {
  const data = await fetchData();
}
\`\`\`

### 小練習（直接對應挑戰題目）

**練習 A：** 寫一個 \`delay(ms)\` 函式，回傳 Promise，在 ms 毫秒後 resolve 字串 \`"done"\`。

提示：用 \`new Promise\` + \`setTimeout\` + \`resolve("done")\`。

**練習 B：** 寫一個 \`getOrder()\` 函式，裡面用 \`order.push("sync1")\`、\`Promise.resolve().then(() => order.push("micro"))\`、\`order.push("sync2")\`，然後 return order。想想看回傳的陣列裡有幾個元素？

---

## 5-2：Pub/Sub 模式 — EventBus

### 問題：元件之間怎麼溝通？

想像一個辦公室場景：
- 會議室 A 裡的人做完報告了，想通知倉庫的人可以出貨了
- 但他不知道倉庫裡**誰**在負責，也不知道**幾個人**需要知道這件事
- 他只需要在公司廣播喊一聲：「報告完成了！」

這就是 **Pub/Sub（發佈/訂閱）模式**。發佈者不需要知道訂閱者是誰，訂閱者不需要知道發佈者是誰，中間有一個**事件匯流排（EventBus）**負責傳遞消息。

\`\`\`
  Component A ──emit("stock:low")──→ ┌───────────┐ ──→ Handler 1
                                      │  EventBus │ ──→ Handler 2
  Component B ──emit("order:new")──→ │  (匯流排)  │ ──→ Handler 3
                                      └───────────┘
\`\`\`

### 資料結構：Map + Set

EventBus 的核心資料結構是 \`Map<string, Set<Function>>\`：

\`\`\`
  _listeners (Map)
  ┌──────────────────────────────────────┐
  │ "stock:low"    → Set{ fn1, fn2 }    │
  │ "order:new"    → Set{ fn3 }         │
  │ "agent:done"   → Set{ fn4, fn5 }    │
  └──────────────────────────────────────┘
\`\`\`

為什麼用 **Map** 而不是普通物件？Map 的 key 可以是任何型別，效能更好。
為什麼用 **Set** 而不是 Array？Set 自動去重（同一個 callback 不會被加兩次），刪除是 O(1) 不是 O(n)。

### 逐步實作 EventBus

\`\`\`javascript
class EventBus {
  constructor() {
    // 初始化：空的 Map，key 是事件名稱，value 是 callback 的 Set
    this._listeners = new Map();
  }

  // 訂閱事件
  on(event, callback) {
    // 如果這個事件還沒有任何訂閱者，建立一個空的 Set
    if (!this._listeners.has(event)) {
      this._listeners.set(event, new Set());
    }

    // 把 callback 加入 Set
    this._listeners.get(event).add(callback);

    // ★ 回傳取消訂閱的函式 — 這是很重要的設計
    // 呼叫回傳的函式就能取消訂閱，不需要另外存 reference
    return () => this.off(event, callback);
  }

  // 發送事件
  emit(event, data) {
    const handlers = this._listeners.get(event);
    if (handlers) {
      // 觸發這個事件所有的 callback，傳入 data
      handlers.forEach(fn => fn(data));
    }
  }

  // 取消訂閱
  off(event, callback) {
    // 用 ?. 安全呼叫 — 即使這個事件沒有訂閱者也不會報錯
    this._listeners.get(event)?.delete(callback);
  }
}
\`\`\`

### 使用範例

\`\`\`javascript
const bus = new EventBus();

// 訂閱 — 回傳 unsubscribe 函式
const unsubscribe = bus.on('stock:critical', (data) => {
  console.log('緊急通知！', data.materialCode, '庫存不足');
});

// 再加一個訂閱者
bus.on('stock:critical', (data) => {
  console.log('記錄到 log：', data);
});

// 發送事件 — 兩個訂閱者都會收到
bus.emit('stock:critical', { materialCode: 'COMP-001', days: 3 });

// 取消第一個訂閱者（兩種方式都行）
unsubscribe();  // 方式 1：呼叫 on() 回傳的函式
// bus.off('stock:critical', handler);  // 方式 2：直接呼叫 off
\`\`\`

### DI 專案怎麼用 — eventBus.js

在 DI 專案裡，EventBus 用來在 React 元件和 Agent 服務之間傳遞消息：

\`\`\`javascript
// 來自 src/services/governance/eventBus.js
// 還支援萬用字元匹配
emit(event, payload) {
  const handlers = this._listeners.get(event);
  if (handlers) {
    handlers.forEach(fn => fn(payload));
  }

  // 萬用字元支援：'agent:*' 匹配 'agent:start', 'agent:done', 'agent:error'
  for (const [pattern, fns] of this._listeners) {
    if (pattern.endsWith('*') && event.startsWith(pattern.slice(0, -1))) {
      fns.forEach(fn => fn(payload));
    }
  }
}
\`\`\`

\`\`\`javascript
// 在 React 元件裡使用
useEffect(() => {
  const unsubscribe = eventBus.on('agent:done', (result) => {
    setAgentResult(result);
  });
  return unsubscribe; // ★ 元件卸載時自動取消訂閱，防止記憶體洩漏
}, []);
\`\`\`

### 常見錯誤

**錯誤 1：忘記取消訂閱 — 記憶體洩漏**
\`\`\`javascript
// 錯誤：每次元件 re-render 都加一個新的訂閱
useEffect(() => {
  eventBus.on('update', handler);
  // 沒有 return 取消訂閱！
});

// 正確：
useEffect(() => {
  const unsub = eventBus.on('update', handler);
  return unsub;
}, []);
\`\`\`

**錯誤 2：用箭頭函式訂閱後想用 off 取消**
\`\`\`javascript
// 錯誤：兩個箭頭函式是不同的物件，off 找不到
bus.on('e', (d) => console.log(d));
bus.off('e', (d) => console.log(d)); // ← 這是不同的函式物件！

// 正確：保存 reference
const handler = (d) => console.log(d);
bus.on('e', handler);
bus.off('e', handler); // ← 同一個函式物件
\`\`\`

### 小練習（直接對應挑戰題目）

實作一個 \`EventBus\` class，必須支援：
- \`on(event, callback)\` — 訂閱事件，**回傳取消訂閱函式**
- \`emit(event, data)\` — 觸發事件的所有 callback
- \`off(event, callback)\` — 取消特定 callback 的訂閱

測試你的實作：建立 bus，訂閱 "test" 事件，emit 一次檢查有收到，然後 unsubscribe 後再 emit 一次檢查沒收到。

---

## 5-3：Semaphore — 並發控制

### 問題：太多請求同時飛出去

你有 100 個 API 呼叫要發。如果同時全部發出去：
- 伺服器回你 **429 Too Many Requests**
- 或者你的電腦記憶體不夠用
- 或者網路頻寬被塞爆

### 餐廳類比

想像一家只有 3 張桌子的餐廳：

\`\`\`
  餐廳（AsyncSemaphore, max = 3）

  桌子 1: [客人A]    ← _active = 3（滿了）
  桌子 2: [客人B]
  桌子 3: [客人C]

  等候區 _queue: [客人D, 客人E, 客人F ...]
                     ↑
              客人 D 在等 Promise（排隊中）

  → 客人 B 吃完離開（release）
  → 桌子 2 空出來
  → 客人 D 自動入座（resolve 被呼叫）
\`\`\`

- \`acquire()\` = 排隊等位子。有位子就直接坐下，沒位子就等。
- \`release()\` = 吃完離開。如果有人在等，讓下一個進來。

### 逐步實作 AsyncSemaphore

\`\`\`javascript
class AsyncSemaphore {
  constructor(max) {
    this._max = max;       // 最大並發數（桌子數）
    this._active = 0;      // 目前使用中的數量（已坐下的客人）
    this._queue = [];       // 等待中的 resolve 函式（排隊的客人）
  }

  async acquire() {
    if (this._active < this._max) {
      // 還有位子！直接進入
      this._active++;
      return;
    }

    // 沒位子了，建立一個 Promise 然後排隊
    // ★ 關鍵技巧：把 resolve 存起來，等有位子的時候再呼叫它
    return new Promise((resolve) => {
      this._queue.push(resolve);
    });
    // 這個 await 會在這裡「卡住」，直到有人呼叫 resolve
  }

  release() {
    this._active--;  // 釋放一個位子

    if (this._queue.length > 0) {
      // 有人在排隊！讓下一個進入
      this._active++;
      const nextResolve = this._queue.shift(); // 取出排最前面的
      nextResolve(); // 呼叫 resolve，解除那個 Promise 的等待
    }
  }
}
\`\`\`

### 核心技巧：把 resolve 存起來

\`\`\`javascript
// 當 _active >= _max 時：
return new Promise((resolve) => {
  this._queue.push(resolve);  // 不立刻呼叫 resolve，而是存起來
});
// ↑ 這個 Promise 會一直處於 pending 狀態
// ↑ 直到某處呼叫 this._queue.shift()()，也就是呼叫 resolve
\`\`\`

這是非同步程式設計裡很重要的模式：**手動控制 Promise 何時 resolve**。

### 使用方式

\`\`\`javascript
const semaphore = new AsyncSemaphore(3); // 最多 3 個同時

async function callApi(url) {
  await semaphore.acquire();  // 等有位子
  try {
    const result = await fetch(url);
    return result;
  } finally {
    semaphore.release();  // ★ 不管成功失敗都要釋放
  }
}

// 即使同時呼叫 100 個，最多只有 3 個在飛
const urls = Array(100).fill('https://api.example.com');
await Promise.all(urls.map(callApi));
\`\`\`

**\`try/finally\` 非常重要：** 如果請求失敗（throw error）但沒有 release，這個位子就被永久佔住了，最終所有位子都被佔住，整個系統卡死。

### DI 專案怎麼用 — aiProxyService.js

\`\`\`javascript
// 來自 src/services/ai-infra/aiProxyService.js
// 限制同時最多 5 個 AI API 呼叫
const aiSemaphore = new AsyncSemaphore(5);

async function invokeAiProxy(payload) {
  await aiSemaphore.acquire();
  try {
    const response = await fetch(edgeFunctionUrl, { ... });
    return response.json();
  } finally {
    aiSemaphore.release();
  }
}
\`\`\`

### 執行流程圖

\`\`\`
  時間軸（max = 2）:

  Task A: ─── acquire() ──→ [執行中...] ──→ release() ───
  Task B: ─── acquire() ──→ [執行中........] ──→ release()
  Task C: ─── acquire() ──→ (排隊等...) ─────→ [執行中...] → release()
                                         ↑
                                    Task A release 後
                                    Task C 才能開始
\`\`\`

### 常見錯誤

**錯誤：忘記 release**
\`\`\`javascript
// 錯誤：如果 fetch 丟出 error，release 不會被執行
async function bad(url) {
  await semaphore.acquire();
  const result = await fetch(url); // 如果這行 throw...
  semaphore.release();             // 這行就不會跑到
  return result;
}

// 正確：用 try/finally
async function good(url) {
  await semaphore.acquire();
  try {
    return await fetch(url);
  } finally {
    semaphore.release(); // 不管成功失敗都會執行
  }
}
\`\`\`

### 小練習（直接對應挑戰題目）

實作 \`AsyncSemaphore\` class：
- \`constructor(max)\` — 設定最大並發數
- \`async acquire()\` — 如果 \`_active < _max\` 就 \`_active++\` 回傳；否則建立 Promise 排隊
- \`release()\` — \`_active--\`；如果 \`_queue\` 有人在等，\`_active++\` 並呼叫 \`shift()()\`

---

## 5-4：Circuit Breaker — 熔斷器

### 問題：API 掛了但你還在狂打

API 伺服器掛了，每個請求都要等 30 秒 timeout 才失敗。你的程式不知道它掛了，繼續送 100 個請求 — 每個等 30 秒 — 使用者等到崩潰。

這就像家裡的**保險絲**（Circuit Breaker）：電流太大就跳掉，保護整個電路不被燒壞。

### 三態狀態機

Circuit Breaker 有三種狀態，形成一個狀態機：

\`\`\`
  ┌──────────────────┐
  │     CLOSED       │ ← 正常狀態，所有請求放行
  │  （保險絲正常）     │
  └────────┬─────────┘
           │ 失敗累積 >= threshold（例如 3 次）
           ↓
  ┌──────────────────┐
  │      OPEN        │ ← 熔斷！所有請求立即被拒絕
  │  （保險絲跳掉）     │    不再浪費時間等 timeout
  └────────┬─────────┘
           │ 冷卻時間到了
           ↓
  ┌──────────────────┐
  │    HALF_OPEN     │ ← 試探性放行一個請求
  │  （試著恢復）      │
  └───┬──────────┬───┘
      │          │
    成功        失敗
      │          │
      ↓          ↓
   CLOSED      OPEN（繼續熔斷）
\`\`\`

| 狀態 | canRequest() | 行為 |
|------|-------------|------|
| CLOSED | true | 正常放行。記錄失敗次數。 |
| OPEN | false | 拒絕所有請求（立刻回傳錯誤，不等 timeout）。等冷卻時間到才進 HALF_OPEN。 |
| HALF_OPEN | true（一次） | 允許一個請求試試。成功回 CLOSED，失敗回 OPEN。 |

### 逐步實作（簡化版，對應挑戰題目）

挑戰要求的是簡化版本——用 **失敗計數器** 而不是時間窗口：

\`\`\`javascript
class CircuitBreaker {
  constructor(threshold = 3) {
    this.state = "CLOSED";       // 初始狀態
    this.failures = 0;           // 失敗次數
    this.threshold = threshold;  // 幾次失敗就跳掉
  }

  // 記錄失敗
  recordFailure() {
    this.failures++;
    if (this.failures >= this.threshold) {
      this.state = "OPEN";  // 失敗次數到達門檻，熔斷！
    }
  }

  // 記錄成功
  recordSuccess() {
    if (this.state === "HALF_OPEN") {
      // 試探成功了！恢復正常
      this.state = "CLOSED";
      this.failures = 0;  // 重置失敗計數
    }
  }

  // 判斷能不能發請求
  canRequest() {
    if (this.state === "CLOSED") {
      return true;  // 正常，放行
    }
    if (this.state === "OPEN") {
      return false;  // 熔斷中，拒絕
      // 注意：完整版會在這裡檢查冷卻時間
      // 冷卻時間到了就轉成 HALF_OPEN 並 return true
    }
    return false;  // HALF_OPEN 時已經有一個試探請求在飛了
  }
}
\`\`\`

### 狀態轉移追蹤

\`\`\`
  操作               failures   state
  ────────────────   ────────   ──────────
  （初始）            0          CLOSED
  recordFailure()    1          CLOSED
  recordFailure()    2          CLOSED
  recordFailure()    3          OPEN ← 熔斷！
  canRequest()       —          return false
  canRequest()       —          return false
  (手動設為 HALF_OPEN)
  recordSuccess()    0          CLOSED ← 恢復！
\`\`\`

### DI 專案的完整版 — 帶時間窗口和冷卻

\`\`\`javascript
// 來自 src/services/ai-infra/aiProxyService.js
class CircuitBreaker {
  constructor({ failureThreshold = 3, cooldownMs = 60000, windowMs = 30000 }) {
    this.state = 'CLOSED';
    this.failures = [];            // 用陣列記錄每次失敗的時間戳
    this.failureThreshold = failureThreshold;
    this.cooldownMs = cooldownMs;  // 冷卻時間：60 秒
    this.windowMs = windowMs;      // 時間窗口：30 秒內的失敗才算
    this.openedAt = null;          // 什麼時候跳掉的
  }

  recordFailure() {
    const now = Date.now();
    // 只計算 windowMs 內的失敗（過期的不算）
    this.failures = this.failures.filter(t => now - t < this.windowMs);
    this.failures.push(now);

    if (this.failures.length >= this.failureThreshold) {
      this.state = 'OPEN';
      this.openedAt = now;
    }
  }

  recordSuccess() {
    if (this.state === 'HALF_OPEN') {
      this.state = 'CLOSED';
      this.failures = [];
      this.cooldownMs = 60000; // 重置冷卻時間
    }
  }

  canRequest() {
    if (this.state === 'CLOSED') return true;
    if (this.state === 'OPEN') {
      // 冷卻時間到了嗎？
      if (Date.now() - this.openedAt >= this.cooldownMs) {
        this.state = 'HALF_OPEN'; // 進入試探模式
        return true;
      }
      return false;
    }
    return false; // HALF_OPEN 已經有試探請求在飛
  }
}
\`\`\`

### 完整版 vs 簡化版差異

| 特性 | 簡化版（挑戰題目） | 完整版（DI 專案） |
|------|-----------------|-----------------|
| 失敗計數 | 簡單計數器 | 時間窗口內的陣列 |
| OPEN → HALF_OPEN | 需手動設定 | 自動（冷卻時間到了） |
| 冷卻時間 | 無 | 60 秒，可加倍 |

### 常見錯誤

**錯誤 1：recordSuccess 在 CLOSED 狀態也重置**
\`\`\`javascript
// 錯誤：在 CLOSED 狀態不應該做任何事
recordSuccess() {
  this.state = "CLOSED";
  this.failures = 0;
}

// 正確：只在 HALF_OPEN 時才有意義
recordSuccess() {
  if (this.state === "HALF_OPEN") {
    this.state = "CLOSED";
    this.failures = 0;
  }
}
\`\`\`

**錯誤 2：canRequest 在 OPEN 狀態回傳 true**
\`\`\`javascript
// 錯誤：OPEN 就是要拒絕，不能放行
canRequest() {
  return this.state !== "BROKEN"; // ← 什麼鬼？
}
\`\`\`

### 小練習（直接對應挑戰題目）

實作 \`CircuitBreaker\` class：
- 初始狀態 \`"CLOSED"\`，失敗計數從 0 開始
- \`recordFailure()\` — \`failures++\`，如果 \`>= threshold\` 就轉 \`"OPEN"\`
- \`recordSuccess()\` — 只在 \`"HALF_OPEN"\` 時才轉回 \`"CLOSED"\` 並重置 failures
- \`canRequest()\` — \`"CLOSED"\` return true，\`"OPEN"\` return false

---

## 5-5：ReAct Loop — Agent 怎麼思考

### 什麼是 AI Agent？

**普通的 LLM 呼叫：** 你問一個問題，它回答。一問一答，結束。

**Agent：** 你給它一個**任務**和一組**工具**，它**自己決定**：
- 要用哪些工具？
- 按什麼順序用？
- 用完後結果對不對？
- 需不需要再用別的工具？
- 什麼時候可以給出最終答案？

### ReAct 模式：思考 → 行動 → 觀察

ReAct = **Re**asoning + **Act**ing。每一步都有三個階段：

\`\`\`
  ┌──────────┐     ┌──────────┐     ┌──────────┐
  │  Thought │ ──→ │  Action  │ ──→ │ Observe  │ ──→ 回到 Thought
  │  (思考)   │     │  (行動)   │     │  (觀察)   │     或輸出答案
  └──────────┘     └──────────┘     └──────────┘
       │                                   │
       │  我需要什麼資訊？                    │  工具回傳了什麼？
       │  該用哪個工具？                      │  夠回答了嗎？
       │  已經知道答案了嗎？                   │  需要再查嗎？
\`\`\`

### 完整範例

\`\`\`
  用戶任務：「COMP-001 會不會斷料？」

  ────── 第 1 步 ──────
  Thought: 我需要查 COMP-001 的庫存和需求資料
  Action:  呼叫 query_inventory("COMP-001")
  Observe: 庫存 200，日需求 50，安全庫存 100

  ────── 第 2 步 ──────
  Thought: 庫存天數 = (200-100)/50 = 2 天，很危險。查看有沒有在途訂單
  Action:  呼叫 query_open_po("COMP-001")
  Observe: PO-20003，500 個，預計 3 天後到

  ────── 第 3 步 ──────
  Thought: 庫存撐 2 天，補貨要 3 天，有 1 天缺口。可以給答案了。
  Action:  回傳最終答案
  Output:  「COMP-001 有斷料風險。庫存天數僅 2 天，最近補貨要 3 天後才到。
            建議加速催貨或尋找替代供應商。」
\`\`\`

### reactStep — 模擬一步 ReAct

挑戰要求你寫 \`reactStep(state, tools)\`，模擬 ReAct 迴圈的**一步**：

\`\`\`javascript
function reactStep(state, tools) {
  const { goal, observations, history } = state;

  // 1. 判斷：observations 裡有 "ANSWER:" 嗎？
  //    如果有，表示上一步的工具已經找到答案了
  if (observations.includes("ANSWER:")) {
    return {
      thought: "找到答案了",
      action: "done",
      result: observations  // 把包含 ANSWER 的觀察結果回傳
    };
  }

  // 2. 還沒找到答案 → 呼叫工具
  const toolNames = Object.keys(tools);
  if (toolNames.length === 0) {
    // 沒有工具可用
    return { thought: "找到答案了", action: "done", result: observations };
  }

  // 呼叫第一個工具（按 Object.keys 順序）
  const toolName = toolNames[0];
  const toolFn = tools[toolName];
  const toolResult = toolFn(goal);

  return {
    thought: "需要更多資訊",
    action: toolName,
    result: toolResult
  };
}
\`\`\`

**關鍵邏輯：**
- 如果 \`observations\` 包含 \`"ANSWER:"\` → 思考 = "找到答案了"，回傳觀察結果
- 否則 → 呼叫 tools 裡的第一個工具，回傳工具結果

### DI 專案怎麼用 — chatAgentLoop.js

\`\`\`javascript
// 來自 src/services/agent-core/chatAgentLoop.js（簡化版）
const MAX_ITERATIONS = 8;

async function agentLoop(userMessage, tools) {
  const messages = [{ role: 'user', content: userMessage }];

  for (let i = 0; i < MAX_ITERATIONS; i++) {
    // 1. 呼叫 LLM，讓它「思考」
    const response = await callLLM(messages);

    // 2. LLM 要求使用工具嗎？
    if (response.toolCalls && response.toolCalls.length > 0) {
      for (const call of response.toolCalls) {
        // 3. 執行工具（「行動」）
        const result = await executeTool(call.name, call.arguments);
        // 4. 把結果回饋給 LLM（「觀察」）
        messages.push({ role: 'tool', content: result });
      }
      // 回到迴圈頂端，讓 LLM 再次「思考」
    } else {
      // 5. LLM 不需要工具了，回傳最終答案
      return response.content;
    }
  }
  return '達到最大迭代次數';
}
\`\`\`

### 動態迭代預算

DI 專案裡有一個聰明的設計——根據問題複雜度調整最大迭代次數：

\`\`\`javascript
function resolveMaxIterations(answerContract) {
  const dims = answerContract?.required_dimensions?.length || 0;
  const outputs = answerContract?.required_outputs?.length || 0;
  const bonus = Math.min(4, Math.floor((dims + outputs) / 2));
  return 8 + bonus; // 基礎 8 次，複雜問題最多 12 次
}
\`\`\`

### 常見錯誤

**錯誤：沒有終止條件**
\`\`\`javascript
// 錯誤：如果工具永遠找不到答案，就會無限迴圈
while (true) {
  const result = callTool();
  if (result.includes("ANSWER")) break;
}

// 正確：設最大迭代次數
for (let i = 0; i < MAX_ITERATIONS; i++) { ... }
\`\`\`

### 小練習（直接對應挑戰題目）

寫 \`reactStep(state, tools)\`：
- \`state\` 有 \`{ goal, observations, history }\`
- 如果 \`observations\` 包含 \`"ANSWER:"\` → 回傳 \`{ thought: "找到答案了", action: "done", result: observations }\`
- 否則 → 呼叫 \`Object.keys(tools)[0]\` 對應的工具函式，回傳 \`{ thought: "需要更多資訊", action: toolName, result: toolResult }\`

---

## 5-6（Boss）：自己寫一個 Mini Agent

### 目標

寫一個 \`createAgent(tools)\` 函式，它接收一組工具，回傳一個 \`run(task)\` 函式。

\`run(task)\` 會：
1. 解析 task 字串裡的 \`[toolName]\` 標記
2. 按順序呼叫對應的工具
3. 收集步驟和結果
4. 回傳結構化的結果

### Agent 的架構

\`\`\`
  createAgent(tools) → 回傳 run 函式
  ┌──────────────────────────────────────────────┐
  │  run(task)                                    │
  │                                               │
  │  1. 解析 task 字串                              │
  │     "[search] 找庫存 然後 [calc] 算風險"         │
  │      ↓ 用正規表達式找 [xxx]                      │
  │     ["search", "calc"]                         │
  │                                               │
  │  2. 按順序呼叫工具                               │
  │     tools["search"](task) → "庫存:200"         │
  │     tools["calc"](task)   → "風險:低"           │
  │                                               │
  │  3. 收集結果                                    │
  │     steps: [                                   │
  │       { tool: "search", result: "庫存:200" },   │
  │       { tool: "calc",   result: "風險:低" }     │
  │     ]                                          │
  │                                               │
  │  4. 回傳                                       │
  │     { task, steps, finalAnswer: "風險:低" }     │
  └──────────────────────────────────────────────┘
\`\`\`

### 逐步實作

\`\`\`javascript
function createAgent(tools) {
  const toolNames = Object.keys(tools);

  return function run(task) {
    const steps = [];

    // 1. 用正規表達式找出 task 中所有的 [toolName]
    //    /\\[([^\\]]+)\\]/g 匹配 [xxx] 並提取 xxx
    const regex = /\\[([^\\]]+)\\]/g;
    let match;
    const mentionedTools = [];

    while ((match = regex.exec(task)) !== null) {
      const name = match[1]; // 取出 [] 裡面的文字
      if (toolNames.includes(name)) {
        mentionedTools.push(name);
      }
    }

    // 2. 按順序呼叫找到的工具
    for (const toolName of mentionedTools) {
      const toolFn = tools[toolName];
      const result = toolFn(task);  // 每個工具的輸入都是原始 task
      steps.push({ tool: toolName, result });
    }

    // 3. 回傳結構化結果
    return {
      task,
      steps,
      finalAnswer: steps.length > 0 ? steps[steps.length - 1].result : null
    };
  };
}
\`\`\`

### 正規表達式解析

\`/\\[([^\\]]+)\\]/g\` 拆解：

| 部分 | 意思 |
|------|------|
| \`\\[\` | 匹配字面的 \`[\` |
| \`([^\\]]+)\` | 捕獲群組：一個或多個「不是 \`]\`」的字元 |
| \`\\]\` | 匹配字面的 \`]\` |
| \`g\` | 全域匹配（找出所有，不是只找第一個） |

\`\`\`
  task: "請用 [search] 找資料然後 [calc] 算結果"
                ↑                    ↑
          match[1]="search"    match[1]="calc"
\`\`\`

### 使用範例

\`\`\`javascript
// 定義工具
const tools = {
  search: (task) => "找到: COMP-001 庫存 200",
  calc:   (task) => "風險評估: 低風險",
  report: (task) => "報告已生成"
};

// 建立 agent
const agent = createAgent(tools);

// 執行任務
const result = agent.run("請用 [search] 查庫存，然後 [calc] 評估風險");
console.log(result);
// {
//   task: "請用 [search] 查庫存，然後 [calc] 評估風險",
//   steps: [
//     { tool: "search", result: "找到: COMP-001 庫存 200" },
//     { tool: "calc",   result: "風險評估: 低風險" }
//   ],
//   finalAnswer: "風險評估: 低風險"
// }

// 沒有匹配工具的情況
const result2 = agent.run("隨便說點什麼");
console.log(result2);
// { task: "隨便說點什麼", steps: [], finalAnswer: null }
\`\`\`

### 對應 DI 專案的架構

你寫的 Mini Agent 其實就是 DI 專案裡 \`chatAgentLoop.js\` 的極度簡化版：

| Mini Agent | DI 專案 chatAgentLoop |
|------------|----------------------|
| \`[toolName]\` 字串解析 | LLM 自己決定要呼叫哪個工具 |
| 同步呼叫工具 | \`await executeTool()\` 非同步呼叫 |
| 按順序一個一個 | 根據 LLM 回應動態決定 |
| 固定流程 | 迴圈 + 最大迭代限制 |
| 無錯誤處理 | Circuit Breaker + Semaphore |

在真正的 Agent 裡，「決定要用哪個工具」這件事是 LLM 自己做的，不是從字串裡找 \`[toolName]\`。但底層的**工具調度架構**是一樣的。

### 常見錯誤

**錯誤 1：工具名稱不在 tools 裡但還是呼叫**
\`\`\`javascript
// 錯誤：task 裡寫了 [fly] 但 tools 沒有 fly，直接呼叫會 crash
const toolFn = tools[name]; // undefined
toolFn(task);               // TypeError!

// 正確：先檢查工具存不存在
if (toolNames.includes(name)) {
  mentionedTools.push(name);
}
\`\`\`

**錯誤 2：finalAnswer 在沒有步驟時不是 null**
\`\`\`javascript
// 錯誤：
finalAnswer: steps[steps.length - 1].result // steps 為空時 crash

// 正確：
finalAnswer: steps.length > 0 ? steps[steps.length - 1].result : null
\`\`\`

### 小練習（直接對應挑戰題目）

寫 \`createAgent(tools)\` 函式：
1. 接收 \`tools\` 物件（\`{name: fn}\`）
2. 回傳 \`run(task)\` 函式
3. \`run\` 用正規表達式 \`/\\[([^\\]]+)\\]/g\` 找出 task 中的工具名稱
4. 按順序呼叫工具（只呼叫 tools 裡存在的）
5. 回傳 \`{ task, steps: [{tool, result}], finalAnswer }\`

測試：
- \`agent.run("請用 [search] 找資料")\` → steps 有 1 個，finalAnswer 是 search 的結果
- \`agent.run("[fetch] 然後 [calc]")\` → steps 有 2 個，finalAnswer 是 calc 的結果
- \`agent.run("沒有工具標記")\` → steps 是空的，finalAnswer 是 null
`;
