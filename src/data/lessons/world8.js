const world8 = `
# World 8：Recommendation & Mock Interview

> 把前面學到的所有技能串在一起，用完整的框架回答面試 Case Study。這是你的畢業考。

面試 Case Study 最大的挑戰不是「你不會」，而是「你不知道從哪裡開始」。
本章給你一個萬用框架和六種經典題型，練到能自然流暢地回答。

---

## Case Answer Framework

面試 Case Study 的萬用回答框架：

### Goal → Metrics → Flow → Segment → Recommend → Validate

| 步驟 | 做什麼 | 範例 |
|------|--------|------|
| **Goal** | 確認問題和目標 | 「讓我確認一下，我們的目標是找出 GMV 下降的原因？」 |
| **Metrics** | 定義和拆解指標 | 「GMV = Orders × AOV，我會先看哪個因素影響更大」 |
| **Flow** | 畫出流程/漏斗 | 「我會看從流量 → 瀏覽 → 加購 → 結帳每一步的轉換率」 |
| **Segment** | 按維度切分看 | 「我會按通路、用戶群、品類分別看，找到問題集中在哪裡」 |
| **Recommend** | 提出建議 | 「基於分析，我建議優先改善 X，預期可以提升 Y%」 |
| **Validate** | 說明驗證方式 | 「我會用 A/B test 驗證這個建議的效果」 |

---

## 8-1：KPI 掉了怎麼查

這是面試最高頻的題型。面試官會說：「某指標掉了 X%，你怎麼查？」

### 回答結構

1. **確認問題**：掉了多少？什麼時候開始？跟歷史比怎樣？
2. **拆解指標**：把大指標拆成子指標（如 Revenue = Users × ARPU）
3. **Trend 分析**：是突然還是逐漸？有沒有季節性？
4. **Segmentation**：按不同維度切開看，問題集中在哪裡？
5. **Root Cause**：列假設，用數據逐一排除
6. **建議行動**：針對根因提出改善方案

### 面試技巧

- 不要一開始就猜原因。先用數據縮小範圍。
- 先排除外部因素（季節性、市場變化、競爭對手）
- 用 MECE 列假設：分子問題 vs 分母問題

---

## 8-2：Feature 成功嗎

面試官會問：「這個功能上線了，怎麼判斷成功？」

### 回答結構

1. **回到目標**：這個功能要解決什麼問題？
2. **定義成功**：Primary metric 是什麼？Guardrail 是什麼？
3. **Adoption 分析**：多少人用了？（Discoverability → Usability → Value）
4. **Impact 分析**：對核心指標的影響？
5. **Trade-offs**：有沒有副作用？有沒有 cannibalization？
6. **建議**：繼續投資 / 調整方向 / 停止

### 面試技巧

- 不要只看 usage。Usage ≠ Value。
- 注意 selection bias：用了功能的人表現好，可能不是功能的功勞。
- 考慮 short-term vs long-term 的 trade-off。

---

## 8-3：流程怎麼改

面試官會給你一個效率低下的流程，問你怎麼改善。

### 回答結構

1. **Process Mapping**：畫出現有流程的每一步
2. **量化時間**：每一步的 processing time 和 wait time
3. **找 Bottleneck**：wait time 最長的那一步
4. **改善方案**：
   - 移除不必要的步驟
   - 序列化 → 平行化
   - 手動 → 自動化
   - 集中 → 分散
5. **權限和 Audit**：改善後的安全性考量
6. **例外處理**：非 happy path 的處理方式

### 面試技巧

- 不要急著建議「全部自動化」。先分析哪些適合。
- 記得量化改善預期（從 X 天縮短到 Y 天）
- 考慮改變的成本和風險

---

## 8-4：Dashboard 設計

面試官會問：「幫我設計一個 dashboard。」

### 回答結構

1. **確認 Audience**：誰要看？CEO vs PM vs Ops？
2. **確認 Key Questions**：他們看 dashboard 要回答什麼問題？
3. **選指標**：覆蓋 Revenue / Growth / Retention / Efficiency
4. **設計層次**：
   - 第一層：3-5 個核心數字 + 趨勢
   - 第二層：趨勢圖
   - 第三層：可下鑽到 segment
5. **Action Triggers**：什麼數字代表要採取行動？

### 面試技巧

- 不要堆太多指標。Less is more。
- 根據 audience 選指標（CEO 看戰略，PM 看產品，Ops 看效率）
- 每個指標都要有「所以呢？」的 actionability

---

## 8-5：User Segmentation

面試官會問：「怎麼做用戶分群？」

### 回答結構

1. **確認目的**：分群是為了做什麼？（個人化推薦？行銷？定價？）
2. **選維度**：
   - 行為維度（使用頻率、深度、feature 偏好）
   - 價值維度（LTV、付費狀態）
   - 來源維度（acquisition channel）
3. **描述每個群體**：用 persona 描述（名字 + 行為特徵 + 需求）
4. **設計策略**：每個群體的差異化策略
5. **驗證效果**：分群策略是否比統一策略好？

### 面試技巧

- 行為分群 > 人口統計分群（年齡性別不一定有區分度）
- 每個群體要有 actionable 的策略，不是分完就結束
- 分群數量不要太多（3-5 個最實用）

---

## 8-6：Boss — 完整模擬面試

最終 Boss 是一個完整的模擬面試 Case Study，需要你把前面所有技能串在一起：

1. **問題拆解**（World 1）— 搞清楚問題是什麼
2. **指標定義**（World 2）— 用什麼衡量
3. **數據分析**（World 3）— 用什麼方法分析
4. **資料素養**（World 4）— 需要什麼數據、怎麼查
5. **產品思維**（World 5）— 從用戶和產品角度看
6. **流程分析**（World 6）— 流程的瓶頸和改善
7. **實驗驗證**（World 7）— 怎麼驗證你的建議

能流暢地走完這個框架，你的面試就準備好了。

---

## 面試最後的提醒

### Do's ✓

- 先確認問題再分析（不要急著答）
- 用結構化的框架回答（Goal → Metrics → Flow → Segment → Recommend → Validate）
- 主動說出你的假設和驗證方式
- 考慮多方利益相關者（不只看一個角度）
- 誠實說「這個我不確定，但我會這樣查」

### Don'ts ✗

- 不要一開始就猜原因
- 不要只看單一指標
- 不要忽略 guardrail metrics
- 不要把 correlation 當 causation
- 不要提改善方案卻不說怎麼驗證

---

## 本章重點回顧

| 題型 | 框架 | 面試黃金句型 |
|------|------|-------------|
| KPI 掉了 | 確認 → 拆解 → Trend → Segment → Root Cause | 「我會先拆解指標，再按 segment 找出問題集中在哪裡」|
| Feature 評估 | 目標 → Metrics → Adoption → Impact → Trade-offs | 「先定義成功再看數據，同時注意 guardrail」|
| 流程改善 | Map → Quantify → Bottleneck → Automate → Exception | 「先量化每步時間，找到 wait time 最長的環節」|
| Dashboard | Audience → Questions → Metrics → Layers → Actions | 「根據 audience 的核心問題選指標，不超過 5 個」|
| 分群 | 目的 → 維度 → Persona → 策略 → 驗證 | 「行為分群比人口統計更有區分度」|
| 模擬面試 | Goal → Metrics → Flow → Segment → Recommend → Validate | 「讓我用 Case Answer Framework 來回答」|
`
export default world8
