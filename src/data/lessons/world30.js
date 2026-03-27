const world30 = `
# World 30：Excel 數據分析

> Excel 是 BA 最常用的工具，面試也常考。不需要精通 VBA，但要能快速做出有 insight 的分析。

這一章聚焦在面試和工作中最實用的 Excel 技能，從公式到 Pivot Table 到 Scenario Analysis。

---

## 30-1：VLOOKUP / INDEX-MATCH

### VLOOKUP 基礎

\`\`\`
=VLOOKUP(查找值, 查找範圍, 返回欄位, 精確匹配)
=VLOOKUP(A2, Sheet2!A:D, 3, FALSE)
\`\`\`

| 參數 | 說明 | 常見值 |
|------|------|--------|
| lookup_value | 要查找的值 | A2（產品 ID） |
| table_array | 查找的範圍 | Sheet2!A:D |
| col_index_num | 返回第幾欄 | 3（第三欄） |
| range_lookup | 精確 or 模糊 | FALSE（精確匹配） |

### VLOOKUP 範例：合併銷售與產品資料

\`\`\`
銷售表（Sheet1）：
| 訂單ID | 產品ID | 數量 | 產品名稱（VLOOKUP） |
|--------|--------|------|-------------------|
| 001    | P-101  | 5    | =VLOOKUP(B2, Products!A:C, 2, FALSE) |
| 002    | P-203  | 3    | =VLOOKUP(B3, Products!A:C, 2, FALSE) |

產品表（Products Sheet）：
| 產品ID | 產品名稱 | 單價 |
|--------|---------|------|
| P-101  | 滑鼠    | 350  |
| P-203  | 鍵盤    | 890  |
\`\`\`

### VLOOKUP 的限制

\`\`\`
❌ 只能向右查找（lookup 值必須在最左欄）
❌ 插入/刪除欄位時 col_index_num 會出錯
❌ 大量資料時效能差
❌ 多條件查找困難
\`\`\`

### INDEX-MATCH：更強大的替代方案

\`\`\`
=INDEX(返回範圍, MATCH(查找值, 查找範圍, 0))
=INDEX(C:C, MATCH(A2, B:B, 0))
\`\`\`

### INDEX-MATCH 優勢

| 功能 | VLOOKUP | INDEX-MATCH |
|------|---------|-------------|
| 向左查找 | ❌ | ✅ |
| 欄位插入不受影響 | ❌ | ✅ |
| 大數據效能 | 慢 | 快 |
| 多條件查找 | 困難 | 容易（搭配陣列） |
| 水平查找 | 需改用 HLOOKUP | 同一組公式 |

### 多條件查找

\`\`\`
情境：根據「部門」+「職級」查找薪資

方法一：輔助欄
在薪資表新增一欄 = 部門 & 職級
=VLOOKUP(A2&B2, Helper!A:C, 3, FALSE)

方法二：INDEX-MATCH 陣列公式（Ctrl+Shift+Enter）
=INDEX(薪資範圍, MATCH(1, (部門範圍=A2)*(職級範圍=B2), 0))

方法三：XLOOKUP（Excel 365+）
=XLOOKUP(A2, 查找範圍, 返回範圍, "Not Found")
\`\`\`

### XLOOKUP（新版 Excel）

\`\`\`
=XLOOKUP(lookup_value, lookup_array, return_array, [if_not_found], [match_mode], [search_mode])

優勢：
- 可以向左查找
- 內建找不到時的預設值
- 支援萬用字元搜尋
- 語法更直覺

範例：
=XLOOKUP(A2, Products!A:A, Products!C:C, "未找到")
\`\`\`

---

## 30-2：Pivot Table 樞紐分析

### 什麼時候用 Pivot Table？

\`\`\`
當你需要：
- 快速彙總大量資料
- 多維度交叉分析
- 動態切換分析角度
- 製作管理報表
\`\`\`

### 建立 Pivot Table 的步驟

\`\`\`
1. 選取資料範圍（確保有標題列）
2. Insert → PivotTable
3. 選擇放置位置（新工作表 / 現有位置）
4. 拖曳欄位到四個區域：
   - Rows（列）：分析維度
   - Columns（欄）：交叉維度
   - Values（值）：計算的數字
   - Filters（篩選）：全域篩選
\`\`\`

### 範例：銷售資料分析

\`\`\`
原始資料：
| 日期 | 地區 | 產品類別 | 業務員 | 金額 | 數量 |
|------|------|---------|--------|------|------|
| 1/1  | 北區 | 電腦    | Alice  | 35000| 2    |
| 1/1  | 南區 | 手機    | Bob    | 28000| 4    |
| 1/2  | 北區 | 手機    | Alice  | 14000| 2    |
| ...  | ...  | ...     | ...    | ...  | ...  |

Pivot Table 設定 1：各地區各類別銷售額
Rows: 地區
Columns: 產品類別
Values: Sum of 金額

結果：
| 地區 | 電腦 | 手機 | 配件 | 總計 |
|------|------|------|------|------|
| 北區 | 850K | 620K | 180K | 1.65M |
| 中區 | 520K | 480K | 150K | 1.15M |
| 南區 | 680K | 590K | 210K | 1.48M |
| 總計 | 2.05M | 1.69M | 540K | 4.28M |
\`\`\`

### Pivot Table 進階技巧

\`\`\`
1. 值欄位設定：
   - Sum（加總）、Count（計數）、Average（平均）
   - Show Values As → % of Grand Total（佔比）
   - Show Values As → % of Column Total（欄佔比）
   - Show Values As → Running Total（累計）

2. Group 功能：
   - 日期群組：按月/季/年
   - 數值群組：金額分級（0-1000, 1001-5000...）

3. Calculated Field（計算欄位）：
   - 客單價 = 金額 / 數量
   - 利潤率 = (金額 - 成本) / 金額

4. Slicer（交叉篩選器）：
   - 視覺化的篩選按鈕
   - 可連動多個 Pivot Table
\`\`\`

### 面試常見 Pivot Table 問題

\`\`\`
Q: 給你一份訂單資料，如何找出 Top 5 客戶？
A: Pivot Table → Rows: 客戶 → Values: Sum of 金額
   → Sort Descending → 取前 5 筆

Q: 如何分析月度趨勢？
A: Pivot Table → Rows: 日期（Group by Month）
   → Values: Sum of 金額
   → 插入折線圖

Q: 如何做 RFM 分析？
A: Recency: MAX(日期) per 客戶
   Frequency: COUNT(訂單) per 客戶
   Monetary: SUM(金額) per 客戶
   → 各維度分 5 級 → 交叉分群
\`\`\`

---

## 30-3：常用公式與函數

### 條件統計函數

\`\`\`
COUNTIF — 條件計數
=COUNTIF(A:A, "北區")                    → 北區有幾筆
=COUNTIFS(A:A, "北區", B:B, ">10000")    → 北區且金額>10000

SUMIF — 條件加總
=SUMIF(A:A, "北區", C:C)                 → 北區的金額總和
=SUMIFS(C:C, A:A, "北區", B:B, "電腦")   → 北區+電腦的金額

AVERAGEIF — 條件平均
=AVERAGEIF(A:A, "北區", C:C)             → 北區的平均金額
\`\`\`

### 文字處理函數

\`\`\`
LEFT / RIGHT / MID — 擷取字串
=LEFT(A2, 3)                → 前 3 個字元
=RIGHT(A2, 4)               → 後 4 個字元
=MID(A2, 3, 5)              → 從第 3 個字元取 5 個

CONCATENATE / TEXTJOIN — 合併字串
=A2 & " - " & B2            → 合併兩欄
=TEXTJOIN(", ", TRUE, A2:A10)  → 用逗號合併範圍

TRIM / CLEAN — 清除空白與特殊字元
=TRIM(A2)                   → 去除首尾空白
=CLEAN(A2)                  → 去除非印刷字元

TEXT — 格式化
=TEXT(A2, "YYYY-MM-DD")     → 日期格式化
=TEXT(A2, "#,##0")           → 數字加千分位
\`\`\`

### 邏輯函數

\`\`\`
IF — 條件判斷
=IF(A2>=60, "Pass", "Fail")

巢狀 IF（不建議超過 3 層）
=IF(A2>=90, "A", IF(A2>=80, "B", IF(A2>=60, "C", "F")))

IFS（Excel 2019+，更易讀）
=IFS(A2>=90, "A", A2>=80, "B", A2>=60, "C", TRUE, "F")

IFERROR — 錯誤處理
=IFERROR(VLOOKUP(...), "Not Found")

AND / OR
=IF(AND(A2>0, B2>0), "Both Positive", "Not Both")
=IF(OR(A2="VIP", B2>10000), "Priority", "Normal")
\`\`\`

### 日期函數

\`\`\`
TODAY() / NOW() — 當前日期/時間
DATEDIF — 日期差
=DATEDIF(A2, B2, "D")    → 相差天數
=DATEDIF(A2, B2, "M")    → 相差月數
=DATEDIF(A2, B2, "Y")    → 相差年數

EOMONTH — 月底日期
=EOMONTH(A2, 0)          → 當月最後一天
=EOMONTH(A2, -1)         → 上月最後一天

WEEKDAY — 星期幾
=WEEKDAY(A2, 2)          → 1=Mon, 7=Sun

NETWORKDAYS — 工作天數
=NETWORKDAYS(A2, B2)     → 兩日期間的工作天數
\`\`\`

### 統計函數

\`\`\`
RANK — 排名
=RANK(A2, A:A, 0)        → 由大到小排名

PERCENTILE — 百分位數
=PERCENTILE(A:A, 0.9)    → P90

STDEV — 標準差
=STDEV(A:A)              → 樣本標準差

LARGE / SMALL — 第 N 大/小
=LARGE(A:A, 3)           → 第 3 大的值
\`\`\`

---

## 30-4：資料清理技巧

### 常見髒資料問題

| 問題 | 範例 | 解決方式 |
|------|------|---------|
| 多餘空白 | " 台北 " | TRIM() |
| 大小寫不一致 | "taipei" vs "Taipei" | UPPER/LOWER/PROPER |
| 日期格式不一 | "2026/3/1" vs "03-01-2026" | TEXT() 或格式設定 |
| 重複資料 | 同一筆訂單出現兩次 | Remove Duplicates |
| 空值 | 缺少地區欄位 | Filter → Blanks → 補值 |
| 異常值 | 金額 = -999 | 條件格式 + Filter |
| 合併儲存格 | 地區跨三列合併 | 取消合併 + 填充 |

### 資料清理流程

\`\`\`
Step 1: 備份原始資料（永遠先備份！）

Step 2: 檢查資料品質
- 總筆數：COUNTA()
- 空值數：COUNTBLANK()
- 重複數：COUNTIF() > 1
- 最大最小值：MAX(), MIN()

Step 3: 標準化
- 去空白：TRIM()
- 統一大小寫：PROPER()
- 統一日期格式：TEXT()

Step 4: 處理缺失值
- 刪除（資料充足時）
- 補中位數（數值型）
- 補眾數（類別型）
- 標記為 Unknown

Step 5: 去重
- Data → Remove Duplicates
- 或用 COUNTIF 標記後手動處理

Step 6: 驗證
- 抽樣檢查
- 交叉比對原始資料
- 彙總數字是否合理
\`\`\`

### 實用清理公式

\`\`\`
去除所有空白（包含全形空白）:
=SUBSTITUTE(SUBSTITUTE(TRIM(A2), CHAR(160), ""), "　", "")

提取數字:
=SUMPRODUCT(MID(0&A2, LARGE(INDEX(ISNUMBER(--MID(A2,
ROW($1:$99), 1))*ROW($1:$99), 0), ROW($1:$99))+1, 1)*10^
ROW($1:$99)/10)

簡單版（只取前面的數字）:
=LEFT(A2, MIN(FIND({0,1,2,3,4,5,6,7,8,9}, A2&"0123456789"))-1+
LEN(A2)-LEN(SUBSTITUTE(A2, " ", "")))

統一電話格式:
=TEXT(SUBSTITUTE(SUBSTITUTE(A2, "-", ""), " ", ""), "0000-000-000")
\`\`\`

### 條件格式標記異常

\`\`\`
1. 選取資料範圍
2. Home → Conditional Formatting → New Rule
3. 常用規則：
   - 空值標黃色
   - 負數標紅色
   - 重複值標橘色
   - 超過 3 個標準差標紅色（異常值）
\`\`\`

---

## 30-5：Scenario Analysis 情境分析

### 什麼是 Scenario Analysis？

\`\`\`
用 Excel 建立模型，測試不同假設下的結果。
BA 常用於：
- 專案投資評估
- 價格策略分析
- 風險評估
- 預算規劃
\`\`\`

### 方法一：Data Table（模擬分析表）

\`\`\`
情境：分析不同定價和銷量組合下的營收

基礎模型：
單價 = $100（Cell B1）
銷量 = 1,000（Cell B2）
營收 = 單價 × 銷量 = $100,000（Cell B3, =B1*B2）

Data Table 設定：
     |  $80   | $100  | $120  | $150
-----+--------+-------+-------+------
 800 | 64,000 |80,000 |96,000 |120,000
1000 | 80,000 |100,000|120,000|150,000
1200 | 96,000 |120,000|144,000|180,000
1500 |120,000 |150,000|180,000|225,000

操作：Data → What-If Analysis → Data Table
Row Input = B1（單價）
Column Input = B2（銷量）
\`\`\`

### 方法二：Scenario Manager

\`\`\`
情境設定：

Best Case（樂觀）:
- 成長率 = 20%
- 客戶流失率 = 2%
- 客單價 = $1,200

Base Case（基準）:
- 成長率 = 10%
- 客戶流失率 = 5%
- 客單價 = $1,000

Worst Case（悲觀）:
- 成長率 = 3%
- 客戶流失率 = 10%
- 客單價 = $800

操作：Data → What-If Analysis → Scenario Manager → Add
\`\`\`

### 方法三：Goal Seek（目標搜尋）

\`\`\`
問題：需要多少銷量才能達到 $500K 營收？

設定：
Set Cell = 營收（B3）
To Value = 500,000
By Changing Cell = 銷量（B2）

操作：Data → What-If Analysis → Goal Seek
結果：銷量需要 5,000 單
\`\`\`

### 敏感度分析（Sensitivity Analysis）

\`\`\`
測試每個變數變化 ±10%、±20% 對結果的影響：

| 變數 | -20% | -10% | Base | +10% | +20% | 敏感度 |
|------|------|------|------|------|------|--------|
| 單價 | $80K | $90K |$100K |$110K |$120K | 高 |
| 銷量 | $80K | $90K |$100K |$110K |$120K | 高 |
| 成本 | $120K| $110K|$100K | $90K | $80K | 中 |
| 折扣率| $105K| $102K|$100K | $98K | $95K | 低 |

→ 單價和銷量對營收的敏感度最高
→ 折扣率影響較小
\`\`\`

### 面試實戰：ROI 計算

\`\`\`
專案投資評估模型：

投入成本：
- 系統開發：$500K
- 年度維運：$100K
- 培訓：$50K
- 總投入（3年）：$500K + $100K × 3 + $50K = $850K

預期效益：
- 年省人力成本：$200K
- 年增營收貢獻：$150K
- 年度總效益：$350K

ROI 計算：
=（3年總效益 - 3年總成本）/ 3年總成本
= ($350K × 3 - $850K) / $850K
= $200K / $850K
= 23.5%

回收期：
= 總投入 / 年度效益
= $850K / $350K
= 2.43 年
\`\`\`

---

## 30-6：完整分析案例

### 案例：電商月度業績分析

#### 任務描述

\`\`\`
你收到一份電商平台的月度銷售資料（5,000 筆訂單），
需要在明天的管理會議上報告以下分析結果：
1. 各品類營收與佔比
2. Top 10 暢銷商品
3. 各通路轉換率比較
4. 客戶 RFM 分群
5. 下月營收預測
\`\`\`

#### Step 1：資料清理

\`\`\`
檢查項目：
☐ 總筆數是否正確（5,000）
☐ 是否有重複訂單（用訂單 ID 的 COUNTIF > 1 檢查）
☐ 日期範圍是否正確（當月 1 日 ~ 月底）
☐ 金額是否有負值或異常值
☐ 地區/品類欄位是否有空值
☐ 資料類型是否正確（金額是數字非文字）
\`\`\`

#### Step 2：Pivot Table 分析

\`\`\`
分析一：各品類營收
Rows: 品類
Values: Sum of 金額, Count of 訂單ID
Show Values As: % of Grand Total

結果：
| 品類 | 營收 | 佔比 | 訂單數 | 客單價 |
|------|------|------|--------|--------|
| 3C 電子 | $2.1M | 35% | 800 | $2,625 |
| 服飾 | $1.5M | 25% | 1,500 | $1,000 |
| 食品 | $1.2M | 20% | 1,800 | $667 |
| 家居 | $0.8M | 13% | 600 | $1,333 |
| 其他 | $0.4M | 7% | 300 | $1,333 |
\`\`\`

#### Step 3：RFM 分析

\`\`\`
計算 RFM 分數：

R（Recency）= TODAY() - 最後購買日期
  → 分 5 級：1-7天=5, 8-14=4, 15-30=3, 31-60=2, >60=1

F（Frequency）= 購買次數
  → 分 5 級：>10=5, 7-10=4, 4-6=3, 2-3=2, 1=1

M（Monetary）= 消費金額
  → 分 5 級：用 PERCENTILE 分 5 等份

RFM 分群：
| RFM 分數 | 客群名稱 | 人數 | 策略 |
|----------|---------|------|------|
| 5-5-5 | Champions | 120 | 獨家優惠、VIP 待遇 |
| 4-4-4 ~ 5-5-4 | Loyal | 350 | 升等獎勵、早鳥 |
| 3-3-3 ~ 4-4-3 | Potential | 580 | 促銷推播、交叉銷售 |
| 2-2-2 ~ 3-3-2 | At Risk | 420 | 挽回優惠、問卷調查 |
| 1-1-1 ~ 2-2-1 | Lost | 280 | 大額折扣或放棄 |
\`\`\`

#### Step 4：Dashboard 呈現

\`\`\`
頁面一：Overview
- 本月營收 vs 上月（Card + 趨勢箭頭）
- 訂單數 vs 上月
- 客單價 vs 上月
- 日營收趨勢圖（Line Chart）

頁面二：品類分析
- 品類營收佔比（Pie Chart）
- 品類月度趨勢（Stacked Bar）
- Top 10 商品（Horizontal Bar）

頁面三：客戶分析
- RFM 分群佔比（Donut Chart）
- 新客 vs 舊客營收佔比
- 客戶地區分佈（Map/Bar）
\`\`\`

---

## Cheat Sheet：Excel 分析速查表

### 必背快捷鍵

| 快捷鍵 | 功能 |
|--------|------|
| Ctrl+T | 建立表格（Table） |
| Alt+N+V | 插入 Pivot Table |
| Ctrl+Shift+L | 加入篩選 |
| F4 | 切換絕對/相對參照 |
| Ctrl+; | 插入今天日期 |
| Ctrl+Shift+1 | 數字格式（千分位） |
| Alt+= | 自動 SUM |
| Ctrl+D | 向下填充 |

### 公式速查

\`\`\`
查找：VLOOKUP → INDEX-MATCH → XLOOKUP
條件統計：COUNTIFS, SUMIFS, AVERAGEIFS
文字：LEFT, RIGHT, MID, TRIM, TEXT
邏輯：IF, IFS, IFERROR, AND, OR
日期：TODAY, DATEDIF, EOMONTH, NETWORKDAYS
統計：RANK, PERCENTILE, STDEV
\`\`\`

### 面試常見 Excel 問題

| 問題 | 回答重點 |
|------|---------|
| VLOOKUP vs INDEX-MATCH？ | INDEX-MATCH 更靈活，可向左查找 |
| 如何處理大量資料？ | Pivot Table + Filter + 結構化表格 |
| 如何做 Scenario Analysis？ | Data Table / Scenario Manager / Goal Seek |
| 如何清理資料？ | TRIM + 去重 + 條件格式標記 + 驗證 |
| 如何呈現分析結果？ | Pivot Chart + Dashboard + Executive Summary |
`;

export default world30;
