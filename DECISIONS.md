# Programme Decisions Log

Everything decided about this programme and its Claude setup, in one place: what was built, why,
what was rejected, and what's still open. Updated whenever the roadmap or setup changes.

**State as of 2026-09-25:** setup complete, programme **not started**. Active track: 🎯 **switch**
(`plan/roadmap/TRACK-switch.md`). Next session: `0.0.1 Intake`.

---

## 1. How the system works (one picture)

```text
  README.md (your charter: philosophy, rules, rubric, templates)   ← never edited by Claude
        │
        ▼
  plan/PLAN.md (mentor strategy)      plan/roadmap/ (every session, in order, with gates)
        │                                   │
        └──────────────┬────────────────────┘
                       ▼
  CLAUDE.md (how Claude behaves) ──► SessionStart hook prints STATUS + progress counts
                       │
                       ▼
        /today ─► due spaced reviews ─► next session ID ─► right skill:
                   /lesson  /design  /drill  /arch-review  /quiz  /weekly-review  /gate  /intake
                       │
                       ▼
        /wrap ─► tracker · weak-areas · review-queue · STATUS · lesson note / journal entry
                 · glossary · question bank · patterns
```

---

## 2. Version history

| Ver | Date | What happened | Status |
|---|---|---|---|
| v1 | 2026-09-23 | Initial Claude setup from README: `CLAUDE.md`, 7 skills, progress files, templates, SessionStart hook, permissions | Kept (extended) |
| v2 | 2026-09-23 | Mentor plan fitted to Aug–Dec: ROI tiers, 21 of 35 designs, dated week-by-week calendar, "days behind", compressed track | **Superseded**: you rejected timeline-driven cuts |
| v3 | 2026-09-23 | **Your directive: "progress over timeline, don't compromise content."** Rebuilt as a mastery-gated roadmap, no dates, all content + additions, gates, `/gate` | Kept |
| v4 | 2026-09-23 | **Full audit** for exhaustiveness, prerequisite order and pedagogy; architect-conversation training added | Kept |
| v5 | 2026-09-25 | **Your new goal: switch jobs within 12 months** (22 → 30–35 LPA, SDE-2 HLD loops ~Apr–Jun 2027). Added the 🎯 **switch track** (`plan/roadmap/TRACK-switch.md`, 189 h of a 190 h budget) as a prioritised order over the same roadmap; the full course (≈ 907 h) continues as the **depth track**. Nothing deleted | Current |

---

## 3. Key decisions (with rationale)

| # | Decision | Why | Rejected alternative |
|---|---|---|---|
| D1 | README stays the untouched charter; Claude's material lives in `plan/`, `CLAUDE.md` etc. | Your document stays yours; changes are traceable | Rewriting the README |
| D2 | **Progress over timeline**: advance only by passing gates; no dates, no "behind" | Your explicit instruction; mastery is the goal | Dated calendar (v2) |
| D3 | **Nothing from the README is cut or compressed**; gaps are *added* | Your instruction; the README's scope is the floor, not the ceiling | ROI tiers / stretch buckets (v2) |
| D4 | Keep the README weekly rhythm as **cycle order** (L→DD→C→M→P→F→R), not tied to weekdays | The rhythm is pedagogically sound; weekdays aren't | Weekday-bound sessions |
| D5 | **Session IDs** (`phase.cycle.n`); `/today` resumes from STATUS | Resumable, unambiguous, trackable | Topic names only |
| D6 | **Mastery bar for ✅** = explain + apply + defend + retain (+21-day recall) | "Heard it" ≠ "know it" | Self-reported completion |
| D7 | **Phase gates** with remediation cycles and unlimited retries | Mastery learning (Bloom) | Move on regardless |
| D8 | **Two passes per design**: a learning pass in its phase, a cold timed pass in Phase 9 | Application inside the phase; interview readiness at the end | README's "Phase 9 only" |
| D9 | **Evolving designs**: URL Shortener v1→v2, Ticket Booking v1→v3, Notification v1→v2→#28→staff | Spiral learning; mirrors how real systems grow | One-shot designs |
| D10 | **Cold baseline mock** at 0.0.2, redone at 11.3.1 under identical conditions | Objective growth measure | No baseline |
| D11 | Phases follow README *sections* 0–10; README §4 table's "Interview Mastery" becomes **Phase 11** | README §4 table and sections disagree on numbering | Following the §4 table |
| D12 | **Spaced review queue** (+2/+7/+21/+60) before new material every session | Retention across a long programme | Review only on Sundays |
| D13 | Learner-built references: numbers, patterns, **glossary**, **architect question bank** | Generation effect: things you write yourself stick; builds your "weapons" | Claude-written cheat sheets |
| D14 | **Interview realism**: voice answers, real diagrams (Phase 5+, mandatory Phase 9+), timed phases, ≥ 6 human mocks | Interviews are spoken, drawn, timed, and run by humans | Typed ASCII only |
| D15 | **Strict scoring**, no flattery; hints cost points | Calibrated feedback | Encouraging but vague |
| D16 | Learner profile via `/intake`; **only emphasis changes, never content** | Target level & companies shape depth/style | Using intake to skip topics |
| D17 | "I already know this" → **prove it cold**, then go deeper (no skipping) | Protects against illusion of competence | Skip on request |
| D18 | Tracker **generated** from the roadmap by `tools/gen_tracker.py` (progress preserved on re-run) | Roadmap and tracker can never drift | Hand-maintained tracker |
| D19 | Memory: "progress over timeline" saved as a persistent feedback memory | So future sessions never re-propose cuts | Relying on chat history |
| D20 | **Architect mode** (`/arch-review`, 14 `AR` sessions) + architect's toolkit + architect-conversation cycle | Your goal: hold your own with any senior architect | Interview-only training |
| D21 | **Worked example first, then fading scaffolds** (0–2 prompted, 3–4 on-demand, 5+ none, 9+ cold) | Expertise-reversal effect: novices learn more from worked examples | Pure attempt-first from day one |
| D22 | **12-month job-switch goal** (2026-09-25): 22 → 30–35 LPA at product companies (Amazon, Microsoft, Uber, Atlassian, Google, Flipkart, PhonePe, Razorpay, Swiggy, Walmart GT, Adobe, Salesforce); most likely SDE-2 loops, HLD rounds ~Apr–Jun 2027 | Your stated goal; SDE-2 HLD expects fundamentals, the framework, estimation and ~12–18 classic designs done well | Ignoring the date (the full course alone is ≈ 907 h) |
| D23 | **Two tracks over one roadmap**: 🎯 switch track (`TRACK-switch.md`, 98 sessions + 3 trimmed gates, 189 h) then the **depth track** (every remaining roadmap row in order + depth passes of `switch:` rows + full gates). Active track lives in STATUS | Interview-critical material first, without forking the curriculum; progress lands in the same tracker | A separate "interview course"; a compressed roadmap |
| D24 | **Nothing is cut** (D3 stands): deferred rows are listed with reasons in `TRACK-switch.md`; `switch:` rows state what waits and stay 🟨 `depth pass pending` until the depth pass | Keeps D2/D3 honest: prioritisation ≠ deletion | Dropping low-value rows (v2) |
| D25 | **Trimmed gates** in the switch track (Gates 0–2, 3–4, 5–8 in three sittings): only included criteria tested; the rest marked deferred and tested in the full gates later | A gate should test what was taught; mastery gating still applies | No gates in the switch track; full gates on partial material |
| D26 | **Designs chosen by SDE-2 HLD frequency**: URL Shortener (v1, v2), Ticket Booking, Distributed KV Store, Distributed Cache, Rate Limiter, Notification, Chat/WhatsApp, Twitter/news feed, Instagram, Web Crawler, Payment, Dropbox, Autocomplete, Uber, YouTube (+ Netflix basics); 5 timed cold mocks, 1 unseen prompt, 3 human mocks, 2 AR role-plays | Most-asked problems at the target companies; each reuses many building blocks | Covering all 56 designs before interviews |
| D27 | **Overlap with the sibling `FAANG-CS-Core-Master` course**: OS / networking / database *internals* (single machine, TCP/IP, TLS handshake, SQL, storage engines, isolation implementation, consensus internals) are deferred here and learnt in depth there; this course keeps them at interview level unless an HLD question needs more | Avoids paying twice for the same hours in the switch year | Teaching internals in both courses |

---

## 4. v4 audit: what changed and why

### 4.1 Added (gaps that would leave you exposed with a senior architect)

| Addition | Where | Why it was missing / why it matters |
|---|---|---|
| **The single machine** (CPU, threads, memory/storage hierarchy, page cache, fsync, event loops vs thread pools) | Cycle 0.3 | Every latency number and bottleneck traces back to hardware; README jumped straight to distributed |
| **Worked example** (mentor designs out loud) | 0.4.6 | Novices need a model of expert thinking before attempting (D21) |
| **C4 model + ADRs** introduced early | 0.4.5, every journal | The lingua franca of architecture reviews |
| **Web auth basics** early (sessions/tokens, cookie flags, CSRF/CORS, JWT/OAuth at a glance) | 1.2.4 | Every design needs auth; README had it only in Phase 8 |
| **Unique IDs moved to sharding**; ID Generator design with them | 2.7.6, 2.7.9 | Sharding needs IDs; README had IDs in Phase 6 (clock depth stays in 6.4.3) |
| **Block vs file vs object storage; GFS/HDFS; storage tiering** | 2.9.3 | Distributed file systems were absent |
| **Cell-based architecture, shuffle sharding, static stability, control/data plane** | 4.4.4 | Standard vocabulary for blast-radius discussions at large companies |
| **Architecture styles & DDD** (monolith → microservices, bounded contexts, aggregates, BFF, contract tests, hexagonal, anti-patterns) | Cycle 4.5 | The #1 senior-architect topic; missing from README; sagas (Phase 5) assume it |
| **Delayed/scheduled work; delivery channels** (APNs/FCM, email deliverability, SMS, webhooks) | 5.1.4–5.1.5 | Needed for Notification v2 and the Job Scheduler staff prompt |
| **Offline-first & mobile sync** | 6.3.3 | Needed for Docs/Dropbox/Drive; client side was absent |
| **Data engineering** (ETL/ELT, orchestration, backfills, data quality, lineage, governance, data mesh, lakehouse) | Cycle 7.4 | Senior architects own data platforms; README stopped at "warehouse/lake" |
| **Embeddings & vector search** (ANN: HNSW/IVF/PQ, vector DBs, hybrid search) | Cycle 7.9 | Essential in 2026 |
| **LLM & AI application systems** (inference economics, KV cache, batching, serving, RAG, agents, evals, guardrails, prompt injection) + 2 designs + 1 staff prompt | Cycle 7.10, 9.7, 10.4.6 | Essential in 2026; the most common new architecture conversation |
| **Security split**: identity (passkeys, OAuth/OIDC, ReBAC, policy engines, workload identity, zero trust) and data/threats/compliance (STRIDE, supply chain, GDPR erasure, PCI scope, audit logs) | Cycles 8.3–8.4 | README's security list lacked threat modelling and compliance |
| **Testing distributed systems** (contract, ephemeral envs, load/soak, testing in production) | 8.5.3 | Missing |
| **Cloud infrastructure & platform engineering** (VPC networking, managed-services map, serverless, IaC/GitOps, IDPs, FinOps) | Cycle 8.7 | Everyday architect vocabulary; missing |
| **Incident response & postmortems** | 8.1.4 | Operational maturity signal |
| **Architect's toolkit** (C4 depth, ADRs, RFCs, ATAM-lite trade-off analysis, fitness functions, tech debt, influence without authority) + review-board role-play | Cycle 10.2 | How decisions are actually made and defended at senior level |
| **Architect conversations** (join an unfamiliar system, facilitate a disagreement, post-mortem review, build-vs-buy memo) | Cycle 11.2 | Directly trains your stated goal |
| **AR role-play at the end of every phase** | 0.4.9 … 8.8.7 | Critique is the highest learning level; you practise spotting flaws in confident proposals |
| **Concept map + calibration** at every gate | all gates | Metacognition; connects topics into a mental model |

### 4.2 Re-ordered (prerequisite fixes)

| Change | From → To | Reason |
|---|---|---|
| URL Shortener split into v1 / v2 | 1.5.6 only → 1.5.6 (v1) + 2.11.6 (v2) | v1 can't use DB/sharding/caching concepts that aren't taught yet |
| Unique ID Generator learning pass | 6.4.5 → 2.7.9 | Sharding needs IDs now; clock skew revisited in 6.4.3 |
| Pastebin | 2.7.8 → 2.9.6 | It's a blob-storage design; object storage is taught in 2.9 |
| Notification v1 | 2.11.6 → 4.5.7 | Its failure under provider outages motivates Phase 5; it needs resilience concepts first |
| Golden signals introduced | Phase 8 only → spiral at 4.1.3 | Bottleneck-finding needs metrics |

### 4.3 Deleted

**No content deleted.** Removed only: the dated calendar (`plan/schedule.md`), ROI tiers, "stretch"
buckets and the compressed track (all v2, superseded by D2/D3). The README's §26 monthly milestones
are superseded by gates as the progress mechanism (the README text is unchanged).

---

## 5. Pedagogical methods applied

Full table in `plan/roadmap/README.md`. Summary: **mastery learning** (gates) · **spiral curriculum**
(auth, IDs, observability, consistency, evolving designs) · **prerequisite ordering** · **worked
example → faded scaffolding → independent** · **productive failure** (attempt first) · **retrieval
practice** (explain-back, quizzes, gates, cold circuit) · **spaced repetition** · **interleaving** ·
**elaborative interrogation** (the 11 questions) · **dual coding** (diagrams) · **critique**
(AR role-plays) · **cognitive apprenticeship** (model → coach → fade) · **desirable difficulties**
(cold, timed, curveballs) · **metacognitive calibration** (predict gate results) · **concept
mapping** · **deliberate practice** (remediation targets the weakest rubric categories).

---

## 6. Inventory: everything that exists

### 6.1 Skills (slash commands) in `.claude/skills/`

| Skill | Session types | What it does | Writes |
|---|---|---|---|
| `/today` | any | Due reviews → finds next session ID → runs the right skill | via wrap |
| `/intake` | 0.0.1 (+ each gate) | Profile: level, companies, background, calibration questions | `progress/profile.md` |
| `/lesson` | L, DD, C, LAB, WE | Mentorship Protocol: attempt → intuition → why → how → examples → trade-offs → failure → interview Qs → exercise → explain-back | `lessons/phase-N/<ID>-*.md` |
| `/design` | M, F, staff, baseline | Timed interview (interviewer mode) → mentor review → ideal architecture (after attempt) → 120-pt score → C4 + ADRs; scaffolding fades by phase | `journal/…` |
| `/drill` | P | Escalating production incidents: blast radius → detection → mitigation → root fix → design change | journal/STATUS |
| `/arch-review` | AR | Claude plays a senior architect with a flawed proposal / two disagreeing architects / system owner / review board; debrief + score | question bank, weak areas |
| `/quiz` | any / floor day | Rapid retrieval, weighted to due reviews and weak areas | tracker, queue |
| `/weekly-review` | R | Cycle review: explain without notes, grill hardest decision, insert repeat sessions if needed | `reviews/…` |
| `/gate` | Gate | Calibration prediction → concept map → cold test of every criterion → pass or remediation cycle | tracker Gates, STATUS |
| `/wrap` | end of every session | Runs the wrap-up protocol | all progress files |

### 6.2 Files

| Path | Purpose | Who writes it |
|---|---|---|
| `README.md` | Your charter | You |
| `CLAUDE.md` | Claude's operating manual (roles, 16 teaching rules, layout, commands, wrap-up) | Claude |
| `DECISIONS.md` | This log | Claude |
| `plan/PLAN.md` | Mentor strategy: assessment, scale, additions, retention, realism, company calibration, reading, pace, traps, risks | Claude |
| `plan/roadmap/README.md` | How the roadmap works + pedagogy table | Claude |
| `plan/roadmap/phase-00…11.md` | All 75 cycles, every session with full sub-points, all gates | Claude |
| `plan/roadmap/TRACK-switch.md` | 🎯 Switch track: prioritised order of roadmap rows (scope, est. hours), trimmed gates, deferred list with reasons | Claude |
| `progress/STATUS.md` | Next session ID, resume point, gates passed, session log | Claude (wrap) |
| `progress/profile.md` | Your targets/background/calibration | Intake |
| `progress/tracker.md` | 238 session rows + 56 designs + baseline + 12 gates | Generated + wrap |
| `progress/review-queue.md` | Spaced-review due dates | Wrap |
| `progress/weak-areas.md` | Open/resolved mistakes | Wrap |
| `reference/numbers.md` | Latency/capacity/availability/cost numbers | **You** (Claude verifies) |
| `reference/patterns.md` | 36-pattern library skeleton | **You** |
| `reference/glossary.md` | Architecture vocabulary | **You** |
| `reference/architect-questions.md` | Question bank for design reviews | **You** |
| `templates/` | Design review (incl. C4 + ADR), lesson note, weekly review | — |
| `lessons/`, `journal/` (+`assets/`), `reviews/` | Outputs | Sessions |
| `tools/gen_tracker.py` | Regenerates tracker from roadmap, keeps progress | — |
| `.claude/hooks/session-start.sh` | Prints date, mastered/total, open weak areas, due reviews, active track + remaining switch-track hours, STATUS at every session start | — |
| `.claude/settings.json` | Hook registration; auto-allows edits to progress/lessons/journal/reviews/README and `date` | — |
| Claude memory: `progress-over-timeline` | Never trim content for dates; switch track = prioritised order, deferred ≠ cut | — |

### 6.3 Programme scale

12 phases · 75 cycles · 216 concept sessions (L/DD/C) · 7 labs · 1 worked example · 14 AR role-plays ·
56 designs (30 README + 14 ★ + 1 exercise + 11 staff) · 12 gates · 7 papers · ≥ 6 human mocks.
93 of 238 tracked sessions are ★ additions beyond the README.

---

## 7. Your "weapons" map: which parts let you hold which conversation

| When a senior architect says… | You're armed by |
|---|---|
| "What's the p99 / how many boxes do we need?" | 0.2, 0.3, 0.4, `reference/numbers.md` |
| "Postgres or Dynamo/Cassandra? How do we shard?" | Phase 2 (2.3 engines, 2.6–2.9), 3.4 |
| "It's eventually consistent, it's fine." | 3.2–3.3 (what the user sees), 2.6.5 |
| "Let's split into microservices." | 4.5 (styles, DDD, anti-patterns), 10.1.3 (Conway, team topologies) |
| "Kafka for everything." | 5.1–5.4, 5.6.7 AR |
| "We'll use a Redis lock." | 6.1.2 fencing tokens, 6.6.4 AR |
| "Exactly-once delivery." | 5.3, 6.1 |
| "Let's add RAG / an LLM." | 7.9–7.10 |
| "Go multi-region / multi-cloud." | 4.4, 6.6.1, 8.7, 8.8.7 AR |
| "Is this secure / compliant?" | 8.3–8.4 (STRIDE, GDPR erasure, PCI scope) |
| "What will it cost?" | 8.7.5 FinOps, cost criteria in staff overlay |
| "How do we migrate without downtime?" | 8.5.2, 10.1.2 |
| "Write up the decision." | 0.4.5, 10.2 (C4, ADRs, RFCs, ATAM-lite) |
| "Here's our system, get up to speed." | 11.2.1 |
| Two architects disagree | 11.2.2, 10.2.4 |

---

## 8. Open items / needs from you

| Item | Status |
|---|---|
| Intake answers (level, companies, background) | Pending: session 0.0.1 |
| README §4 phase table vs section numbering | Left as is (D11). Want Claude to fix the table in README? |
| Git repository | Not a git repo. Recommend `git init` + a private remote for history/backup (not done without your OK) |
| Docker for the 7 labs | Needed from 2.2.4; confirm availability at intake |
| Excalidraw (or paper + phone photo) | Needed from Phase 5 designs |
| Human mock partners | Needed from Phase 5 (≥ 6 total) |
| DDIA book | Recommended companion (PLAN §8) |
| Switch-track choices | Confirm at intake: target level (SDE-2 assumed), whether any target team is infra/AI-heavy (then bring Top-K, Metrics or AI rows forward), and human-mock partners for 3 mocks by ~Mar 2027 |

---

## 9. Changing things later

Edit the relevant `plan/roadmap/phase-NN.md` → run `python3 tools/gen_tracker.py` → add a row to §2/§4
here. Ask Claude to do it: "add X to the roadmap" follows this procedure (CLAUDE.md).
