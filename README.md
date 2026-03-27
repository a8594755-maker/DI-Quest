# DI Quest

A Duolingo-style interview prep app for Business Analysis, SQL, Python, and Decision Intelligence product knowledge.

## Features

- **5 Learning Tracks** - Business Analysis (20 worlds), SQL (5 worlds), Python (8 worlds), DI Product Knowledge (9 worlds), Professional English (6 worlds)
- **45 Worlds / 283 Quests / 600+ Challenges** - Multiple-choice, code execution, and open-ended questions
- **Gamification** - XP system, streaks, daily check-ins, spaced repetition (SM-2), friends & leaderboard
- **AI Evaluation** - Open-ended answers graded by AI (DeepSeek API)
- **Code Sandbox** - In-browser Python & SQL execution via sql.js
- **Bilingual** - Traditional Chinese (zh-TW) & English
- **Responsive** - Mobile-first design with desktop optimization

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Framework | React 18 + Vite 5 |
| Styling | Tailwind CSS 3.4 |
| Animation | Framer Motion |
| Auth & DB | Supabase (PostgreSQL + Auth + RLS) |
| i18n | i18next |
| Charts | Recharts |
| Code Editor | Monaco Editor |
| SQL Engine | sql.js (WebAssembly SQLite) |
| Hosting | Netlify |

## Getting Started

### Prerequisites

- Node.js 18+
- npm 9+

### Setup

```bash
# Clone
git clone https://github.com/a8594755-maker/DI-Quest.git
cd DI-Quest

# Install dependencies
npm install

# Create .env file
cp .env.example .env
# Fill in your Supabase credentials:
#   VITE_SUPABASE_URL=your_supabase_url
#   VITE_SUPABASE_ANON_KEY=your_supabase_anon_key

# Start dev server
npm run dev
```

### Build

```bash
npm run build
npm run preview  # Preview production build locally
```

### Lint & Test

```bash
npm run lint          # ESLint check
npm run lint:fix      # Auto-fix lint issues
npm run test          # Watch mode
npm run test:unit     # Single run
npm run test:coverage # With coverage report
```

### Database

Apply the migration to your Supabase project:

```bash
supabase db push
```

Or run `supabase/migrations/001_init.sql` manually in the Supabase SQL editor.

## Project Structure

```
src/
  pages/          # Route pages (Login, QuestMap, CaseStudy, etc.)
  components/     # Reusable UI components
  contexts/       # React contexts (Auth, Quest progress)
  data/
    worlds/       # Quest & challenge data per track
    lessons/      # Markdown lesson content per world
    branches.js   # Learning track definitions
    questData.js  # World data aggregator
  hooks/          # Custom React hooks
  i18n/           # Translation files (zh-TW, en)
  utils/          # Supabase client, XP calculator, analytics
```

## Learning Tracks

| Track | Worlds | Focus |
|-------|--------|-------|
| Business Analysis | 1-8, 27-38, 42 | Case studies, frameworks, stakeholder management, Excel, BI, project management |
| SQL | 4, 23-26 | Query fundamentals to advanced analytics (LeetCode-style) |
| Python | 15-22 | Syntax to Pandas pipelines with business-context code challenges |
| DI Product | 9-14, 39-41 | Decision Intelligence platform architecture, deployment, quality |
| Professional English | 48-53 | Project pitches, interview answers, workplace communication (zh-TW only) |

## CI/CD

GitHub Actions runs on every push/PR to `main`:
1. **Lint** — ESLint with React hooks & refresh plugins
2. **Test** — Vitest unit tests
3. **Build** — Production build verification

Deployment is handled automatically by **Netlify** on merge to `main`.

## License

MIT
