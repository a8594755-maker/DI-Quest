const world52_en = `
# World 52: Professional Reading

> A huge amount of workplace information is in English — JDs, READMEs, PRDs, reports. Missing it means missing critical details, or worse, making the wrong call.
> This chapter teaches you how to **quickly extract the key points**, not translate word by word.

Professional reading isn't an English test — it's a test of whether you can **pull actionable information** out of a wall of text.
Master these reading strategies and you'll be one step ahead in job hunting and on the job.

---

## 52-1: Reading a Job Description

### Why You Need to Read JDs Well

A JD isn't just a job listing — it's your **cheat sheet for interview prep**. Read it well and you'll know exactly what the interviewer will ask and what kind of person the company is looking for.

### Anatomy of a JD

A typical JD looks like this:

\`\`\`
[Job Title]       — Your role; watch the level (Junior / Senior / Lead)
[About the Team]  — What the team does and how big it is
[Responsibilities]— What you'll actually do (interviews revolve around this)
[Requirements]    — Must-haves
[Nice-to-haves]   — Bonuses (great to have, but not dealbreakers)
[Benefits]        — Perks (usually doesn't affect whether you apply)
\`\`\`

### Decoding Corporate Speak

JDs are full of "coded language." Learning to decode it is essential:

| What the JD says | What it actually means |
|-----------------|------------------------|
| Fast-paced environment | Lots going on, things change quickly — you need to handle pressure |
| Wear many hats | Small team, lots of tasks — you'll do a bit of everything |
| Self-starter | Nobody will hand-hold you through the work |
| Cross-functional collaboration | You'll work across many teams — communication skills matter a lot |
| Data-driven | Decisions need data to back them up, not just gut feelings |
| Ambiguity | Requirements are often unclear — you'll need to figure things out yourself |

### Annotated Reading Example

\`\`\`
Requirements:
- 3+ years of experience in product analytics
  → "3+" is the bar, but if you have 2 years + a strong portfolio, still apply
- Proficiency in SQL and at least one scripting language
  → SQL is non-negotiable; Python or R, at least one
- Experience with A/B testing frameworks
  → Expect A/B testing questions in the interview for sure

Nice to have:
- Experience with Looker or Tableau
  → Not having it is fine, but mentioning it in the interview is a plus
- Familiarity with machine learning concepts
  → You don't need to build ML models, but you should know the basics
\`\`\`

### Common Mistakes

- **Waiting until you meet every Requirement before applying**: In practice, 60–70% is enough to apply
- **Ignoring Nice-to-haves**: These are clues for bonus interview points
- **Skipping About the Team**: This section reveals team culture and priorities

---

## 52-2: README / Technical Documentation

### Why READMEs Matter

Whether you're a PM, BA, or engineer, reading READMEs is part of the daily routine. A new tool, an open-source project, an internal service — the first step is always the README.

### Standard README Structure

\`\`\`
# Project Name          ← Project name
## Overview / About     ← What this project does (most important!)
## Getting Started      ← How to install and run it
  ### Prerequisites     ← What you need installed first
  ### Installation      ← Step-by-step install
## Usage                ← How to use it (usually includes example code)
## API Reference        ← API docs (if applicable)
## Contributing         ← How to contribute (open source only)
## License              ← License type
\`\`\`

### Quick-Reference Glossary

| Term | Meaning | What to do |
|------|---------|------------|
| Prerequisites | Pre-requirements | Install these first before continuing |
| Dependencies | Required packages | Missing these means it won't run |
| Breaking changes | Non-backward-compatible updates | Always check before upgrading |
| Deprecated | Being phased out | Still works but not recommended; will be removed eventually |
| Migration guide | Upgrade instructions | Tells you how to move from the old version to the new one |
| Environment variables | Env vars | Where sensitive config lives (API keys, etc.) |

### Annotated Reading Example

\`\`\`
## Getting Started

### Prerequisites
- Node.js >= 18.0      ← Specific version required — don't just install any version
- npm or yarn           ← Pick one
- PostgreSQL 14+        ← You need to install the database separately

### Installation
$ git clone https://github.com/example/project.git
$ cd project
$ npm install           ← Install packages
$ cp .env.example .env  ← Copy the env template (important — fill in your own values)
$ npm run dev           ← Start the development environment
\`\`\`

### Common Mistakes

- **Skipping Prerequisites**: Running install straight away, then getting a bunch of errors you can't explain
- **Ignoring version numbers**: Node 16 and Node 18 can behave very differently
- **Missing .env.example**: Starting the app without setting env vars will throw errors

---

## 52-3: PRD / Spec Reading

### What Is a PRD?

A PRD (Product Requirements Document) defines what to build, why, and to what standard. Whether you're the PM writing it or the BA reading it, understanding this format is essential.

### Core PRD Structure

\`\`\`
1. Overview            — Why this is being built (business context)
2. User Stories        — Requirements from the user's perspective
3. Requirements        — Feature details
4. Priority            — P0 / P1 / P2 ranking
5. Acceptance Criteria — What "done" looks like
6. Out of Scope        — What is NOT being built this time (very important!)
\`\`\`

### User Story Format

User Stories are the heart of a PRD, and they follow a fixed format:

\`\`\`
As a [role], I want to [action], so that [outcome].

Example:
As a new user, I want to sign up with my Google account,
so that I don't have to remember another password.
\`\`\`

### How to Read Priority Levels

| Level | Meaning | Your response |
|-------|---------|---------------|
| P0 (Critical) | Can't ship without this | Do first, no compromises |
| P1 (High) | Very important but not a blocker | Aim to finish this sprint |
| P2 (Medium) | Nice to have | Do when time allows; can push to next sprint |
| P3 (Low) | Nice cherry on top | Goes to backlog — do it someday |

### Acceptance Criteria Example

\`\`\`
Feature: User Registration

Acceptance Criteria:
- [ ] User can sign up with email and password
- [ ] Password must be at least 8 characters
  with 1 uppercase and 1 number
- [ ] User receives a confirmation email within 2 minutes
- [ ] Duplicate email addresses show an error message
- [ ] All form fields have proper validation messages

→ These are the basis for QA testing and the definition of "done"
\`\`\`

### Common Mistakes

- **Reading Requirements but ignoring Out of Scope**: You end up building something you shouldn't — wasted time
- **Not confirming Acceptance Criteria**: You finish but the output doesn't match expectations
- **Ignoring Priority**: You spend three days on a P2 while the P0 hasn't been touched

---

## 52-4: Data Reports / Dashboards

### What Do Workplace Reports Look Like?

Whether it's a weekly update, a monthly report, or a dashboard, English-language reports follow predictable structures and vocabulary. Learn to read them and you'll cut straight to the key points in any meeting.

### Common Report Structure

\`\`\`
1. Executive Summary    — Key points in one paragraph (execs only read this)
2. Key Metrics / KPIs   — Numbers and performance
3. Highlights           — The good news
4. Areas of Concern     — The bad news (stated diplomatically)
5. Root Cause Analysis  — What caused the problem
6. Recommendations      — Suggested next steps
\`\`\`

### Decoding Report Language

| What the report says | What it actually means |
|----------------------|------------------------|
| Showed modest growth | Growth was minimal |
| Underperformed expectations | Missed the target |
| Remains flat | No growth at all |
| Experienced headwinds | Ran into trouble |
| Opportunities for improvement | Performance was poor (diplomatic phrasing) |
| Trending upward / downward | There's an upward / downward trend |

### KPI Report Reading Example

\`\`\`
Q4 Performance Summary

Revenue: $2.4M (↑12% QoQ)
  → QoQ = Quarter over Quarter, compared to last quarter
  → 12% growth is healthy

DAU: 45K (↓8% MoM)
  → MoM = Month over Month, compared to last month
  → DAU is dropping — needs attention

Churn Rate: 5.2% (↑0.8pp)
  → pp = percentage points
  → Rising churn is not a good sign

NPS: 42 (flat)
  → flat = no change
  → NPS of 42 is slightly above average
\`\`\`

### How to Read Root Cause Analysis

\`\`\`
Root Cause Analysis: DAU Decline

Investigation revealed that the decline was primarily driven by:
1. A 15% increase in app load time after the v3.2 release
   → A technical issue degraded the user experience
2. Seasonal patterns consistent with previous years
   → Seasonal factors — not entirely our fault
3. Increased competition from Product X's new feature launch
   → A competitor launched a new feature and drew users away

Recommended Actions:
- Immediate: Rollback performance regression in v3.2.1
- Short-term: Implement caching layer for top 10 API endpoints
- Long-term: Develop competitive feature parity roadmap
\`\`\`

### Common Mistakes

- **Looking at numbers without looking at trends**: A single number means nothing — look at QoQ / MoM / YoY change
- **Not understanding diplomatic language**: "Areas of concern" means something went wrong — it's not a minor issue
- **Confusing percentage and percentage points**: Going from 5% to 6% is an increase of 1pp, not 1%

---

## 52-5 (Boss): Integrated Reading Comprehension

### Boss Level: Comprehensive Reading Challenge

This level isn't about translation ability — it's about whether you can **quickly extract actionable information** from English documents.

### Reading Strategy Summary

| Document type | Read first | What to extract |
|---------------|------------|-----------------|
| JD | Requirements + Responsibilities | Direction for interview prep |
| README | Overview + Getting Started | How to get it running |
| PRD | User Stories + Acceptance Criteria | What to build and to what standard |
| Report | Executive Summary + KPIs | Performance numbers and recommended actions |

### Speed Reading Techniques

\`\`\`
1. Skim First
   → Scan headings, bold text, and numbers — get the gist in 30 seconds

2. Identify Action Items
   → What's relevant to you? What do you need to do?

3. Note Unknown Terms
   → You don't need to look up every word, but key terms must be understood

4. Summarize in One Sentence
   → If you can't state the main point in one sentence, you haven't truly read it yet
\`\`\`

### Integrated Practice

> **Exercise 1: Read this JD excerpt and answer three questions**
> "We're looking for a data-savvy Product Analyst who thrives in ambiguity
> and can drive insights from complex datasets. You'll partner with
> cross-functional teams to define metrics, run experiments, and inform
> product strategy. Experience with SQL is required; Python is a plus."
>
> 1. What is the most critical hard skill for this role?
> 2. What does "thrives in ambiguity" signal about this job?
> 3. What types of questions should you expect in the interview?

> **Exercise 2: Read this report excerpt and identify the key actions**
> "Weekly active users declined 12% WoW, primarily due to a login bug
> introduced in v2.5. The engineering team has identified the root cause
> and a hotfix is expected by EOD Friday. Marketing recommends pausing
> the ongoing campaign until the fix is deployed."
>
> 1. What is the most urgent action?
> 2. Who is responsible for what?
> 3. Which decision needs to wait?

### Build Your Personal Glossary

Make it a habit: every time you read an English document, add new terms to your personal glossary.

\`\`\`
Suggested format:
| Term | Abbreviation | Meaning | Where I saw it |
|------|-------------|---------|----------------|
| Quarter over Quarter | QoQ | Compared to the previous quarter | Q4 report |
| End of Day | EOD | By the end of today | Slack message |
| Out of Scope | OOS | Not included in this iteration | PRD document |
\`\`\`

Keep building it — three months from now, you'll find that English documents aren't intimidating anymore.
`;

export default world52_en;
