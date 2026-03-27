const world58 = `
# World 58：ERP 與系統流程

> **目標：** 了解 ERP、WMS、TMS、MRP 等企業系統如何支撐供應鏈運作
> **適用場景：** Business IT、ERP 導入、系統流程面試
> **預估學習時間：** 4-5 小時

---

## 58-1：ERP 基礎與模組

### 什麼是 ERP？

**ERP (Enterprise Resource Planning)** 的核心是「一個資料庫，多個模組」。所有部門在同一個系統上操作，數據即時同步。

**核心價值 = Single Source of Truth**

| 模組 | 縮寫 | 功能 |
|------|------|------|
| Financial Accounting | FI | 總帳、應收/應付帳款 |
| Controlling | CO | 成本中心、利潤中心 |
| Materials Management | MM | 採購、庫存管理 |
| Sales & Distribution | SD | 訂單、出貨、開票 |
| Production Planning | PP | 生產計劃、MRP |
| Warehouse Management | WM | 倉庫作業管理 |

> **主流 ERP：** SAP S/4HANA（大型企業首選）、Oracle ERP Cloud、Microsoft Dynamics 365、NetSuite（中小企業）

### Master Data（主檔資料）

Master Data 是 ERP 的地基。**GIGO — Garbage In, Garbage Out。**

| 類型 | 內容 | 影響 |
|------|------|------|
| **Material Master** | 品號、描述、單位、倉位 | 所有庫存和採購交易 |
| **Customer Master** | 名稱、地址、付款條件 | 所有銷售訂單 |
| **Vendor Master** | 供應商資訊、採購條件 | 所有採購訂單 |
| **BOM** | 產品的材料清單 | MRP 計算 |
| **Routing** | 生產步驟和工時 | 生產排程和成本 |

> **統計：** 60% 的 ERP 導入問題來自 Master Data 品質不佳。Data Governance（數據治理）是長期工作。

### MRP（物料需求規劃）

MRP 是製造業的核心計劃引擎。

**MRP 邏輯：**
\`\`\`
1. MPS（主生產排程）決定要生產什麼
2. BOM Explosion 展開物料需求（毛需求）
3. 扣除現有庫存和在途量（淨需求）
4. 根據 Lead Time 倒推下單時間（計劃訂單）
\`\`\`

**公式：** 淨需求 = 毛需求 - 現有庫存 - 在途量

> **關鍵：** MRP 不只算「要買多少」，還算「什麼時候要下單」——根據 Lead Time 倒推。

---

## 58-2：供應鏈系統生態

### 系統架構

\`\`\`
ERP（核心骨幹）
├── WMS（倉庫管理系統）— 儲位、揀貨、庫存追蹤
├── TMS（運輸管理系統）— 路線規劃、承運商、運費
├── MES（製造執行系統）— 生產即時監控
└── SCP（供應鏈計劃）— 需求計劃、供應計劃
\`\`\`

| 系統 | 管什麼 | 主流產品 |
|------|--------|----------|
| **WMS** | 倉庫內部作業 | Manhattan, Blue Yonder, SAP EWM |
| **TMS** | 出了倉庫的運輸 | Oracle TMS, SAP TM, project44 |
| **MES** | 工廠生產執行 | Siemens, Rockwell |

### Order-to-Cash (O2C)

銷售端的端到端流程：

\`\`\`
Sales Order → Credit Check → Pick/Pack/Ship → Invoice → Payment
\`\`\`

**關鍵控制點：**
- **Credit Check：** 信用額度不足 → Credit Block → 人工審批
- **ATP Check：** 可用量承諾（Available-to-Promise）
- **Three-Way Match：** PO + Receipt + Invoice 三者核對

> 在 SAP 中：VA01(建單) → VL01N(出貨) → VF01(開票) → F-28(收款)

### ERP 導入成功要素

**三 P 法則：People > Process > Platform**

| 要素 | 重要性 | 常見問題 |
|------|--------|----------|
| **People** | 最高 | 使用者抗拒、培訓不足 |
| **Process** | 高 | 流程沒有重新設計 |
| **Platform** | 中 | 過度客製化 |

> **統計：** ERP 導入失敗 70% 的原因是 Change Management 不足——不是技術問題，是人的問題。

**最佳實踐：**
1. 充分的使用者培訓（教操作也教「為什麼」）
2. Key User 制度（每個部門的種子使用者）
3. 管理層支持和帶頭使用
4. 快速回應使用者問題
5. 定期 Health Check 和持續改善

> SAP 名言：「SAP is not an IT project, it's a business transformation.」
`

export default world58
