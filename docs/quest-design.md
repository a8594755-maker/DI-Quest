# DI Quest 关卡设计文档
# 基于 Decision-Intelligence- 真实代码的学习路径

---

## World 1: JavaScript 基础岛 🏝️
> 目标：读懂 `src/domains/inventory/calculator.js` 的基础语法

### 1-1: 变量与型别 — 从 RISK_THRESHOLDS 开始
**对应代码**: `src/domains/inventory/calculator.js:19-37`

```javascript
export const RISK_THRESHOLDS = {
  CRITICAL_DAYS: 7,      // 7 天内断料为紧急
  WARNING_DAYS: 14,      // 14 天内断料为警告
  HIGH_VOLATILITY: 0.2,  // 需求波动超过 20% 视为高波动
  URGENCY_CRITICAL: 100,
  URGENCY_WARNING: 50,
  URGENCY_LOW: 10,
  MAX_PROBABILITY: 0.95,
  STATUS_CRITICAL: 'critical',
  STATUS_WARNING: 'warning',
  STATUS_OK: 'ok',
  STATUS_LOW: 'low'
};
```

**挑战**: 
1. 填空：补全 STATUS 常量的值
2. 改错：找出型别错误（CRITICAL_DAYS = "7"）
3. 类型判断：typeof RISK_THRESHOLDS.CRITICAL_DAYS 是什么？

---

### 1-2: 函数与 return — calculateDaysToStockout
**对应代码**: `src/domains/inventory/calculator.js:72-126`

```javascript
export function calculateDaysToStockout(currentStock, dailyDemand, safetyStock = 0) {
  // 输入验证
  if (typeof currentStock !== 'number' || isNaN(currentStock)) {
    throw new Error(ERROR_MESSAGES.INVALID_NUMBER('currentStock'));
  }
  
  // Edge Case 1: 负库存（已断料）
  if (currentStock < 0) {
    return {
      days: 0,
      status: RISK_THRESHOLDS.STATUS_CRITICAL
    };
  }
  
  // 正常计算
  const availableStock = currentStock - safetyStock;
  const days = availableStock / dailyDemand;
  
  return {
    days: Math.max(0, days),
    status
  };
}
```

**挑战**:
1. 实现 gradeScore(score) 函数，返回 'A'|'B'|'C'|'D'|'F'
2. 加上输入验证：score 必须是 0-100 的数字
3. 处理边界：score > 100 或 score < 0 返回 'Invalid'

---

### 1-3: 条件判断 — 库存状态判断
**对应代码**: `src/domains/inventory/calculator.js:84-120`

**挑战**: 
实现判断库存状态的函数：
```javascript
function getInventoryStatus(currentStock, safetyStock, dailyDemand) {
  // 你的代码
}

// 测试案例：
// (100, 20, 10) => 'ok' (还有8天)
// (50, 20, 10) => 'warning' (还有3天)
// (10, 20, 10) => 'critical' (已低于安全库存)
// (-5, 0, 10) => 'critical' (已断料)
```

---

### 1-4: 对象与解构 — InventoryPosition
**对应代码**: `src/domains/inventory/calculator.js:255-298`

```javascript
export function calculateInventoryRisk(position) {
  const {
    currentStock,
    safetyStock = 0,
    dailyDemand,
    leadTimeDays,
    demandVolatility = 0.1
  } = position;
  
  // 计算断料天数
  const stockoutResult = calculateDaysToStockout(currentStock, dailyDemand, safetyStock);
  // ...
}
```

**挑战**:
1. 从 position 对象中提取字段
2. 给 safetyStock 和 demandVolatility 设置默认值
3. 实现一个函数，接收对象参数，返回风险等级

---

### 1-5: 数组与迴圈 — 批量计算
**对应代码**: `src/services/risk/riskScoreService.js:305-357`

```javascript
function mergeRiskInputs(probMap, revenueMap, riskRows, currentBucket) {
  const inputs = [];
  const allKeys = new Set([
    ...Object.keys(probMap),
    ...Object.keys(revenueMap)
  ]);
  
  for (const key of allKeys) {
    const prob = probMap[key];
    const rev = revenueMap[key] || { impactUsd: 0, penaltyUsd: 0 };
    // ...
  }
}
```

**挑战**:
1. 给定一个库存数组，计算每个物料的风险等级
2. 过滤出高风险（critical）的物料
3. 计算平均库存天数

---

### 1-6: **Boss 关 — 读懂 calculator.js**
**机制**: 遮码填空

显示 `calculator.js` 的关键部分，遮住具体实现，让学生填回去：

```javascript
// 遮住第 72-126 行，显示框架
export function calculateDaysToStockout(currentStock, dailyDemand, safetyStock = 0) {
  // [填空 1]: 输入验证代码
  
  // [填空 2]: Edge Case - 负库存处理
  
  // [填空 3]: 正常计算逻辑
  
  return {
    days: ???,
    status: ???
  };
}
```

**评分**: 不要求与原始代码完全一致，只要逻辑正确即可通过。

---

## World 2: 纯函数式神殿 ⛩️
> 目标：掌握 `src/domains/forecast/bomCalculator.js` 的纯函数设计

### 2-1: 什么是纯函数
**对应代码**: 文件开头的注释

```javascript
/**
 * Forecast Domain - BOM Calculator
 * BOM 计算器 - 纯函数实现
 * 
 * 此档案包含所有 BOM Explosion 的核心计算逻辑
 * 所有函数都是 Pure Functions：
 * - 不依赖外部状态
 * - 不产生副作用
 * - 相同输入永远产生相同输出
 * - 不呼叫 API 或修改输入参数
 */
```

**挑战**: 判断下列函数哪些是纯函数
```javascript
// A
function add(a, b) {
  return a + b;
}

// B
let counter = 0;
function increment() {
  return ++counter;
}

// C
function calculateComponentRequirement(parentQty, qtyPer) {
  return parentQty * qtyPer;
}
```

---

### 2-2: 输入验证 — 防御式编程
**对应代码**: `src/domains/forecast/bomCalculator.js:185-236`

```javascript
export function calculateComponentRequirement(parentQty, qtyPer, scrapRate = 0, yieldRate = 1) {
  // Early Return: 处理 null/undefined
  if (parentQty === null || parentQty === undefined) {
    return 0;
  }
  
  // 参数验证
  if (typeof parentQty !== 'number' || isNaN(parentQty) || parentQty < 0) {
    throw new Error(ERROR_MESSAGES.NEGATIVE_NUMBER('parentQty'));
  }
  
  // Edge Case: qtyPer 为 0 直接返回 0
  if (qtyPer === 0) {
    return 0;
  }
  
  // 报废率验证（防止 >= 1 导致除以零）
  if (typeof scrapRate !== 'number' || isNaN(scrapRate) || 
      scrapRate < DEFAULTS.MIN_SCRAP_RATE || scrapRate >= DEFAULTS.MAX_SCRAP_RATE) {
    throw new Error(ERROR_MESSAGES.OUT_OF_RANGE('scrapRate', DEFAULTS.MIN_SCRAP_RATE, DEFAULTS.MAX_SCRAP_RATE));
  }
  
  const result = parentQty * qtyPer * (1 + scrapRate) / yieldRate;
  return roundTo(result, DEFAULTS.QUANTITY_DECIMALS);
}
```

**挑战**:
1. 为一个计算函数添加输入验证
2. 处理三种边界情况：null/undefined、负数、零值
3. 验证数值范围

---

### 2-3: 边界情况 — 找出所有 Edge Cases
**对应代码**: `bomCalculator.js` 和 `calculator.js` 中的 Edge Case 处理

**挑战**: 阅读 `calculateDaysToStockout` 函数，列出所有边界情况：
1. 负库存
2. 库存低于安全库存
3. 零需求
4. 无效输入

让学生为 `calculateComponentRequirement` 找出5种边界情况。

---

### 2-4: 函数组合 — 串接计算
**对应代码**: `src/domains/forecast/bomCalculator.js:540-550`

```javascript
// 计算子件数量
const childQty = calculateComponentRequirement(
  parentDemand.demand_qty,
  childEdge.qty_per,
  scrapRate,
  yieldRate
);

const newMultiplier = roundTo(
  multiplier * childEdge.qty_per * (1 + scrapRate) / yieldRate,
  4
);
```

**挑战**: 
实现一个函数，串接以下计算：
1. 计算基础需求 = parentQty * qtyPer
2. 加上报废 = base * (1 + scrapRate)
3. 除以良率 = withScrap / yieldRate
4. 四舍五入

---

### 2-5: 写测试 — Vitest
**对应代码**: `src/domains/forecast/bomCalculator.test.js`

**挑战**: 为 `calculateComponentRequirement` 写测试案例：
```javascript
import { describe, it, expect } from 'vitest';
import { calculateComponentRequirement } from './bomCalculator';

describe('calculateComponentRequirement', () => {
  it('应该正确计算基础需求', () => {
    // 你的测试
  });
  
  it('应该处理报废率', () => {
    // 你的测试
  });
  
  it('应该处理良率', () => {
    // 你的测试
  });
  
  it('应该抛出错误当参数无效', () => {
    // 你的测试
  });
});
```

---

### 2-6: **Boss 关 — BOM 递归展开**
**对应代码**: `src/domains/forecast/bomCalculator.js:457-581`

**机制**: 
1. 给学生一棵 BOM 树的视觉化图（用 ReactFlow）
2. 显示 `explodeBOMRecursive` 函数的框架
3. 学生需要实现递归逻辑

```javascript
function explodeBOMRecursive(
  parentDemand, bomLevel, multiplier, path, bomIndex, 
  componentDemandMap, traceRows, errors, maxDepth, ...
) {
  // [填空 1]: 检查最大深度
  
  // [填空 2]: 检查循环引用
  
  // [填空 3]: 累加零件需求到 componentDemandMap
  
  // [填空 4]: 如果有子件，递归展开
  for (const childEdge of children) {
    // 计算子件数量
    const childQty = ???;
    
    // 递归调用
    explodeBOMRecursive(
      childDemand,
      ???, // bomLevel + ?
      newMultiplier,
      [...path, ???], // 更新 path
      // ...其他参数
    );
  }
}
```

**视觉反馈**: 每完成一层递归，树上对应的节点会亮起来。

---

## World 3: SQL 地下城 🏰
> 目标：理解 `src/services/risk/riskScoreService.js` 和 `src/services/planning/diRunsService.js` 的数据库操作

### 3-1: SELECT 基础
**对应代码**: `src/services/risk/riskScoreService.js:41-50`

```javascript
const { data: runData, error: runError } = await supabase
  .from('forecast_runs')
  .select('id, kind, parameters, created_at')
  .eq('id', forecastRunId)
  .eq('user_id', userId)
  .single();
```

**挑战**: 
1. 查询所有库存位置（inventory_positions）
2. 查询特定物料的库存
3. 查询最近7天的预测数据

---

### 3-2: WHERE + JOIN
**对应代码**: `src/services/risk/riskScoreService.js:184-228`

```javascript
const { data, error } = await supabase
  .from('inventory_forecast_prob_summary')
  .select('material_code, plant_id, p_stockout, stockout_bucket_p50')
  .eq('user_id', userId)
  .eq('forecast_run_id', runId);
```

**挑战**: 
1. 查询库存低于安全水位的物料
2. 查询有风险分数的物料（JOIN risk_score_results）
3. 查询特定工厂的所有物料需求

---

### 3-3: GROUP BY + 聚合
**对应代码**: `src/services/planning/diRunsService.js:160-178`

```javascript
const { data, error } = await supabase
  .from('di_runs')
  .select('*')
  .eq('user_id', userId)
  .order('created_at', { ascending: false })
  .limit(limit);
```

**挑战**: 
1. 统计各工厂的高风险物料数量
2. 计算平均库存天数
3. 找出风险分数最高的前10个物料

---

### 3-4: INSERT + UPDATE
**对应代码**: `src/services/planning/diRunsService.js:38-82`

```javascript
const { data, error } = await supabase
  .from('di_runs')
  .insert([payload])
  .select('*')
  .single();
```

**挑战**: 
1. 插入一个新的运行记录
2. 更新运行状态
3. 批量插入风险分数结果

---

### 3-5: RPC 函数
**对应代码**: `src/services/aiEmployee/queries.js` - 查询门面模式

**挑战**: 理解 RPC 函数调用：
```javascript
// 调用 Supabase RPC 函数
const { data, error } = await supabase
  .rpc('get_inventory_summary', {
    p_user_id: userId,
    p_plant_id: plantId
  });
```

---

### 3-6: **Boss 关 — 实时查询挑战**
**机制**: 使用 DuckDB-WASM 执行真实查询

给学生一个业务问题：
> "COMP-001 在 P001 工厂未来 30 天的库存天数是多少？"

学生需要写 SQL：
```sql
SELECT 
  material_code,
  plant_id,
  current_stock,
  daily_demand,
  (current_stock - safety_stock) / daily_demand as days_to_stockout
FROM inventory_positions
WHERE material_code = 'COMP-001'
  AND plant_id = 'P001';
```

**数据集**: 使用 `sample_data/` 中的真实数据。

---

## World 4: React 前线 ⚔️
> 目标：读懂 `src/components/chat/AgentExecutionPanel.jsx`

### 4-1: JSX 基础
**对应代码**: `src/components/chat/AgentExecutionPanel.jsx:22-43`

```javascript
const STATUS_STYLES = {
  pending:     { bg: 'bg-[var(--surface-subtle)]', text: 'text-[var(--text-muted)]', dot: 'bg-slate-400', label: 'Pending' },
  running:     { bg: 'bg-blue-50 dark:bg-blue-900/20', text: 'text-blue-600', dot: 'bg-blue-500', label: 'Running' },
  succeeded:   { bg: 'bg-emerald-50 dark:bg-emerald-900/20', text: 'text-emerald-600', dot: 'bg-emerald-500', label: 'Done' },
  failed:      { bg: 'bg-red-50 dark:bg-red-900/20', text: 'text-red-600', dot: 'bg-red-500', label: 'Failed' },
};
```

**挑战**: 理解 JSX 和对象解构。

---

### 4-2: Props 与 State
**对应代码**: `src/components/chat/AgentExecutionPanel.jsx:66-83`

```javascript
function CopyButton({ text }) {
  const [copied, setCopied] = useState(false);
  const handleCopy = () => {
    navigator.clipboard.writeText(text).then(() => {
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    });
  };
  // ...
}
```

**挑战**: 修改组件行为，添加新的 state。

---

### 4-3: useEffect 与生命周期
**对应代码**: 搜索 useEffect 的使用

**挑战**: 修复一个 useEffect 依赖数组 bug。

---

### 4-4: Context 与全局状态
**对应代码**: `src/services/aiEmployee/queries.js` - 查询门面模式

```javascript
/**
 * queries.js — Unified read-only query facade for the AI Employee subsystem.
 *
 * Aggregates read methods from all persistence repos into a single namespace.
 * UI pages should import from here instead of aiEmployeeService.js.
 */
```

**挑战**: 理解 Context 的数据流。

---

### 4-5: 条件渲染与列表
**对应代码**: `src/components/chat/AgentExecutionPanel.jsx:195-220`

**挑战**: 实现一个风险列表组件。

---

### 4-6: **Boss 关 — 从零写一个 Dashboard Card**
**目标**: 写一个展示库存风险的 Dashboard Card

**要求**:
1. 显示物料代码、工厂、风险等级
2. 根据风险等级显示不同颜色
3. 点击展开显示详细信息
4. 使用 Tailwind CSS

---

## World 5: Agent 深渊 🌀
> 目标：理解 `src/services/aiEmployee/orchestrator.js` 的 Agent 架构

### 5-1: Async/Await
**对应代码**: `src/services/aiEmployee/orchestrator.js:63-70`

```javascript
async function _getAutonomyLevel(employeeId) {
  try {
    const metrics = await getLatestMetrics(employeeId);
    return metrics?.autonomy_level || 'A1';
  } catch {
    return 'A1';
  }
}
```

**挑战**: 理解异步执行顺序。

---

### 5-2: Pub/Sub 模式
**对应代码**: `src/services/governance/eventBus.js`

```javascript
import { eventBus, EVENT_NAMES } from '../governance/eventBus.js';

// 订阅事件
const unsubscribe = eventBus.subscribe(EVENT_NAMES.TASK_STATUS_CHANGED, (payload) => {
  console.log('Task status changed:', payload);
});

// 发布事件
eventBus.publish(EVENT_NAMES.TASK_STATUS_CHANGED, { taskId: '123', status: 'running' });
```

**挑战**: 自己写一个 EventBus。

---

### 5-3: Semaphore 并发控制
**对应代码**: 搜索 semaphore 相关代码

**挑战**: 实现一个限制同时请求数的 Semaphore。

---

### 5-4: Circuit Breaker
**对应代码**: `src/services/ai-infra/aiProxyService.js`

**挑战**: 实现三态状态机（Closed/Open/Half-Open）。

---

### 5-5: ReAct Loop
**对应代码**: `src/services/aiEmployee/orchestrator.js:1-20`

```javascript
/**
 * orchestrator.js — The single owner of all task/step/employee state transitions.
 *
 * Responsibilities:
 *   1. Accept plans from Planner → create task + steps in DB
 *   2. On approval → queue and start tick loop
 *   3. tick() → run next pending step via Executor → handle result
 *   4. Chain artifacts between steps
 *   5. Handle errors via selfHealingService → retry or fail
 *   6. Emit events via eventBus for UI updates
 *   7. Manage employee state transitions
 *   ...
 */
```

**挑战**: 理解「思考→行动→观察」循环。

---

### 5-6: **Boss 关 — 自己写一个 Mini Agent**
**机制**: 

学生需要写一个能使用三种工具（查库存、算风险、查 BOM）的 mini agent。

```javascript
class MiniAgent {
  constructor() {
    this.tools = {
      queryInventory: async (materialCode) => { /* ... */ },
      calculateRisk: async (position) => { /* ... */ },
      explodeBOM: async (fgCode) => { /* ... */ }
    };
  }
  
  async run(question) {
    // [填空 1]: 解析问题，决定使用哪些工具
    
    // [填空 2]: 按顺序调用工具
    
    // [填空 3]: 整合结果，给出答案
    
    return answer;
  }
}

// 测试："COMP-001 会不会断料？"
// 预期：查询库存 → 计算风险 → 回答
```

**连接**: 这个 Mini Agent 会实际调用 LLM API（通过现有的 ai-proxy）。

---

## World 6: 供应链商业案例 📊
> 目标：整合所有技能，解决真实业务问题

### 6-1: 需求预测
**对应代码**: `src/domains/forecast/bomCalculator.js`

**挑战**: 理解预测模型，选择适当的算法。

---

### 6-2: 安全库存策略
**对应代码**: `src/domains/inventory/calculator.js`

**挑战**: 计算最佳安全水位。

---

### 6-3: BOM 成本分析
**对应代码**: `src/domains/forecast/bomCalculator.js:185-236`

**挑战**: 展开 BOM 算总成本。

---

### 6-4: 风险量化
**对应代码**: `src/domains/risk/riskScore.js`

**挑战**: 用概率模型评估供应风险。

---

### 6-5: 场景模拟
**对应代码**: `src/domains/risk/whatIfEngine.js`

**挑战**: "如果原料涨价 20%⋯"

---

### 6-6: **Boss 关 — 完整商业简报**
**机制**: 

给学生一组真实的供应链数据，要求：
1. 用 SQL 查询数据
2. 用 JS 计算指标
3. 用 Agent 分析趋势
4. 做出决策建议

LLM 扮演「老板」角色，会追问：
- "为什么选这个策略？"
- "如果供应商倒了怎么办？"
- "这个决策的风险是什么？"

**数据集**: 使用 Decision-Intelligence- 项目中的真实 sample_data。

---

## 学习路径总结

| 世界 | 核心文件 | 技能点 | 产出 |
|------|---------|-------|------|
| 1 | `inventory/calculator.js` | JS 基础语法 | 读懂并修改库存计算器 |
| 2 | `forecast/bomCalculator.js` | 纯函数、递归 | 实现 BOM 递归展开 |
| 3 | `risk/riskScoreService.js` | SQL 查询 | 执行真实业务查询 |
| 4 | `chat/AgentExecutionPanel.jsx` | React | 写 Dashboard Card |
| 5 | `aiEmployee/orchestrator.js` | Agent 架构 | 写 Mini Agent |
| 6 | 全部整合 | 商业分析 | 完整决策建议 |

---

## 实施建议

1. **Phase 1（Week 1）**: 完成 World 1-2 的关卡数据（基于已有代码）
2. **Phase 2（Week 2）**: 完成 World 3-4（SQL + React）
3. **Phase 3（Week 3）**: 完成 World 5-6（Agent + 商业案例）
4. **持续迭代**: 根据学生反馈调整难度
