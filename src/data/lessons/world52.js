const world52 = `
# World 52：專業閱讀

> 職場上大量資訊都是英文的——JD、README、PRD、報告。讀不懂就會錯過關鍵資訊，甚至做出錯誤判斷。
> 這一章教你如何**快速抓重點**，而不是逐字翻譯。

專業閱讀不是考英文，是考你能不能從一堆文字中**提取行動資訊**。
學會這些閱讀技巧，你在求職、工作中都會比別人快一步。

---

## 52-1：Job Description 閱讀

### 為什麼要會讀 JD？

JD 不只是職缺說明，它是你準備面試的**作弊小抄**。讀懂 JD，你就知道面試官會問什麼、公司在找什麼特質的人。

### JD 結構拆解

一份典型的 JD 長這樣：

\`\`\`
[Job Title] — 職稱，注意 level（Junior / Senior / Lead）
[About the Team] — 了解團隊做什麼、規模多大
[Responsibilities] — 你要做的事（面試會圍繞這些問）
[Requirements] — 必備條件（Must-have）
[Nice-to-haves] — 加分條件（有最好，沒有也行）
[Benefits] — 福利（通常不影響你投不投）
\`\`\`

### 企業語言解碼

JD 裡有很多「暗語」，學會解碼很重要：

| JD 寫的 | 真正的意思 |
|---------|-----------|
| Fast-paced environment | 事情很多、變化很快，要能扛壓 |
| Wear many hats | 人少事多，什麼都要做一點 |
| Self-starter | 不會有人手把手教你 |
| Cross-functional collaboration | 要跟很多部門溝通，溝通能力很重要 |
| Data-driven | 決策要有數據佐證，不能只靠直覺 |
| Ambiguity | 需求常常不明確，你要自己搞清楚 |

### 實用閱讀範例

\`\`\`
Requirements:
- 3+ years of experience in product analytics
  → 「3+」是門檻，但如果你有 2 年 + 強作品集，還是可以投
- Proficiency in SQL and at least one scripting language
  → SQL 是必備，Python 或 R 至少會一個
- Experience with A/B testing frameworks
  → 面試一定會問 A/B test 相關問題

Nice to have:
- Experience with Looker or Tableau
  → 不會也沒關係，但會的話在面試中提到會加分
- Familiarity with machine learning concepts
  → 不需要你會寫 ML model，但要懂基本概念
\`\`\`

### 常見錯誤

- **看到 Requirements 全符合才敢投**：其實符合 60-70% 就可以投了
- **忽略 Nice-to-haves**：這些是面試加分題的線索
- **不看 About the Team**：這段告訴你團隊文化和工作重點

---

## 52-2：README / 技術文件

### README 為什麼重要？

不管你是 PM、BA 還是工程師，看 README 是日常。一個新工具、一個 open source project、一個內部服務——第一步都是讀 README。

### README 標準結構

\`\`\`
# Project Name          ← 專案名稱
## Overview / About     ← 這個專案是做什麼的（最重要！）
## Getting Started      ← 如何安裝和啟動
  ### Prerequisites     ← 需要先裝什麼
  ### Installation      ← 安裝步驟
## Usage                ← 怎麼用（通常有範例 code）
## API Reference        ← API 文件（如果有）
## Contributing         ← 如何貢獻（open source 才有）
## License              ← 授權方式
\`\`\`

### 關鍵詞彙速查

| 英文 | 意思 | 你要注意的 |
|------|------|-----------|
| Prerequisites | 前置需求 | 先裝好這些才能繼續 |
| Dependencies | 相依套件 | 缺了會跑不起來 |
| Breaking changes | 不相容的更新 | 升版前一定要看 |
| Deprecated | 即將淘汰 | 還能用但不建議，遲早會移除 |
| Migration guide | 升版指南 | 告訴你舊版怎麼轉新版 |
| Environment variables | 環境變數 | 設定敏感資訊（API key 等） |

### 實用閱讀範例

\`\`\`
## Getting Started

### Prerequisites
- Node.js >= 18.0      ← 版本有要求，不是隨便裝就好
- npm or yarn           ← 二擇一
- PostgreSQL 14+        ← 要另外裝資料庫

### Installation
$ git clone https://github.com/example/project.git
$ cd project
$ npm install           ← 裝套件
$ cp .env.example .env  ← 複製環境變數模板（重要！要自己填值）
$ npm run dev           ← 啟動開發環境
\`\`\`

### 常見錯誤

- **跳過 Prerequisites**：直接跑 install，然後一堆 error 不知道為什麼
- **不看版本號**：Node 16 跟 Node 18 可能差很多
- **忽略 .env.example**：沒設環境變數就啟動，當然會噴錯

---

## 52-3：PRD / Spec 閱讀

### 什麼是 PRD？

PRD（Product Requirements Document）是產品需求文件，定義了要做什麼、為什麼做、做到什麼程度。不管你是 PM 寫的還是 BA 讀的，都要懂這個格式。

### PRD 核心結構

\`\`\`
1. Overview         — 為什麼做這個（business context）
2. User Stories     — 從用戶角度描述需求
3. Requirements     — 功能細節
4. Priority         — P0 / P1 / P2 排序
5. Acceptance Criteria — 怎樣算「做完了」
6. Out of Scope     — 這次不做的東西（很重要！）
\`\`\`

### User Story 格式

User Story 是 PRD 的核心，格式固定：

\`\`\`
As a [角色], I want to [行為], so that [目的].

範例：
As a new user, I want to sign up with my Google account,
so that I don't have to remember another password.
\`\`\`

### 優先級怎麼讀

| 等級 | 意思 | 你的反應 |
|------|------|---------|
| P0 (Critical) | 沒有這個不能上線 | 最先做，不能妥協 |
| P1 (High) | 很重要但不是阻塞 | 盡量在這個 sprint 做完 |
| P2 (Medium) | 有就更好 | 有時間就做，可以排到下個 sprint |
| P3 (Low) | 錦上添花 | 放到 backlog，有空再說 |

### Acceptance Criteria 範例

\`\`\`
Feature: User Registration

Acceptance Criteria:
- [ ] User can sign up with email and password
- [ ] Password must be at least 8 characters
  with 1 uppercase and 1 number
- [ ] User receives a confirmation email within 2 minutes
- [ ] Duplicate email addresses show an error message
- [ ] All form fields have proper validation messages

→ 這些就是 QA 測試的依據，也是「做完了」的定義
\`\`\`

### 常見錯誤

- **只看 Requirements 不看 Out of Scope**：做了不該做的東西，浪費時間
- **不確認 Acceptance Criteria**：做完了但跟預期不符
- **忽略 Priority**：P2 的東西做了三天，P0 的還沒動

---

## 52-4：資料報告 / Dashboard

### 職場上的報告長什麼樣？

不管是週報、月報還是 dashboard，英文報告都有固定的結構和用詞。學會讀這些，你在會議中就能快速抓到重點。

### 報告常見結構

\`\`\`
1. Executive Summary   — 一段話講完重點（高管只看這段）
2. Key Metrics / KPIs  — 數字表現
3. Highlights          — 好消息
4. Areas of Concern    — 壞消息（委婉說法）
5. Root Cause Analysis — 問題原因分析
6. Recommendations     — 建議行動
\`\`\`

### 報告常見用詞解碼

| 報告寫的 | 真正的意思 |
|---------|-----------|
| Showed modest growth | 成長很少 |
| Underperformed expectations | 沒達標 |
| Remains flat | 沒成長 |
| Experienced headwinds | 遇到困難 |
| Opportunities for improvement | 表現不好（委婉說法） |
| Trending upward / downward | 有上升/下降趨勢 |

### KPI 報告閱讀範例

\`\`\`
Q4 Performance Summary

Revenue: $2.4M (↑12% QoQ)
  → QoQ = Quarter over Quarter，跟上一季比
  → 12% 成長算健康

DAU: 45K (↓8% MoM)
  → MoM = Month over Month，跟上個月比
  → DAU 在掉，需要關注

Churn Rate: 5.2% (↑0.8pp)
  → pp = percentage points，百分點
  → Churn 上升不是好事

NPS: 42 (flat)
  → flat = 沒變化
  → NPS 42 算中等偏上
\`\`\`

### Root Cause Analysis 怎麼讀

\`\`\`
Root Cause Analysis: DAU Decline

Investigation revealed that the decline was primarily driven by:
1. A 15% increase in app load time after the v3.2 release
   → 技術問題導致體驗變差
2. Seasonal patterns consistent with previous years
   → 季節性因素，不完全是我們的問題
3. Increased competition from Product X's new feature launch
   → 競品推了新功能搶走用戶

Recommended Actions:
- Immediate: Rollback performance regression in v3.2.1
- Short-term: Implement caching layer for top 10 API endpoints
- Long-term: Develop competitive feature parity roadmap
\`\`\`

### 常見錯誤

- **只看數字不看趨勢**：單一數字沒意義，要看 QoQ / MoM / YoY 的變化
- **不懂委婉語**："Areas of concern" 就是出問題了，不是小事
- **混淆 percentage 和 percentage points**：從 5% 漲到 6% 是漲了 1pp，不是漲了 1%

---

## 52-5（Boss）：閱讀理解綜合

### Boss 關卡：綜合閱讀挑戰

這一關考的不是翻譯能力，而是你能不能從英文文件中**快速提取行動資訊**。

### 閱讀策略總整理

| 文件類型 | 先看哪裡 | 要抓什麼 |
|---------|---------|---------|
| JD | Requirements + Responsibilities | 面試準備方向 |
| README | Overview + Getting Started | 怎麼跑起來 |
| PRD | User Stories + Acceptance Criteria | 要做什麼、做到什麼程度 |
| 報告 | Executive Summary + KPIs | 數字表現和行動建議 |

### 速讀技巧

\`\`\`
1. Skim First（先掃過）
   → 看標題、粗體、數字，30 秒內掌握大意

2. Identify Action Items（找行動項目）
   → 哪些跟你有關？你需要做什麼？

3. Note Unknown Terms（記下不懂的詞）
   → 不用每個字都查，但關鍵術語要搞懂

4. Summarize in One Sentence（用一句話總結）
   → 如果你不能用一句話說出重點，代表你還沒真的讀懂
\`\`\`

### 綜合練習

> **練習一：讀這段 JD，回答三個問題**
> "We're looking for a data-savvy Product Analyst who thrives in ambiguity
> and can drive insights from complex datasets. You'll partner with
> cross-functional teams to define metrics, run experiments, and inform
> product strategy. Experience with SQL is required; Python is a plus."
>
> 1. 這個職位最重要的硬技能是什麼？
> 2. "thrives in ambiguity" 暗示什麼？
> 3. 面試可能會問你什麼類型的問題？

> **練習二：讀這段報告，找出關鍵行動**
> "Weekly active users declined 12% WoW, primarily due to a login bug
> introduced in v2.5. The engineering team has identified the root cause
> and a hotfix is expected by EOD Friday. Marketing recommends pausing
> the ongoing campaign until the fix is deployed."
>
> 1. 最緊急的行動是什麼？
> 2. 誰要負責什麼？
> 3. 哪個決定需要等？

### 建立你的術語庫

養成習慣：每次讀英文文件，把新學到的術語記到自己的術語庫。

\`\`\`
格式建議：
| 術語 | 縮寫 | 意思 | 在哪裡看到的 |
|------|------|------|-------------|
| Quarter over Quarter | QoQ | 季度環比 | Q4 報告 |
| End of Day | EOD | 今天結束前 | Slack 訊息 |
| Out of Scope | OOS | 不在範圍內 | PRD 文件 |
\`\`\`

持續累積，三個月後你就會發現——英文文件再也不可怕了。
`;

export default world52;
