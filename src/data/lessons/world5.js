const world5 = `
# World 5：Product Thinking

> 學會用產品經理的視角思考問題。面試中最常考的不是技術，而是你能不能站在使用者和商業的角度分析。

Product Thinking 是把「使用者需求」和「商業目標」連接起來的能力。
不管你面試的是 Product Analyst、Business Analyst 還是 PM，這些概念都是必備的。

---

## 5-1：User Journey Mapping（使用者旅程圖）

### 什麼是 User Journey？

User Journey 是使用者從「第一次接觸產品」到「達成目標」的完整路徑。

### 為什麼面試要考這個？

因為很多問題的根因藏在使用者旅程的某一步裡。
畫出 journey，你才知道問題出在哪。

### 怎麼畫 User Journey

一個好的 User Journey 包含：

1. **Stages（階段）**：使用者經歷的主要階段
2. **Actions（行為）**：每個階段使用者做了什麼
3. **Touchpoints（接觸點）**：使用者在哪裡跟產品互動
4. **Pain Points（痛點）**：使用者在哪裡感到挫折
5. **Emotions（情緒）**：使用者的情緒起伏

### 範例：SaaS 產品的 User Journey

| 階段 | 行為 | 接觸點 | 痛點 |
|------|------|--------|------|
| Awareness | Google 搜尋解決方案 | 搜尋結果、Blog | 不知道有這個產品 |
| Consideration | 比較不同產品 | Landing page、Reviews | 不確定是否適合 |
| Trial | 註冊免費試用 | 註冊頁、Onboarding | 設定太複雜 |
| Activation | 完成第一個核心動作 | 產品內引導 | 不知道下一步做什麼 |
| Retention | 持續使用 | Email、通知 | 找不到進階功能 |
| Expansion | 升級付費方案 | Pricing page | 價格不透明 |

### 面試中怎麼用

面試官問：「用戶 activation 率下降了，你怎麼分析？」

> 「我會先畫出從註冊到 activation 的 user journey，列出每一步的行為和可能的痛點。然後用 funnel 數據看哪一步的 drop-off 最大，再按 user segment 切開看是哪群用戶卡住了。」

### 常見錯誤

- 只看「開心路徑」（happy path），忽略了使用者卡住的情境
- 假設所有用戶的 journey 一樣（不同 segment 的旅程可能很不同）
- 只看產品內的旅程，忽略產品外的體驗（客服、email、口碑）

---

## 5-2：Feature 成功評估

### 新功能上線後怎麼判斷成不成功？

這是面試超高頻題型。面試官想看你能不能**事前定義成功**，而不是事後找數字合理化。

### 評估框架：Before → During → After

**Before（上線前）**：
- 這個功能要解決什麼問題？
- 成功的定義是什麼？（具體指標 + 目標值）
- Guardrail metrics 是什麼？（不能變差的指標）

**During（上線中）**：
- 功能的 adoption rate 如何？
- 有沒有技術問題（crash、loading time）？
- 用戶回饋如何？

**After（上線後）**：
- Primary metric 有達標嗎？
- Guardrail metrics 有沒有受影響？
- 不同 segment 的反應有差異嗎？

### 常見的 Feature Metrics

| 指標 | 衡量什麼 | 範例 |
|------|----------|------|
| Adoption Rate | 多少人用了 | 30% 的 DAU 用了新搜尋 |
| Usage Frequency | 用的人多常用 | 平均每週用 3 次 |
| Task Completion Rate | 能不能完成任務 | 85% 的搜尋有點擊結果 |
| Time-to-value | 多快得到價值 | 平均 2 分鐘完成搜尋 |
| Retention Impact | 對留存的影響 | 使用者 D7 retention +5pp |

### 面試黃金句型

> 「在評估之前，我會先回到這個功能的初衷 — 它要解決什麼問題？然後定義 primary metric 和 guardrail，再看數據。」

---

## 5-3：Adoption 問題診斷

### 為什麼沒人用你的功能？

一個功能 adoption 低，原因通常在三個層面之一。

### Discoverability → Usability → Value 三層模型

1. **Discoverability（發現性）**：用戶知道這個功能存在嗎？
   - 入口在哪？容易找到嗎？
   - 有沒有引導或通知告訴用戶？
   - 分析方法：看功能入口的曝光次數和點擊率

2. **Usability（易用性）**：用戶嘗試了，但能順利用完嗎？
   - 操作流程順暢嗎？有沒有卡住？
   - 錯誤訊息清楚嗎？
   - 分析方法：看 funnel completion rate 和 error rate

3. **Value（價值）**：用完了，但覺得沒有用？
   - 功能解決了用戶的問題嗎？
   - 用戶用完後有得到他想要的結果嗎？
   - 分析方法：看 repeat usage（會再用第二次嗎？）

### 怎麼判斷問題在哪一層

| 現象 | 最可能的問題層 |
|------|---------------|
| 很少人點進功能 | Discoverability |
| 很多人點了但沒完成 | Usability |
| 完成了但沒有再用 | Value |
| 用了一次就離開產品 | 可能是 Value，也可能傷害了整體體驗 |

### 面試中怎麼回答

面試官問：「我們新做了一個推薦功能，但只有 5% 的用戶在用，你怎麼分析？」

> 「5% 的 adoption 可能是三個層面的問題。我會先看 discoverability — 推薦功能的入口有被多少人看到？點擊率是多少？如果曝光很高但點擊很低，可能是入口設計的問題。如果點擊了但沒完成操作，是 usability 問題。如果完成了但沒再用，是 value 問題。」

---

## 5-4：Usage vs Value

### 使用率高不等於有價值

這是很多人的盲點。

範例：
- 一個「搜尋」功能被大量使用，但用戶平均要搜 5 次才能找到想要的結果 → 高 usage，低 value
- 一個「自動備份」功能很少被主動使用，但有它用戶就不會因為資料遺失而離開 → 低 usage，高 value

### 怎麼衡量 Value？

| 方法 | 適用場景 | 範例 |
|------|----------|------|
| Outcome-based | 功能是否達成目標 | 搜尋後有點擊結果嗎？ |
| Comparative | 有用 vs 沒用的差異 | 用了功能的用戶 retention 更高嗎？ |
| Counterfactual | 沒有這個功能會怎樣 | 移除功能後指標有變嗎？ |
| Survey | 直接問用戶 | NPS、CSAT 分數 |

### 面試技巧

當面試官用「使用率」來衡量功能成功時，你可以補充：

> 「使用率是一個起點，但我更關注的是 value — 使用了這個功能的用戶，他們的目標行為有改善嗎？比如說，用了搜尋的人有沒有更容易找到商品並完成購買？」

### 常見的 Usage 陷阱

- **Forced usage**：功能在主流程上，不得不用（usage 高但可能 value 低）
- **Novelty effect**：剛上線大家好奇用，兩週後就不用了
- **Power user bias**：少數重度用戶貢獻大部分 usage，整體用戶並不在乎

---

## 5-5：Discoverability vs Usability vs Value

### 三層模型的完整應用

這個模型不只適用於單一功能，也適用於整個產品的分析。

### 每一層的分析工具

**Discoverability 分析：**
- 曝光率（impression）和點擊率（CTR）
- 用戶訪談：「你知道有這個功能嗎？」
- Heatmap：用戶在頁面上看了哪裡
- A/B test：不同入口位置的比較

**Usability 分析：**
- Task completion rate
- Error rate 和 error types
- Time-on-task（完成一個任務要花多久）
- Funnel drop-off（每一步的流失）
- 用戶測試（看用戶操作的錄影）

**Value 分析：**
- Repeat usage rate（會再用第二次嗎？）
- Impact on downstream metrics（對後續行為的影響）
- User satisfaction（NPS、CSAT）
- Churn correlation（不用這個功能的人比較容易流失嗎？）

### 面試完整回答範例

問題：「我們的報表功能上線三個月了，但大部分用戶還是在用 Excel。你怎麼分析？」

> 「我會用三層模型來分析：
>
> 首先 Discoverability：用戶知道報表功能存在嗎？我會看功能入口的曝光數和點擊率。如果很多人看到但沒點，可能是入口的 messaging 不清楚。
>
> 其次 Usability：點進來的人能順利做出報表嗎？我會看 funnel — 從開始建立到完成輸出每一步的 drop-off。
>
> 最後 Value：做出來的報表有滿足需求嗎？我會比較用報表功能的人和用 Excel 的人，前者的工作效率有更好嗎？也可以做 user interview 了解他們為什麼還是選 Excel。
>
> 根據問題在哪一層，解法會完全不同。」

---

## 5-6：Boss — 產品分析 Case

Boss 關卡會給你一個完整的產品分析情境：

1. 用 **User Journey** 畫出使用者旅程
2. 定義功能的 **Success Metrics**
3. 用 **Discoverability / Usability / Value** 診斷問題
4. 區分 **Usage vs Value**
5. 提出 **改善建議** 並排優先級

這就是面試中 Product Analyst 的核心考題。能流暢回答這類問題，面試就成功一半了。

---

## 本章重點回顧

| 技能 | 核心概念 | 面試黃金句型 |
|------|----------|-------------|
| User Journey | 畫出完整旅程找痛點 | 「我會先畫出 user journey 找痛點」|
| Feature 評估 | Before / During / After | 「先定義成功再看數據」|
| Adoption 診斷 | 三層問題模型 | 「是 discoverability、usability 還是 value 的問題？」|
| Usage vs Value | 使用率不等於價值 | 「我更關注 outcome 而不只是 usage」|
| 完整分析 | 三層模型串接 | 「根據問題在哪一層，解法完全不同」|
`
export default world5
