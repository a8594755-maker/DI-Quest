const world22 = `
# 🏗️ 商業流程工具開發

從寫腳本升級到設計完整的商業流程工具。

---

## 22-1：需求分析與規格

User Story 格式：As a [角色], I want to [行動], so that [目的]。

MVP = 最小但完整可用的核心流程。先讓使用者跑通一個循環。

---

## 22-2：表單處理

- 前端驗證 = UX（即時回饋）
- 後端驗證 = Security（不信任前端）
- 用 Pydantic BaseModel 定義資料結構和驗證規則

---

## 22-3：Workflow 自動化

狀態機設計：
- 定義所有合法狀態和轉換
- 每個轉換有明確的觸發條件和執行者
- 狀態變更時觸發自動化動作（通知、更新）

---

## 22-4：內部工具架構

前後端分離：
- Frontend: React / Retool / Streamlit
- Backend: FastAPI / Flask
- Database: SQLite / PostgreSQL
- 透過 REST API 溝通

---

## 22-5：部署與維護概念

- Docker：環境一致性
- .env：環境變數管理
- logging：生產環境用 logging 不用 print
- 基本監控：健康檢查、錯誤追蹤

---

## 22-6（Boss）：設計請假申請系統

綜合運用：
- Schema 設計
- RESTful API
- 狀態機
- 權限控制
- 通知機制
- MVP 規劃
`

export default world22
