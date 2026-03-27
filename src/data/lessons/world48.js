const world48 = `
# World 48：專案介紹英文

> **目標：** 學會用流暢的英文介紹你做過的專案，從 Overview 到技術細節到成果，完整且專業
> **適用場景：** 技術面試、Portfolio 簡報、LinkedIn 專案描述
> **預估學習時間：** 3-4 小時

---

## 48-1：Project Overview 句型

### 為什麼專案介紹的開頭最重要？

面試官每天聽十幾個人介紹專案，你只有 30 秒抓住他的注意力。一個好的 Project Overview 要在三句話內讓對方知道：**你做了什麼、為什麼做、結果如何**。

### 核心句型

**1. 說明專案目標**

| 句型 | 中文意思 | 使用時機 |
|------|----------|----------|
| The goal of this project is to... | 這個專案的目標是⋯ | 介紹專案目的 |
| This project aims to address... | 這個專案旨在解決⋯ | 強調問題導向 |
| We set out to solve the problem of... | 我們著手解決⋯的問題 | 敘事感更強 |

**2. 描述做了什麼**

| 句型 | 中文意思 | 使用時機 |
|------|----------|----------|
| We developed a system that... | 我們開發了一個⋯的系統 | 描述產出 |
| I built a data pipeline to... | 我建了一個資料管線來⋯ | 強調個人貢獻 |
| The solution involved creating... | 解決方案包含建立⋯ | 較正式的說法 |

**3. 概述成果**

| 句型 | 中文意思 | 使用時機 |
|------|----------|----------|
| Overall, this project delivered... | 整體而言，這個專案帶來了⋯ | 總結成果 |
| As a result, we achieved... | 因此，我們達成了⋯ | 連結因果 |
| The project successfully reduced/improved... | 專案成功降低/提升了⋯ | 量化成果 |

### 常見錯誤

> ❌ **錯誤：** "This project is about doing a recommendation system."
> ✅ **正確：** "This project aims to improve user engagement by building a personalized recommendation system."

> ❌ **錯誤：** "We made a website for the company."
> ✅ **正確：** "We developed an internal dashboard that enables the operations team to monitor KPIs in real time."

中文母語者最常犯的錯：太籠統、缺乏 impact。英文專案介紹要 **specific + result-oriented**。

### 實用模板

\`\`\`
In [context/course/internship], I worked on a project that aimed to
[solve what problem]. We developed [what solution] using [key technologies].
Overall, this project delivered [quantified result], and my primary
contribution was [your specific role].
\`\`\`

### 好 vs 壞的範例

**❌ 不好的版本：**
> "My project is a chatbot. I used Python and some APIs. It works well."

**✅ 好的版本：**
> "During my internship at XYZ Corp, I developed a customer service chatbot that automated 40% of routine inquiries. The system was built with Python and integrated with the company's CRM via REST APIs. Overall, this project reduced average response time from 2 hours to under 5 minutes."

---

## 48-2：技術架構描述

### 用英文講技術，不是翻譯中文

很多同學介紹技術時會「逐字翻譯」中文思維，結果講出來的英文很卡。關鍵是用 **英文的邏輯來組織技術描述**：先講整體架構，再講每個元件的角色，最後講資料怎麼流動。

### 核心句型

**1. 描述整體架構**

| 句型 | 中文意思 |
|------|----------|
| The architecture consists of three main components:... | 架構由三個主要元件組成⋯ |
| The system follows a microservices architecture where... | 系統採用微服務架構，其中⋯ |
| At a high level, the system is divided into... | 從高層來看，系統分為⋯ |

**2. 解釋技術選擇**

| 句型 | 中文意思 |
|------|----------|
| We leveraged X for its [advantage]... | 我們採用 X 因為它的 [優勢]⋯ |
| We chose X over Y because... | 我們選 X 而非 Y 因為⋯ |
| X was selected due to its ability to... | 選用 X 是因為它能夠⋯ |

**3. 描述資料流**

| 句型 | 中文意思 |
|------|----------|
| The data flows from [source] through [process] to [destination] | 資料從 [來源] 經過 [處理] 到 [目的地] |
| First, the raw data is ingested via... | 首先，原始資料透過⋯被匯入 |
| The processed results are then stored in... | 處理完的結果接著被存入⋯ |

### 常見錯誤

> ❌ **錯誤：** "We use React because it is popular."
> ✅ **正確：** "We leveraged React for its component-based architecture, which allowed us to build reusable UI modules efficiently."

> ❌ **錯誤：** "The data goes to the database and then we show it."
> ✅ **正確：** "The data flows from the API gateway through a validation layer, is persisted in PostgreSQL, and is served to the frontend via a GraphQL endpoint."

**注意：** 用 "leverage" 而不是 "use" 會更專業，但不要每句都用 leverage，會顯得刻意。交替使用 utilize, employ, adopt, leverage。

### 實用模板

\`\`\`
The architecture consists of [N] main components: [list them].
On the backend, we leveraged [technology] for [reason].
The data flows from [source], is processed by [component],
and the results are served to [consumer] via [method].
We chose [tech A] over [tech B] because [specific reason].
\`\`\`

### 關鍵字彙

| 英文 | 中文 | 例句 |
|------|------|------|
| scalable | 可擴展的 | "a scalable data pipeline" |
| decoupled | 解耦的 | "decoupled services communicate via message queues" |
| latency | 延遲 | "reduced latency by 50ms" |
| throughput | 吞吐量 | "handles 10K requests per second throughput" |
| fault-tolerant | 容錯的 | "a fault-tolerant system with automatic failover" |

---

## 48-3：數據與成果描述

### 用數字說話——但要說對

面試官想聽到數字，但更想聽到 **數字背後的意義**。不是只說 "accuracy is 95%"，而是要說這個 95% 跟之前比怎樣、跟業界標準比怎樣。

### 核心句型

**1. 描述改善幅度**

| 句型 | 中文意思 |
|------|----------|
| This resulted in a X% improvement in... | 這帶來了 X% 的⋯提升 |
| We observed a X% reduction in... | 我們觀察到⋯降低了 X% |
| Performance improved from X to Y, representing a Z% gain | 效能從 X 提升到 Y，代表 Z% 的進步 |

**2. 列舉關鍵指標**

| 句型 | 中文意思 |
|------|----------|
| Key metrics include... | 關鍵指標包括⋯ |
| We tracked three primary KPIs:... | 我們追蹤三個主要 KPI⋯ |
| The model achieved an F1 score of X on the test set | 模型在測試集上達到 F1 score X |

**3. 強調個人貢獻**

| 句型 | 中文意思 |
|------|----------|
| My primary contribution was... | 我的主要貢獻是⋯ |
| I was specifically responsible for... | 我具體負責⋯ |
| I led the effort to... | 我主導了⋯的工作 |

### 常見錯誤

> ❌ **錯誤：** "The result is good. Accuracy is high."
> ✅ **正確：** "This resulted in a 15% improvement in prediction accuracy, raising it from 78% to 93%, which exceeded our target of 90%."

> ❌ **錯誤：** "I did the frontend and backend."
> ✅ **正確：** "My primary contribution was designing and implementing the ETL pipeline, which processed over 2 million records daily."

**小技巧：** 描述成果時用 **「比較級」** 的框架——跟之前比、跟目標比、跟業界比。這樣數字才有意義。

### 實用模板

\`\`\`
The project achieved the following results:
- [Metric 1]: improved from [before] to [after], a [X]% improvement
- [Metric 2]: reduced [what] by [X]%, saving approximately [time/cost]
- [Metric 3]: [qualitative achievement]

My primary contribution was [specific work], which directly
contributed to [which result].
\`\`\`

### 描述數據的實用字彙

| 英文 | 中文 | 常見搭配 |
|------|------|----------|
| baseline | 基準線 | "compared to the baseline" |
| benchmark | 標竿 | "outperformed the industry benchmark" |
| uplift | 提升 | "a 20% uplift in conversion" |
| yield | 產出 / 帶來 | "yielded significant cost savings" |
| outperform | 優於 | "outperformed the previous model by 12%" |

---

## 48-4：挑戰與 Trade-off

### 展現你的思考深度

面試官問 "What challenges did you face?" 不是要聽你抱怨，而是要看你 **如何分析問題、做決策、從中學習**。這是最能展現 senior thinking 的環節。

### 核心句型

**1. 描述挑戰**

| 句型 | 中文意思 |
|------|----------|
| The main challenge was... | 主要挑戰是⋯ |
| One significant obstacle we encountered was... | 我們遇到的一個重大障礙是⋯ |
| We ran into an issue where... | 我們碰到一個⋯的問題 |

**2. 描述 Trade-off**

| 句型 | 中文意思 |
|------|----------|
| The trade-off between X and Y was... | X 和 Y 之間的取捨是⋯ |
| We had to balance [A] against [B] | 我們必須在 [A] 和 [B] 之間取得平衡 |
| We prioritized X at the expense of Y because... | 我們優先選擇 X 而犧牲 Y 因為⋯ |

**3. 反思與學習**

| 句型 | 中文意思 |
|------|----------|
| Looking back, the key lesson was... | 回頭看，關鍵的學習是⋯ |
| If I were to do it again, I would... | 如果重新來過，我會⋯ |
| This experience taught me the importance of... | 這個經驗讓我學到⋯的重要性 |

### 常見錯誤

> ❌ **錯誤：** "The challenge was the data is dirty."（文法錯 + 太籠統）
> ✅ **正確：** "The main challenge was dealing with inconsistent data formats across three different source systems, which required us to build a custom validation layer."

> ❌ **錯誤：** "We chose the simple way because we don't have time."
> ✅ **正確：** "Given the two-week timeline, we prioritized a rule-based approach at the expense of model accuracy, because delivering a working MVP was more critical at that stage."

### 實用模板

\`\`\`
The main challenge was [specific problem]. We considered [option A]
and [option B]. The trade-off between them was [what you gained vs lost].
Ultimately, we chose [decision] because [reasoning].

Looking back, the key lesson was [insight]. If I were to do it again,
I would [what you'd change] to [expected benefit].
\`\`\`

### Trade-off 常見主題

| Trade-off | 英文說法 |
|-----------|----------|
| 速度 vs 品質 | "speed of delivery vs. code quality" |
| 準確度 vs 可解釋性 | "model accuracy vs. interpretability" |
| 功能 vs 時程 | "feature completeness vs. time-to-market" |
| 自建 vs 外購 | "build vs. buy" |
| 一致性 vs 可用性 | "consistency vs. availability" |

---

## 48-5（Boss）：完整專案英文簡報

### 五段式專案簡報框架

把前面學的全部串起來！一個完整的專案英文簡報，遵循 **B-R-A-R-L 框架**：

### The B-R-A-R-L Framework

| 段落 | 英文 | 中文 | 時間分配 |
|------|------|------|----------|
| 1 | **B**ackground | 背景 | 15% |
| 2 | **R**ole | 你的角色 | 10% |
| 3 | **A**pproach | 做法 | 35% |
| 4 | **R**esults | 成果 | 25% |
| 5 | **L**earnings | 學習 | 15% |

### 每段怎麼說

**Background（背景）**
\`\`\`
During [when], at [where], our team identified a problem:
[describe problem]. The business impact was [quantify].
The goal of this project was to [objective].
\`\`\`

**Role（角色）**
\`\`\`
I served as the [role] on a [size]-person team.
I was specifically responsible for [your scope].
\`\`\`

**Approach（做法）**
\`\`\`
The architecture consists of [components].
We leveraged [tech] for [reason].
The data flows from [A] through [B] to [C].
We chose [X] over [Y] because [reasoning].
\`\`\`

**Results（成果）**
\`\`\`
This resulted in a [X]% improvement in [metric].
Key metrics include [list].
My primary contribution was [specific impact].
\`\`\`

**Learnings（學習）**
\`\`\`
The main challenge was [problem].
The trade-off between [A] and [B] was [description].
Looking back, the key lesson was [insight].
\`\`\`

### 完整範例

> "During my summer internship at a fintech startup, our team identified that manual fraud detection was causing a 48-hour delay in transaction reviews. The goal of this project was to build an automated fraud detection system.
>
> I served as the data engineer on a four-person team. I was specifically responsible for building the feature engineering pipeline and the real-time scoring API.
>
> The architecture consists of three components: an ingestion layer using Kafka, a feature store built on Redis, and a scoring service deployed on AWS Lambda. We leveraged XGBoost for its balance of accuracy and inference speed.
>
> This resulted in a 92% reduction in review time and a 15% improvement in fraud detection accuracy. My primary contribution — the real-time feature pipeline — enabled sub-200ms scoring latency.
>
> The main challenge was handling data skew, since only 0.3% of transactions were fraudulent. Looking back, the key lesson was that feature engineering matters more than model selection — our biggest accuracy gain came from adding velocity-based features, not from tuning the model."

### 簡報時的 Do's and Don'ts

| ✅ Do | ❌ Don't |
|-------|---------|
| 用具體數字 | 說 "it works well" |
| 主動描述你的貢獻 | 只說 "we" 不說 "I" |
| 解釋技術選擇的原因 | 只列技術名稱 |
| 承認挑戰並說明如何解決 | 假裝一切順利 |
| 控制在 3-5 分鐘內 | 講超過 10 分鐘 |
`;

export default world48;
