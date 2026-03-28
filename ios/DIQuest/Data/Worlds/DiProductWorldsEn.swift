import Foundation

enum DiProductWorldsEn {
    static let worlds: [World] = [
        World(
            id: 9,
            name: "Digital Worker Product Understanding",
            emoji: "🤖",
            description: "Understand Decision Intelligence product positioning, core workflows, and feature modules",
            quests: [
                Quest(
                    id: "9-1",
                    name: "Product Positioning: Not a Chatbot",
                    description: "Understand the fundamental difference between Digital Worker Platform and chatbots",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Platform vs Chatbot",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the most accurate product positioning for Decision Intelligence?",
                            scenario: Challenge.Scenario(
                                title: "Core Positioning of Decision Intelligence",
                                narrative: "Your manager asks: \"How is Decision Intelligence different from ChatGPT?\" You need to answer precisely in one sentence.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Think about it: a Chatbot \"answers questions,\" while a Digital Worker \"executes workflows\""],
                            explanation: "Decision Intelligence is a Digital Worker Platform. In plain terms: ChatGPT is a consultant you ask questions and get answers from; DI is a digital employee you assign tasks to, who completes them and delivers a report. The core difference is that DI autonomously executes complete workflows (Upload data → Validate → Forecast → Plan → Approve → Export), with defined roles, permission boundaries, and audit trails.",
                            frameworkTip: "Three questions for product positioning: Who does it help? What does it do? How is it different from existing solutions?"
                        ),
                        Challenge(
                            id: 2,
                            name: "Digital Worker Output",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the final output of a Digital Worker completing one workflow?",
                            scenario: Challenge.Scenario(
                                title: "Defining Digital Worker Output",
                                narrative: "When a Digital Worker completes one full cycle of work, what does it ultimately deliver?",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["The last two steps of the Golden Path are Approve and Export"],
                            explanation: "The Digital Worker's output is not a text response, but three structured deliverables: (1) Decision Brief — a decision summary for management, including recommendations, cost impact, and risk warnings; (2) Evidence Pack — a complete calculation record for auditing; (3) Writeback Payload — write instructions for the ERP system. Together, these three items form an actionable decision plan.",
                            frameworkTip: "When evaluating AI products, look at whether the output is \"information\" or \"actionable decisions.\""
                        ),
                    ]
                ),
                Quest(
                    id: "9-2",
                    name: "Golden Path Six-Step Workflow",
                    description: "Master Upload→Validate→Forecast→Plan→Approve→Export",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Golden Path Step Ordering",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the correct order of the Golden Path?",
                            scenario: Challenge.Scenario(
                                title: "Golden Path Workflow",
                                narrative: "Decision Intelligence's core workflow is called the Golden Path, consisting of six steps.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["First upload data, validate before forecasting; after planning, human approval is needed before output"],
                            explanation: "Correct order: Upload → Validate → Forecast → Plan → Approve → Export. Validation comes before forecasting (ensuring data quality), and approval comes before export (human oversight).",
                            frameworkTip: "Golden Path design logic: Data Quality → AI Inference → Human Decision → Execution."
                        ),
                        Challenge(
                            id: 2,
                            name: "Purpose of the Validate Step",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the biggest risk of skipping the Validate step?",
                            scenario: Challenge.Scenario(
                                title: "Why Validate Is Needed",
                                narrative: "The team is discussing whether to skip Validate and go directly to Forecast.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Data quality is the foundation of all analysis"],
                            explanation: "Validate ensures data quality and prevents GIGO. Forecasts without validation may be based on incorrect data, leading to poor decisions.",
                            frameworkTip: "Data workflow is always: Collect → Clean/Validate → Analyze → Act."
                        ),
                    ]
                ),
                Quest(
                    id: "9-3",
                    name: "Feature Module Overview",
                    description: "Learn about the 27 pages and major feature modules",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Core Workspace Route",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which of the following is Decision Intelligence's core workspace route?",
                            scenario: Challenge.Scenario(
                                title: "Feature Module Map",
                                narrative: "Decision Intelligence has 27 pages, and you need to identify the core workspace.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["/workspace is the core convergence point for routes"],
                            explanation: "/workspace is the Unified Canvas where all Golden Path steps are completed within the same interface.",
                            frameworkTip: "Good SaaS products pursue \"route convergence\" — reducing page switches to improve efficiency."
                        ),
                        Challenge(
                            id: 2,
                            name: "Frontend Service Scale",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Approximately how many service directories does the Decision Intelligence frontend have?",
                            scenario: Challenge.Scenario(
                                title: "Frontend Service Architecture",
                                narrative: "You are reading the frontend code and discover a large number of subdirectories under the services directory.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["This is an enterprise-grade platform; the number of service modules reflects its complexity"],
                            explanation: "The frontend has approximately 31 service directories, covering modules like auth, workspace, forecast, plan, and more.",
                            frameworkTip: "When assessing project scale, the number of service directories is a quick indicator."
                        ),
                    ]
                ),
                Quest(
                    id: "9-4",
                    name: "Digital Worker Autonomy Levels",
                    description: "Understand A1-A4 autonomy levels and trust progression mechanism",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Autonomy Level Definitions",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which description best matches the behavior of an A1 level Digital Worker?",
                            scenario: Challenge.Scenario(
                                title: "Autonomy Levels A1-A4",
                                narrative: "Decision Intelligence defines four autonomy levels.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["A1 is the lowest autonomy level"],
                            explanation: "A1 (Assisted) is like an intern: the AI makes suggestions, but all decisions are made by humans. In plain terms: you ask it \"How much should we buy?\" and it says \"I recommend buying 500 units,\" but you decide whether to buy or not. The system uses first_pass_acceptance_rate (the proportion of submissions approved on the first attempt) to recommend upgrades: 20+ tasks completed with 85%+ first-pass approval → recommend promotion to A4.",
                            frameworkTip: "Trust Progression: Let humans control first → gradually let go → eventually AI operates autonomously."
                        ),
                        Challenge(
                            id: 2,
                            name: "Trust Progression Mechanism",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the core rationale for Trust Progression?",
                            scenario: Challenge.Scenario(
                                title: "Trust Progression",
                                narrative: "A client asks: \"Why can't it be fully automated from the start?\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["Would you hand financial decisions to a new employee on their first day?"],
                            explanation: "Trust progression is a risk management strategy, just like onboarding a new employee: on day one you watch their every step (A1), after three months you let them handle routine tasks on their own (A3), and after a year you fully trust them (A4). It's not a technical limitation or regulatory mandate — enterprises simply don't want to hand decision-making authority to unverified AI right away.",
                            frameworkTip: "AI product design principle: Users must be able to control the degree of automation and revert at any time."
                        ),
                        Challenge(
                            id: 3,
                            name: "Writeback Approval Design",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "In DI v1, what is the approval policy for Writeback (writing back to ERP)? Why was it designed this way?",
                            scenario: Challenge.Scenario(
                                title: "Design Decision: Why Writeback Always Requires Human Approval",
                                narrative: "The team is discussing whether v2 should allow automatic Writeback approval. You are the Product Owner and need to weigh risk versus efficiency.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Think about what happens if AI automatically places an incorrect purchase order", "v1 takes the conservative approach: ensure safety first, then talk about efficiency"],
                            explanation: "In reviewContract.js, the Writeback auto_approve_at array is empty — v1 does not allow any autonomy level to auto-execute ERP writes. Because a single incorrect purchase order could cause losses in the hundreds of thousands. Export (report export) and Notify (send notifications) are more lenient — A2+ and A3+ can auto-approve respectively. This is a design that grades actions by their risk level.",
                            frameworkTip: "When designing approval policies, ask three questions: 1. How costly is an error? 2. Can it be reversed? 3. How wide is the impact?"
                        ),
                    ]
                ),
                Quest(
                    id: "9-5",
                    name: "User Journey & Route Convergence",
                    description: "Understand the /workspace Unified Canvas design philosophy",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Route Convergence Strategy",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the main benefit of converging routes to /workspace?",
                            scenario: Challenge.Scenario(
                                title: "Why Use a Unified Canvas",
                                narrative: "The design team decided to converge all workflows to /workspace.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Think about working in Excel vs opening a new application for each step"],
                            explanation: "The Unified Canvas eliminates context switching between steps; all Golden Path steps are completed on the same screen.",
                            frameworkTip: "UX principle: Less context switching = less cognitive load = higher efficiency."
                        ),
                        Challenge(
                            id: 2,
                            name: "Unified Canvas Tradeoffs",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the biggest engineering challenge of the Unified Canvas?",
                            scenario: Challenge.Scenario(
                                title: "Architecture Tradeoffs",
                                narrative: "Engineers are discussing the cost of the Unified Canvas.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["All functionality on one page means state management becomes very complex"],
                            explanation: "The Unified Canvas concentrates a multi-step process in a single route, significantly increasing state management complexity.",
                            frameworkTip: "Architecture decisions always have tradeoffs. The Unified Canvas trades engineering complexity for user experience."
                        ),
                    ]
                ),
                Quest(
                    id: "9-6",
                    name: "Product Pitch (Boss)",
                    description: "Explain Decision Intelligence to a non-technical executive in 60 seconds",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Elevator Pitch: Decision Intelligence",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: Challenge.Scenario(
                                title: "60-Second Product Pitch",
                                narrative: "You run into the company CEO in the elevator: \"What is Decision Intelligence? Why do we need it?\" You have 60 seconds.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["The CEO cares about: cost, efficiency, risk, competitive advantage", "Use an analogy: \"Like hiring an analyst who never sleeps\""],
                            explanation: "A good pitch structure: Problem → Solution → Differentiation → Value.",
                            frameworkTip: "Elevator Pitch framework: Pain → Solution → Differentiation → Value → Call to Action"
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 10,
            name: "System Architecture Topology",
            emoji: "🏗️",
            description: "Understand Decision Intelligence's four-layer architecture and request flow",
            quests: [
                Quest(
                    id: "10-1",
                    name: "Four-Layer Architecture Overview",
                    description: "Learn about Frontend / Supabase / Edge Functions / ML API",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Four-Layer Architecture Identification",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the correct combination for Decision Intelligence's four-layer architecture?",
                            scenario: Challenge.Scenario(
                                title: "Architecture Layers",
                                narrative: "Decision Intelligence uses a four-layer architecture that you need to correctly identify.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Supabase provides Auth + DB + Storage"],
                            explanation: "Using a restaurant analogy: the frontend is the seating and menu (what users see and interact with), Supabase is the fridge and ledger (database and auth), Edge Functions are the waiters (relay requests to the kitchen, keep API keys away from customers), and ML API is the head chef (uses Python's Prophet and OR-Tools for forecasting and optimization, which can't run in a browser).",
                            frameworkTip: "How to read architecture: First draw the layer diagram, then trace how requests flow between layers."
                        ),
                        Challenge(
                            id: 2,
                            name: "ML API Layer Responsibilities",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the main responsibility of the ML API layer?",
                            scenario: Challenge.Scenario(
                                title: "Layer Responsibilities",
                                narrative: "You need to know what each layer is responsible for.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["ML = Machine Learning, handles compute-intensive work"],
                            explanation: "The ML API is written in FastAPI (Python) and handles three things: (1) Forecasting — using models like Prophet and LightGBM for demand forecasting; (2) Solving — using OR-Tools to compute optimal procurement plans; (3) Async operations — managing long-running computation tasks. Why separate? Because these Python tools can't run in a browser, and the compute load is heavy, requiring independent scaling.",
                            frameworkTip: "Core principle of layered architecture: Each layer does one thing, and does it well."
                        ),
                        Challenge(
                            id: 3,
                            name: "Why Not a Single Server",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "Which reason best explains why DI needs a separate ML API instead of putting ML logic in Edge Functions?",
                            scenario: Challenge.Scenario(
                                title: "Architecture Trade-off",
                                narrative: "A new intern asks you: \"Why make it so complicated with four layers? Can't we just use a single Node.js server?\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Prophet is written in Python, OR-Tools also requires a Python environment", "Think about language constraints — different tools need different runtime environments"],
                            explanation: "Edge Functions run in a Deno (TypeScript) environment. Prophet, LightGBM, and OR-Tools are all Python packages that must run in a Python environment. It's like you can't bake a cake in a microwave — different jobs need different tools. Additionally, ML computations are very CPU and memory intensive; independent deployment allows them to scale separately without affecting other services.",
                            frameworkTip: "Three questions for layer separation decisions: (1) Can they technically be combined? (2) What are the downsides of combining? (3) Is the operational cost of separation worth it?"
                        ),
                    ]
                ),
                Quest(
                    id: "10-2",
                    name: "Frontend Service Layer",
                    description: "Understand how the 31 service directories are organized",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Service Directory Organization",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What principle most likely governs how the frontend service directories are organized?",
                            scenario: Challenge.Scenario(
                                title: "Frontend Service Architecture",
                                narrative: "You open the src/services directory and see 31 subdirectories.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Enterprise applications are typically organized by business domain"],
                            explanation: "Frontend services are organized by business domain (domain-driven), with each directory corresponding to a business capability.",
                            frameworkTip: "Code organization principle: Organize by business domain, not by technology."
                        ),
                        Challenge(
                            id: 2,
                            name: "Frontend Framework Choice",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which frontend framework does Decision Intelligence use?",
                            scenario: Challenge.Scenario(
                                title: "Technology Selection",
                                narrative: "Decision Intelligence's frontend tech stack.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["React 19 is the latest major version"],
                            explanation: "Uses React 19 SPA, built with Vite, without an SSR framework.",
                            frameworkTip: "Technology selection considerations: team familiarity, ecosystem maturity, product requirements."
                        ),
                    ]
                ),
                Quest(
                    id: "10-3",
                    name: "Supabase Layer",
                    description: "Learn about Auth, Postgres, Storage, and Edge Functions",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Supabase Service Scope",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which of the following is NOT a service Supabase provides in this project?",
                            scenario: Challenge.Scenario(
                                title: "Supabase as BaaS",
                                narrative: "Decision Intelligence uses Supabase instead of building a custom backend.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["ML-related work is handled by another layer"],
                            explanation: "Supabase provides Auth, Postgres, Storage, and Edge Functions. ML is handled by the separate FastAPI layer.",
                            frameworkTip: "Value of BaaS: Reduce the burden of building infrastructure yourself so you can focus on business logic."
                        ),
                        Challenge(
                            id: 2,
                            name: "Edge Functions Role",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the primary use of Edge Functions?",
                            scenario: Challenge.Scenario(
                                title: "Edge Functions Purpose",
                                narrative: "What role do Edge Functions play in the architecture?",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Lightweight server-side functions handling logic that shouldn't be on the frontend"],
                            explanation: "Edge Functions handle logic that needs server-side execution, such as webhooks, third-party API integrations, and sensitive operations.",
                            frameworkTip: "Deciding which layer handles logic: Needs secret keys? Server-side. Needs GPU? ML API. Neither? Frontend."
                        ),
                    ]
                ),
                Quest(
                    id: "10-4",
                    name: "ML API Entry Point",
                    description: "Understand FastAPI, solver, registry, and async operations",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "ML API Tech Stack",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which Python web framework does the ML API use?",
                            scenario: Challenge.Scenario(
                                title: "ML API Technology Selection",
                                narrative: "The ML API is an independently deployed Python service.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["Known for high performance and automatic API documentation"],
                            explanation: "The ML API uses FastAPI — high performance, automatic OpenAPI documentation, native async/await.",
                            frameworkTip: "ML services commonly choose FastAPI: type hints → auto validation → auto documentation."
                        ),
                        Challenge(
                            id: 2,
                            name: "Asynchronous Operation Pattern",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What pattern is used for long-running ML inference tasks?",
                            scenario: Challenge.Scenario(
                                title: "Why Async Is Needed",
                                narrative: "ML inference can take several minutes; the frontend cannot wait indefinitely.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["AsyncRunService manages states: pending → running → completed/failed"],
                            explanation: "Long-running tasks use an async pattern: submit task → receive job ID → poll status. This avoids HTTP timeouts.",
                            frameworkTip: "Three elements of async operations: Submit (POST), Query (GET /status), Cancel (DELETE)."
                        ),
                    ]
                ),
                Quest(
                    id: "10-5",
                    name: "Request Flow Tracing",
                    description: "Trace three main request paths",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Authentication Flow",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the request flow for user login?",
                            scenario: Challenge.Scenario(
                                title: "User Login Flow",
                                narrative: "Trace the login request flow through the four-layer architecture.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Supabase Auth handles authentication directly, without going through Edge Functions"],
                            explanation: "Login flow: Frontend → Supabase Auth → returns JWT upon successful verification → Frontend stores the JWT.",
                            frameworkTip: "When tracing request flows, draw each arrow and label the data being passed."
                        ),
                        Challenge(
                            id: 2,
                            name: "Forecast Request Flow",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "What is the most likely complete flow for a forecast request?",
                            scenario: Challenge.Scenario(
                                title: "Complete Forecast Process",
                                narrative: "A user clicks \"Run Forecast\" — trace the request through all layers.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["Frontend calls ML API directly, JWT is used for authentication"],
                            explanation: "Frontend with JWT → ML API validates → Creates async job → Results written back to DB upon completion → Frontend polls to retrieve results. The frontend does not directly interact with the database for forecasting, nor does it go through Edge Functions (since ML computation requires Python). The frontend calls the ML API's REST endpoint directly.",
                            frameworkTip: "Complex request tracing: Draw a sequence diagram, noting the trigger condition and return data at each step."
                        ),
                        Challenge(
                            id: 3,
                            name: "Troubleshooting: System Slowdown",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "Which layer would you start investigating?",
                            scenario: Challenge.Scenario(
                                title: "Scenario Diagnosis",
                                narrative: "A user reports: \"The system has slowed down — running a forecast takes 3 minutes, it used to take only 30 seconds.\" You are the on-call engineer and need to quickly locate the problem.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["The problem is with \"running forecasts,\" and forecasting is the ML API's job", "Telemetry data records solve time and engine for each run"],
                            explanation: "\"Forecasts running slower\" points directly to the ML API layer. First step: check solver_telemetry_events and look at the average solve time trend. Possible causes: (1) data volume has grown (SKUs went from 1,000 to 4,000); (2) solver engine settings were changed; (3) server is low on memory, causing swap. The frontend and Supabase are not responsible for forecast computation, and ai-proxy only handles AI chat, not forecasting — so A/C/D are ruled out.",
                            frameworkTip: "First step in troubleshooting: Determine which layer owns the problem. Ask \"Which layer is responsible for this feature?\" then start with that layer's monitoring data."
                        ),
                    ]
                ),
                Quest(
                    id: "10-6",
                    name: "Architecture Whiteboard (Boss)",
                    description: "Draw the four-layer architecture and explain specific files in each layer",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Architecture Diagram Explanation",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: Challenge.Scenario(
                                title: "Interview Whiteboard: System Architecture",
                                narrative: "Interviewer: \"Please draw Decision Intelligence's system architecture, naming at least two specific modules per layer.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Top to bottom: UI → BaaS → Serverless → ML", "Think about which directories or files exist in each layer"],
                            explanation: "Architecture whiteboard questions test: (1) Big-picture understanding (2) Specific details (3) Inter-layer relationships.",
                            frameworkTip: "Three elements of an architecture diagram: Components + Connections + Contracts."
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 11,
            name: "Deployment & Runtime Environment",
            emoji: "🚀",
            description: "Understand Decision Intelligence's deployment topology, Docker configuration, and startup process",
            quests: [
                Quest(
                    id: "11-1",
                    name: "Deployment Topology",
                    description: "Understand Static Hosting + Supabase + ML Container deployment",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Three-Zone Deployment Model",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which is the correct deployment topology?",
                            scenario: Challenge.Scenario(
                                title: "Deployment Topology Diagram",
                                narrative: "Decision Intelligence's three components are deployed in different environments.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Frontend is static files, Supabase is a managed service, ML API needs containerization"],
                            explanation: "Three-zone deployment: static frontend (CDN), Supabase managed service, ML API Docker container. Each scales independently.",
                            frameworkTip: "Modern deployment principle: Different workloads use different deployment strategies. Static → CDN, Services → Containers."
                        ),
                        Challenge(
                            id: 2,
                            name: "Why Containerize the ML API",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the main reason for containerizing the ML API?",
                            scenario: Challenge.Scenario(
                                title: "Containerization Decision",
                                narrative: "The team discusses why the ML API needs Docker while the frontend does not.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Python ML dependencies are complex; different environments easily cause issues"],
                            explanation: "The ML API has complex Python dependencies (numpy, pandas, sklearn, etc.); containerization ensures complete consistency across development, testing, and production environments.",
                            frameworkTip: "Core value of containerization: Environment consistency. \"It works on my machine\" → \"It works everywhere.\""
                        ),
                    ]
                ),
                Quest(
                    id: "11-2",
                    name: "Dockerfile Analysis",
                    description: "Understand multi-stage builds, Chronos exclusion, and image size",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Multi-Stage Build",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the main benefit of multi-stage builds?",
                            scenario: Challenge.Scenario(
                                title: "Multi-stage Docker Build",
                                narrative: "The ML API's Dockerfile uses multi-stage builds.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Build stage tools (compilers, dev dependencies) don't need to be in the final image"],
                            explanation: "Multi-stage build: The first stage installs build tools and dependencies; the second stage only copies the needed artifacts. The production image contains no compilers or dev tools, significantly reducing size.",
                            frameworkTip: "Three Docker image slimming techniques: multi-stage builds, .dockerignore, minimal base images."
                        ),
                        Challenge(
                            id: 2,
                            name: "Chronos Exclusion",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the main consideration for excluding Chronos?",
                            scenario: Challenge.Scenario(
                                title: "Optional Dependency Management",
                                narrative: "The Dockerfile allows excluding Chronos (time-series forecasting model) to produce a lean version.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Chronos depends on PyTorch, which is very large"],
                            explanation: "Chronos requires PyTorch (~700MB); excluding it reduces the image from ~1.5GB to ~800MB. Deployments that don't need time-series forecasting can use the lean version.",
                            frameworkTip: "Image size directly affects: deployment speed, storage cost, startup time. When possible, choose lean."
                        ),
                    ]
                ),
                Quest(
                    id: "11-3",
                    name: "Environment Variables & Secrets",
                    description: "Understand three categories of environment variable management",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Environment Variable Classification",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which environment variable should NEVER appear in frontend code?",
                            scenario: Challenge.Scenario(
                                title: "Three Categories of Environment Variables",
                                narrative: "Decision Intelligence's environment variables fall into three major categories.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["SERVICE_ROLE_KEY has full database access permissions"],
                            explanation: "Variables prefixed with VITE_ are directly substituted into frontend JavaScript by Vite, visible to anyone opening DevTools. SUPABASE_SERVICE_ROLE_KEY has full database access (bypasses RLS) — if exposed, it's like posting the database master key on the front door. It should be stored server-side via supabase secrets set.",
                            frameworkTip: "Environment variable security rule: Frontend can only use public keys (anon key); secret keys must stay server-side."
                        ),
                        Challenge(
                            id: 2,
                            name: "Secret Management",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which secret management approach is the most secure?",
                            scenario: Challenge.Scenario(
                                title: "Secret Management Approach",
                                narrative: "The team discusses how to manage API keys and database passwords.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["Secrets should never enter version control"],
                            explanation: "Secrets should be injected through CI/CD pipelines or secret managers, and should never appear in Git history.",
                            frameworkTip: "Once a secret enters Git, it remains in history even if deleted. Prevention > Remediation."
                        ),
                    ]
                ),
                Quest(
                    id: "11-4",
                    name: "Health Check Mechanism",
                    description: "Understand healthcheck.sh, /healthz, liveness vs readiness",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Liveness vs Readiness",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What happens when a liveness probe fails?",
                            scenario: Challenge.Scenario(
                                title: "Two Types of Health Checks",
                                narrative: "Container orchestration systems use two types of health checks: liveness and readiness.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Liveness = Is it still alive? If not, restart it"],
                            explanation: "Using a hospital analogy: Liveness is like a nurse checking the patient is still breathing — if not, administer CPR (restart the container). Readiness is like confirming the patient can be discharged — if not ready, keep them in hospital (pause traffic but don't restart). DI's ML API has a 60-second start-period grace period because loading ML models takes time. Readiness failures during the grace period are not considered abnormal.",
                            frameworkTip: "Liveness = Does it need a restart? Readiness = Can it accept traffic? They serve different purposes."
                        ),
                        Challenge(
                            id: 2,
                            name: "Health Endpoint Design",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What should the /healthz endpoint check?",
                            scenario: Challenge.Scenario(
                                title: "/healthz Endpoint",
                                narrative: "The ML API exposes a /healthz endpoint for monitoring systems to check.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Too simple (just returning 200) won't detect problems; too complex will affect performance"],
                            explanation: "/healthz should check: (1) the service itself is alive (2) critical dependencies are reachable. It should not perform heavyweight operations.",
                            frameworkTip: "Health check principles: Lightweight, fast, and able to detect real problems."
                        ),
                    ]
                ),
                Quest(
                    id: "11-5",
                    name: "Startup & Verification Process",
                    description: "Understand migration ordering and preflight checks",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Startup Order",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the correct startup order?",
                            scenario: Challenge.Scenario(
                                title: "Service Startup Order",
                                narrative: "During deployment, the three components need to start in a specific order.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["The database must be ready first because other services depend on it"],
                            explanation: "Run DB migration (Supabase) first to ensure the schema is ready → start ML API → finally deploy the frontend. Dependency direction determines startup order.",
                            frameworkTip: "Startup order follows dependency direction: dependees start first. Draw the dependency graph to know the order."
                        ),
                        Challenge(
                            id: 2,
                            name: "Preflight Check",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the most important item for a preflight check?",
                            scenario: Challenge.Scenario(
                                title: "Pre-deployment Check",
                                narrative: "Before deployment, you need to confirm the environment is ready.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Missing environment variables are one of the most common causes of deployment failures"],
                            explanation: "Missing environment variables cause startup failures or runtime anomalies. Preflight checks should verify all necessary env vars and secrets are set.",
                            frameworkTip: "Deployment Checklist: Environment variables ✓ → DB migration ✓ → Health check ✓ → Traffic switch ✓"
                        ),
                    ]
                ),
                Quest(
                    id: "11-6",
                    name: "Staging Deployment Plan (Boss)",
                    description: "Write a complete staging environment deployment plan",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Write a Staging Deployment Plan",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: Challenge.Scenario(
                                title: "Deployment Plan Document",
                                narrative: "You are asked to write a deployment plan for Decision Intelligence in the staging environment. This is the team's first time deploying this system.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Think about what information you need to troubleshoot if deployment fails", "Rollback plan should be specific: which version to revert to and how"],
                            explanation: "A good deployment plan is an executable document that any team member can follow.",
                            frameworkTip: "Deployment plan formula: Prerequisites → Steps → Verification → Rollback → Communication"
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 12,
            name: "Engineering Quality Signals",
            emoji: "🛡️",
            description: "Understand Decision Intelligence's testing strategy, regression testing, and quality gates",
            quests: [
                Quest(
                    id: "12-1",
                    name: "Testing Pyramid",
                    description: "Understand Unit / Component / E2E / Regression layers",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Pyramid Levels",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the correct bottom-to-top order of the testing pyramid?",
                            scenario: Challenge.Scenario(
                                title: "Testing Pyramid",
                                narrative: "The testing pyramid is the foundational model for software quality.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["The bottom layer has the most tests and runs the fastest; the top has the fewest but broadest coverage"],
                            explanation: "Like quality inspection for building a house: Unit Tests check each brick for cracks (most numerous, fastest, running hundreds in seconds); Component Tests check if a wall is straight (middle layer, testing how several parts work together); E2E Tests are like inviting someone to stay overnight to see if the whole house is comfortable (fewest, slowest, but closest to real usage). Investment ratio follows the pyramid: large volume at the bottom, small volume at the top.",
                            frameworkTip: "Testing investment ratio: Many Unit + Moderate Component + Few E2E = Best ROI."
                        ),
                        Challenge(
                            id: 2,
                            name: "Purpose of Each Level",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which level should be used to test the complete Golden Path process?",
                            scenario: Challenge.Scenario(
                                title: "Choosing the Right Test Level",
                                narrative: "You need to test \"a user can complete the entire Golden Path process.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["\"Complete process\" requires spanning multiple components and pages"],
                            explanation: "Testing the complete Golden Path process (Upload → Validate → Forecast → Plan → Approve → Export) spans multiple pages and components — this cannot be covered by a single function or component. E2E Tests use Playwright to simulate a real user's operations: clicking buttons, filling forms, waiting for pages to load, and checking results. Like a mystery shopper at a restaurant — they go through the entire experience from reservation to payment to evaluate quality.",
                            frameworkTip: "Basis for choosing test level: The broader the test scope → the higher the level. Single function → Unit. Complete process → E2E."
                        ),
                    ]
                ),
                Quest(
                    id: "12-2",
                    name: "Regression Test Suite",
                    description: "Understand deterministic fixtures and regression_result.json",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Purpose of Regression Testing",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the main purpose of regression testing?",
                            scenario: Challenge.Scenario(
                                title: "What Is Regression Testing",
                                narrative: "The team runs the regression test suite before every release.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Regression = going backward. Regression testing prevents regression."],
                            explanation: "Regression literally means \"going backward.\" Regression testing is a safety net that prevents backsliding — you add a new feature and accidentally break the old login feature; regression testing catches it. It's even more critical in DI: you change a solver parameter and all forecast results shift — regression testing compares regression_result.json against expected results and alerts on discrepancies.",
                            frameworkTip: "Regression testing is a safety net: The bigger the change, the more important the safety net."
                        ),
                        Challenge(
                            id: 2,
                            name: "Deterministic Fixtures",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Why do regression tests use deterministic fixtures?",
                            scenario: Challenge.Scenario(
                                title: "Fixed Test Data",
                                narrative: "ML model regression tests use fixed fixtures rather than random data.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["If input is different every time, how do you know if an output change is due to a bug or different input?"],
                            explanation: "Imagine you're testing a ruler's accuracy. If you measure different objects each time, how do you know if the ruler is accurate? So you always measure the same 30cm stick. If it reads 30cm, it's correct; if it reads 28cm, the ruler is broken. Deterministic fixtures are that \"always 30cm stick\" — fixed inputs ensure a consistent baseline for comparison. With random data, you can't tell if output changes are from bugs or different inputs.",
                            frameworkTip: "Reproducibility is the lifeblood of testing. A flaky test (sometimes passes, sometimes fails) = a worthless test."
                        ),
                    ]
                ),
                Quest(
                    id: "12-3",
                    name: "Release Gate Mechanism",
                    description: "Understand MAPE thresholds, coverage requirements, and canary deployment",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "MAPE Threshold",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the purpose of the MAPE (Mean Absolute Percentage Error) threshold?",
                            scenario: Challenge.Scenario(
                                title: "Forecast Accuracy Threshold",
                                narrative: "Release gates require the forecast model's MAPE to stay below a threshold value.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["MAPE is a forecast error metric; lower is better"],
                            explanation: "MAPE = mean percentage deviation in forecasts. For example, MAPE=5% means forecasts deviate by 5% on average (predicting 100 units when actual could be 95-105). The Release Gate sets a threshold (e.g., 5%); if the new version's MAPE exceeds this, it cannot go live. Like an annual elevator inspection — if the load test fails, it can't operate. In DI, model forecasts directly affect procurement plans; MAPE degrading from 5% to 10% could mean hundreds of thousands in inventory cost differences.",
                            frameworkTip: "ML Release Gate: Accuracy threshold + Regression testing + A/B testing = Safe go-live."
                        ),
                        Challenge(
                            id: 2,
                            name: "Canary Deployment",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the core strategy of canary deployment?",
                            scenario: Challenge.Scenario(
                                title: "Progressive Deployment",
                                narrative: "New versions are not pushed to all users immediately.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Canary = the bird. Canaries were used in coal mines to detect danger first."],
                            explanation: "The canary story: Miners used to bring canaries into mines because canaries are more sensitive to toxic gas — if the canary collapsed, it meant danger. Canary deployment works the same way: push the new version to 5-10% of users (the canary group), monitoring their error rates, latency, and business metrics. If everything is fine, gradually expand (20% → 50% → 100%). If there's a problem, roll back — only 5% of users are affected, not all of them.",
                            frameworkTip: "Deployment risk control: Canary (small traffic) → Monitor → Full rollout. Problems only affect a small number of users."
                        ),
                    ]
                ),
                Quest(
                    id: "12-4",
                    name: "E2E & Smoke Tests",
                    description: "Understand Playwright testing and smoke testing",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Smoke Test Definition",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the purpose of a smoke test?",
                            scenario: Challenge.Scenario(
                                title: "Smoke Testing",
                                narrative: "The first test run after deployment is the smoke test.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Smoke = literally smoke. If it smokes after powering on = there's a problem."],
                            explanation: "The smoke test origin comes from hardware testing: power it on and see if it smokes — smoke = big problem. Software smoke testing is the same — after deployment, spend 2 minutes running a few basic checks: Does the homepage load? Does login work? Do APIs respond? It's not about testing every feature, but quickly confirming \"the system isn't smoking.\" If the smoke test fails, there's no point running the full test suite — just roll back.",
                            frameworkTip: "Post-deployment verification levels: Smoke test (minutes) → Regression test (hours) → Full E2E (longer)."
                        ),
                        Challenge(
                            id: 2,
                            name: "Playwright E2E",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is Playwright's main advantage over Selenium?",
                            scenario: Challenge.Scenario(
                                title: "E2E Testing Framework",
                                narrative: "Decision Intelligence uses Playwright for E2E testing.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Playwright's auto-wait mechanism significantly reduces flaky tests"],
                            explanation: "Playwright is an E2E testing framework developed by Microsoft. Its biggest improvement over the veteran Selenium is auto-wait — it automatically waits for elements to appear and become clickable before interacting, eliminating the need for manual sleep(2000) calls. This drastically reduces flaky tests (tests that intermittently pass and fail). DI uses Playwright to test the entire Golden Path flow, ensuring stable user experience.",
                            frameworkTip: "E2E framework selection criteria: Stability > Speed > Feature richness. Flaky tests are the biggest cost."
                        ),
                    ]
                ),
                Quest(
                    id: "12-5",
                    name: "Guardrail Checks",
                    description: "Understand AI Worker governance controls and action guardrails",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Necessity of Guardrails",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What do AI Worker guardrails primarily prevent?",
                            scenario: Challenge.Scenario(
                                title: "AI Action Guardrails",
                                narrative: "Digital Workers can autonomously execute decisions, but guardrails are needed to limit their scope of action.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Autonomy needs boundaries. The greater the autonomy, the more important the guardrails."],
                            explanation: "Like a driving school car with a dual brake — the student (AI Worker) can drive (autonomous execution), but the instructor (guardrail) can hit the brake at any time. DI's guardrails include: toolPermissionGate (which tools this Worker can use), governanceRulesGate (business rule constraints, e.g., amounts exceeding X require manual approval), and capabilityPolicyGate (mapping task types to model tiers). An AI Worker without guardrails = a driving school car without a dual brake — an accident is inevitable.",
                            frameworkTip: "Three layers of AI governance: Authentication (who are you) → Authorization (what can you do) → Guardrails (what you must not do)."
                        ),
                        Challenge(
                            id: 2,
                            name: "GovernanceAction",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "What is the design principle behind the GovernanceAction mechanism?",
                            scenario: Challenge.Scenario(
                                title: "Governance Action Types",
                                narrative: "Decision Intelligence uses GovernanceAction to define allowed operations.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Least Privilege — the principle of minimum necessary permissions"],
                            explanation: "The least privilege principle in plain terms: \"Unless I explicitly say you can, you can't do anything.\" It's the opposite of what most people expect — rather than listing \"what you can't do\" (blacklist), you list \"what you can do\" (whitelist). Why? Because you can never exhaustively list all dangerous operations, but you can list all safe operations. DI's GovernanceAction follows this design: each Worker can only perform actions explicitly listed on the whitelist.",
                            frameworkTip: "Security design principle: Deny by default, Allow by exception."
                        ),
                    ]
                ),
                Quest(
                    id: "12-6",
                    name: "Quality Report (Boss)",
                    description: "Decide whether a new version can be pushed to Production",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Go/No-Go Decision",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: Challenge.Scenario(
                                title: "Release Review",
                                narrative: "You are the Release Manager. The new version's test report is as follows:\n- Unit tests: 98% pass (2 flaky)\n- Regression MAPE: 4.2% (threshold 5%)\n- E2E: 95% pass (1 failed: PDF export)\n- Coverage: 78% (requirement 80%)\n- Canary (5% traffic): No errors, latency +3%",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Coverage 78% < 80% threshold — is this a hard requirement?", "One E2E failure could be flaky or a real bug"],
                            explanation: "Good release decisions require: (1) Distinguishing blocking vs non-blocking issues (2) Assessing risk levels (3) Providing alternatives.",
                            frameworkTip: "Release decision framework: Must-have gates (must pass) vs Nice-to-have (recommended) vs Known issues (acceptable)."
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 13,
            name: "ML API Backend Deep Dive",
            emoji: "🧠",
            description: "Understand ML API authentication, multi-tenancy, rate limiting, and async operation mechanisms",
            quests: [
                Quest(
                    id: "13-1",
                    name: "JWT Authentication Mechanism",
                    description: "Understand HS256, JWTClaims, stateless auth",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "JWT Basics",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Why is JWT authentication called \"stateless\"?",
                            scenario: Challenge.Scenario(
                                title: "JWT Authentication",
                                narrative: "The ML API uses JWT (JSON Web Token) for stateless authentication.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Session-based auth requires the server to remember each user's state"],
                            explanation: "JWT encodes user information within the token (self-contained); the server only needs to verify the signature, without querying a session store.",
                            frameworkTip: "Benefits of stateless auth: Easy horizontal scaling — any server can verify the token."
                        ),
                        Challenge(
                            id: 2,
                            name: "HS256 Signing",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What characterizes HS256 (HMAC-SHA256) signing?",
                            scenario: Challenge.Scenario(
                                title: "JWT Signing Algorithm",
                                narrative: "The ML API uses HS256 to sign JWTs.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["HMAC = Hash-based Message Authentication Code, uses a shared secret"],
                            explanation: "HS256 is symmetric signing: signing and verification use the same secret. Suitable for a single service or trusted service clusters. For cross-organization verification, use RS256 (asymmetric).",
                            frameworkTip: "HS256 vs RS256: Internal services → HS256 (simple). Cross-organization → RS256 (public key can be safely shared)."
                        ),
                        Challenge(
                            id: 3,
                            name: "Public Paths",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Why doesn't the health check endpoint /healthz require JWT authentication?",
                            scenario: Challenge.Scenario(
                                title: "Unauthenticated Paths",
                                narrative: "Certain API paths don't require JWT, such as /healthz.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Load balancers need to periodically check if backend services are alive"],
                            explanation: "Health check endpoints must be public so infrastructure (LB, K8s) can seamlessly monitor service status.",
                            frameworkTip: "Public paths principle: Only infrastructure endpoints and public information. Any endpoint with user data requires authentication."
                        ),
                    ]
                ),
                Quest(
                    id: "13-2",
                    name: "Multi-Tenancy & Role Control",
                    description: "Understand GovernanceAction, role enforcement, least privilege",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Multi-Tenant Isolation",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "In a multi-tenant architecture, what is the most critical security requirement?",
                            scenario: Challenge.Scenario(
                                title: "Multi-tenant Architecture",
                                narrative: "Multiple companies share the same ML API instance.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Imagine the consequences if Company A's forecast data were visible to Company B"],
                            explanation: "Data isolation is the most critical aspect of multi-tenancy. Every API request must verify the tenant_id to ensure access is limited to that tenant's data.",
                            frameworkTip: "Three layers of multi-tenant security: Authentication (who) → Tenant identification (which company) → Data isolation (see only your own)."
                        ),
                        Challenge(
                            id: 2,
                            name: "Least Privilege Principle",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the correct application of the Least Privilege principle?",
                            scenario: Challenge.Scenario(
                                title: "Least Privilege",
                                narrative: "The role system design follows the principle of least privilege.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["\"Just enough\" rather than \"conveniently generous\""],
                            explanation: "Least privilege principle: Grant only the minimum permissions needed to complete a specific task. This reduces the risk of privilege abuse and accidental operations.",
                            frameworkTip: "Permission design: First list the role's specific tasks, then authorize one by one. Each extra permission is one more risk."
                        ),
                    ]
                ),
                Quest(
                    id: "13-3",
                    name: "Rate Limiting",
                    description: "Understand InProcess vs Redis, sliding window, graceful degradation",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Why Rate Limiting Is Needed",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What does rate limiting primarily prevent?",
                            scenario: Challenge.Scenario(
                                title: "Rate Limiting",
                                narrative: "The ML API sets request frequency limits per tenant.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Noisy neighbor = one tenant uses too many resources, everyone else is affected."],
                            explanation: "Rate limiting prevents the noisy neighbor problem: one tenant's excessive usage won't slow down other tenants. It also protects against DDoS attacks.",
                            frameworkTip: "Rate limiting protects three things: System stability, fairness, security."
                        ),
                        Challenge(
                            id: 2,
                            name: "InProcess vs Redis",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "When should you choose Redis rate limiter over InProcess?",
                            scenario: Challenge.Scenario(
                                title: "Two Rate Limiter Implementations",
                                narrative: "The ML API supports both InProcess (in-memory) and Redis rate limiters.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["InProcess counters only exist in a single process's memory"],
                            explanation: "In plain terms: you've opened 3 branch stores (3 ML API instances), each with its own counter. If the limit is 10 requests per person per minute, with InProcess the same person can go to all 3 stores for 10 each = 30 total. With Redis, all 3 stores share one counter, truly limited to 10 requests.",
                            frameworkTip: "Distributed systems need centralized state (like Redis) for coordination. Single machines can use in-memory."
                        ),
                        Challenge(
                            id: 3,
                            name: "Graceful Degradation",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "When Redis is unavailable, which approach is most reasonable?",
                            scenario: Challenge.Scenario(
                                title: "Design Decision: What If Redis Goes Down",
                                narrative: "DI's Rate Limiter automatically degrades to the InProcess version when Redis is unavailable. A colleague asks: \"Why not just let all requests through? Redis is only temporarily down.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["Think about whether \"no protection at all\" or \"blocking everything\" carries more risk", "Graceful degradation = continue operating with a suboptimal solution"],
                            explanation: "DI's approach is C — degrade to InProcess. Letting everything through (A) poses security risks; blocking everything (B) is essentially a self-inflicted outage. Degrading to single-machine rate limiting isn't perfectly accurate (each instance counts independently with multiple instances), but at least each machine has basic protection. This is the spirit of graceful degradation: when a dependency fails, continue operating with a suboptimal solution rather than crashing.",
                            frameworkTip: "When designing features that depend on external services, always ask: \"What happens if it goes down?\" Three options: degrade, retry, fail. Don't choose \"pretend nothing happened.\""
                        ),
                    ]
                ),
                Quest(
                    id: "13-4",
                    name: "Async Operation System",
                    description: "Understand AsyncRunService and job state transitions",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Job State Transitions",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the correct job state transition flow?",
                            scenario: Challenge.Scenario(
                                title: "AsyncRunService State Machine",
                                narrative: "Async operations have well-defined state transitions.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["After submission, the task waits (pending), starts executing (running), then has three possible outcomes"],
                            explanation: "State transitions: pending (waiting) → running (executing) → completed (success) / failed (failure) / cancelled (cancelled).",
                            frameworkTip: "State machine design: Transition conditions for each state must be explicit; no illegal jumps allowed."
                        ),
                        Challenge(
                            id: 2,
                            name: "Job Cancellation Mechanism",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "When cancelling a running operation, what should the system do?",
                            scenario: Challenge.Scenario(
                                title: "Cancelling Long-Running Operations",
                                narrative: "A user wants to cancel a forecast task that has been running for 5 minutes.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Graceful shutdown allows resources to be properly released"],
                            explanation: "Correct approach: Mark cancelled → Notify worker → Worker checks the flag and stops gracefully → Release resources. You cannot kill the process directly as it causes resource leaks.",
                            frameworkTip: "Cancellation pattern: Cooperative cancellation. Not \"kill\" but \"please stop.\" The worker decides when to stop."
                        ),
                    ]
                ),
                Quest(
                    id: "13-5",
                    name: "Telemetry & SSE",
                    description: "Understand solver telemetry, Prometheus metrics, SSE streaming",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "SSE vs WebSocket",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the main reason for choosing SSE over WebSocket?",
                            scenario: Challenge.Scenario(
                                title: "Real-time Streaming Choice",
                                narrative: "The ML API uses SSE (Server-Sent Events) to push real-time solver progress.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Solver progress is a one-way data stream from server → client"],
                            explanation: "SSE is one-way (server → client) streaming, implemented over HTTP, simple and lightweight. WebSocket is bidirectional communication, suitable for scenarios requiring two-way interaction like chat.",
                            frameworkTip: "Choosing communication protocols: One-way push → SSE. Bidirectional interaction → WebSocket. Simple beats complex."
                        ),
                        Challenge(
                            id: 2,
                            name: "Prometheus Metrics",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which of the following is NOT a typical ML API monitoring metric?",
                            scenario: Challenge.Scenario(
                                title: "Monitoring Metrics",
                                narrative: "The ML API exposes Prometheus-formatted metrics.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["Monitoring metrics focus on runtime behavior, not the development process"],
                            explanation: "Runtime monitoring metrics: latency, throughput, error rate, resource utilization. Lines of code is a development metric, not a runtime metric.",
                            frameworkTip: "RED Method: Rate (throughput), Errors (errors), Duration (latency) — three key service monitoring metrics."
                        ),
                    ]
                ),
                Quest(
                    id: "13-6",
                    name: "API Security Architecture Review (Boss)",
                    description: "Review the ML API's security design",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Security Architecture Review Report",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: Challenge.Scenario(
                                title: "Security Review",
                                narrative: "You are asked to review the ML API's security architecture and report findings to the security team.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["If the HS256 secret is leaked, all tokens can be forged", "Multi-tenant isolation needs to be enforced at every query level"],
                            explanation: "A security review isn't about finding fault — it's about systematically evaluating whether defense layers are complete.",
                            frameworkTip: "Security review framework: Authentication → Authorization → Data Protection → Monitoring → Incident Response"
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 14,
            name: "Boundaries & Limitations",
            emoji: "🚧",
            description: "Understand Decision Intelligence's operational boundaries and known limitations",
            quests: [
                Quest(
                    id: "14-1",
                    name: "Frontend-Only Partial Startup",
                    description: "Understand what the frontend can do without a backend",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Partial Startup Capability",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "In frontend-only mode, which feature is still available?",
                            scenario: Challenge.Scenario(
                                title: "Frontend-Only Mode",
                                narrative: "When both the ML API and Supabase are unreachable, the frontend can still start.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["No backend = no authentication, no data, no computation"],
                            explanation: "Like a restaurant with a power outage but natural light — you can go in and look at the menu and decor (UI and static pages), but you can't order food, cook, or pay the bill (login, data access, ML forecasting). In frontend-only mode, all backend-dependent features fail: Supabase unreachable (no data), ML API unreachable (no forecasting), auth service unreachable (can't log in). But the page skeleton, components, and static text are still visible.",
                            frameworkTip: "Understand the system's degraded mode: which features are core (require backend), which can operate in degraded mode."
                        ),
                        Challenge(
                            id: 2,
                            name: "Degradation Strategy",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the best way for the frontend to handle backend unavailability?",
                            scenario: Challenge.Scenario(
                                title: "Graceful Degradation",
                                narrative: "The design team discusses how the frontend should handle backend unavailability.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["User experience first: Tell the user what happened and what to do"],
                            explanation: "Good degradation experience is like an airline handling a flight delay: (1) Tell you what happened (\"Backend service temporarily unavailable\") (2) Explain the impact scope (\"Forecast and data features are temporarily unavailable\") (3) Provide alternatives or timeline (\"Expected recovery within 30 minutes, or contact support@...\"). Worst handling: filling with fake data and pretending nothing's wrong (users making decisions based on fake data = disaster) or infinite retries (browser crashes).",
                            frameworkTip: "Degradation design principles: Inform → Guide → Fallback. Users must always know what's happening."
                        ),
                    ]
                ),
                Quest(
                    id: "14-2",
                    name: "SAP Adapter Boundaries",
                    description: "Understand that adapter ≠ turnkey connector",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Adapter vs Connector",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the correct description of the SAP adapter?",
                            scenario: Challenge.Scenario(
                                title: "SAP Integration Boundaries",
                                narrative: "Decision Intelligence has an SAP adapter, but clients expect a one-click integration.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Adapter ≠ Turnkey. Every enterprise's SAP setup is different."],
                            explanation: "The difference between an adapter and a connector is like an \"adapter plug\" versus a \"universal outlet.\" The SAP adapter is an adapter plug — it provides a framework (schema mapping to align fields between both sides, API bridging for communication), but you need to wire it yourself. Because every company's SAP is different: different versions (S/4HANA vs ECC), different modules (some use MM but not PP), different custom fields (you added 10 custom fields). So there's no \"one-click connect to all SAP\" universal outlet.",
                            frameworkTip: "When communicating integrations to clients: Clearly state \"what we provide\" and \"what the client needs to do.\" Manage expectations."
                        ),
                        Challenge(
                            id: 2,
                            name: "Locked Contracts",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "What is the main reason for locking data contracts?",
                            scenario: Challenge.Scenario(
                                title: "Locked Contracts",
                                narrative: "The SAP adapter's data contracts are locked and cannot be arbitrarily modified.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["In a multi-tenant environment, one client's changes could affect other clients"],
                            explanation: "Imagine a highway interchange standard — if every city could modify its own interchange width and slope, every vehicle passing through would need to readjust, and accident rates would skyrocket. Locked data contracts work the same way: DI's SAP adapter defines a fixed schema (which fields, what format, what types), and all clients use the same contract. If Client A wants to change field names and Client B wants to change data types, the testing matrix would explode (N clients × M schemas = chaos), and one client's changes could affect other clients in the multi-tenant environment.",
                            frameworkTip: "Platform vs customization tension: Platform stability > Individual client customization needs. Use configuration, not code changes, to accommodate differences."
                        ),
                    ]
                ),
                Quest(
                    id: "14-3",
                    name: "Optional ML Footprint",
                    description: "Understand Chronos exclusion and lean/full runtime",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Lean vs Full Runtime",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the difference between Lean and Full runtime?",
                            scenario: Challenge.Scenario(
                                title: "Two Deployment Versions",
                                narrative: "The ML API has lean and full runtime versions.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Chronos brings ~700MB of PyTorch dependencies"],
                            explanation: "Chronos is the time-series forecasting engine; its underlying PyTorch dependency alone consumes ~700MB. Full runtime includes Chronos with an image of approximately 1.5GB; Lean excludes Chronos, reducing the image to ~800MB. Like a full vs lite version of a phone app — if you don't use offline maps, why take up an extra 500MB? Clients who don't need time-series forecasting (only using solver and data validation) can use the lean version to save memory, deployment time, and cost.",
                            frameworkTip: "Optional feature design: Core features always-on + heavyweight features opt-in. Reduce the burden of minimum deployment."
                        ),
                        Challenge(
                            id: 2,
                            name: "When to Use Full",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which scenario requires the Full runtime?",
                            scenario: Challenge.Scenario(
                                title: "Version Selection Decision",
                                narrative: "A client needs to decide whether to deploy the lean or full version.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Chronos is the time-series forecasting engine, only available in the full version"],
                            explanation: "Chronos is exclusive to the Full runtime. If the client needs \"forecasting next month's demand per SKU\" — that kind of time-series forecasting — they must use Full. But if they only need solver (optimizing procurement plans), validation (data verification), and async runs (asynchronous operations) — all of these are available in the Lean version. Decision principle: Start with Lean, upgrade to Full only when the client explicitly says \"I need forecasting.\"",
                            frameworkTip: "Deployment decision: Start with the minimum viable version (lean), upgrade only when there's a clear requirement (full)."
                        ),
                    ]
                ),
                Quest(
                    id: "14-4",
                    name: "Documentation Reading Path",
                    description: "Understand the recommended documentation reading order",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Recommended Reading Order",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the most logical documentation reading order?",
                            scenario: Challenge.Scenario(
                                title: "New Employee Onboarding",
                                narrative: "A newly joined engineer asks: \"There's so much documentation — where should I start reading?\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["First understand \"what,\" then \"how it's built,\" then \"how it runs\""],
                            explanation: "Like getting to know a city: First look at the map (Product Spec — the city's planning philosophy and functional zones) → Then look at building floor plans (Architecture — how systems connect) → Then read the transit guide (API Docs — how systems communicate) → Finally read the construction manual (Deployment Guide — how to get it running). If you start with the construction manual, you'll get lost in details not knowing what you're building. Understanding \"why\" before \"how\" makes learning most efficient.",
                            frameworkTip: "Order for learning a new project: Why → What → How → Where. Understand the purpose before examining details."
                        ),
                        Challenge(
                            id: 2,
                            name: "Spec vs Status",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the main difference between Spec and Status documents?",
                            scenario: Challenge.Scenario(
                                title: "Document Type Distinction",
                                narrative: "The project has Spec documents and Status documents, which serve different purposes.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Spec = specification (goal), Status = state (reality). There may be a gap between them."],
                            explanation: "A Spec is the \"architectural blueprint\" — describing what we want to build and why. Status is the \"construction progress report\" — describing where we are now, what's complete, and what's not. The key is the gap between them: If the Spec says there should be 5 API endpoints and the Status says only 3 are done → the gap = 2 endpoints of technical debt. When reading documentation, pay special attention to this gap — it provides clues about risk, workload, and priorities.",
                            frameworkTip: "When reading documents, watch for the gap between Spec and Status — that's where risk and opportunity lie."
                        ),
                    ]
                ),
                Quest(
                    id: "14-5",
                    name: "Operational Boundaries Overview",
                    description: "Understand env var guardrails and execution limits",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Execution Limits",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the main reason for setting operational boundaries (e.g., max request size, timeout duration)?",
                            scenario: Challenge.Scenario(
                                title: "Operational Boundaries",
                                narrative: "The ML API has various execution limits, such as request size and timeout duration.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["A single oversized request or overly long computation can bring down the entire system"],
                            explanation: "Like an elevator's weight limit — it's not that the elevator is bad, it's protecting it from overloading and breaking. DI's guardrails work the same way: DI_MAX_ROWS_PER_SHEET=2,000,000 limits each sheet to 2 million rows (prevents memory overflow), DI_SOLVER_MAX_SECONDS=90 limits solving to 90 seconds max (prevents CPU lockup), DI_SOLVER_MAX_CONCURRENT=3 limits 3 concurrent solves (prevents server crash). Without these limits, a single abnormal large request could bring down the entire system, affecting all users.",
                            frameworkTip: "Defensive design: Assume all inputs could be malicious or abnormal. Set reasonable boundaries."
                        ),
                        Challenge(
                            id: 2,
                            name: "Environment Variable Guardrails",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the benefit of controlling operational boundaries via environment variables?",
                            scenario: Challenge.Scenario(
                                title: "Env Var Guardrails",
                                narrative: "Operational boundaries are controlled through environment variables.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Changing environment variables only requires a service restart, not a rebuild and redeploy"],
                            explanation: "Benefits of environment variables: Set DI_SOLVER_MAX_SECONDS=30 for dev (quick testing) and 90 for prod (production run). Need to adjust limits? Change the env var and restart the service — no code changes, no repackaging, no redeployment needed. This is the 12-Factor App principle — separate configuration from code. Practical scenario: At 3 AM you discover too many solver timeouts; ops can change MAX_SECONDS from 90 to 120 and restart — done in 5 minutes. If hardcoded, you'd have to wait for an engineer to change code → PR review → deploy → could take a full day.",
                            frameworkTip: "12-Factor App principle: Store configuration in environment variables. Let the same code behave differently in different environments."
                        ),
                    ]
                ),
                Quest(
                    id: "14-6",
                    name: "Communicating Limitations (Boss)",
                    description: "Professionally reply to a client's SAP integration question",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Client Communication: SAP Integration Limitations",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: Challenge.Scenario(
                                title: "Client Email Reply",
                                narrative: "A client writes: \"We use SAP S/4HANA and want to sync all data to Decision Intelligence with one click. Can your SAP adapter do this? We hope to go live next month.\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["Don't say \"can't do it\" directly; instead say \"here are the steps needed\"", "Offer an assessment process rather than a vague promise"],
                            explanation: "Communicating limitations is a core skill for product managers and solutions engineers. Honesty + professionalism + providing alternatives = maintaining trust.",
                            frameworkTip: "Limitation communication formula: Acknowledge (understand the need) → Clarify (explain the situation) → Offer (provide a plan) → Next Step (what happens next)"
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 39,
            name: "Negotiation Engine & Simulation System",
            emoji: "🎯",
            description: "Understand CFR game theory negotiation and Digital Twin supply chain simulation",
            quests: [
                Quest(
                    id: "39-1",
                    name: "CFR Fundamentals",
                    description: "Understand the core principles of the CFR+ algorithm",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "What Is CFR+",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the most accurate description of CFR+ (Counterfactual Regret Minimization Plus)?",
                            scenario: Challenge.Scenario(
                                title: "CFR+ Algorithm Positioning",
                                narrative: "Your colleague asks: \"What technology does DI's negotiation engine use?\" You need to explain the essence of CFR+ in one sentence.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Think about what \"Counterfactual\" and \"Regret\" in the CFR name each represent"],
                            explanation: "CFR+ is an equilibrium-solving algorithm from game theory. In plain terms: it simulates 50,000 negotiations, calculating \"regret values\" after each round (how much more would I have earned if I had chosen a different action?), then adjusts the strategy to minimize regret. After enough iterations, the strategy converges to a Nash Equilibrium — no matter how the opponent changes tactics, your strategy won't lose out. This has mathematical proof behind it; it's not just \"sounds reasonable\" advice.",
                            frameworkTip: "Distinguishing AI methods: LLMs excel at language tasks; CFR excels at strategic games. Choose tools based on the problem's nature."
                        ),
                        Challenge(
                            id: 2,
                            name: "Why Not Use ChatGPT for Negotiation",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is CFR+'s most critical advantage over ChatGPT in negotiation scenarios?",
                            scenario: Challenge.Scenario(
                                title: "ChatGPT vs CFR+",
                                narrative: "The boss asks: \"We already have ChatGPT — why do we need to build a CFR negotiation engine?\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Negotiation is a game; what's needed is an optimal strategy, not the best-sounding words"],
                            explanation: "The core of negotiation is strategy, not rhetoric. ChatGPT can help you think of what to say (rhetoric), but it cannot guarantee the strategy is mathematically optimal. CFR+, through 50,000 simulations and convergence, finds the Nash Equilibrium — like GTO (Game Theory Optimal) strategy in Texas Hold'em poker: a mathematically proven optimal solution, not a gut-feeling guess.",
                            frameworkTip: "Technology selection principle: Need \"optimal strategy\" → use optimization algorithms. Need \"natural language\" → use LLMs. Not everything needs GPT."
                        ),
                    ]
                ),
                Quest(
                    id: "39-2",
                    name: "Game Tree & Position Buckets",
                    description: "Understand how negotiations are modeled as decision trees",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Position Bucket Grading",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "How are the 5 Position Bucket levels divided?",
                            scenario: Challenge.Scenario(
                                title: "Buyer Bargaining Power Grading",
                                narrative: "DI's negotiation engine uses Position Buckets to classify buyer bargaining power into 5 levels based on risk score (risk_score).",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Low risk_score means low supply chain risk, more buyer alternatives, naturally stronger bargaining power"],
                            explanation: "The formula is bucket = max(0, floor((199 - risk_score) / 40)), divided into 5 levels: VERY_STRONG (risk 0-39) → STRONG (40-79) → NEUTRAL (80-119) → WEAK (120-159) → VERY_WEAK (160+). The logic is intuitive: the lower your supply chain risk (more alternative suppliers, readily available items), the stronger your negotiating position; conversely, if the supplier is the sole source and the item is scarce, you have little leverage.",
                            frameworkTip: "Benefit of quantifying bargaining power: Avoids subjective judgments like \"I think we have a strong position\" — let the data speak."
                        ),
                        Challenge(
                            id: 2,
                            name: "Buckets vs Continuous Scores",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "What is the main reason for using discrete buckets instead of continuous scores?",
                            scenario: Challenge.Scenario(
                                title: "Discrete vs Continuous",
                                narrative: "Someone asks: \"Why not feed the risk_score (0-200) directly into CFR as a continuous value instead of first bucketing it into 5 levels?\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["CFR's computational complexity is proportional to the number of information sets"],
                            explanation: "This is a precision-efficiency trade-off. CFR's game tree stores \"cumulative regret values\" and \"average strategies\" at every node; more information sets mean more memory and computation. 200 scores × 3 supplier types × 3 rounds × 3 actions = explosion. 5 buckets compress the state space to a manageable size, and in practice, a 5-point difference in risk_score doesn't actually change the negotiation strategy.",
                            frameworkTip: "Common trade-off in system design: Precision vs efficiency. Many times \"good enough\" is more practical than \"perfect.\""
                        ),
                    ]
                ),
                Quest(
                    id: "39-3",
                    name: "Negotiation Engine Flow",
                    description: "Understand trigger conditions, standard options, and fallback",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Trigger Conditions",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What triggers the negotiation engine?",
                            scenario: Challenge.Scenario(
                                title: "When to Start Negotiation",
                                narrative: "Not every procurement needs negotiation. DI only triggers the negotiation engine under specific conditions.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["If the solver can already find a good solution on its own, why bother negotiating?"],
                            explanation: "The negotiation engine triggers in two situations: (1) Solver infeasible — no solution found that satisfies all constraints under current conditions (e.g., budget insufficient for minimum order quantities); (2) KPIs not met — a solution was found but metrics are unsatisfactory. The system then attempts to \"negotiate conditions with the supplier\" to relax constraints so the solver can find a better solution.",
                            frameworkTip: "Automation trigger design: Not \"always on,\" but \"activated when needed.\" Saves resources and avoids unnecessary negotiations."
                        ),
                        Challenge(
                            id: 2,
                            name: "6 Standard Options",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which of the following is NOT one of DI negotiation engine's 6 standard options?",
                            scenario: Challenge.Scenario(
                                title: "What Can Be Negotiated",
                                narrative: "DI's negotiation engine has 6 standard negotiation options, each representing a negotiable condition.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["All 6 options adjust conditions within the same supplier framework, not switching suppliers"],
                            explanation: "The 6 standard options are: (1) Budget +10% (increase budget), (2) MOQ relax (relax minimum order quantity), (3) Pack rounding (flexible pack size rounding), (4) Expedite (rush delivery), (5) Safety stock (adjust safety stock), (6) Target -5% (lower target). These are all specific conditions that can be negotiated with suppliers or adjusted internally. \"Switch suppliers\" is not included because that's an entirely different decision process.",
                            frameworkTip: "Negotiation option design: Each option is quantifiable with clear boundaries. Not vague instructions like \"try to get it cheaper.\""
                        ),
                        Challenge(
                            id: 3,
                            name: "When CFR Lookup Table Is Unavailable",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "What should the system do when the CFR lookup table is unavailable?",
                            scenario: Challenge.Scenario(
                                title: "Graceful Fallback",
                                narrative: "The CFR lookup table is pre-computed. But what if you encounter a bucket/supplier combination that wasn't covered during training and can't find a strategy?",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["A good system always has a Plan B. CFR is a bonus, not a requirement."],
                            explanation: "This is the DEFAULT_CFR_INFLUENCE = 0.30 design in DI. CFR strategies and lexicographic ranking (solutions ordered by business priority) are blended at a 70:30 weight ratio. If CFR can't find a strategy, influence drops to zero, and it fully uses lexicographic ranking. This is graceful fallback — the system doesn't crash because CFR fails; instead, it falls back to a \"reasonable but suboptimal\" backup plan. Like a navigation app falling back to offline maps when there's no network.",
                            frameworkTip: "Graceful degradation principle: When advanced features (CFR) break, basic features (ranking logic) must still work."
                        ),
                    ]
                ),
                Quest(
                    id: "39-4",
                    name: "Digital Twin Simulation",
                    description: "Understand how ChaosEngine simulates supply chain disasters",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "What ChaosEngine Does",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is ChaosEngine's primary purpose?",
                            scenario: Challenge.Scenario(
                                title: "Supply Chain Stress Testing",
                                narrative: "In the real world, you can't \"replay\" a supply chain disaster. But DI's ChaosEngine can create all kinds of trouble in a simulated environment.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Chaos = disorder. Chaos Engineering core idea: Proactively create chaos to discover weaknesses."],
                            explanation: "ChaosEngine simulates 5 types of trouble: (1) supplier_delay (supplier delay, base probability 8%), (2) port_strike (port strike, 0.5%), (3) quality_issue (quality problem, 3%), (4) demand_spike (demand surge, 2%), (5) raw_material_shortage (raw material shortage, 1%). Each event has 4 severity levels (low → critical) with varying impact. The purpose is to \"rehearse\" before placing orders to see if your plan can withstand surprises.",
                            frameworkTip: "Netflix invented Chaos Monkey to randomly kill servers. DI's ChaosEngine applies the same idea to supply chains."
                        ),
                        Challenge(
                            id: 2,
                            name: "Murphy's Law Setting",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What does ChaosEngine's Murphy's Law setting do?",
                            scenario: Challenge.Scenario(
                                title: "Bad Things Are More Likely at the Worst Time",
                                narrative: "ChaosEngine has a \"Murphy's Law\" setting.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Murphy's Law: If something bad can happen, it will happen at the worst possible time"],
                            explanation: "The Murphy's Law logic: when inventory / daily_demand < 7 days, event probability × 1.5. In plain terms: when your inventory is already tight, bad things are more likely to happen. This mirrors reality — you're out of stock and the supplier happens to delay; you're busiest when quality issues strike. This setting makes the simulation closer to the real world's \"unfortunate coincidences.\"",
                            frameworkTip: "Good simulations consider \"correlation\" — bad events don't happen independently; they're more likely to occur together at the worst times."
                        ),
                    ]
                ),
                Quest(
                    id: "39-5",
                    name: "Simulation Scenarios & Feedback",
                    description: "Understand four scenario purposes and FeedbackLoop",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Four Scenario Purposes",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which description of scenario purposes is most accurate?",
                            scenario: Challenge.Scenario(
                                title: "Simulation Scenario Selection",
                                narrative: "ChaosEngine has an intensity multiplier that can simulate different stress level scenarios.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Different intensity tests answer different questions: Can it handle normal conditions? What about high stress? Extreme conditions?"],
                            explanation: "The intensity multiplier determines the probability multiplier for anomalous events: calm=0.3x (almost nothing happens, used to establish a baseline for normal conditions), low=0.6x (light stress), medium=1.0x (standard stress test), high=1.8x (severe stress), extreme=3.0x (disaster level). Like earthquake simulations testing magnitude 3, 5, and 7 — you need to know how your plan performs under different pressure levels.",
                            frameworkTip: "Stress testing best practice: Normal → Stress → Extreme, gradually increasing pressure to find the plan's \"breaking point.\""
                        ),
                        Challenge(
                            id: 2,
                            name: "FeedbackLoop Recommendations",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "When fill_rate is 92% (below the 95% target), what is FeedbackLoop's most likely recommendation?",
                            scenario: Challenge.Scenario(
                                title: "fill_rate Below Target",
                                narrative: "Simulation results are in: fill_rate = 92% (target 95%). How will FeedbackLoop respond?",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Insufficient fill_rate usually means insufficient inventory; the most direct fix is increasing safety stock"],
                            explanation: "FeedbackLoop's configuration: min_fill_rate_pct=95, safety_stock_uplift_pct=20, max_iterations=3. When fill_rate < 95%, the system recommends increasing safety stock by 20%. Why 20%? It's an empirical value — too little has no effect, too much wastes capital. Maximum 3 iterations (increase → re-simulate → still not enough then increase again → up to three rounds) prevents endless adjustments. If 3 rounds still don't meet the target, it's handed to human decision-making.",
                            frameworkTip: "Automatic adjustments must have limits (max_iterations=3). An unlimited automatic adjustment loop is more dangerous than not adjusting at all."
                        ),
                    ]
                ),
                Quest(
                    id: "39-6",
                    name: "Negotiation Strategy Design (Boss)",
                    description: "Combine CFR and simulation knowledge to design a negotiation strategy",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Negotiation Strategy Design",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: Challenge.Scenario(
                                title: "Complete Negotiation Scenario",
                                narrative: "You have the following information:\n- risk_score = 45 (Position Bucket = STRONG)\n- Estimated supplier type: 60% cooperative, 30% aggressive, 10% desperate seller\n- CFR strategy recommendation: Round 1 \"counter-offer,\" Round 2 \"concede,\" Round 3 \"accept\"\n- Available negotiation options: Budget +10%, MOQ relax, Expedite\n- Simulation result: current fill_rate = 91% (target 95%)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["STRONG bucket means you have an advantage; you can start strong then concede", "The fill_rate issue can be addressed through Expedite or Safety stock options"],
                            explanation: "A good negotiation strategy requires: (1) Knowing where your advantage lies (STRONG bucket = alternative suppliers exist) (2) Having a clear concession sequence (concede low-cost items first) (3) Incorporating business issues (fill_rate) into negotiation terms (4) Always having a Plan B.",
                            frameworkTip: "Negotiation framework: Know yourself (bucket) → Know your opponent (supplier type) → Strategy (CFR) → Contingency (fallback)."
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 40,
            name: "Closed-Loop Learning System",
            emoji: "🔄",
            description: "Understand Drift Detection, Style Learning, and closed-loop orchestration",
            quests: [
                Quest(
                    id: "40-1",
                    name: "Model Degradation Causes",
                    description: "Understand Data Drift and Concept Drift",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Data Drift vs Concept Drift",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the core difference between Data Drift and Concept Drift?",
                            scenario: Challenge.Scenario(
                                title: "Two Types of Drift",
                                narrative: "Your forecast model had 95% accuracy last month but dropped to 80% this month. You need to determine which type of drift is occurring.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Imagine predicting ice cream sales: Data Drift = suddenly encountering temperatures never seen before; Concept Drift = the effect of temperature on sales has changed"],
                            explanation: "Data Drift means the \"appearance\" of inputs has changed — order volumes used to be 100-500, now suddenly 2,000+ appears. The model hasn't seen this data and doesn't know how to predict. Concept Drift means the \"rules\" have changed — \"promotion → sales up 50%\" used to hold, but now the market is saturated and \"promotion → only up 10%.\" Same inputs but different outcome patterns.",
                            frameworkTip: "First step in diagnosing drift: Check PSI (input distribution). High PSI = Data Drift. Normal PSI but high MAPE = likely Concept Drift."
                        ),
                        Challenge(
                            id: 2,
                            name: "Which Is Harder to Handle",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "Why is Concept Drift usually harder to handle than Data Drift?",
                            scenario: Challenge.Scenario(
                                title: "Drift Severity Comparison",
                                narrative: "The interviewer asks: \"Which is harder to handle, Data Drift or Concept Drift? Why?\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Data Drift can be fixed by retraining with new data (data reflects new reality), but Concept Drift means the old model assumptions themselves are wrong"],
                            explanation: "The solution for Data Drift is relatively straightforward: retrain with new data so the model \"sees\" the new distribution. But Concept Drift means the \"rules\" between inputs and outputs have changed, potentially requiring: (1) adding new features to capture the reason for change, (2) changing model architecture, (3) shortening the training window to use only recent data. Retraining may not help because the problem isn't data volume but model assumptions.",
                            frameworkTip: "ML debugging order: Data Drift → Retrain. Concept Drift → Check features, check model assumptions."
                        ),
                    ]
                ),
                Quest(
                    id: "40-2",
                    name: "Drift Detection: Three Metrics",
                    description: "Understand the significance of PSI, MAPE change, and Coverage",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "What PSI > 0.2 Means",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What does PSI (Population Stability Index) > 0.2 indicate?",
                            scenario: Challenge.Scenario(
                                title: "PSI Metric",
                                narrative: "DI's drift_monitor.py sets the PSI threshold at 0.2.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["PSI compares \"what the data looked like during training\" vs \"what the data looks like now\""],
                            explanation: "PSI measures the difference between two distributions. < 0.1 = stable (data looks about the same), 0.1-0.2 = some drift (worth watching), > 0.2 = significant drift (trigger alert). In plain terms, it's like a thermometer — PSI > 0.2 means \"the data has a fever,\" looking too different from what the model saw during training.",
                            frameworkTip: "Remember three PSI thresholds: < 0.1 normal, 0.1-0.2 watch, > 0.2 alert."
                        ),
                        Challenge(
                            id: 2,
                            name: "Scenario Diagnosis: MAPE Up but PSI Normal",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "MAPE is rising but PSI is normal — what is the most likely cause?",
                            scenario: Challenge.Scenario(
                                title: "Contradictory Metrics",
                                narrative: "The monitoring dashboard shows: MAPE increased by 15% (threshold 10%), but PSI = 0.08 (normal).",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Normal PSI = inputs look the same as before. High MAPE = predictions are getting worse. Inputs haven't changed but predictions are worse → what changed?"],
                            explanation: "This is a classic Concept Drift symptom. Normal PSI means the input data distribution hasn't changed (order volumes, category proportions are about the same as before). But MAPE spiking means predictions are increasingly inaccurate. Put together: same inputs, but the model's predictions are increasingly off → because the \"rules\" between inputs and outputs have changed. For example, \"promotion → sales up 50%\" now only up 10% — the input (promotion event) hasn't changed, but the effect has.",
                            frameworkTip: "Cross-metric diagnosis: High PSI + High MAPE = Data Drift. Normal PSI + High MAPE = Concept Drift. Both normal = Model healthy."
                        ),
                    ]
                ),
                Quest(
                    id: "40-3",
                    name: "Retraining Triggers",
                    description: "Understand Cooldown, four rules, proactive vs reactive",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Cooldown Mechanism",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the main purpose of a retraining cooldown (24-hour cooling period)?",
                            scenario: Challenge.Scenario(
                                title: "Why Not Retrain Immediately",
                                narrative: "Drift has been detected, but the system won't retrain immediately. There's a 24-hour cooldown.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["If you retrain at every slight drift detection, you might train 10 times a day with different results each time"],
                            explanation: "Configuration: cooldown_hours=24, max_retrain_per_day=3. Without a cooldown, a single fluctuation could trigger cascading retrains: data during training itself triggers drift detection → retrains again → infinite loop. The cooldown ensures enough \"observation time\" between retrains to confirm whether retraining actually improved things. Like not taking a fever reducer every 5 minutes — you wait for the medicine to take effect before deciding if you need more.",
                            frameworkTip: "Safety valves for automated systems: Cooldown prevents overreaction, rate limits prevent resource exhaustion, circuit breakers prevent cascading failures."
                        ),
                        Challenge(
                            id: 2,
                            name: "Reactive Rules",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Among the above rules, which one is fundamentally different from the other three?",
                            scenario: Challenge.Scenario(
                                title: "Four Trigger Rules",
                                narrative: "Retraining has four trigger rules: consecutive coverage misses, MAPE degradation > 15%, residual drift > 0.6, and data drift > 0.6.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["The first four are \"triggered when a problem is detected,\" but periodic health checks are...?"],
                            explanation: "The first four are reactive — they trigger only when metrics exceed thresholds. Periodic health checks are proactive — they run a full evaluation at regular intervals regardless of whether metrics look fine. Why? Because some degradation is gradual — just a tiny bit each day, no single metric exceeds its threshold, but after a month it's already severe. Periodic health checks are like regular physicals — you don't wait until you're sick to see a doctor.",
                            frameworkTip: "Monitoring strategy: Proactive (periodic checks) + Reactive (anomaly triggers) = Complete monitoring coverage."
                        ),
                    ]
                ),
                Quest(
                    id: "40-4",
                    name: "Style Learning",
                    description: "Understand style rule confidence mechanism and conflict resolution",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Style Rule Confidence",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the starting confidence score for a style rule? What score is needed to upgrade it to a company policy?",
                            scenario: Challenge.Scenario(
                                title: "Learning Manager Preferences",
                                narrative: "The Style Learning system learns report preferences from manager edits and feedback (e.g., header colors, KPI arrangement). Each rule has a confidence score.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Applying at too-low confidence = reckless; requiring too-high confidence for upgrade = inefficient. Find the balance."],
                            explanation: "New rules start with a confidence of 0.40 (\"seen it once, not very sure\"). Each time the manager's behavior aligns with the rule, confidence increases. At 0.75 and above, the system suggests upgrading to a company policy, but requires explicit manager confirmation (not auto-upgrade). The logic: automation should be gradual — first observe, then suggest, finally let humans confirm.",
                            frameworkTip: "Automation trust ladder: Observe → Suggest → Semi-automatic → Fully automatic. Each step requires higher confidence."
                        ),
                        Challenge(
                            id: 2,
                            name: "Trust Metrics & Promotion",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What conditions must be met to promote from A3 to A4 (highest autonomy)?",
                            scenario: Challenge.Scenario(
                                title: "Autonomy Promotion",
                                narrative: "DI's AI Workers have 4 autonomy levels (A1-A4); promotion requires meeting trust metrics.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["A4 is the highest autonomy level, so the bar is naturally the strictest: volume (100 tasks) + quality (85% first-pass) + safety (violations ≤ 2%)"],
                            explanation: "A4 promotion has four thresholds: (1) first_pass_rate ≥ 0.85 (85% of tasks pass manager review on first submission), (2) min_tasks ≥ 100 (enough volume for statistical significance), (3) max_revision_rate ≤ 0.10 (revision rate no more than 10%), (4) max_policy_violations ≤ 0.02 (violation rate no more than 2%). This is just like workplace promotions — it's not about tenure, it's about doing enough work, doing it well, and not making mistakes.",
                            frameworkTip: "Trust system design: Quantitative metrics + threshold values + minimum sample size = reliable automatic promotion mechanism."
                        ),
                        Challenge(
                            id: 3,
                            name: "Style Conflict Resolution",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "When two managers' style preferences conflict, how should the system handle it?",
                            scenario: Challenge.Scenario(
                                title: "Two Managers with Different Styles",
                                narrative: "Manager Zhang prefers red headers in reports; Manager Li prefers blue headers. Both have left edit records in the system.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Style Learning is per-Worker, not shared company-wide. Unless...?"],
                            explanation: "Style rules are bound to each Worker (per-Worker scope). Manager Zhang's Worker learns red headers; Manager Li's Worker learns blue headers — no interference. Only when a rule's confidence reaches 0.75+ and the manager confirms upgrading it to \"company policy\" does it apply across Workers. The benefit: personal preferences don't interfere with each other, but truly important standards (e.g., \"KPIs must include fill_rate\") can be promoted company-wide.",
                            frameworkTip: "Scope design principle: Personal preferences = local scope. Company standards = global scope. Use confidence threshold + human confirmation to control upgrades."
                        ),
                    ]
                ),
                Quest(
                    id: "40-5",
                    name: "Closed-Loop Orchestration",
                    description: "Understand the safety differences of three execution modes",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Three Execution Modes",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Which of the three modes is the safest?",
                            scenario: Challenge.Scenario(
                                title: "Retraining Execution Modes",
                                narrative: "DI's closed-loop orchestration system has three modes for executing retraining.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["dry_run = drill. Just look at the report, don't take action."],
                            explanation: "dry_run is safest because it doesn't change anything at all — it just \"rehearses\" a retraining and reports results (what the new model's MAPE would be, how many resources training would need, etc.). approval_required is next (has human oversight). auto_run is most aggressive (fully automatic). In practice, you typically start with dry_run for observation over a few weeks, confirm the judgments are sound, then switch to approval_required, and only then consider auto_run.",
                            frameworkTip: "Three steps to automation go-live: dry_run (observe) → approval_required (semi-automatic) → auto_run (fully automatic). Gradual progression."
                        ),
                        Challenge(
                            id: 2,
                            name: "Why Not auto_run Right Away",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What is the main reason for not using auto_run from the start?",
                            scenario: Challenge.Scenario(
                                title: "Risks of Full Automation",
                                narrative: "An engineer suggests: \"Since drift detection is already automated, why not just run retraining automatically too?\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["The first version of any automated system always has bugs. You run dry_run first to find those bugs."],
                            explanation: "Drift detection isn't perfect — it can have false positives. If you start with auto_run: PSI temporarily rises due to seasonal factors → system falsely detects drift → automatic retraining → new model may be worse (data isn't stable yet). First run dry_run for a few weeks, tracking: \"Of the 10 times it recommended retraining, how many were actually necessary?\" If accuracy is high enough, then upgrade.",
                            frameworkTip: "Manual first → semi-automatic → fully automatic. Each upgrade needs sufficient observation data to support it."
                        ),
                    ]
                ),
                Quest(
                    id: "40-6",
                    name: "Model Degradation Diagnosis (Boss)",
                    description: "Comprehensively assess severity and prioritize actions",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Model Degradation Diagnosis",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: Challenge.Scenario(
                                title: "Three Alerts Firing Simultaneously",
                                narrative: "The monitoring dashboard simultaneously shows three alerts:\n- MAPE = 0.25 (last month 0.12, threshold mape_degradation_pct = 15%)\n- PSI = 0.35 (threshold 0.2)\n- Coverage = 65% (threshold coverage_min = 65%, right on the edge)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["High PSI + High MAPE = primarily Data Drift. But MAPE increase (12% → 25%) far exceeds what pure Data Drift could explain, possibly also Concept Drift", "Coverage at 65%, right at the minimum, may mean the model has zero coverage for some newly appearing categories"],
                            explanation: "This question tests comprehensive judgment. Looking at three metrics together is far more meaningful than examining each individually. PSI 0.35 + MAPE 0.25 = clear Data Drift, but the MAPE increase is too large, potentially suggesting Concept Drift as well.",
                            frameworkTip: "Diagnostic framework: Severity → Problem type → Handling priority → Execution mode. Like a doctor: Take temperature → Diagnose → Treatment plan → Follow-up."
                        ),
                    ]
                ),
            ]
        ),
        World(
            id: 41,
            name: "Advanced Execution & Smart Routing",
            emoji: "⚡",
            description: "Understand Ralph Loop, Model Routing, and Signal Radar",
            quests: [
                Quest(
                    id: "41-1",
                    name: "Ralph Loop",
                    description: "Understand the self-correcting AI worker",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Difference from Single AI Calls",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the most critical difference between Ralph Loop and a single AI call?",
                            scenario: Challenge.Scenario(
                                title: "Ralph Loop vs Single Call",
                                narrative: "A typical AI call is like ordering delivery: place the order, wait for results, accept what comes. Ralph Loop is like an office worker: completes a step, reviews the result, and self-corrects if it's not good enough.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Loop = cycle. The significance of a cycle: do → evaluate → correct → do again"],
                            explanation: "Single AI call = one chance; accept the result whether good or bad. Ralph Loop = multiple chances: executeTick (advance one step) → getTaskStatus (check result) → unsatisfied, adjust strategy and try again → markComplete (only stop when satisfied). Like writing a report: write first draft → self-review → find data error → correct → review again → OK → submit.",
                            frameworkTip: "AI task design: Simple queries → single call. Complex multi-step tasks → Loop with self-correction."
                        ),
                        Challenge(
                            id: 2,
                            name: "Three Safety Ropes",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which of the following is NOT one of Ralph Loop's three safety ropes?",
                            scenario: Challenge.Scenario(
                                title: "Preventing Infinite Loops",
                                narrative: "If Ralph Loop always feels \"not good enough,\" it could loop forever. So there are three safety ropes.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["The three safety ropes prevent \"losing control,\" not measuring \"quality\""],
                            explanation: "Three safety ropes: (1) VITE_RALPH_MAX_ITERATIONS=30 — forcibly stops after 30 runs, preventing infinite loops; (2) VITE_RALPH_MAX_COST=5.00 — max $5 in AI call costs per task, preventing bill explosions; (3) AbortController — users or system can pull the stop at any time (abortRalphLoop(taskId) stops one, abortAllRalphLoops() stops all). The MAPE threshold belongs to Release Gates, not Ralph Loop's safety ropes.",
                            frameworkTip: "Three layers of safety design: Resource limits (count/cost) → Timeout limits → Manual abort. All three are essential."
                        ),
                    ]
                ),
                Quest(
                    id: "41-2",
                    name: "Model Routing",
                    description: "Understand Tier A/B/C roles and cost considerations",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Tier A/B/C Roles",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What tasks are Tier A, B, and C each suited for?",
                            scenario: Challenge.Scenario(
                                title: "Smart Model Routing",
                                narrative: "DI doesn't use the most expensive AI model for every task. The Model Router selects the appropriate tier based on task type.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Imagine a kitchen: A=head chef (handles key dishes), B=sous chef (handles specialized dishes), C=assistant (prep work)"],
                            explanation: "Tier A is high-reasoning: planner (task decomposition), executor (execution decisions), challenger (challenge verification), judge (quality judgment) — these need the strongest reasoning capability. Tier B is expert-type: renderer (report generation) and analytical tasks. Tier C is low-cost: report, export, dashboard_summary — only needing formatting and summarization, no deep thinking.",
                            frameworkTip: "Cost optimization principle: Not the best, but the most appropriate. You don't need the head chef to chop vegetables."
                        ),
                        Challenge(
                            id: 2,
                            name: "Why Not Use Tier A for Everything",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "What is the most important reason for not using Tier A for everything?",
                            scenario: Challenge.Scenario(
                                title: "Cost vs Quality",
                                narrative: "Someone suggests: \"Tier A is the strongest anyway — why not just use Tier A for all tasks?\"",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["Model price differences can be 10-50x. 100 summary tasks × 50x price difference = huge cost gap"],
                            explanation: "Suppose the Tier A model costs 20x more than Tier C. A Worker runs 200 tasks per day, 160 of which are formatting and summaries. All Tier A: 160 × $0.10 = $16/day. Using Tier C: 160 × $0.005 = $0.80/day. That's $456 difference per month. With 100 Workers, that's $45,600. And Tier C handles summaries about as well as Tier A — these tasks don't need deep reasoning.",
                            frameworkTip: "80/20 rule in system design: 80% of tasks can be handled with 20% of the cost. Save the budget for the 20% that truly need it."
                        ),
                    ]
                ),
                Quest(
                    id: "41-3",
                    name: "Signal Radar",
                    description: "Understand four anomaly types and zero-cost design",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Four Anomaly Types",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Which of the following is NOT one of Signal Radar's four anomaly types?",
                            scenario: Challenge.Scenario(
                                title: "Signal Radar Anomaly Detection",
                                narrative: "Signal Radar is DI's anomaly detection engine, capable of detecting four types of anomalies.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "C",
                            hints: ["Model Drift is Drift Monitor's job, not Signal Radar's"],
                            explanation: "Signal Radar's four anomaly types: (1) Metric Anomalies — metric values deviating 2σ or changing > 30%; (2) Contradictions — illogical metric relationships (e.g., revenue up but profit down, orders up but fulfillment rate down); (3) Concentration Risk — top few accounting for ≥ 60% (≥80% is critical); (4) Stale Insights — analysis reports not updated in over 30 days. Model Drift is handled by drift_monitor.py, not Signal Radar.",
                            frameworkTip: "Separation of concerns: Signal Radar monitors \"business metric\" anomalies; Drift Monitor monitors \"model\" anomalies. Each has its own role."
                        ),
                        Challenge(
                            id: 2,
                            name: "Why Zero Cost",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "Why does Signal Radar have zero AI cost?",
                            scenario: Challenge.Scenario(
                                title: "Zero AI Cost",
                                narrative: "Signal Radar claims \"zero AI cost\" — it doesn't call any LLM.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["2σ checks, percentage calculations, proportion statistics — these are all mathematical formulas, no AI needed"],
                            explanation: "Signal Radar is a pure rule engine: delta > 2σ? → Anomaly. Change > 30%? → Anomaly. Proportion > 60%? → Concentration risk. Update time > 30 days? → Stale. These are all if-else judgments plus basic statistics, no LLM calls needed. Benefits: (1) Zero additional cost (2) Extremely low latency (millisecond-level) (3) Explainable results (not a black box).",
                            frameworkTip: "Not every problem needs AI. Simple rule engines are often faster, cheaper, and more explainable."
                        ),
                    ]
                ),
                Quest(
                    id: "41-4",
                    name: "Browser vs Server",
                    description: "Understand the differences between two execution modes",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "What Happens When You Close the Browser",
                            type: .multipleChoice,
                            difficulty: .easy,
                            question: "What is the most critical difference between browser mode and server mode?",
                            scenario: Challenge.Scenario(
                                title: "Execution Mode Differences",
                                narrative: "DI has two execution modes: running in the browser and running on the server.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Browser = local. Close it = gone. Server = remote. You shut down your computer and it keeps running."],
                            explanation: "Browser mode: Tasks run in your browser; closing the tab or browser = task terminates. Suitable for quick interactions. Server mode: Tasks run on a remote server; closing your browser has no effect, and you can see results next time you open it. Suitable for long-running computations.",
                            frameworkTip: "Frontend vs backend execution tradeoff: Frontend = instant interaction but depends on the browser; Backend = persistent execution but requires additional infrastructure."
                        ),
                        Challenge(
                            id: 2,
                            name: "taskWorker Concurrency Limit",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "Why does the solver allow only 3 concurrent tasks instead of 10?",
                            scenario: Challenge.Scenario(
                                title: "Why Limit to 3 Concurrent Tasks",
                                narrative: "DI's solver allows a maximum of 3 concurrent tasks (DI_SOLVER_MAX_CONCURRENT=3).",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["The solver performs optimization calculations; it's CPU and memory intensive. Too many concurrent = server crash"],
                            explanation: "The solver performs optimization calculations (linear programming, mixed-integer programming); each task may process millions of rows of data (DI_MAX_ROWS_PER_SHEET=2,000,000) and run for up to 90 seconds (DI_SOLVER_MAX_SECONDS=90). A single task can consume several GB of memory and heavy CPU. Running 3 concurrently is already demanding; any more and the server risks OOM (out of memory) or all tasks slowing down to timeout.",
                            frameworkTip: "Concurrency limits = protecting system stability. Better to have tasks queue and wait than to have the entire system crash."
                        ),
                    ]
                ),
                Quest(
                    id: "41-5",
                    name: "DB Schema & RLS",
                    description: "Understand multi-tenant data isolation",
                    xp: 50,
                    isBoss: false,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Purpose of RLS",
                            type: .multipleChoice,
                            difficulty: .medium,
                            question: "What does RLS (Row-Level Security) do?",
                            scenario: Challenge.Scenario(
                                title: "Row-Level Security",
                                narrative: "DI uses a multi-tenant architecture where multiple companies' data is stored in the same database.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["Row-Level = row-level. Security = security. Every row is checked: Does this data belong to you?"],
                            explanation: "RLS is a Supabase/PostgreSQL feature that has the database automatically filter for you. After setting RLS policies, no matter how your SQL is written, the database automatically adds WHERE tenant_id = current user's tenant_id. Like a building's access card — no matter which door you approach, the system only lets you onto your own floor.",
                            frameworkTip: "Multi-tenant data isolation: Application-level filtering (code adding WHERE) is the first line of defense; RLS is the last. Two layers of protection."
                        ),
                        Challenge(
                            id: 2,
                            name: "RLS Is the Last Line of Defense",
                            type: .multipleChoice,
                            difficulty: .hard,
                            question: "If the code forgets to add a tenant_id filter, will data leak to other tenants?",
                            scenario: Challenge.Scenario(
                                title: "Code Bug vs RLS",
                                narrative: "A new engineer writes a query that forgets to include a tenant_id filter condition.",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: [
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                                Challenge.Option(id: "", text: "", explanation: ""),
                            ],
                            correctAnswer: "B",
                            hints: ["The value of RLS lies exactly here — it's a security layer independent of application code"],
                            explanation: "This is the core value of RLS: even if the code has a bug (forgot WHERE tenant_id = ?), the database's RLS policy automatically filters at the lowest level, ensuring you can only see your own company's data. This is \"defense in depth\" — the application-level filter is the first door, and RLS is the final iron gate. Engineers can make mistakes, but RLS never forgets.",
                            frameworkTip: "Security design principle: Don't rely on a single layer of protection. RLS = even if all code-level protections fail, the database level is still secure."
                        ),
                    ]
                ),
                Quest(
                    id: "41-6",
                    name: "Integration Scenario (Boss)",
                    description: "Connect causal relationships across multiple systems",
                    xp: 200,
                    isBoss: true,
                    challenges: [
                        Challenge(
                            id: 1,
                            name: "Four Signals Firing Simultaneously",
                            type: .openEnded,
                            difficulty: .hard,
                            question: "",
                            scenario: Challenge.Scenario(
                                title: "Four Simultaneous Alerts",
                                narrative: "At 3 AM, the monitoring system fires four alerts simultaneously:\n1. MAPE surged from 0.12 to 0.28\n2. PSI = 0.42 (threshold 0.2)\n3. Signal Radar detected a \"Contradiction\": order volume up 40% but fulfillment rate down 15%\n4. Model Router downgraded planner from Tier A to Tier B (due to Tier A model API response timeout)",
                                data: nil,
                                dataCaption: nil
                            ),
                            options: nil,
                            correctAnswer: "",
                            hints: ["First think: Which signal could be the cause of others?", "Model Router downgrade means all critical tasks needing Tier A (planner, executor) are running on suboptimal models", "When Ralph Loop uses a downgraded model, the quality of each correction iteration is degraded, and it may not reach a satisfactory result within the 30-iteration limit"],
                            explanation: "This question tests systems thinking — when seeing multiple alerts, don't handle them one by one; instead, find the causal chain.",
                            frameworkTip: "Multi-system failure analysis: First find the root cause → Then trace cascading effects → Fix root cause first → Simultaneously stop the bleeding on the most severe symptoms."
                        ),
                    ]
                ),
            ]
        ),
    ]
}
