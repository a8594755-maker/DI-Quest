const world11_en = `
# World 11: Deployment and Runtime Environment

> **Objective:** Understand how the DI system goes from your local machine to being accessible worldwide, what Docker does, and how environment variables are managed
> **Related Project:** Decision-Intelligence-
> **Estimated Study Time:** 3-4 hours

---

## 11-1: Deployment Topology — Getting Software Online

### What Is "Deployment"?

You've written your code on your own machine, and \`npm run dev\` shows you the interface. But only you can see it. **Deployment is moving your software to a place where others can use it.**

The DI system has three parts to deploy, each with a different approach:

### Three Parts, Three Approaches

**1. Frontend (React) → Deploy to CDN**

After running \`npm run build\`, the frontend produces a set of static files (HTML, CSS, JavaScript). These files don't need a server to "run" — they just need a place to be "hosted."

CDN (Content Delivery Network) is that place. Imagine you've opened a chain of convenience stores, with a branch in every city — customers just go to the nearest one. A CDN copies your website files to servers all around the world, and users connect to the nearest one, making page loads fast.

Common CDNs: Netlify, Vercel, AWS S3 + CloudFront.

**2. Supabase → No Need to Deploy It Yourself**

Supabase is a managed service — you create an account, and it sets up the database, authentication, and Storage for you. All you need to do is:
- Set up the Supabase project
- Run SQL migrations (create your table structures)
- Deploy Edge Functions
- Set up secrets (API keys)

**3. ML API → Deploy to Docker Container**

The ML API is a Python program that needs a complete Python environment to run (Prophet, OR-Tools, etc.). You can't host it on a CDN like the frontend.

**Docker** is the solution. Imagine you're moving to another country — instead of packing items one by one (risking forgotten things), you pack your entire room into a **shipping container** — furniture, appliances, clothes, pots and pans all included. When you arrive, you open the container and you're ready to live.

A Docker container is the software equivalent: the Python environment, all packages, and your source code, all packaged together. No matter which server it's moved to, it just works.

### Deployment Order Matters

\`\`\`
1. Supabase → Set up database and Auth first (the foundation)
2. Edge Functions → Deploy to Supabase (install plumbing and electricity)
3. ML API → Deploy Docker container (move in the head chef and kitchen equipment)
4. Frontend → Deploy to CDN (open for business)
\`\`\`

Why this order? Because the frontend tries to connect to Supabase and the ML API when it starts up. If they're not ready, users will see a bunch of errors when they open the page. **Set up the backend first, then expose the frontend last** — just like finishing renovations before inviting guests.

> **Possible interview follow-up:**
> "Why not use Kubernetes?"
> For a v1 product, K8s complexity is too high. Docker + a simple container platform (Railway, Cloud Run) is sufficient. Only consider K8s when you need to manage multiple ML API instances and do auto-scaling. This is an example of "don't over-engineer."

---

## 11-2: Dockerfile — The Art of Packing

### Multi-Stage Build — Spread Everything Out, Then Slim Down

DI's Dockerfile uses a technique called **multi-stage build**. Using the packing analogy:

**Stage 1: Builder (Spread Everything Out)**

You lay out everything you might need on the bed:
- Python 3.12 (base environment)
- gcc, g++ (compilation tools — some Python packages need to compile C code during installation)
- libgomp1 (parallel computing library needed by Prophet and OR-Tools)
- All Python packages listed in requirements-ml.txt

Then install all packages. After installation, gcc and g++ are no longer needed — they're "tools," not "luggage."

**An important filtering step:**

During package installation, the Dockerfile deliberately skips three very large packages: \`torch\`, \`transformers\`, and \`accelerate\`. These three are needed by Chronos (the zero-shot forecasting model) and together exceed 2 GB. They're not needed by default, so they're not included.

**Stage 2: Runtime (Only Bring the Essentials)**

Starting from a clean Python 3.12 image, only bring:
- libgomp1 (needed at runtime)
- Python packages already installed in Stage 1 (copied directly)
- Your source code (\`src/\` and \`run_ml_api.py\`)

The final Docker image is approximately 800 MB, instead of the 3-4 GB it would be with Chronos.

### Why Do This?

| Aspect | Without Multi-Stage | With Multi-Stage |
|------|-----------------|----------------|
| Image size | ~2 GB (includes build tools) | ~800 MB (only runtime essentials) |
| Security | Has gcc and other attack surfaces | Minimal attack surface |
| Deployment speed | Slow (larger image to transfer) | Fast |

### Startup Command

When the Docker container starts, it runs:

\`\`\`
gunicorn ml.api.main:app
  --worker-class uvicorn.workers.UvicornWorker
  --bind 0.0.0.0:8000
  --workers 2
  --timeout 120
  --keep-alive 30
\`\`\`

In plain terms:
- **gunicorn** — A production-grade Python web server (for development you can use uvicorn, but production needs something more robust)
- **workers 2** — Run two worker processes to handle requests concurrently (like a restaurant with two chefs)
- **timeout 120** — A single request can take up to 120 seconds (ML computations can run long)
- **keep-alive 30** — Keep connections alive for 30 seconds (to avoid re-establishing connections every time)

> **Possible interview follow-up:**
> "Why set timeout to 120 seconds instead of the default 30?"
> Because ML computations (especially OR-Tools solving) can take up to 90 seconds. If the timeout is 30 seconds, the connection would drop before solving is complete, and users would see "504 Gateway Timeout." 120 seconds leaves a 30-second buffer.

---

## 11-3: Environment Variables — Key Management

### Three Types of Environment Variables, Three Security Levels

The DI system has three types of environment variables with completely different security levels:

**1. Frontend Environment Variables (Address plaques — everyone can see them)**

Variables prefixed with \`VITE_\` get bundled into the frontend's JavaScript by Vite. **Anyone** can see them by opening browser DevTools. So only **public information** can go here:

\`\`\`
VITE_SUPABASE_URL=https://xxx.supabase.co     # Supabase address (public)
VITE_SUPABASE_ANON_KEY=eyJhbGci...             # Anonymous key (safe with RLS)
VITE_ML_API_URL=http://127.0.0.1:8000         # ML API address
\`\`\`

**2. Edge Function Secrets (Safe combination — only the server knows)**

AI model API keys are stored in Supabase's secure storage via \`supabase secrets set\`. Only Edge Functions can access them at runtime; the browser can never touch them:

\`\`\`
GEMINI_API_KEY=sk-...
DEEPSEEK_API_KEY=sk-...
ANTHROPIC_API_KEY=sk-...
OPENAI_API_KEY=sk-...
KIMI_API_KEY=sk-...
\`\`\`

Why not put them in \`.env.local\`? Because anything in \`.env.local\` prefixed with \`VITE_\` gets bundled into the frontend. Even without the \`VITE_\` prefix, \`.env.local\` is for the frontend. API keys must exist only on the server side.

**3. ML API Environment Variables (Kitchen settings — only the backend knows)**

The ML API Docker container has its own environment variables:

\`\`\`
DI_DATABASE_URL=postgresql://...       # Database connection
DI_SOLVER_ENGINE=ortools               # Which solver to use
DI_CHRONOS_ENABLED=false               # Disable the heavyweight model
ALLOWED_ORIGINS=http://localhost:5173   # Allowed frontend addresses
\`\`\`

### Execution Guardrails — Safety Valves

\`\`\`
DI_MAX_ROWS_PER_SHEET=2000000   # Max 2 million rows per sheet
DI_MAX_SKUS=5000                 # Max 5,000 SKUs
DI_SOLVER_MAX_SECONDS=90         # Max 90 seconds for solving
DI_BOM_MAX_EDGES=200000          # Max 200,000 BOM edges
DI_FORECAST_MAX_SERIES=5000      # Max 5,000 forecast series
\`\`\`

These are **safety valves** controlled via environment variables. Why not hardcode them? Because different deployment environments may need different limits. Set them smaller in development (runs faster), and larger in production.

> **Possible interview follow-up:**
> "What if someone accidentally commits GEMINI_API_KEY to Git?"
> Step one: immediately revoke the key in Google Cloud Console and generate a new one. Step two: use \`git filter-branch\` or BFG Repo-Cleaner to remove it from Git history. Simply deleting the file and committing again doesn't work — the Git history still contains it.

---

## 11-4: Health Checks — The System's Medical Report

### Why Are Health Checks Needed?

A running service can develop problems:
- Memory runs out
- Database connection breaks
- A bug causes a deadlock

You can't wait for users to call before discovering issues. **Health checks are automated checkups** that regularly confirm the system is alive and functioning normally.

### DI's Four-Layer Health Checks

**Layer 1: Shell Script (Manual Checkup)**

\`./scripts/healthcheck.sh\` — A quick check for developers or CI. Running it reports the status of four services (Supabase, ML API, AI Proxy, Frontend), like a medical report.

**Layer 2: ML API's /healthz and /readyz (Automated Checkup)**

These are two standard Kubernetes endpoints:

- **\`/healthz\` (Liveness Probe)** — "Is this process still alive?"
  - If it can't return 200 → the process is dead (possibly deadlocked or crashed) → **restart it**
  - Like a nurse checking if the patient is still breathing

- **\`/readyz\` (Readiness Probe)** — "Is it ready to serve requests?"
  - If it can't return 200 → it temporarily can't handle requests (possibly still loading models) → **stop sending traffic, but don't restart**
  - Like confirming a patient is ready to be discharged

The difference matters: liveness failure = restart (drastic measure), readiness failure = pause traffic (gentle measure).

**Layer 3: Docker HEALTHCHECK (Container-Level Checkup)**

\`\`\`
Checks every 30 seconds
60-second startup grace period (ML model loading takes time)
3 consecutive failures before marking as unhealthy
\`\`\`

Why the 60-second grace period? Because the ML API needs time to load models and establish database connections at startup. If checking starts immediately, it would falsely be judged as "unhealthy."

**Layer 4: Frontend systemHealthService (User-Visible)**

The frontend also has a health check service that pings each service from the browser side. Results are displayed on the Settings page, letting users (and you during demos) see whether all services are functioning normally.

> **Possible interview follow-up:**
> "If the ML API's readiness check fails, what does the user see?"
> The frontend's systemHealthService detects that the ML API is unavailable, and the Settings page displays a red warning. Chat functionality and AI analysis still work (via ai-proxy), but forecasting and planning features are temporarily unavailable. This is the benefit of a layered architecture — one layer having issues doesn't affect the others.

---

## 11-5: Startup and Verification — The Correct Way to Launch

### Single-Command Startup

\`\`\`
./scripts/start.sh          # Full startup (frontend + backend)
./scripts/start.sh --check  # Preflight checks only (no startup)
./scripts/start.sh --backend # Backend only
\`\`\`

### Preflight Checks — Pre-Flight Safety Inspection

Before takeoff, a pilot runs through a preflight checklist. DI's \`start.sh\` does the same:

1. Is Node.js installed? Correct version?
2. Is Python installed? Correct version?
3. Are all npm packages installed?
4. Does the .env.local file exist? Are all required variables present?
5. Can Supabase be reached?
6. Is the ML API port available? (No conflicts with other programs)

If any check fails, the system won't start — it tells you exactly what's wrong.

### Verification Checklist — How to Confirm Everything Works

After startup, how do you confirm the system is actually working?

1. Open browser → login page appears
2. Successful login → home page appears
3. ML API's \`/health/live\` → returns 200
4. Settings page → no red "missing secret" warnings
5. Upload sample data → complete the full Golden Path
6. \`npm run build\` → passes (confirms no compilation errors)
7. \`npm run test:regression\` → passes (confirms nothing is broken)

### Three Startup Phases

A mature system has three startup phases:

1. **Preflight**: Check all prerequisites
2. **Startup**: Start all services
3. **Verification**: Confirm all services are healthy

Skipping any phase can cause problems. The most common mistake is skipping Preflight and starting directly, then spending half a day debugging only to discover a missing environment variable.

> **Possible interview follow-up:**
> "If you were writing a deployment runbook for a new teammate, what are the three most important things?"
> 1. **Order**: Backend first, frontend last. 2. **Secrets**: Ensure all API keys are set via \`supabase secrets set\`, not placed in .env.local. 3. **Verification**: Always run \`healthcheck.sh\` after deployment — don't assume success just because "the webpage opens."

---

## 11-6 (Boss): Deployment Plan

### Scenario

Your team needs to set up a new staging environment for QA testing. You're asked to write a deployment runbook.

### Your Task

Write a step-by-step deployment plan that includes:
1. **Supabase setup** (create project, run migrations, ordering)
2. **Edge Function deployment** (which ones to deploy, how to set secrets)
3. **Frontend deployment** (build, env vars, hosting)
4. **ML API deployment** (Docker build, env vars, health probes)
5. **Verification steps** (how to confirm everything works)

### Evaluation Criteria

- Correct deployment order (backend first, frontend last)
- Knows that secrets must use \`supabase secrets set\` (not .env)
- Includes health check verification steps (not just "the webpage opens")
- Considers migration ordering
- Mentions the three security levels of environment variables
`

export default world11_en
