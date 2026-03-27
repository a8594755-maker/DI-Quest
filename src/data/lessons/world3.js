export default `
# World 3：SQL 地下城

> **目標：** 學會用 SQL 思維查詢、統計、修改資料，並用 JavaScript 實作這些操作
> **對應專案：** \`sql/\` 目錄裡的 72 個 migration 和 \`sample_data/\` 裡的 CSV
> **挑戰方式：** 本關的挑戰不會真的連資料庫——你會用 JavaScript 函式模擬 SQL 操作，處理陣列資料

---

## 3-1：SELECT — 從資料庫讀資料

### 什麼是 SQL？

SQL = Structured Query Language = 結構化查詢語言。

你的 DI 專案有一個 Supabase（PostgreSQL）資料庫，裡面存了庫存、需求、BOM、供應商等資料。SQL 就是你跟這個資料庫「對話」的語言。

### 你的第一個查詢

\`\`\`sql
-- 從 inventory_snapshots 表中取出所有資料
SELECT * FROM inventory_snapshots;
\`\`\`

- \`SELECT\` — 我要**讀取**資料
- \`*\` — 所有欄位
- \`FROM inventory_snapshots\` — 從哪張表

### 只取你要的欄位

\`\`\`sql
SELECT material_code, onhand_qty, safety_stock
FROM inventory_snapshots;
\`\`\`

在 SQL 中，指定欄位可以減少資料傳輸量，也讓結果更清楚。

### JavaScript 等價：selectColumns()

在本關的挑戰中，你會實作 \`selectColumns(table, columns)\` 函式。table 是一個物件陣列，columns 是你想保留的欄位名稱陣列：

\`\`\`javascript
function selectColumns(table, columns) {
  return table.map(row => {
    const newRow = {};
    for (const col of columns) {
      newRow[col] = row[col];
    }
    return newRow;
  });
}
\`\`\`

**核心概念：** \`.map()\` 就像 SQL 的 SELECT——它對每一筆資料做轉換，回傳新陣列。

#### 用 DI 專案資料示範

\`\`\`javascript
const inventory_snapshots = [
  { material_code: 'FG-001', plant_id: 'P01', snapshot_date: '2025-07-01', onhand_qty: 500, allocated_qty: 50, safety_stock: 100 },
  { material_code: 'COMP-001', plant_id: 'P01', snapshot_date: '2025-07-01', onhand_qty: 1200, allocated_qty: 200, safety_stock: 300 },
  { material_code: 'COMP-002', plant_id: 'P01', snapshot_date: '2025-07-01', onhand_qty: 80, allocated_qty: 10, safety_stock: 150 },
];

selectColumns(inventory_snapshots, ['material_code', 'onhand_qty']);
// [
//   { material_code: 'FG-001', onhand_qty: 500 },
//   { material_code: 'COMP-001', onhand_qty: 1200 },
//   { material_code: 'COMP-002', onhand_qty: 80 },
// ]
\`\`\`

### 你的 sample_data 長什麼樣

\`inventory_snapshots.csv\`（你專案裡真實的資料）：

| material_code | plant_id | snapshot_date | onhand_qty | allocated_qty | safety_stock |
|---------------|----------|---------------|------------|---------------|--------------|
| FG-001        | P01      | 2025-07-01    | 500        | 50            | 100          |
| COMP-001      | P01      | 2025-07-01    | 1200       | 200           | 300          |
| COMP-002      | P01      | 2025-07-01    | 80         | 10            | 150          |

\`fg_financials.csv\`：

| material_code | unit_price | currency | cost_center |
|---------------|------------|----------|-------------|
| FG-001        | 250.00     | USD      | CC-100      |
| FG-002        | 180.00     | USD      | CC-100      |
| FG-003        | 320.00     | USD      | CC-200      |

### 排序：ORDER BY

\`\`\`sql
-- 按庫存量由小到大排
SELECT material_code, onhand_qty
FROM inventory_snapshots
ORDER BY onhand_qty ASC;

-- 由大到小
ORDER BY onhand_qty DESC;
\`\`\`

- \`ASC\` = ascending（升序，預設）
- \`DESC\` = descending（降序）

### JavaScript 等價：orderBy()

你會實作 \`orderBy(table, field, direction)\`：

\`\`\`javascript
function orderBy(table, field, direction = 'asc') {
  // 重要：用展開運算子複製陣列，不改動原始資料
  return [...table].sort((a, b) => {
    if (a[field] < b[field]) return direction === 'asc' ? -1 : 1;
    if (a[field] > b[field]) return direction === 'asc' ? 1 : -1;
    return 0;
  });
}
\`\`\`

**注意：** \`[...table]\` 先複製一份再排序。直接用 \`.sort()\` 會改動原始陣列——在 SQL 的世界裡，SELECT 不會修改原始資料，我們的函式也應該如此。

#### 排序示範

\`\`\`javascript
const sorted = orderBy(inventory_snapshots, 'onhand_qty', 'asc');
// [
//   { material_code: 'COMP-002', onhand_qty: 80, ... },
//   { material_code: 'FG-001', onhand_qty: 500, ... },
//   { material_code: 'COMP-001', onhand_qty: 1200, ... },
// ]
\`\`\`

### 限制筆數：LIMIT

\`\`\`sql
SELECT * FROM inventory_snapshots LIMIT 5;
\`\`\`

JavaScript 等價非常簡單：\`.slice(0, n)\`。

### 練習

1. 用 \`selectColumns\` 取出 inventory_snapshots 的 \`material_code\` 和 \`onhand_qty\`
2. 用 \`orderBy\` 按 \`onhand_qty\` 升序排列
3. 用 \`.slice(0, 3)\` 取前 3 筆

> **提示：** 可以把這些操作串起來：\`orderBy(selectColumns(table, cols), field, dir).slice(0, 3)\`

---

## 3-2：WHERE + JOIN — 過濾與合併

### WHERE — 過濾條件

SQL 用 \`WHERE\` 過濾資料：

\`\`\`sql
-- 庫存低於安全庫存的品項
SELECT material_code, onhand_qty, safety_stock
FROM inventory_snapshots
WHERE onhand_qty < safety_stock;

-- 多個條件
SELECT *
FROM inventory_snapshots
WHERE plant_id = 'P01'
  AND onhand_qty < 200;
\`\`\`

**比較運算子速查：**

| SQL | 意思 | 例子 |
|-----|------|------|
| \`=\` | 等於 | \`plant_id = 'P01'\` |
| \`<>\` 或 \`!=\` | 不等於 | \`status <> 'closed'\` |
| \`<\`, \`>\`, \`<=\`, \`>=\` | 比較 | \`onhand_qty > 100\` |
| \`BETWEEN\` | 範圍 | \`qty BETWEEN 10 AND 100\` |
| \`IN\` | 在清單中 | \`code IN ('COMP-001', 'COMP-002')\` |
| \`LIKE\` | 模糊比對 | \`code LIKE 'COMP%'\` |
| \`IS NULL\` | 是空值 | \`notes IS NULL\` |

### JavaScript 等價：where()

你會實作 \`where(table, conditions)\`，conditions 是一個物件，每個 key-value 代表一個「等於」條件：

\`\`\`javascript
function where(table, conditions) {
  return table.filter(row => {
    return Object.entries(conditions).every(([key, value]) => {
      return row[key] === value;
    });
  });
}
\`\`\`

**核心概念：**
- \`.filter()\` 就像 SQL 的 WHERE——只保留符合條件的資料列
- \`Object.entries()\` 把物件拆成 \`[key, value]\` 對
- \`.every()\` 確保**所有**條件都成立（等同 SQL 的 AND）

#### 過濾示範

\`\`\`javascript
const po_open_lines = [
  { po_number: 'PO-001', material_code: 'COMP-001', qty: 500, status: 'open', supplier_id: 'SUP-A' },
  { po_number: 'PO-002', material_code: 'COMP-002', qty: 200, status: 'open', supplier_id: 'SUP-B' },
  { po_number: 'PO-003', material_code: 'COMP-001', qty: 300, status: 'closed', supplier_id: 'SUP-A' },
];

where(po_open_lines, { status: 'open', supplier_id: 'SUP-A' });
// [ { po_number: 'PO-001', material_code: 'COMP-001', qty: 500, status: 'open', supplier_id: 'SUP-A' } ]
\`\`\`

### JOIN — 合併兩張表

你的資料分散在不同的表：庫存在 \`inventory_snapshots\`，價格在 \`fg_financials\`。要一起看就要用 JOIN。

\`\`\`sql
-- 查看每個品項的庫存和單價
SELECT
  i.material_code,
  i.onhand_qty,
  f.unit_price,
  i.onhand_qty * f.unit_price AS inventory_value
FROM inventory_snapshots i
JOIN fg_financials f ON i.material_code = f.material_code;
\`\`\`

- \`i\` 和 \`f\` 是**別名**（alias），用來簡寫表名
- \`ON\` 指定兩張表用什麼欄位配對
- \`AS inventory_value\` — 給計算結果取名字

### JOIN 的種類

| 種類 | 說明 | 結果 |
|------|------|------|
| \`INNER JOIN\` | 只取兩邊都有配對的 | 最常用，沒配到的丟掉 |
| \`LEFT JOIN\` | 左邊全部保留 | 右邊沒配到的填 NULL |
| \`RIGHT JOIN\` | 右邊全部保留 | 左邊沒配到的填 NULL |
| \`FULL JOIN\` | 兩邊都保留 | 沒配到的都填 NULL |

### JavaScript 等價：innerJoin()

你會實作 \`innerJoin(tableA, tableB, keyA, keyB)\`：

\`\`\`javascript
function innerJoin(tableA, tableB, keyA, keyB) {
  const result = [];
  for (const rowA of tableA) {
    for (const rowB of tableB) {
      if (rowA[keyA] === rowB[keyB]) {
        // 合併兩筆資料（如果欄位名衝突，tableB 會覆蓋 tableA）
        result.push({ ...rowA, ...rowB });
      }
    }
  }
  return result;
}
\`\`\`

**核心概念：**
- 雙層迴圈比對每一種組合——這就是 INNER JOIN 的本質
- \`{ ...rowA, ...rowB }\` 用展開運算子合併兩個物件
- 只有 \`rowA[keyA] === rowB[keyB]\` 的配對才會進入結果

#### 效能小知識

上面的寫法是 O(n×m)，資料量大時會很慢。實務上可以先用 Map 建索引：

\`\`\`javascript
function innerJoinOptimized(tableA, tableB, keyA, keyB) {
  const indexB = new Map();
  for (const rowB of tableB) {
    const key = rowB[keyB];
    if (!indexB.has(key)) indexB.set(key, []);
    indexB.get(key).push(rowB);
  }

  const result = [];
  for (const rowA of tableA) {
    const matches = indexB.get(rowA[keyA]) || [];
    for (const rowB of matches) {
      result.push({ ...rowA, ...rowB });
    }
  }
  return result;
}
\`\`\`

#### JOIN 示範

\`\`\`javascript
const joined = innerJoin(
  inventory_snapshots,
  fg_financials,
  'material_code', 'material_code'
);
// 只有 material_code 在兩張表都出現的資料會被保留
// 每筆結果同時擁有 onhand_qty 和 unit_price
\`\`\`

### BOM 表也能 JOIN

\`bom_edge.csv\` 記錄了成品與零件的關係：

| parent_code | child_code | qty_per | uom |
|-------------|------------|---------|-----|
| FG-001      | COMP-001   | 2       | EA  |
| FG-001      | COMP-002   | 1       | EA  |
| FG-002      | COMP-001   | 3       | EA  |

\`\`\`javascript
// 找出每個成品需要的零件和零件庫存
const bomWithStock = innerJoin(bom_edge, inventory_snapshots, 'child_code', 'material_code');
// 結果會同時有 parent_code, child_code, qty_per, onhand_qty 等欄位
\`\`\`

### 練習

1. 用 \`where\` 找出 \`po_open_lines\` 中 status 為 \`'open'\` 的採購單
2. 用 \`innerJoin\` 合併 \`inventory_snapshots\` 和 \`fg_financials\`（以 \`material_code\` 配對）
3. 串起來：先 join 再 where，找出庫存低於安全庫存**且**有價格資料的品項

> **提示：** \`where(innerJoin(invTable, finTable, 'material_code', 'material_code'), {})\` 然後在 where 裡面想辦法比較 onhand_qty 和 safety_stock。挑戰中的 conditions 物件支援簡單的等於比對。

---

## 3-3：GROUP BY + 聚合函式

### 聚合函式概覽

SQL 的聚合函式對一組資料做統計運算：

\`\`\`sql
SELECT SUM(onhand_qty) AS total_stock FROM inventory_snapshots;    -- 總和
SELECT AVG(onhand_qty) AS avg_stock FROM inventory_snapshots;      -- 平均
SELECT COUNT(*) AS item_count FROM inventory_snapshots;            -- 計數
SELECT MAX(onhand_qty) AS max_stock FROM inventory_snapshots;      -- 最大值
SELECT MIN(onhand_qty) AS min_stock FROM inventory_snapshots;      -- 最小值
\`\`\`

| 函式 | 用途 | 範例結果（以上面 3 筆資料）|
|------|------|--------------------------|
| \`SUM\` | 加總 | 500 + 1200 + 80 = 1780 |
| \`AVG\` | 平均 | 1780 / 3 ≈ 593.3 |
| \`COUNT\` | 計數 | 3 |
| \`MAX\` | 最大 | 1200 |
| \`MIN\` | 最小 | 80 |

### JavaScript 等價：aggregate()

你會實作 \`aggregate(table, field, op)\`：

\`\`\`javascript
function aggregate(table, field, op) {
  const values = table.map(row => row[field]);

  switch (op) {
    case 'sum':
      return values.reduce((acc, v) => acc + v, 0);
    case 'avg':
      return values.reduce((acc, v) => acc + v, 0) / values.length;
    case 'count':
      return values.length;
    case 'max':
      return Math.max(...values);
    case 'min':
      return Math.min(...values);
    default:
      throw new Error('Unknown operation: ' + op);
  }
}
\`\`\`

**核心概念：** \`.reduce()\` 是聚合的靈魂——它把陣列「折疊」成一個值。

#### 聚合示範

\`\`\`javascript
aggregate(inventory_snapshots, 'onhand_qty', 'sum');  // 1780
aggregate(inventory_snapshots, 'onhand_qty', 'avg');  // 593.33...
aggregate(inventory_snapshots, 'onhand_qty', 'max');  // 1200
\`\`\`

### GROUP BY — 分組統計

SQL 的 GROUP BY 先分組，再對每組做聚合：

\`\`\`sql
-- 每個工廠的總庫存
SELECT plant_id, SUM(onhand_qty) AS total_stock
FROM inventory_snapshots
GROUP BY plant_id;

-- 結果：
-- plant_id | total_stock
-- P01      | 1780
-- P02      | 2100
\`\`\`

### JavaScript 等價：groupBy()

你會實作 \`groupBy(table, field)\`，回傳一個 Map（或物件），key 是分組值，value 是該組的資料陣列：

\`\`\`javascript
function groupBy(table, field) {
  const groups = new Map();
  for (const row of table) {
    const key = row[field];
    if (!groups.has(key)) {
      groups.set(key, []);
    }
    groups.get(key).push(row);
  }
  return groups;
}
\`\`\`

也可以用 \`.reduce()\` 寫成一行：

\`\`\`javascript
function groupBy(table, field) {
  return table.reduce((groups, row) => {
    const key = row[field];
    if (!groups[key]) groups[key] = [];
    groups[key].push(row);
    return groups;
  }, {});
}
\`\`\`

#### 分組 + 聚合示範

\`\`\`javascript
const groups = groupBy(inventory_snapshots, 'plant_id');
// {
//   'P01': [ {material_code:'FG-001',...}, {material_code:'COMP-001',...}, ... ],
//   'P02': [ ... ]
// }

// 對每一組做聚合
const result = {};
for (const [plantId, rows] of Object.entries(groups)) {
  result[plantId] = aggregate(rows, 'onhand_qty', 'sum');
}
// { P01: 1780, P02: 2100 }
\`\`\`

### HAVING — 對分組結果過濾

\`\`\`sql
-- 只看總庫存低於 2000 的工廠
SELECT plant_id, SUM(onhand_qty) AS total_stock
FROM inventory_snapshots
GROUP BY plant_id
HAVING SUM(onhand_qty) < 2000;
\`\`\`

**WHERE vs HAVING：**
- \`WHERE\` 過濾**原始資料**（分組前）
- \`HAVING\` 過濾**統計後的結果**（分組後）

在 JavaScript 中，HAVING 就是對分組結果再做一次 filter：

\`\`\`javascript
Object.entries(result).filter(([_, total]) => total < 2000);
\`\`\`

### 實戰：用 demand_fg 統計需求

\`demand_fg.csv\` 記錄了成品的需求預測：

| material_code | period | demand_qty | customer_id |
|---------------|--------|------------|-------------|
| FG-001        | 2025-Q3 | 200       | CUST-A      |
| FG-001        | 2025-Q4 | 350       | CUST-B      |
| FG-002        | 2025-Q3 | 150       | CUST-A      |

\`\`\`javascript
// 每個成品的總需求量
const demandByProduct = groupBy(demand_fg, 'material_code');
for (const [code, rows] of Object.entries(demandByProduct)) {
  console.log(code, aggregate(rows, 'demand_qty', 'sum'));
}
// FG-001  550
// FG-002  150
\`\`\`

### 練習

1. 用 \`groupBy\` 按 \`plant_id\` 分組 inventory_snapshots
2. 對每一組用 \`aggregate\` 算出 \`onhand_qty\` 的 sum
3. 過濾出總庫存低於 2000 的工廠

> **挑戰提示：** 挑戰會要求你回傳 \`{ P01: 1780 }\` 這樣的物件。記得用 \`groupBy\` 拿到分組後，再用迴圈對每組做 \`aggregate\`。

---

## 3-4：INSERT + UPDATE — 寫入與修改

### INSERT — 新增資料

\`\`\`sql
INSERT INTO di_plan_audit_log (plan_id, action, actor, notes)
VALUES ('PLAN-001', 'approved', 'louis', '風險可接受');
\`\`\`

- \`INSERT INTO 表名 (欄位1, 欄位2, ...)\` 指定要填的欄位
- \`VALUES (...)\` 對應的值
- 沒指定的欄位會用預設值（如 \`id\` 可能是自動遞增）

### JavaScript 等價：insertRow()

你會實作 \`insertRow(table, row)\`——注意要**不修改原始陣列**（immutable 模式），並自動產生 id：

\`\`\`javascript
function insertRow(table, row) {
  // 找出目前最大的 id，新 id = maxId + 1
  const maxId = table.reduce((max, r) => Math.max(max, r.id || 0), 0);
  const newRow = { id: maxId + 1, ...row };

  // 回傳新陣列，不修改原始 table
  return [...table, newRow];
}
\`\`\`

**重點：不可變性（Immutability）**

在 React 和現代前端開發中，不修改原始資料是非常重要的原則。SQL 的 INSERT 會直接修改資料庫，但在 JavaScript 中我們偏好回傳新的陣列：

\`\`\`javascript
// ❌ 不好：直接修改原始陣列
table.push(newRow);

// ✅ 好：回傳新陣列
const newTable = [...table, newRow];
\`\`\`

#### insertRow 示範

\`\`\`javascript
const auditLog = [
  { id: 1, plan_id: 'PLAN-001', action: 'created', actor: 'system' },
  { id: 2, plan_id: 'PLAN-001', action: 'reviewed', actor: 'angela' },
];

const updated = insertRow(auditLog, {
  plan_id: 'PLAN-001',
  action: 'approved',
  actor: 'louis',
  notes: '風險可接受',
});
// updated 有 3 筆，新的那筆 id = 3
// auditLog 仍然只有 2 筆（不受影響）
\`\`\`

### UPDATE — 修改現有資料

\`\`\`sql
UPDATE inventory_snapshots
SET onhand_qty = 450, allocated_qty = 100
WHERE material_code = 'COMP-001' AND plant_id = 'P01';
\`\`\`

**重要：** \`UPDATE\` 不加 \`WHERE\` 會改掉**所有**資料！永遠記得加 WHERE。

### JavaScript 等價：updateRows()

你會實作 \`updateRows(table, condition, updates)\`——同樣不修改原始陣列：

\`\`\`javascript
function updateRows(table, condition, updates) {
  return table.map(row => {
    // 檢查這筆資料是否符合條件
    const matches = Object.entries(condition).every(
      ([key, value]) => row[key] === value
    );
    if (matches) {
      // 符合條件：回傳合併了 updates 的新物件
      return { ...row, ...updates };
    }
    // 不符合條件：原封不動回傳
    return row;
  });
}
\`\`\`

**核心概念：**
- \`.map()\` 走過每一筆資料
- 符合條件的用 \`{ ...row, ...updates }\` 建立新物件
- 不符合的直接回傳原物件（reference 不變，有利效能）

#### updateRows 示範

\`\`\`javascript
const newInventory = updateRows(
  inventory_snapshots,
  { material_code: 'COMP-001', plant_id: 'P01' },  // WHERE 條件
  { onhand_qty: 450, allocated_qty: 100 }            // SET 更新值
);
// COMP-001 的 onhand_qty 變成 450
// 其他資料不變
// 原始 inventory_snapshots 不受影響
\`\`\`

### DELETE 概念（補充）

\`\`\`sql
DELETE FROM di_plan_audit_log
WHERE plan_id = 'PLAN-001';
\`\`\`

JavaScript 等價就是 \`.filter()\` 取反：

\`\`\`javascript
const afterDelete = table.filter(row => row.plan_id !== 'PLAN-001');
\`\`\`

### 你的專案怎麼用

DI 專案裡，大部分寫入操作是透過 Supabase 的 JavaScript SDK：

\`\`\`javascript
// INSERT
const { data, error } = await supabase
  .from('di_plan_audit_log')
  .insert({ plan_id: 'PLAN-001', action: 'approved' });

// UPDATE
const { data, error } = await supabase
  .from('inventory_snapshots')
  .update({ onhand_qty: 450 })
  .eq('material_code', 'COMP-001');
\`\`\`

底層跑的就是 SQL INSERT / UPDATE，但 Supabase SDK 幫你處理了安全性和權限。

### 練習

1. 用 \`insertRow\` 新增一筆審核紀錄：\`{ plan_id: 'PLAN-002', action: 'flagged', actor: 'system', notes: '庫存低於安全水位' }\`
2. 用 \`updateRows\` 把 COMP-002 的 \`onhand_qty\` 改成 200
3. 驗證原始陣列沒有被修改

> **挑戰提示：** 挑戰會測試你的函式是否真的不修改原始陣列。用 \`===\` 比較原始 table 和回傳值，它們應該是不同的 reference。

---

## 3-5：RPC 函式 + 子查詢

### 子查詢（Subquery）

SQL 允許查詢裡面套查詢：

\`\`\`sql
-- 找出庫存低於「平均安全庫存」的品項
SELECT material_code, onhand_qty
FROM inventory_snapshots
WHERE onhand_qty < (
  SELECT AVG(safety_stock) FROM inventory_snapshots
);
\`\`\`

子查詢先算出平均安全庫存（例如 183），外層再用這個值做過濾。

### CTE（Common Table Expression）

\`\`\`sql
WITH stock_days AS (
  SELECT
    material_code,
    onhand_qty,
    daily_demand,
    CASE WHEN daily_demand > 0
      THEN onhand_qty / daily_demand
      ELSE 9999
    END AS days_remaining
  FROM inventory_with_demand
)
SELECT * FROM stock_days WHERE days_remaining < 7;
\`\`\`

\`WITH ... AS\` 先建一個「暫存表」，後面的查詢可以引用它。你的專案 SQL 裡很多用 CTE。

### 什麼是 RPC？

RPC = Remote Procedure Call = 遠端程序呼叫。

概念很簡單：**把一段邏輯封裝成函式，用名稱呼叫它**。在 Supabase 中，你可以把複雜的 SQL 邏輯寫成 PostgreSQL 函式，前端只要呼叫函式名稱和傳參數：

\`\`\`sql
-- 在資料庫定義一個函式
CREATE OR REPLACE FUNCTION get_critical_items(threshold_days int)
RETURNS TABLE(material_code text, days_remaining numeric) AS $$
  SELECT material_code, onhand_qty / NULLIF(daily_demand, 0)
  FROM inventory_with_demand
  WHERE onhand_qty / NULLIF(daily_demand, 0) < threshold_days;
$$ LANGUAGE sql;
\`\`\`

JavaScript 端呼叫：

\`\`\`javascript
const { data } = await supabase.rpc('get_critical_items', { threshold_days: 7 });
\`\`\`

### JavaScript 等價：createRPC()

在挑戰中，你會建立一個「函式註冊表」：

\`\`\`javascript
function createRPC(functions) {
  // functions 是一個物件，key 是函式名稱，value 是函式本體
  // 回傳一個 rpc 函式，用來按名稱呼叫已註冊的函式

  return function rpc(name, params) {
    if (!functions[name]) {
      throw new Error('Unknown function: ' + name);
    }
    return functions[name](params);
  };
}
\`\`\`

**核心概念：**
- \`createRPC\` 是一個**高階函式**（Higher-Order Function）——它回傳另一個函式
- 這就是**閉包**（Closure）——回傳的 \`rpc\` 函式「記住」了 \`functions\` 這個變數
- 這種模式叫**函式註冊表**（Function Registry）

#### createRPC 示範

\`\`\`javascript
const rpc = createRPC({
  get_critical_items: ({ threshold_days }) => {
    return inventory_snapshots.filter(row => {
      const daysRemaining = row.onhand_qty / (row.daily_demand || Infinity);
      return daysRemaining < threshold_days;
    });
  },
  get_total_stock: ({ plant_id }) => {
    const filtered = inventory_snapshots.filter(r => r.plant_id === plant_id);
    return filtered.reduce((sum, r) => sum + r.onhand_qty, 0);
  },
});

rpc('get_critical_items', { threshold_days: 7 });
// 回傳庫存天數低於 7 天的品項

rpc('get_total_stock', { plant_id: 'P01' });
// 回傳 P01 工廠的總庫存
\`\`\`

### 安全性：createSecureRPC

在真實系統中，不是每個使用者都能呼叫所有函式。你會實作 \`createSecureRPC\`，加上允許清單：

\`\`\`javascript
function createSecureRPC(functions, allowList) {
  return function rpc(name, params) {
    // 先檢查是否在允許清單中
    if (!allowList.includes(name)) {
      throw new Error('Permission denied: ' + name);
    }
    if (!functions[name]) {
      throw new Error('Unknown function: ' + name);
    }
    return functions[name](params);
  };
}
\`\`\`

#### createSecureRPC 示範

\`\`\`javascript
const secureRpc = createSecureRPC(
  {
    get_critical_items: (params) => { /* ... */ },
    delete_all_data: () => { /* 危險操作 */ },
    get_total_stock: (params) => { /* ... */ },
  },
  ['get_critical_items', 'get_total_stock']  // 只允許這兩個
);

secureRpc('get_critical_items', { threshold_days: 7 });  // ✅ 正常
secureRpc('delete_all_data', {});  // ❌ 拋出 Permission denied
\`\`\`

### 為什麼 RPC 模式很重要？

在 DI 專案中，RPC 模式的好處是：

1. **封裝複雜邏輯**——前端不需要知道 SQL 怎麼寫，只要呼叫函式名稱
2. **安全性**——資料庫只暴露允許的函式，不直接暴露表
3. **可重用**——同一個函式可以被多個頁面呼叫
4. **可測試**——函式是獨立的，容易寫測試

### 練習

1. 用 \`createRPC\` 註冊兩個函式：\`get_low_stock\`（找庫存 < 100 的品項）和 \`get_open_pos\`（找 status = 'open' 的採購單）
2. 用回傳的 \`rpc\` 呼叫它們
3. 用 \`createSecureRPC\` 只允許 \`get_low_stock\`，然後嘗試呼叫 \`get_open_pos\`，確認會拋出錯誤

---

## 3-6（Boss）：即時查詢挑戰

### Boss 關卡概述

在這個最終挑戰中，你要實作一個通用的 \`query(table, options)\` 函式，把前面所有操作組合起來。這就像是自己寫一個迷你版的 SQL 引擎！

### SQL 查詢的執行順序

理解 SQL 的執行順序很重要——它**不是**按照你寫的順序：

| 步驟 | 子句 | 說明 |
|------|------|------|
| 1 | \`FROM\` | 先決定從哪張表取資料 |
| 2 | \`WHERE\` | 過濾原始資料 |
| 3 | \`GROUP BY\` | 分組 |
| 4 | \`HAVING\` | 過濾分組結果 |
| 5 | \`SELECT\` | 選取欄位 |
| 6 | \`ORDER BY\` | 排序 |
| 7 | \`LIMIT\` | 限制筆數 |

### JavaScript 等價：query()

你要實作的 \`query\` 函式接受一張表和選項物件：

\`\`\`javascript
function query(table, options = {}) {
  let result = [...table];  // 複製，不改原始資料

  // 1. WHERE — 過濾
  if (options.where) {
    result = result.filter(row =>
      Object.entries(options.where).every(
        ([key, value]) => row[key] === value
      )
    );
  }

  // 2. ORDER BY — 排序
  if (options.orderBy) {
    const { field, direction = 'asc' } = options.orderBy;
    result.sort((a, b) => {
      if (a[field] < b[field]) return direction === 'asc' ? -1 : 1;
      if (a[field] > b[field]) return direction === 'asc' ? 1 : -1;
      return 0;
    });
  }

  // 3. SELECT — 選取欄位
  if (options.select) {
    result = result.map(row => {
      const newRow = {};
      for (const col of options.select) {
        newRow[col] = row[col];
      }
      return newRow;
    });
  }

  // 4. LIMIT — 限制筆數
  if (options.limit) {
    result = result.slice(0, options.limit);
  }

  return result;
}
\`\`\`

### 用 DI 專案資料做完整示範

\`\`\`javascript
// 相當於：
// SELECT material_code, onhand_qty
// FROM inventory_snapshots
// WHERE plant_id = 'P01'
// ORDER BY onhand_qty ASC
// LIMIT 3;

const answer = query(inventory_snapshots, {
  where: { plant_id: 'P01' },
  orderBy: { field: 'onhand_qty', direction: 'asc' },
  select: ['material_code', 'onhand_qty'],
  limit: 3,
});
\`\`\`

### Boss 挑戰的業務問題

你會拿到一組真實的 \`sample_data\`，用你的 \`query\` 函式回答以下問題：

1. **哪些品項的庫存天數低於 7 天？**
   - 需要先計算每個品項的庫存天數（onhand_qty / daily_demand）
   - 再用 where 過濾

2. **這些品項有沒有正在開的採購單？**
   - 需要把結果和 \`po_open_lines\` 做 join
   - 再用 where 過濾 status = 'open'

3. **各工廠的庫存總價值是多少？**
   - 需要 join inventory_snapshots 和 fg_financials
   - 再 groupBy plant_id
   - 對每組算 sum(onhand_qty * unit_price)

4. **哪個供應商的交貨延遲率最高？**
   - 從 po_open_lines 分組統計

### 解題策略

Boss 關卡考驗的是**組合能力**。把前面學的函式串起來：

\`\`\`javascript
// 範例：各工廠庫存總價值
const withPrice = innerJoin(inventory_snapshots, fg_financials, 'material_code', 'material_code');
const groups = groupBy(withPrice, 'plant_id');
const totals = {};
for (const [plant, rows] of Object.entries(groups)) {
  totals[plant] = rows.reduce((sum, r) => sum + r.onhand_qty * r.unit_price, 0);
}
\`\`\`

> **提示：** 不需要一次寫完——先拆解問題，一步一步串接，每一步都用 console.log 確認中間結果。

---

## SQL 速查表

### SQL 語法對照表

| SQL 語法 | 用途 | SQL 範例 | JS 等價 |
|----------|------|----------|---------|
| \`SELECT\` | 選取欄位 | \`SELECT col FROM t\` | \`.map(r => ({ col: r.col }))\` |
| \`WHERE\` | 過濾 | \`WHERE qty > 10\` | \`.filter(r => r.qty > 10)\` |
| \`ORDER BY\` | 排序 | \`ORDER BY qty DESC\` | \`[...arr].sort((a,b) => b.qty - a.qty)\` |
| \`LIMIT\` | 限制筆數 | \`LIMIT 10\` | \`.slice(0, 10)\` |
| \`JOIN\` | 合併表 | \`JOIN t2 ON t1.id = t2.id\` | 雙層迴圈 + 條件比對 |
| \`GROUP BY\` | 分組 | \`GROUP BY plant_id\` | \`.reduce()\` 建立分組物件 |
| \`HAVING\` | 過濾分組 | \`HAVING SUM(qty) > 100\` | 對分組結果 \`.filter()\` |
| \`INSERT\` | 新增 | \`INSERT INTO t (col) VALUES (val)\` | \`[...table, newRow]\` |
| \`UPDATE\` | 修改 | \`UPDATE t SET col = val WHERE ...\` | \`.map(r => match ? {...r, ...updates} : r)\` |
| \`SUM\` | 加總 | \`SUM(qty)\` | \`.reduce((s,r) => s + r.qty, 0)\` |
| \`AVG\` | 平均 | \`AVG(qty)\` | \`sum / arr.length\` |
| \`COUNT\` | 計數 | \`COUNT(*)\` | \`.length\` |
| \`MAX / MIN\` | 極值 | \`MAX(qty)\` | \`Math.max(...vals)\` |
| \`CASE WHEN\` | 條件 | \`CASE WHEN x > 0 THEN 'yes' END\` | 三元運算子 \`x > 0 ? 'yes' : 'no'\` |
| \`NULLIF(x, 0)\` | 防除零 | 如果 x=0 回傳 NULL | \`x === 0 ? null : x\` 或 \`x \\|\\| Infinity\` |
| \`COALESCE(x, 0)\` | 空值替代 | 如果 x 是 NULL 回傳 0 | \`x ?? 0\` 或 \`x \\|\\| 0\` |
| \`WITH ... AS\` | CTE | 暫存子查詢 | 用變數存中間結果 |

### DI 專案常用表

| 表名 | 用途 | 重要欄位 |
|------|------|----------|
| \`inventory_snapshots\` | 庫存快照 | material_code, plant_id, onhand_qty, safety_stock |
| \`fg_financials\` | 成品財務 | material_code, unit_price, currency |
| \`po_open_lines\` | 開立中採購單 | po_number, material_code, qty, status, supplier_id |
| \`bom_edge\` | BOM 結構（成品→零件）| parent_code, child_code, qty_per |
| \`demand_fg\` | 成品需求預測 | material_code, period, demand_qty, customer_id |

### 本關學到的 JS 核心方法

| 方法 | 用途 | 對應 SQL |
|------|------|----------|
| \`.map()\` | 轉換每一筆資料 | SELECT |
| \`.filter()\` | 過濾資料 | WHERE / HAVING |
| \`.sort()\` | 排序（會改原陣列！） | ORDER BY |
| \`.slice()\` | 取部分陣列 | LIMIT |
| \`.reduce()\` | 聚合 / 分組 | SUM, AVG, GROUP BY |
| \`[...arr]\` | 展開複製 | （避免修改原始資料）|
| \`{ ...obj }\` | 合併物件 | JOIN, UPDATE |

> **下一關：** World 4 將會把 SQL 查詢和前端 UI 串起來，學習如何把查詢結果呈現在畫面上！
`;
