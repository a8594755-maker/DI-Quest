export default `
# World 4：React 前線

> **目標：** 理解 React 的 component 模型、Virtual DOM、state 管理、資料流
> **對應專案：** \`src/components/\` 裡的 100+ 個 component
> **挑戰方式：** 用純 JavaScript 模擬 React 核心概念（不需要瀏覽器！）

---

## 4-1：JSX 基礎 — HTML + JavaScript

### React 是什麼？

React 是一個「UI 框架」。它讓你用 JavaScript 寫 HTML。

你的 DI 專案的整個畫面——導航欄、聊天室、Dashboard、圖表——全部都是 React component。

### JSX 的本質：其實是函式呼叫

當你寫 JSX 的時候，你覺得你在寫 HTML：

\`\`\`jsx
const element = <h1 className="title">你好，世界</h1>;
\`\`\`

但 Babel 編譯器會把它轉成這個：

\`\`\`javascript
const element = React.createElement('h1', { className: 'title' }, '你好，世界');
\`\`\`

而 \`React.createElement\` 回傳的只是一個**普通的 JavaScript 物件**：

\`\`\`javascript
{
  type: 'h1',
  props: {
    className: 'title',
    children: '你好，世界'
  }
}
\`\`\`

這個物件就叫做 **Virtual DOM 節點**。整棵 UI 樹其實就是一棵由這些物件組成的樹。

### Virtual DOM 的視覺化

\`\`\`
你寫的 JSX：               React 看到的 Virtual DOM：

<div>                      { type: 'div', props: {
  <h1>標題</h1>     →        children: [
  <p>內文</p>                   { type: 'h1', props: { children: '標題' } },
</div>                          { type: 'p',  props: { children: '內文' } }
                               ]
                            }}
\`\`\`

### 巢狀結構也是一樣

\`\`\`jsx
// 這個 JSX：
<div>
  <header>
    <h1>DI 庫存管理</h1>
  </header>
  <main>
    <p>歡迎回來</p>
  </main>
</div>

// 其實是這個：
React.createElement('div', null,
  React.createElement('header', null,
    React.createElement('h1', null, 'DI 庫存管理')
  ),
  React.createElement('main', null,
    React.createElement('p', null, '歡迎回來')
  )
);
\`\`\`

### DI 專案中的真實範例

你的專案裡 \`StatusBadge\` component 用 JSX 顯示庫存狀態：

\`\`\`jsx
function StatusBadge({ status }) {
  const colors = {
    critical: 'bg-red-500',
    warning: 'bg-yellow-500',
    safe: 'bg-green-500',
  };

  return (
    <span className={\\\`px-2 py-1 rounded text-white \\\${colors[status]}\\\`}>
      {status}
    </span>
  );
}
\`\`\`

在 Virtual DOM 裡，這就是一個 \`{ type: 'span', props: { className: '...', children: 'critical' } }\` 物件。

### JSX 規則

1. **只能有一個根元素** — 用 \`<div>\` 或 \`<>\`（Fragment）包起來
2. **class 要寫成 className** — 因為 class 是 JS 保留字
3. **style 用物件** — \`style={{ color: 'red', fontSize: '16px' }}\`
4. **JavaScript 用 \`{}\` 包** — \`{variable}\`、\`{expression}\`

### 用純 JS 模擬 createElement

挑戰會要你實作 \`createElement\`，概念很簡單：

\`\`\`javascript
// 模擬 React.createElement
function createElement(tag, props, ...children) {
  return {
    type: tag,
    props: {
      ...props,
      children: children.length === 1 ? children[0] : children
    }
  };
}

// 用法：
const vdom = createElement('div', { id: 'app' },
  createElement('h1', null, '標題'),
  createElement('p', { className: 'info' }, '內文')
);

// 結果：
// {
//   type: 'div',
//   props: {
//     id: 'app',
//     children: [
//       { type: 'h1', props: { children: '標題' } },
//       { type: 'p', props: { className: 'info', children: '內文' } }
//     ]
//   }
// }
\`\`\`

### 遞迴計算 Virtual DOM 節點數

Virtual DOM 是一棵樹，我們可以遞迴遍歷它：

\`\`\`javascript
function countElements(tree) {
  // 如果不是物件（是文字節點），不算
  if (typeof tree !== 'object' || tree === null) return 0;

  let count = 1; // 目前這個節點

  const children = tree.props?.children;
  if (Array.isArray(children)) {
    for (const child of children) {
      count += countElements(child);
    }
  } else if (typeof children === 'object' && children !== null) {
    count += countElements(children);
  }
  // 文字 children 不計入節點數

  return count;
}
\`\`\`

> **挑戰預告：** 你需要實作 \`createElement(tag, props, children)\` 和 \`countElements(tree)\`。前者建立 Virtual DOM 節點，後者遞迴計算節點數量。

### 常見錯誤

- **忘記處理 children 是單一元素的情況** — children 可能是字串、物件、或陣列
- **忘記處理 null/undefined** — props 可以是 null
- **遞迴時忘記基礎條件** — 文字節點和 null 要正確處理

---

## 4-2：Props 與 State

### Props — 從外面傳進來的資料

Props 就像函式的參數。父 component 決定要傳什麼，子 component 只能讀取，不能修改。

\`\`\`
     ┌─── App ───────────────────────┐
     │  name="COMP-001"              │
     │  stock={500}                  │
     │  status="safe"                │
     │         │                     │
     │         ▼  (props 往下流)      │
     │  ┌─ ProductCard ──────┐       │
     │  │  讀取 name, stock  │       │
     │  │  不能修改！         │       │
     │  └────────────────────┘       │
     └───────────────────────────────┘
\`\`\`

\`\`\`jsx
// 父 component 傳 props 給子 component
function App() {
  return <ProductCard name="COMP-001" stock={500} status="safe" />;
}

// 子 component 接收 props（用解構語法）
function ProductCard({ name, stock, status }) {
  return (
    <div className="card">
      <h3>{name}</h3>
      <p>庫存：{stock}</p>
      <StatusBadge status={status} />
    </div>
  );
}
\`\`\`

### Default Props — 預設值

有時候 props 沒傳進來，你需要一個預設值：

\`\`\`jsx
function ProductCard({ name, stock = 0, status = 'unknown' }) {
  // 如果沒傳 stock，預設是 0
  // 如果沒傳 status，預設是 'unknown'
}
\`\`\`

用純 JS 模擬 props 合併：

\`\`\`javascript
function mergeProps(defaultProps, userProps) {
  return { ...defaultProps, ...userProps };
}

const defaults = { stock: 0, status: 'unknown', threshold: 100 };
const user = { stock: 500, status: 'safe' };
const merged = mergeProps(defaults, user);
// { stock: 500, status: 'safe', threshold: 100 }
// userProps 的值覆蓋 defaultProps，但 threshold 保留預設值
\`\`\`

### State — component 自己管理的資料

State 是 component 的「記憶」。它可以改變，改變時 component 會重新渲染。

\`\`\`jsx
import { useState } from 'react';

function Counter() {
  const [count, setCount] = useState(0);
  return (
    <div>
      <p>你點了 {count} 次</p>
      <button onClick={() => setCount(count + 1)}>+1</button>
    </div>
  );
}
\`\`\`

### Props vs State 比較

| | Props | State |
|---|-------|-------|
| 誰控制 | 父 component | 自己 |
| 能改嗎 | 不能 | 可以（用 setter） |
| 用途 | 接收外部資料 | 管理內部狀態 |
| 改變時 | 父 component re-render | 自己 re-render |

### 用閉包模擬 useState

React 的 useState 回傳 \`[getter, setter]\`。我們可以用 JavaScript 閉包模擬：

\`\`\`javascript
function createState(initialValue) {
  let value = initialValue;       // 被閉包「記住」

  function getter() {
    return value;                 // 讀取目前的值
  }

  function setter(newValue) {
    value = newValue;             // 更新值
  }

  return [getter, setter];       // 回傳 [讀取函式, 更新函式]
}

// 用法：
const [getCount, setCount] = createState(0);
console.log(getCount());  // 0
setCount(5);
console.log(getCount());  // 5
setCount(getCount() + 1);
console.log(getCount());  // 6
\`\`\`

**為什麼用閉包？** 因為 \`value\` 變數被 \`getter\` 和 \`setter\` 共同「記住」了。即使 \`createState\` 已經執行完畢，\`value\` 仍然存在於記憶體中，可以被讀取和修改。

### DI 專案中的 State 應用

\`\`\`jsx
// 搜尋過濾——用 state 過濾 props
function InventoryList({ items }) {
  const [search, setSearch] = useState('');

  const filtered = items.filter(item =>
    item.materialCode.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <div>
      <input
        value={search}
        onChange={(e) => setSearch(e.target.value)}
        placeholder="搜尋品項..."
      />
      {filtered.map(item => (
        <div key={item.materialCode}>
          {item.materialCode}: {item.currentStock}
        </div>
      ))}
    </div>
  );
}
\`\`\`

> **挑戰預告：** 你需要實作 \`createState(initialValue)\` 回傳 \`[getter, setter]\`，以及 \`mergeProps(defaultProps, userProps)\` 用物件展開合併 props。

### 常見錯誤

- **直接修改 state** — 不要 \`state.count = 5\`，要用 setter
- **忘記 spread 順序** — \`{ ...defaults, ...user }\` 中 user 覆蓋 defaults，反過來就錯了
- **在 setter 裡用舊值** — 要用 \`getter()\` 取得最新值，不要用之前存的變數

---

## 4-3：useEffect — 副作用處理

### 什麼是副作用？

Component 的主要工作是根據資料渲染 UI。但有時候你需要做「渲染以外的事」：

\`\`\`
Component 的工作：
┌──────────────────────────────────┐
│  主要工作：render UI              │
│  ┌────────────────────────────┐  │
│  │ props/state → JSX → 畫面   │  │
│  └────────────────────────────┘  │
│                                  │
│  副作用（Side Effects）：         │
│  • 載入資料（API 呼叫）           │
│  • 設定計時器（setInterval）      │
│  • 訂閱事件（WebSocket）          │
│  • 操作 DOM                      │
│  • 寫入 localStorage             │
└──────────────────────────────────┘
\`\`\`

useEffect 就是告訴 React：「渲染完之後，幫我做這件事。」

### useEffect 的三種用法

\`\`\`javascript
// 1. 沒有依賴陣列 → 每次 render 後都執行（小心！很少用到）
useEffect(() => {
  console.log('每次 render 後都會執行');
});

// 2. 空依賴陣列 → 只在首次 render 後執行一次（像 componentDidMount）
useEffect(() => {
  console.log('只執行一次，適合初始化');
}, []);

// 3. 有依賴 → 依賴改變時才執行（最常見！）
useEffect(() => {
  fetchData(materialCode);
}, [materialCode]);  // materialCode 改變時重新執行
\`\`\`

### 依賴比較的原理

React 會「淺比較」依賴陣列。每次 render 時，React 比較新的依賴和上一次的依賴：

\`\`\`
第一次 render：deps = ['COMP-001']    → 執行 effect
第二次 render：deps = ['COMP-001']    → 不執行（相同）
第三次 render：deps = ['COMP-002']    → 執行 effect（不同！）
第四次 render：deps = ['COMP-002']    → 不執行（相同）
\`\`\`

比較方式是用 \`===\`（嚴格相等），逐一比較陣列中的每個元素。

### DI 專案中的 useEffect

\`\`\`jsx
function StockMonitor({ materialCode }) {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function fetchData() {
      setLoading(true);
      const response = await fetch('/api/stock/' + materialCode);
      const json = await response.json();
      setData(json);
      setLoading(false);
    }
    fetchData();
  }, [materialCode]); // materialCode 改變時重新載入

  if (loading) return <p>載入中...</p>;
  return <p>{materialCode}: {data?.currentStock} 個</p>;
}
\`\`\`

你的專案裡 \`useEventBus.js\` 也用了 useEffect：訂閱事件 → 回傳取消訂閱函式（cleanup）。

### 用純 JS 模擬依賴追蹤

\`\`\`javascript
function createEffectTracker() {
  let previousDeps = null; // 上一次的依賴陣列

  function check(deps) {
    // 第一次呼叫，沒有上一次的依賴 → 一定要執行
    if (previousDeps === null) {
      previousDeps = deps;
      return { shouldRun: true, reason: 'first-run' };
    }

    // 長度不同 → 一定要執行
    if (previousDeps.length !== deps.length) {
      previousDeps = deps;
      return { shouldRun: true, reason: 'deps-length-changed' };
    }

    // 逐一比較（淺比較，用 ===）
    for (let i = 0; i < deps.length; i++) {
      if (previousDeps[i] !== deps[i]) {
        previousDeps = deps;
        return { shouldRun: true, reason: \\\`deps[\\\${i}]-changed\\\` };
      }
    }

    // 全部相同 → 不需要執行
    return { shouldRun: false, reason: 'no-change' };
  }

  return { check };
}

// 用法：
const tracker = createEffectTracker();
tracker.check(['COMP-001']);  // { shouldRun: true,  reason: 'first-run' }
tracker.check(['COMP-001']);  // { shouldRun: false, reason: 'no-change' }
tracker.check(['COMP-002']);  // { shouldRun: true,  reason: 'deps[0]-changed' }
\`\`\`

> **挑戰預告：** 你需要實作 \`createEffectTracker()\`，回傳一個 \`{ check }\` 物件。\`check(deps)\` 接收依賴陣列，回傳 \`{ shouldRun, reason }\`。

### 常見錯誤

- **忘記依賴陣列** — 沒傳依賴陣列會導致每次 render 都執行，可能造成無限迴圈
- **物件/陣列作為依賴** — \`===\` 比較的是參考（reference），所以每次 render 建立的新物件永遠不相等
- **忘記比較第一次呼叫的特殊情況** — previousDeps 為 null 時一定要執行

---

## 4-4：Context — 全域狀態

### 問題：Props Drilling

當資料需要從最上層傳到最深層，每一層都要當「傳話人」：

\`\`\`
App（有 user 資料）
 └─ Layout（被迫接收 user prop，只為了往下傳）
     └─ Sidebar（被迫接收 user prop，只為了往下傳）
         └─ UserBadge（終於用到 user！）

每一層都要寫：<Child user={user} />
中間那些 component 根本不在意 user 是什麼！
\`\`\`

### 解法：Context — 跨層傳遞

Context 讓你在最上層「廣播」資料，任何深層 component 都可以直接「收聽」：

\`\`\`
App（Provider — 廣播 user 資料）
 └─ Layout（不需要知道 user）
     └─ Sidebar（不需要知道 user）
         └─ UserBadge（useContext — 直接收聽！）
\`\`\`

\`\`\`jsx
import { createContext, useContext, useState } from 'react';

// 1. 建立 Context（附帶預設值）
const UserContext = createContext(null);

// 2. 在最上層用 Provider 提供值
function App() {
  const [user, setUser] = useState({ name: 'Louis', level: 7 });
  return (
    <UserContext.Provider value={{ user, setUser }}>
      <Layout />
    </UserContext.Provider>
  );
}

// 3. 任何深層 component 都可以直接取用
function UserBadge() {
  const { user } = useContext(UserContext);
  return <span>Lv.{user.level} {user.name}</span>;
}
\`\`\`

### DI 專案中的 Context

你的專案用了多個 Context：
- **AppContext** — dark mode、data source 等全域設定
- **AuthContext** — 登入狀態、使用者資訊
- **QuestContext**（DI Quest）— XP、等級、進度

### useReducer — 複雜的 State 管理

當 state 邏輯變複雜時，\`useState\` 不夠用。\`useReducer\` 像一個「規則表」：

\`\`\`jsx
function reducer(state, action) {
  switch (action.type) {
    case 'INCREMENT': return { count: state.count + 1 };
    case 'DECREMENT': return { count: state.count - 1 };
    case 'RESET':     return { count: 0 };
    default:          return state;
  }
}

function Counter() {
  const [state, dispatch] = useReducer(reducer, { count: 0 });
  return (
    <div>
      <p>{state.count}</p>
      <button onClick={() => dispatch({ type: 'INCREMENT' })}>+1</button>
      <button onClick={() => dispatch({ type: 'RESET' })}>重置</button>
    </div>
  );
}
\`\`\`

### 用純 JS 模擬 Context

\`\`\`javascript
function createContext(defaultValue) {
  let currentValue = defaultValue;

  return {
    Provider: function(value) {
      currentValue = value;  // 設定目前的值
    },
    useContext: function() {
      return currentValue;   // 讀取目前的值
    }
  };
}

// 用法：
const ThemeContext = createContext('light');
ThemeContext.useContext();        // 'light'（預設值）
ThemeContext.Provider('dark');    // 提供新值
ThemeContext.useContext();        // 'dark'
\`\`\`

### 用純 JS 模擬 useReducer / Store

\`\`\`javascript
function createStore(reducer, initialState) {
  let state = initialState;

  return {
    getState: function() {
      return state;
    },
    dispatch: function(action) {
      state = reducer(state, action);  // 用 reducer 計算新 state
      return state;
    }
  };
}

// 用法：
function inventoryReducer(state, action) {
  switch (action.type) {
    case 'ADD_ITEM':
      return { ...state, items: [...state.items, action.payload] };
    case 'REMOVE_ITEM':
      return {
        ...state,
        items: state.items.filter(item => item.id !== action.payload)
      };
    case 'UPDATE_STOCK':
      return {
        ...state,
        items: state.items.map(item =>
          item.id === action.payload.id
            ? { ...item, stock: action.payload.stock }
            : item
        )
      };
    default:
      return state;
  }
}

const store = createStore(inventoryReducer, { items: [] });
store.dispatch({ type: 'ADD_ITEM', payload: { id: 1, name: 'COMP-001', stock: 500 } });
store.dispatch({ type: 'ADD_ITEM', payload: { id: 2, name: 'COMP-002', stock: 30 } });
console.log(store.getState().items.length); // 2

store.dispatch({ type: 'UPDATE_STOCK', payload: { id: 2, stock: 0 } });
console.log(store.getState().items[1].stock); // 0
\`\`\`

> **挑戰預告：** 你需要實作 \`createContext(defaultValue)\` 和 \`createStore(reducer, initialState)\`。前者回傳 \`{ Provider, useContext }\`，後者回傳 \`{ getState, dispatch }\`。

### 常見錯誤

- **忘記提供 defaultValue** — 如果沒有 Provider 包住，useContext 應該回傳 defaultValue
- **reducer 修改了原始 state** — reducer 必須回傳新物件，不能直接修改 state
- **dispatch 忘記更新 state** — 要把 reducer 的結果存回去

---

## 4-5：條件渲染與列表

### 條件渲染的三種寫法

在 React 中，你經常需要根據條件顯示不同的 UI：

\`\`\`jsx
// 1. && 短路 — 條件成立才顯示
{isAdmin && <AdminPanel />}

// 2. 三元運算子 — 二選一
{isLoggedIn ? <Dashboard /> : <Login />}

// 3. 提前 return — 處理載入/錯誤狀態
if (loading) return <Spinner />;
if (error) return <ErrorMessage error={error} />;
return <Content data={data} />;
\`\`\`

### DI 專案的庫存狀態判斷

在 DI 專案中，庫存品項需要根據不同條件顯示不同的狀態標籤：

\`\`\`
判斷邏輯：

  currentStock === 0
       │
       ├── 是 → 「缺貨」（critical，紅色）
       │
       └── 否 → currentStock < threshold?
                    │
                    ├── 是 → daysToStockout < 7?
                    │          │
                    │          ├── 是 → 「緊急」（critical，紅色）
                    │          │
                    │          └── 否 → 「警告」（warning，黃色）
                    │
                    └── 否 → 「安全」（safe，綠色）
\`\`\`

\`\`\`jsx
function StockStatus({ item }) {
  const { currentStock, threshold, daysToStockout } = item;

  if (currentStock === 0) {
    return <span className="text-red-500">缺貨</span>;
  }
  if (currentStock < threshold) {
    if (daysToStockout < 7) {
      return <span className="text-red-500">緊急</span>;
    }
    return <span className="text-yellow-500">警告</span>;
  }
  return <span className="text-green-500">安全</span>;
}
\`\`\`

### 用純 JS 模擬條件渲染

\`\`\`javascript
function renderStatus(item) {
  const { currentStock, threshold, daysToStockout } = item;

  if (currentStock === 0) {
    return { text: '缺貨', level: 'critical' };
  }
  if (currentStock < threshold) {
    if (daysToStockout < 7) {
      return { text: '緊急', level: 'critical' };
    }
    return { text: '警告', level: 'warning' };
  }
  return { text: '安全', level: 'safe' };
}

// 用法：
renderStatus({ currentStock: 0, threshold: 100, daysToStockout: 0 });
// { text: '缺貨', level: 'critical' }

renderStatus({ currentStock: 50, threshold: 100, daysToStockout: 3 });
// { text: '緊急', level: 'critical' }

renderStatus({ currentStock: 80, threshold: 100, daysToStockout: 10 });
// { text: '警告', level: 'warning' }

renderStatus({ currentStock: 500, threshold: 100, daysToStockout: 30 });
// { text: '安全', level: 'safe' }
\`\`\`

### 列表渲染 — .map() 是關鍵

React 用 \`.map()\` 把資料陣列轉成 UI 元素陣列：

\`\`\`jsx
function RiskList({ items }) {
  return (
    <ul>
      {items.map(item => (
        <li key={item.materialCode}>
          <span>{item.materialCode}</span>
          <StatusBadge status={item.riskLevel} />
          <span>{item.daysToStockout} 天</span>
        </li>
      ))}
    </ul>
  );
}
\`\`\`

### key 為什麼重要？

\`\`\`
沒有 key：React 看到列表改變，重新渲染全部 5 個 <li>

有 key：
  舊列表：[A, B, C, D, E]     key: [1, 2, 3, 4, 5]
  新列表：[A, C, D, E, F]     key: [1, 3, 4, 5, 6]

  React 知道：
  - key=2 (B) 被移除
  - key=6 (F) 是新增的
  - 其他不用動
  → 只更新 2 個元素，而非全部 5 個！
\`\`\`

### 結合過濾與列表

\`\`\`javascript
function renderList(items, filterLevel) {
  // 先判斷每個 item 的狀態
  const withStatus = items.map(item => ({
    ...item,
    ...renderStatus(item)  // 加上 text 和 level
  }));

  // 如果有指定 filterLevel，就過濾
  if (filterLevel) {
    return withStatus.filter(item => item.level === filterLevel);
  }

  return withStatus;
}

// 用法：
const items = [
  { materialCode: 'COMP-001', currentStock: 500, threshold: 100, daysToStockout: 60 },
  { materialCode: 'COMP-002', currentStock: 30,  threshold: 100, daysToStockout: 3 },
  { materialCode: 'COMP-003', currentStock: 0,   threshold: 50,  daysToStockout: 0 },
  { materialCode: 'COMP-004', currentStock: 80,  threshold: 100, daysToStockout: 12 },
];

renderList(items, 'critical');
// 只回傳 COMP-002（緊急）和 COMP-003（缺貨）

renderList(items, null);
// 回傳全部，每個都帶有 text 和 level
\`\`\`

> **挑戰預告：** 你需要實作 \`renderStatus(item)\` 根據庫存/門檻回傳 \`{ text, level }\`，以及 \`renderList(items, filterLevel)\` 過濾並回傳帶有狀態的列表。

### 常見錯誤

- **忘記處理 currentStock === 0 的邊界情況** — 零庫存一定是 critical
- **filterLevel 為 null/undefined 時要回傳全部** — 不要過濾
- **\`.map()\` 忘記回傳值** — 箭頭函式用 \`{}\` 時要寫 \`return\`

---

## 4-6（Boss）：從零寫一個 Dashboard Card

### Dashboard 是什麼？

Dashboard 就是把大量資料「濃縮」成一目了然的摘要。你的 DI 專案的 \`src/components/insights/\` 裡面有很多 Dashboard Card，每個都做同樣的事：

\`\`\`
原始資料（數百筆）        Dashboard Card
┌──────────────┐     ┌─────────────────────┐
│ COMP-001: 500│     │ 📊 庫存風險總覽       │
│ COMP-002: 30 │ →   │                     │
│ COMP-003: 0  │     │ 總品項數：20         │
│ COMP-004: 80 │     │ 安全：15  警告：3    │
│ ...200 more  │     │ 緊急：2              │
└──────────────┘     │ 平均耗盡天數：18.5天  │
                     │ 風險分數：42/100      │
                     └─────────────────────┘
\`\`\`

### 一個 Dashboard Card 需要什麼？

這就是前面所有概念的綜合應用：

1. **4-1 的概念** — 資料結構（createElement → 物件）
2. **4-2 的概念** — Props 接收 inventoryData，State 管理排序/過濾
3. **4-3 的概念** — 資料載入、依賴追蹤
4. **4-4 的概念** — 全域設定（threshold 可能來自 Context）
5. **4-5 的概念** — 條件渲染狀態標籤、列表渲染品項

### Boss 挑戰：用純 JS 處理 Dashboard 資料

你需要實作 \`createDashboard(inventoryData)\`，這個函式接收庫存資料陣列，回傳 Dashboard 需要的所有摘要資訊：

\`\`\`javascript
function createDashboard(inventoryData) {
  // 1. 計算每個品項的狀態
  // 2. 統計各狀態的數量
  // 3. 找出 critical 和 warning 品項
  // 4. 計算平均耗盡天數
  // 5. 計算風險分數

  // 步驟 1：用 renderStatus 標記每個品項
  const itemsWithStatus = inventoryData.map(item => ({
    ...item,
    ...renderStatus(item)
  }));

  // 步驟 2：統計
  const summary = { total: inventoryData.length, safe: 0, warning: 0, critical: 0 };
  itemsWithStatus.forEach(item => {
    summary[item.level]++;
  });

  // 步驟 3：找出需要關注的品項
  const criticalItems = itemsWithStatus.filter(i => i.level === 'critical');
  const warningItems = itemsWithStatus.filter(i => i.level === 'warning');

  // 步驟 4：平均耗盡天數（排除已經缺貨的）
  const activeItems = inventoryData.filter(i => i.currentStock > 0);
  const avgDaysToStockout = activeItems.length > 0
    ? activeItems.reduce((sum, i) => sum + i.daysToStockout, 0) / activeItems.length
    : 0;

  // 步驟 5：風險分數（0-100，越高越危險）
  const riskScore = Math.round(
    ((summary.critical * 3 + summary.warning * 1) / summary.total) * 100
  );

  return {
    summary,
    criticalItems,
    warningItems,
    avgDaysToStockout: Math.round(avgDaysToStockout * 10) / 10,
    riskScore: Math.min(riskScore, 100)
  };
}
\`\`\`

### 範例：完整執行

\`\`\`javascript
const inventory = [
  { materialCode: 'COMP-001', currentStock: 500, threshold: 100, daysToStockout: 60 },
  { materialCode: 'COMP-002', currentStock: 30,  threshold: 100, daysToStockout: 3 },
  { materialCode: 'COMP-003', currentStock: 0,   threshold: 50,  daysToStockout: 0 },
  { materialCode: 'COMP-004', currentStock: 80,  threshold: 100, daysToStockout: 12 },
  { materialCode: 'COMP-005', currentStock: 200, threshold: 150, daysToStockout: 20 },
];

const dashboard = createDashboard(inventory);

// dashboard.summary:
// { total: 5, safe: 1, warning: 2, critical: 2 }

// dashboard.criticalItems:
// [COMP-002（緊急）, COMP-003（缺貨）]

// dashboard.warningItems:
// [COMP-004（警告）, COMP-005（警告）]

// dashboard.avgDaysToStockout: 23.8
// （只算有庫存的：(60 + 3 + 12 + 20) / 4）

// dashboard.riskScore: 160 → capped at 100
// （(2*3 + 2*1) / 5 * 100 = 160 → min(160, 100) = 100）
\`\`\`

### 這與真正的 React Dashboard Card 的關係

在真正的 React component 中，這些計算會放在 \`useMemo\` 裡面（避免每次 render 都重算）：

\`\`\`jsx
function InventoryRiskCard({ items }) {
  const dashboard = useMemo(() => createDashboard(items), [items]);

  return (
    <div className="bg-white rounded-lg shadow p-4">
      <h3 className="text-lg font-bold">庫存風險總覽</h3>

      <div className="grid grid-cols-3 gap-2 my-4">
        <div className="text-green-500">安全：{dashboard.summary.safe}</div>
        <div className="text-yellow-500">警告：{dashboard.summary.warning}</div>
        <div className="text-red-500">緊急：{dashboard.summary.critical}</div>
      </div>

      <p>平均耗盡天數：{dashboard.avgDaysToStockout} 天</p>
      <p>風險分數：{dashboard.riskScore}/100</p>

      {dashboard.criticalItems.length > 0 && (
        <div className="mt-4">
          <h4 className="text-red-500 font-bold">需要立即處理：</h4>
          {dashboard.criticalItems.map(item => (
            <div key={item.materialCode}>
              {item.materialCode}: {item.text}
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
\`\`\`

你看到了嗎？\`createDashboard\` 是純粹的資料處理，不依賴 React。這就是為什麼我們可以用純 JS 來練習——**核心邏輯永遠是 JavaScript**，React 只負責把結果顯示在畫面上。

> **Boss 挑戰：** 實作 \`createDashboard(inventoryData)\`，回傳 \`{ summary, criticalItems, warningItems, avgDaysToStockout, riskScore }\`。這會用到 World 4 學到的所有概念：物件結構、狀態計算、條件判斷、列表過濾、資料聚合。

### 常見錯誤

- **計算平均值時除以零** — 如果所有品項都缺貨，activeItems 為空，要回傳 0
- **riskScore 超過 100** — 記得用 \`Math.min\` 限制上限
- **忘記展開原始 item 的屬性** — \`{ ...item, ...renderStatus(item) }\` 才能保留 materialCode 等欄位
- **浮點數精度** — avgDaysToStockout 要適當四捨五入
`;
