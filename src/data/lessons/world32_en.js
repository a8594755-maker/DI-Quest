const world32_en = `
# World 32: System Analysis Fundamentals

> A BA doesn't need to write code, but must understand how systems work. This enables effective communication with engineers and writing implementable requirements.

This chapter teaches you "just enough" technical knowledge to hold conversations with engineering teams in both interviews and on the job.

---

## 32-1: System Workflow Analysis

### How Does a System Work?

\`\`\`
User Action
  ↓
Frontend
  ↓ HTTP Request
Backend / Server
  ↓ SQL Query
Database
  ↓ Data
Backend (Processing Logic)
  ↓ HTTP Response
Frontend (Render Result)
  ↓
User Sees Result
\`\`\`

### Three-Tier Architecture

| Layer | Name | Responsibility | Technology Examples |
|-------|------|---------------|-------------------|
| Presentation | Frontend / UI | User interface, interaction | React, Vue, HTML/CSS |
| Business Logic | Backend / Server | Business logic, validation | Node.js, Python, Java |
| Data | Database | Data storage, querying | MySQL, PostgreSQL, MongoDB |

### Process Flow Example: E-Commerce Order Placement

\`\`\`
User browses products
    ↓
Add to cart
    ↓
Click checkout
    ↓
┌─ Logged in? ──→ No ──→ Login/Register ──┐
│     Yes                                  │
│     ↓                                    │
│  Select shipping method                  │
│     ↓                                    │
│  Enter delivery information              │
│     ↓                                    │
│  Select payment method                   │
│     ↓                                    │
│  Confirm order                           │
│     ↓                                    │
│  ┌─ Payment successful?                  │
│  │   Yes → Create order → Send           │
│  │         confirmation email             │
│  │   No  → Show error → Retry            │
│  └───────────────────────────────────── │
└──────────────────────────────────────────┘
\`\`\`

### Sequence Diagram

\`\`\`
User          Frontend      Backend       Database      Payment API
 │             │             │             │             │
 │──Click      │             │             │             │
 │  Checkout──→│             │             │             │
 │             │──POST /order→│             │             │
 │             │             │──Check       │             │
 │             │             │  inventory──→│             │
 │             │             │←──Inventory  │             │
 │             │             │   data──────│             │
 │             │             │                           │
 │             │             │──Create      │             │
 │             │             │  order──────→│             │
 │             │             │←──Order ID──│             │
 │             │             │                           │
 │             │             │──Request charge──────────→│
 │             │             │←──Charge result──────────│
 │             │             │                           │
 │             │←─Order      │             │             │
 │             │  success───│             │             │
 │←─Display   │             │             │             │
 │  result────│             │             │             │
\`\`\`

### System Aspects BAs Should Focus On

\`\`\`
1. Happy Path: Normal flow
2. Exception Path: Error handling (payment failure, out of stock)
3. Edge Cases: Boundary situations (simultaneous orders, oversized orders)
4. Error Messages: User-friendly error messages
5. Audit Trail: Operation logs (who did what and when)
6. Data Validation: Dual validation (frontend + backend)
\`\`\`

---

## 32-2: Database Fundamentals (BA Edition)

### Why Does a BA Need to Understand Databases?

\`\`\`
1. Writing requirements requires defining data fields
2. Analysis requires understanding data structures
3. Communicating Data Models with engineers
4. Designing reports requires knowing where data comes from
\`\`\`

### Relational Database Core Concepts

| Concept | Description | Analogy |
|---------|-------------|---------|
| Table | Data table | Excel worksheet |
| Row / Record | One data entry | Excel row |
| Column / Field | One attribute | Excel column |
| Primary Key (PK) | Unique identifier | Social Security Number |
| Foreign Key (FK) | Key referencing another table | Referencing another table's ID |
| Schema | Database structure | Table blueprint |

### Entity-Relationship Diagram (ERD)

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

Relationship Types:
1:1 — One-to-One (User ↔ Profile)
1:N — One-to-Many (Customer → Orders)
N:N — Many-to-Many (Student ↔ Course, requires junction table)
\`\`\`

### Normalization (Brief Overview)

\`\`\`
Why normalize? To avoid data redundancy and update anomalies.

❌ Unnormalized:
| OrderID | CustName | CustPhone | Item1    | Item2    | Item3 |
|---------|----------|-----------|----------|----------|-------|
| 001     | Alice    | 555-1234  | Mouse    | Keyboard |       |
| 002     | Alice    | 555-1234  | Monitor  |          |       |

Problems: Changing Alice's phone requires updating many rows; item count is not flexible

✅ After Normalization:
Customer table, Order table, OrderItem table each stand independently
→ Alice's data stored in one place only
→ No limit on number of items
\`\`\`

### SQL vs NoSQL

| Aspect | SQL (Relational) | NoSQL (Non-Relational) |
|--------|-----------------|----------------------|
| Structure | Fixed Schema | Flexible Schema |
| Data Format | Tables | JSON / Key-Value / Graph |
| Relationships | JOIN queries | Nested documents or references |
| Scaling | Primarily vertical | Primarily horizontal |
| Best For | Transactional, reporting | Big data, real-time, flexible |
| Examples | MySQL, PostgreSQL | MongoDB, Redis, DynamoDB |

### BA's Role in Data Modeling

\`\`\`
1. Define Entities: What are the main data objects?
2. Define Attributes: What fields does each object have?
3. Define Relationships: How are objects related?
4. Define Business Rules: What constraints? What validations?
5. Review Data Model together with engineers
\`\`\`

---

## 32-3: API Fundamentals

### What Is an API?

\`\`\`
API (Application Programming Interface)
= The "specification" for how systems communicate

Analogy: Ordering at a restaurant
- You (frontend) read the menu (API documentation)
- Tell the waiter (API) your order (Request)
- The kitchen (backend) prepares the food
- The waiter delivers the food (Response) to you
\`\`\`

### RESTful API Basics

\`\`\`
REST = Representational State Transfer
HTTP Method + URL + Body

Common HTTP Methods:
| Method | Purpose | Example |
|--------|---------|---------|
| GET    | Read    | GET /api/orders → Get all orders |
| POST   | Create  | POST /api/orders → Create new order |
| PUT    | Update (full) | PUT /api/orders/123 → Update order |
| PATCH  | Update (partial) | PATCH /api/orders/123 → Modify partial fields |
| DELETE | Delete  | DELETE /api/orders/123 → Delete order |
\`\`\`

### API Request / Response Example

\`\`\`
Request:
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
  "shipping_address": "123 Main Street, New York, NY 10001"
}

Response — Success:
Status: 201 Created
{
  "order_id": 10567,
  "status": "pending",
  "total": 1590,
  "created_at": "2026-03-15T14:30:00Z"
}

Response — Failure:
Status: 400 Bad Request
{
  "error": "INSUFFICIENT_STOCK",
  "message": "Product 101 only has 1 in stock",
  "details": { "product_id": 101, "available": 1, "requested": 2 }
}
\`\`\`

### HTTP Status Codes (Must-Know for BAs)

| Code | Meaning | BA Focus |
|------|---------|----------|
| 200 | OK | Success |
| 201 | Created | Successfully created |
| 400 | Bad Request | Request format error (frontend validation issue) |
| 401 | Unauthorized | Not logged in |
| 403 | Forbidden | No permission |
| 404 | Not Found | Resource doesn't exist |
| 409 | Conflict | Conflict (e.g., duplicate creation) |
| 422 | Unprocessable | Validation failed (business rule) |
| 500 | Server Error | Backend error (notify engineering) |
| 503 | Service Unavailable | Service temporarily down |

### How BAs Use API Knowledge

\`\`\`
1. Define API input/output when writing FRDs
2. Discuss system integration approaches with engineers
3. Understand third-party API limitations (Rate Limit, costs)
4. Test APIs using tools like Postman
5. Design error handling user experience
\`\`\`

---

## 32-4: System Integration Point Analysis

### What Is System Integration?

\`\`\`
Connecting two or more independent systems so data can flow between them.

E-commerce system integration points:
┌─────────┐     ┌──────────┐     ┌─────────┐
│   EC    │────→│ Payment  │────→│ Banking  │
│ Platform │     │ Gateway  │     │ System   │
└─────────┘     └──────────┘     └─────────┘
     │               │
     ↓               ↓
┌─────────┐     ┌──────────┐
│ Logistics│     │Accounting│
│ System   │     │ System   │
└─────────┘     └──────────┘
     │
     ↓
┌─────────┐
│Notification│ (Email / SMS / Push)
│ System   │
└─────────┘
\`\`\`

### Integration Patterns

| Pattern | Description | Best For | Example |
|---------|-------------|----------|---------|
| Point-to-Point | Direct connection | Few systems, simple | Frontend directly calling API |
| Hub-and-Spoke | Central hub | Multiple system integration | ESB (Enterprise Service Bus) |
| Pub/Sub | Publish/Subscribe | Event-driven | Order created → notify multiple systems |
| Batch | Batch processing | Non-real-time needs | Nightly sync of sales data to accounting |
| API Gateway | Unified entry point | Microservices architecture | All APIs routed through Gateway |

### Integration Analysis Checklist

\`\`\`
For each integration point, the BA needs to confirm:

1. Data Flow Direction
   → One-way or two-way?
   → Who is the Source? Who is the Target?

2. Frequency
   → Real-time or Batch?
   → If batch, how often?

3. Data Format
   → JSON, XML, CSV?
   → Encoding (UTF-8)?

4. Data Volume
   → Expected records per day/hour?
   → Peak volume as a multiple of normal?

5. Error Handling
   → What happens if the other system is down?
   → How many retries for failed transmissions?
   → Scenarios requiring manual intervention?

6. Security
   → Authentication method (API Key, OAuth)?
   → Data encryption (HTTPS, TLS)?
   → Sensitive data masking?

7. SLA
   → Response time requirements?
   → Availability requirements?
   → Rate limits?
\`\`\`

### Integration Requirements Document Example

\`\`\`
Integration: EC Platform → Logistics System

Direction: One-way (EC → Logistics)
Trigger: When order status changes to "Paid"
Frequency: Real-time
Format: JSON via REST API

Data Field Mapping:
| EC Platform Field | Logistics Field | Transformation Rule |
|-------------------|----------------|-------------------|
| order_id | shipment_ref | Add prefix "EC-" |
| customer.name | recipient_name | Direct mapping |
| customer.phone | recipient_phone | Remove country code |
| customer.address | delivery_address | Direct mapping |
| items[].name | package_items | Concatenate into string |
| total_weight | package_weight | Grams → Kilograms |

Error Handling:
| Error Code | Handling |
|-----------|---------|
| Connection timeout | Retry 3 times, 5-second interval |
| 400 Format error | Log, notify BA for review |
| 500 Logistics error | Retry 3 times, then route to manual processing queue |
| Unrecognized address | Flag order as "Address Pending Confirmation", notify CS |
\`\`\`

---

## 32-5: Authentication, Roles, and Permissions

### Authentication vs Authorization

| Aspect | Authentication | Authorization |
|--------|---------------|--------------|
| Question | Who are you? | What can you do? |
| Verification | Username/password, SSO, MFA | Role-based permissions, ACL |
| When | At login | On every operation |
| Example | Enter credentials to log in | Manager can approve; employee can only submit |

### Common Authentication Methods

| Method | Description | Best For |
|--------|-------------|----------|
| Username + Password | Traditional credentials | General web applications |
| SSO (Single Sign-On) | One account for multiple systems | Enterprise internal systems |
| OAuth 2.0 | Third-party authorization login | "Sign in with Google" |
| MFA (Multi-Factor) | Multi-factor verification | High-security requirements |
| JWT (JSON Web Token) | Token-based verification | Stateless APIs |

### RBAC (Role-Based Access Control)

\`\`\`
Role Definition Example (E-Commerce Back Office):

Role Structure:
Super Admin
  ├── Admin
  │     ├── Product Manager
  │     ├── Order Manager
  │     └── Customer Service
  ├── Finance
  └── Marketing
\`\`\`

### Permission Matrix

| Feature | Super Admin | Admin | Product Mgr | Order Mgr | CS | Finance |
|---------|------------|-------|------------|-----------|-----|---------|
| User Management | CRUD | CRU | - | - | R | - |
| Product Management | CRUD | CRUD | CRUD | R | R | R |
| Order Management | CRUD | CRUD | R | CRUD | RU | R |
| Refund Approval | CRUD | CRU | - | R | CR | RU |
| Report Access | R | R | R (Products) | R (Orders) | R (CS) | R (All) |
| System Settings | CRUD | R | - | - | - | - |

\`\`\`
C = Create, R = Read, U = Update, D = Delete
- = No access
\`\`\`

### Permission Requirements Writing Example

\`\`\`
FR-AUTH-001: Role Management

Description: Super Admin can create, modify, and delete roles,
and assign feature-level permissions to each role.

Rules:
1. Default roles (Super Admin, Admin) cannot be deleted
2. Custom role names must be unique
3. Role permission changes take effect immediately (no re-login required)
4. Confirm no users are assigned before deleting a role

FR-AUTH-002: Data-Level Permissions

Description: Users can only see data belonging to their department.

Examples:
- North region sales staff can only see North region orders and customers
- Headquarters can view all regions
- Managers can see their subordinates' data

Implementation (Row-Level Security):
Each record is tagged with department_id,
queries automatically include WHERE department_id = user.department_id
\`\`\`

### Security Requirements Checklist

\`\`\`
Security items BAs should consider when writing requirements:

☐ Password policy (minimum length, complexity, expiration policy)
☐ Login failure lockout (lock after 5 failures for 30 minutes)
☐ Session timeout (auto-logout after 30 minutes of inactivity)
☐ Secondary verification for sensitive operations (e.g., refund, delete)
☐ Audit Log (operation logging)
☐ PII protection (partial masking of phone/email)
☐ Data encryption (HTTPS in transit, encrypted at rest)
☐ GDPR / Privacy law compliance (right to data deletion)
\`\`\`

---

## 32-6: System Analysis Comprehensive Case Study

### Case: Designing an Online Appointment System

#### Requirements Background

\`\`\`
Scenario: A chain of clinics wants to build an online appointment system
Users: Patients, Doctors, Front desk staff, System administrators
Features: Online booking, appointment slot management, notification reminders
\`\`\`

#### 1. System Context Diagram

\`\`\`
                ┌──────────┐
   Patient ────→│          │──────→ Email/SMS
                │Appointment│
   Doctor  ────→│  System  │──────→ Calendar
                │          │
   Front   ────→│          │←─────→ Insurance
   Desk         └──────────┘        System
                     ↕
                ┌──────────┐
                │  Medical │
                │ Records  │
                │  System  │
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

#### 3. Core API Design

\`\`\`
Patient-facing:
GET  /api/doctors?specialty=family-medicine  → Search doctors
GET  /api/doctors/{id}/slots?date=...       → View available slots
POST /api/appointments                      → Create appointment
DELETE /api/appointments/{id}               → Cancel (must be 2+ hours in advance)

Doctor-facing:
GET   /api/doctors/me/appointments          → Today's appointment list
PATCH /api/appointments/{id}                → Update consultation notes
POST  /api/doctors/me/slots                 → Set available time slots
\`\`\`

#### 4. Role Permissions

| Feature | Patient | Doctor | Front Desk | Admin |
|---------|---------|--------|-----------|-------|
| Search doctors | R | - | R | R |
| Book appointment | CR | - | CRD | CRUD |
| Cancel appointment | Own only | - | All | All |
| View appointment list | Own only | Own only | All | All |
| Set time slots | - | Own only | RU | CRUD |
| Manage doctors | - | - | R | CRUD |
| System settings | - | - | - | CRUD |

#### 5. Integration Points

| System | Purpose | Method | Notes |
|--------|---------|--------|-------|
| Email/SMS | Appointment notifications, reminders | Pub/Sub (event-driven) | SendGrid / Twilio |
| Insurance System | Identity verification, visit records | REST API (real-time) | Handle maintenance windows |
| Medical Records | Chart retrieval during visits | FHIR Standard API | Strict access control |
| Google Calendar | Doctor calendar sync | OAuth 2.0 | Timezone handling |

#### 6. Non-Functional Requirements

\`\`\`
Performance:
- Doctor search response time < 1 second
- Appointment operation response time < 2 seconds
- Support 1,000 concurrent online users

Availability:
- 99.9% Uptime
- Maintenance window: Sunday 2-4 AM

Security:
- PII encrypted at rest
- Audit logs retained for 3 years
- Compliant with healthcare data privacy regulations

Compatibility:
- Support Chrome, Safari, Edge (last two versions)
- Mobile responsive (iOS Safari, Android Chrome)
\`\`\`

---

## Cheat Sheet: System Analysis Quick Reference

### Must-Know Technical Terms for BAs

| Term | Plain Language Explanation |
|------|--------------------------|
| API | Specification for how systems communicate |
| REST | A style of API design |
| JSON | Data transfer format (like structured text) |
| Database | Where data is stored |
| Schema | The structural design of a database |
| ERD | Diagram showing relationships between data entities |
| Authentication | Verifying who you are |
| Authorization | Verifying what you can do |
| RBAC | Controlling permissions through roles |
| SLA | Contractual commitment for service quality |
| Webhook | Automatic notification when an event occurs |
| Microservices | Breaking a large system into small services |
| CI/CD | Automated testing and deployment |
| Rate Limit | Limit on the number of API calls |

### System Analysis Process

\`\`\`
1. Understand business processes → Process Flow
2. Identify data entities → ERD
3. Define API interfaces → API Spec
4. Analyze integration points → Integration Map
5. Design permission model → RBAC Matrix
6. Define NFR → Performance, Security, Scalability
7. Review with engineering → Technical Feasibility
\`\`\`

### High-Frequency Interview Questions

| Question | Key Answer Points |
|----------|------------------|
| How do you understand system architecture? | Three-tier: Frontend → Backend → Database |
| What is an API? | Communication interface between systems, using HTTP methods to operate resources |
| How to draw an ERD? | Entities + Attributes + Relationships |
| Authentication vs Authorization? | Authentication = Who you are; Authorization = What you can do |
| What to watch out for in system integration? | Data flow, frequency, format, error handling, security |
| How to communicate with engineers? | Use process diagrams, ERDs, API specs; speak in business language |
`;

export default world32_en;
