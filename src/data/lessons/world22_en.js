const world22_en = `
# 🏗️ Business Process Tool Development

Level up from writing scripts to designing complete business process tools.

---

## 22-1: Requirements Analysis and Specifications

User Story format: As a [role], I want to [action], so that [purpose].

MVP = the smallest yet fully usable core workflow. Let users complete one full cycle first.

---

## 22-2: Form Processing

- Frontend validation = UX (instant feedback)
- Backend validation = Security (never trust the frontend)
- Use Pydantic BaseModel to define data structures and validation rules

---

## 22-3: Workflow Automation

State machine design:
- Define all valid states and transitions
- Each transition has clear trigger conditions and actors
- State changes trigger automated actions (notifications, updates)

---

## 22-4: Internal Tool Architecture

Frontend-backend separation:
- Frontend: React / Retool / Streamlit
- Backend: FastAPI / Flask
- Database: SQLite / PostgreSQL
- Communication via REST API

---

## 22-5: Deployment and Maintenance Concepts

- Docker: Environment consistency
- .env: Environment variable management
- logging: Use logging in production, not print
- Basic monitoring: Health checks, error tracking

---

## 22-6 (Boss): Design a Leave Request System

Combine all concepts:
- Schema design
- RESTful API
- State machine
- Permission control
- Notification mechanism
- MVP planning
`;

export default world22_en;
