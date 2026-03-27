const world32 = `
# World 32：系統分析基礎

> BA 不需要會寫 Code，但必須理解系統是怎麼運作的。這樣才能跟工程師有效溝通，寫出可實作的需求。

這一章教你「剛好夠用」的技術知識，讓你在面試和工作中都能跟工程團隊對話。

---

## 32-1：系統工作流程分析

### 系統是怎麼運作的？

\`\`\`
用戶操作
  ↓
前端（Frontend）
  ↓ HTTP Request
後端（Backend / Server）
  ↓ SQL Query
資料庫（Database）
  ↓ Data
後端（處理邏輯）
  ↓ HTTP Response
前端（呈現結果）
  ↓
用戶看到結果
\`\`\`

### 三層架構（Three-Tier Architecture）

| 層級 | 名稱 | 負責 | 技術範例 |
|------|------|------|---------|
| Presentation | 前端 / UI | 用戶介面、互動 | React, Vue, HTML/CSS |
| Business Logic | 後端 / Server | 商業邏輯、驗證 | Node.js, Python, Java |
| Data | 資料庫 | 資料存儲、查詢 | MySQL, PostgreSQL, MongoDB |

### 流程圖（Process Flow）範例：電商下單

\`\`\`
用戶瀏覽商品
    ↓
加入購物車
    ↓
點擊結帳
    ↓
┌─ 已登入？──→ 否 ──→ 登入/註冊 ──┐
│     是                            │
│     ↓                             │
│  選擇配送方式                      │
│     ↓                             │
│  填寫收件資訊                      │
│     ↓                             │
│  選擇付款方式                      │
│     ↓                             │
│  確認訂單                          │
│     ↓                             │
│  ┌─ 付款成功？                     │
│  │   是 → 建立訂單 → 發確認信      │
│  │   否 → 顯示錯誤 → 重試          │
│  └──────────────────────────────  │
└──────────────────────────────────┘
\`\`\`

### Sequence Diagram（時序圖）

\`\`\`
用戶          前端          後端          資料庫        支付 API
 │             │             │             │             │
 │──點擊結帳──→│             │             │             │
 │             │──POST /order→│             │             │
 │             │             │──查庫存──────→│             │
 │             │             │←──庫存資料───│             │
 │             │             │                           │
 │             │             │──建立訂單───→│             │
 │             │             │←──訂單 ID───│             │
 │             │             │                           │
 │             │             │──請求扣款────────────────→│
 │             │             │←──扣款結果───────────────│
 │             │             │                           │
 │             │←─訂單成功───│             │             │
 │←─顯示結果──│             │             │             │
\`\`\`

### BA 需要關注的系統面向

\`\`\`
1. Happy Path：正常流程
2. Exception Path：異常處理（付款失敗、庫存不足）
3. Edge Cases：邊界情況（同時下單、超大訂單）
4. Error Messages：錯誤訊息（對用戶友善）
5. Audit Trail：操作記錄（誰在什麼時間做了什麼）
6. Data Validation：資料驗證（前端 + 後端雙重驗證）
\`\`\`

---

## 32-2：資料庫基礎（給 BA 的版本）

### 為什麼 BA 需要懂資料庫？

\`\`\`
1. 寫需求時需要定義資料欄位
2. 做分析需要理解資料結構
3. 跟工程師溝通 Data Model
4. 設計報表時需要知道資料從哪來
\`\`\`

### 關聯式資料庫基本概念

| 概念 | 說明 | 類比 |
|------|------|------|
| Table | 資料表 | Excel 工作表 |
| Row / Record | 一筆資料 | Excel 一列 |
| Column / Field | 一個欄位 | Excel 一欄 |
| Primary Key (PK) | 唯一識別碼 | 身分證字號 |
| Foreign Key (FK) | 關聯其他表的 Key | 引用其他表的 ID |
| Schema | 資料庫結構 | 表格的設計圖 |

### Entity-Relationship Diagram（ERD）

\`\`\`
┌──────────┐     1:N     ┌──────────┐
│ Customer │─────────────│  Order   │
├──────────┤             ├──────────┤
│ *id (PK) │             │ *id (PK) │
│ name     │             │ customer_│
│ email    │             │   id (FK)│
│ phone    │             │ date     │
│ city     │             │ total    │
│ created  │             │ status   │
└──────────┘             └──────────┘
                              │ 1:N
                              │
                         ┌──────────┐     N:1     ┌──────────┐
                         │OrderItem │─────────────│ Product  │
                         ├──────────┤             ├──────────┤
                         │ *id (PK) │             │ *id (PK) │
                         │ order_id │             │ name     │
                         │   (FK)   │             │ price    │
                         │ product_ │             │ category │
                         │   id(FK) │             │ stock    │
                         │ quantity │             └──────────┘
                         │ price    │
                         └──────────┘

關係類型：
1:1 — 一對一（User ↔ Profile）
1:N — 一對多（Customer → Orders）
N:N — 多對多（Student ↔ Course，需中間表）
\`\`\`

### 正規化（Normalization）簡要概念

\`\`\`
為什麼要正規化？避免資料重複和更新異常。

❌ 未正規化：
| 訂單ID | 客戶名 | 客戶電話 | 商品1 | 商品2 | 商品3 |
|--------|--------|---------|-------|-------|-------|
| 001    | Alice  | 0912... | 滑鼠  | 鍵盤  |       |
| 002    | Alice  | 0912... | 螢幕  |       |       |

問題：Alice 改電話要改很多筆、商品數量不固定

✅ 正規化後：
Customer 表、Order 表、OrderItem 表各自獨立
→ Alice 資料只存一處
→ 商品數量不受限制
\`\`\`

### SQL vs NoSQL

| 面向 | SQL（關聯式） | NoSQL（非關聯式） |
|------|-------------|-----------------|
| 結構 | 固定 Schema | 彈性 Schema |
| 資料格式 | 表格 | JSON / Key-Value / Graph |
| 關聯 | JOIN 查詢 | 嵌套文件或引用 |
| 擴展 | 垂直擴展為主 | 水平擴展為主 |
| 適用場景 | 交易型、報表 | 大數據、即時、彈性 |
| 代表 | MySQL, PostgreSQL | MongoDB, Redis, DynamoDB |

### BA 在資料建模中的角色

\`\`\`
1. 定義 Entity（實體）：有哪些主要資料物件？
2. 定義 Attributes（屬性）：每個物件有哪些欄位？
3. 定義 Relationships（關係）：物件之間怎麼關聯？
4. 定義 Business Rules（規則）：什麼約束？什麼驗證？
5. 與工程師一起 Review Data Model
\`\`\`

---

## 32-3：API 基礎概念

### 什麼是 API？

\`\`\`
API（Application Programming Interface）
= 系統之間溝通的「規格」

類比：餐廳點餐
- 你（前端）看菜單（API 文件）
- 跟服務生（API）點餐（Request）
- 廚房（後端）做菜
- 服務生送餐（Response）給你
\`\`\`

### RESTful API 基礎

\`\`\`
REST = Representational State Transfer
HTTP Method + URL + Body

常用 HTTP Methods：
| Method | 用途 | 範例 |
|--------|------|------|
| GET    | 讀取 | GET /api/orders → 取得所有訂單 |
| POST   | 新增 | POST /api/orders → 建立新訂單 |
| PUT    | 更新（全部） | PUT /api/orders/123 → 更新訂單 |
| PATCH  | 更新（部分） | PATCH /api/orders/123 → 修改部分欄位 |
| DELETE | 刪除 | DELETE /api/orders/123 → 刪除訂單 |
\`\`\`

### API Request / Response 範例

\`\`\`
Request（請求）:
POST /api/orders
Headers:
  Content-Type: application/json
  Authorization: Bearer eyJhbGciOiJI...
Body:
{
  "customer_id": 42,
  "items": [
    { "product_id": 101, "quantity": 2 },
    { "product_id": 203, "quantity": 1 }
  ],
  "shipping_address": "台北市信義區信義路五段7號"
}

Response（回應）— 成功:
Status: 201 Created
{
  "order_id": 10567,
  "status": "pending",
  "total": 1590,
  "created_at": "2026-03-15T14:30:00Z"
}

Response（回應）— 失敗:
Status: 400 Bad Request
{
  "error": "INSUFFICIENT_STOCK",
  "message": "Product 101 only has 1 in stock",
  "details": { "product_id": 101, "available": 1, "requested": 2 }
}
\`\`\`

### HTTP Status Codes（BA 必知）

| Code | 意義 | BA 關注點 |
|------|------|----------|
| 200 | OK | 成功 |
| 201 | Created | 新增成功 |
| 400 | Bad Request | 請求格式錯誤（前端驗證問題） |
| 401 | Unauthorized | 未登入 |
| 403 | Forbidden | 沒有權限 |
| 404 | Not Found | 資源不存在 |
| 409 | Conflict | 衝突（如重複建立） |
| 422 | Unprocessable | 驗證失敗（商業規則） |
| 500 | Server Error | 後端出錯（需通知工程師） |
| 503 | Service Unavailable | 服務暫停 |

### BA 如何使用 API 知識？

\`\`\`
1. 撰寫 FRD 時定義 API 的輸入/輸出
2. 與工程師討論系統整合方案
3. 理解第三方 API 的限制（Rate Limit、費用）
4. 測試 API 時使用 Postman 等工具
5. 設計錯誤處理的用戶體驗
\`\`\`

---

## 32-4：系統整合點分析

### 什麼是系統整合？

\`\`\`
將兩個或多個獨立系統連接起來，讓資料可以流通。

電商系統的整合點：
┌─────────┐     ┌──────────┐     ┌─────────┐
│ EC 平台  │────→│ 支付閘道  │────→│ 銀行系統 │
└─────────┘     └──────────┘     └─────────┘
     │               │
     ↓               ↓
┌─────────┐     ┌──────────┐
│ 物流系統  │     │ 會計系統  │
└─────────┘     └──────────┘
     │
     ↓
┌─────────┐
│ 通知系統  │（Email / SMS / Push）
└─────────┘
\`\`\`

### 整合模式

| 模式 | 說明 | 適用場景 | 範例 |
|------|------|---------|------|
| Point-to-Point | 直接對接 | 系統少、簡單 | 前端直接呼叫 API |
| Hub-and-Spoke | 中央樞紐 | 多系統整合 | ESB（Enterprise Service Bus） |
| Pub/Sub | 發布/訂閱 | 事件驅動 | 訂單建立 → 通知多個系統 |
| Batch | 批次處理 | 非即時需求 | 每晚同步銷售資料到會計系統 |
| API Gateway | 統一入口 | 微服務架構 | 所有 API 透過 Gateway 路由 |

### 整合分析清單

\`\`\`
對每個整合點，BA 需要確認：

1. 資料流向
   → 單向或雙向？
   → 誰是來源（Source）、誰是目的（Target）？

2. 頻率
   → 即時（Real-time）還是批次（Batch）？
   → 批次的話，多久一次？

3. 資料格式
   → JSON、XML、CSV？
   → 編碼（UTF-8）？

4. 資料量
   → 預期每天/每小時多少筆？
   → 高峰期的量是平常的幾倍？

5. 錯誤處理
   → 對方系統掛掉怎麼辦？
   → 資料傳送失敗要重試幾次？
   → 需要人工介入的情境？

6. 安全性
   → 認證方式（API Key、OAuth）？
   → 資料加密（HTTPS、TLS）？
   → 敏感資料遮罩？

7. SLA
   → 回應時間要求？
   → 可用性要求？
   → 有無 Rate Limit？
\`\`\`

### 整合需求文件範例

\`\`\`
Integration: EC 平台 → 物流系統

方向：單向（EC → 物流）
觸發：訂單狀態變為「已付款」時
頻率：即時
格式：JSON via REST API

資料欄位映射：
| EC 平台欄位 | 物流系統欄位 | 轉換規則 |
|------------|------------|---------|
| order_id | shipment_ref | 加前綴 "EC-" |
| customer.name | recipient_name | 直接對應 |
| customer.phone | recipient_phone | 去除 +886 |
| customer.address | delivery_address | 直接對應 |
| items[].name | package_items | 合併為字串 |
| total_weight | package_weight | 公克→公斤 |

錯誤處理：
| 錯誤碼 | 處理方式 |
|--------|---------|
| 連線逾時 | 重試 3 次，間隔 5 秒 |
| 400 格式錯誤 | 記錄 Log，通知 BA 檢查 |
| 500 物流端錯誤 | 重試 3 次，失敗後進入人工處理佇列 |
| 地址無法辨識 | 標記訂單「待確認地址」，通知客服 |
\`\`\`

---

## 32-5：認證、角色與權限

### 認證（Authentication）vs 授權（Authorization）

| 面向 | Authentication（認證） | Authorization（授權） |
|------|----------------------|---------------------|
| 問題 | 你是誰？ | 你能做什麼？ |
| 驗證 | 帳號密碼、SSO、MFA | 角色權限、ACL |
| 時機 | 登入時 | 每次操作時 |
| 範例 | 輸入帳密登入 | 主管可以審核，員工只能提交 |

### 常見認證方式

| 方式 | 說明 | 適用場景 |
|------|------|---------|
| Username + Password | 傳統帳密 | 一般 Web 應用 |
| SSO（Single Sign-On） | 一組帳號登入多系統 | 企業內部系統 |
| OAuth 2.0 | 第三方授權登入 | 「用 Google 帳號登入」 |
| MFA（Multi-Factor） | 多因子驗證 | 高安全性需求 |
| JWT（JSON Web Token） | Token 驗證 | Stateless API |

### RBAC（Role-Based Access Control）

\`\`\`
角色定義範例（電商後台）：

角色結構：
Super Admin
  ├── Admin
  │     ├── Product Manager
  │     ├── Order Manager
  │     └── Customer Service
  ├── Finance
  └── Marketing
\`\`\`

### 權限矩陣

| 功能 | Super Admin | Admin | Product Mgr | Order Mgr | CS | Finance |
|------|------------|-------|------------|-----------|-----|---------|
| 用戶管理 | CRUD | CRU | - | - | R | - |
| 商品管理 | CRUD | CRUD | CRUD | R | R | R |
| 訂單管理 | CRUD | CRUD | R | CRUD | RU | R |
| 退款審核 | CRUD | CRU | - | R | CR | RU |
| 報表查看 | R | R | R（商品） | R（訂單） | R（客服） | R（全部） |
| 系統設定 | CRUD | R | - | - | - | - |

\`\`\`
C = Create, R = Read, U = Update, D = Delete
- = 無權限
\`\`\`

### 權限需求撰寫範例

\`\`\`
FR-AUTH-001: 角色管理

描述：Super Admin 可以建立、修改、刪除角色，
並為每個角色指定功能權限。

規則：
1. 預設角色（Super Admin, Admin）不可刪除
2. 自訂角色名稱不可重複
3. 角色權限變更即時生效（不需重新登入）
4. 刪除角色前需確認無用戶綁定

FR-AUTH-002: 資料層級權限

描述：用戶只能看到所屬部門的資料。

範例：
- 北區業務只能看北區的訂單和客戶
- 總部可以看所有地區
- 主管可以看下屬的資料

實作方式（Row-Level Security）：
每筆資料標記 department_id，
查詢時自動加入 WHERE department_id = user.department_id
\`\`\`

### 安全性需求清單

\`\`\`
BA 在寫需求時需考慮的安全項目：

☐ 密碼規則（最少長度、複雜度、過期策略）
☐ 登入失敗鎖定（5 次失敗鎖定 30 分鐘）
☐ Session 過期（閒置 30 分鐘自動登出）
☐ 敏感操作需二次驗證（如退款、刪除）
☐ 操作日誌（Audit Log）
☐ 個資保護（手機/Email 部分遮罩）
☐ 資料加密（傳輸中 HTTPS、儲存時加密）
☐ GDPR / 個資法合規（資料刪除權）
\`\`\`

---

## 32-6：系統分析綜合案例

### 案例：設計線上預約系統

#### 需求背景

\`\`\`
情境：一家連鎖診所要建立線上預約系統
用戶：病患、醫師、櫃台人員、系統管理員
功能：線上預約、管理看診時段、通知提醒
\`\`\`

#### 1. System Context Diagram

\`\`\`
                ┌──────────┐
    病患 ──────→│          │──────→ Email/SMS
                │ 預約系統  │
    醫師 ──────→│          │──────→ 行事曆
                │          │
    櫃台 ──────→│          │←─────→ 健保系統
                └──────────┘
                     ↕
                ┌──────────┐
                │ 病歷系統  │
                └──────────┘
\`\`\`

#### 2. Entity Relationship Diagram

\`\`\`
┌──────────┐  1:N  ┌──────────┐  N:1  ┌──────────┐
│ Patient  │──────→│Appointment│←──────│ Doctor   │
├──────────┤       ├──────────┤       ├──────────┤
│ *id      │       │ *id      │       │ *id      │
│ name     │       │ patient_ │       │ name     │
│ phone    │       │   id(FK) │       │ specialty│
│ email    │       │ doctor_  │       │ clinic_id│
│ birth    │       │   id(FK) │       │ bio      │
│ ID_number│       │ slot_id  │       └──────────┘
└──────────┘       │   (FK)   │
                   │ status   │  N:1  ┌──────────┐
                   │ notes    │──────→│ TimeSlot │
                   └──────────┘       ├──────────┤
                                      │ *id      │
                                      │ doctor_id│
                                      │ date     │
                                      │ start    │
                                      │ end      │
                                      │ available│
                                      └──────────┘
\`\`\`

#### 3. 核心 API 設計

\`\`\`
病患端：
GET  /api/doctors?specialty=家醫科     → 搜尋醫師
GET  /api/doctors/{id}/slots?date=...  → 查可預約時段
POST /api/appointments                 → 建立預約
DELETE /api/appointments/{id}          → 取消（需提前 2 小時）

醫師端：
GET   /api/doctors/me/appointments     → 今日看診清單
PATCH /api/appointments/{id}           → 更新看診紀錄
POST  /api/doctors/me/slots            → 設定可看診時段
\`\`\`

#### 4. 角色權限

| 功能 | 病患 | 醫師 | 櫃台 | 管理員 |
|------|------|------|------|--------|
| 搜尋醫師 | R | - | R | R |
| 預約掛號 | CR | - | CRD | CRUD |
| 取消預約 | 自己的 | - | 全部 | 全部 |
| 查看看診清單 | 自己的 | 自己的 | 全部 | 全部 |
| 設定時段 | - | 自己的 | RU | CRUD |
| 管理醫師 | - | - | R | CRUD |
| 系統設定 | - | - | - | CRUD |

#### 5. 整合點

| 系統 | 用途 | 方式 | 注意 |
|------|------|------|------|
| Email/SMS | 預約通知、提醒 | Pub/Sub（事件驅動） | SendGrid / Twilio |
| 健保系統 | 身分驗證、就醫紀錄 | REST API（即時） | 維護時段處理 |
| 病歷系統 | 看診時調閱 | FHIR 標準 API | 嚴格存取控制 |
| Google Calendar | 醫師行事曆同步 | OAuth 2.0 | 時區處理 |

#### 6. 非功能需求

\`\`\`
效能：
- 搜尋醫師回應時間 < 1 秒
- 預約操作回應時間 < 2 秒
- 支援 1,000 同時在線用戶

可用性：
- 99.9% Uptime
- 維護時段：週日凌晨 2-4 點

安全：
- 個資加密存儲
- 操作日誌保留 3 年
- 符合醫療個資規範

相容性：
- 支援 Chrome、Safari、Edge（最近兩個版本）
- 行動端 RWD（iOS Safari、Android Chrome）
\`\`\`

---

## Cheat Sheet：系統分析速查表

### BA 必懂的技術詞彙

| 術語 | 白話解釋 |
|------|---------|
| API | 系統之間溝通的規格 |
| REST | 一種 API 設計風格 |
| JSON | 資料傳輸格式（像結構化的文字） |
| Database | 存資料的地方 |
| Schema | 資料庫的結構設計 |
| ERD | 畫出資料之間關係的圖 |
| Authentication | 驗證你是誰 |
| Authorization | 驗證你能做什麼 |
| RBAC | 用角色控制權限 |
| SLA | 服務品質的合約承諾 |
| Webhook | 事件發生時自動通知 |
| Microservices | 把大系統拆成小服務 |
| CI/CD | 自動化測試和部署 |
| Rate Limit | API 呼叫次數限制 |

### 系統分析流程

\`\`\`
1. 理解業務流程 → Process Flow
2. 識別資料實體 → ERD
3. 定義 API 介面 → API Spec
4. 分析整合點 → Integration Map
5. 設計權限模型 → RBAC Matrix
6. 定義 NFR → Performance, Security, Scalability
7. 與工程 Review → Technical Feasibility
\`\`\`

### 面試高頻問題

| 問題 | 回答重點 |
|------|---------|
| 系統架構怎麼理解？ | 三層架構：前端→後端→資料庫 |
| 什麼是 API？ | 系統之間的溝通介面，用 HTTP 方法操作資源 |
| ERD 怎麼畫？ | Entity + Attributes + Relationships |
| 認證 vs 授權？ | 認證=你是誰；授權=你能做什麼 |
| 系統整合要注意什麼？ | 資料流向、頻率、格式、錯誤處理、安全性 |
| 如何跟工程師溝通？ | 用流程圖、ERD、API 規格，說業務語言 |
`;

export default world32;
