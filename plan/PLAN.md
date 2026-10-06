# Mentor's Plan — System Design Programme

> `README.md` = the charter (what & why). This file = the mentor's strategy (how).
> `plan/roadmap/` = the full, mastery-gated sequence of sessions that `/today` follows.

**Guiding decision (from the learner): progress over timeline.** No content is cut, skimmed or
compressed to fit dates. The README's Aug–Dec window is a direction, not a deadline. We advance
when a gate is passed, and it takes as long as it takes.

---

## 1. Assessment of the README plan

**Excellent, and kept as the backbone:**
- First-principles framing (the 11 questions). This is exactly what separates strong candidates.
- The weekly rhythm (learn → deep-dive → compare → apply → break it → full design → review): a
  complete learning cycle (acquisition, elaboration, discrimination, application, retrieval). It is
  kept as the **cycle order**, just not tied to weekdays.
- Failure-first thinking, the scoring rubric, the design-review template, the architecture journal.
- "Design before you see the solution" (Rule 7).

**What I've strengthened:**

| # | Gap in the README plan | Why it matters | What the roadmap does |
|---|---|---|---|
| 1 | Designs only begin in Phase 9 | Concepts don't stick until they're applied | Every design gets a **learning pass** inside the phase that teaches its concepts, **plus** a timed cold pass in Phase 9. More design work, not less |
| 2 | "Done" isn't defined | Reading ≠ knowing | 4-part mastery bar (explain, apply, defend, retain) + a **gate** per phase with remediation loops |
| 3 | No baseline | Can't measure growth | Cold baseline mock at 0.0.2, redone at 11.3.1 |
| 4 | Missing topics (§3) | Interviewers and architects probe them; several designs are impossible without them | 93 ★ sessions added across phases, incl. architecture styles/DDD, AI/LLM systems, data engineering, cloud/platform, threat modelling & compliance, architect's toolkit |
| 5 | Missing common designs | Frequently asked problems not in the list | 14 ★ designs + 6 ★ staff prompts added (§4) |
| 6 | No spaced repetition | Early phases are forgotten by the later ones | Review queue at +2/+7/+21/+60 days (§5) |
| 7 | Typed/ASCII only | Interviews are spoken and drawn | Voice + real diagrams protocol (§6) |
| 8 | AI-only interviewer | Useful but can lead subtly, with no social pressure | ≥6 human mocks (Phase 11 runs in parallel from Phase 5) |
| 9 | No hands-on | Seeing things break is the fastest way to understand them | 7 labs (Docker) at the points where they teach most |
| 10 | Phase table (§4) ≠ section numbering | Confusing | Roadmap follows sections 0–10; "Interview Mastery" becomes Phase 11 |
| 11 | No learner profile | Depth and interviewer style should match the target level/companies | `/intake` → `progress/profile.md` |
| 12 | No practice at *conversations* with architects | Your stated goal: hold your own with senior architects | 14 `AR` role-plays (`/arch-review`), architect's toolkit (10.2), architect-conversation cycle (11.2), glossary + question bank |
| 13 | Pure attempt-first even for novices | Novices learn more from worked examples first (expertise-reversal effect) | Worked example 0.4.6 + scaffolding that fades by phase |

---

## 2. Scale of the programme

| | Count |
|---|---|
| Phases | 12 (0–11), 75 cycles |
| Concept sessions (L / DD / C) | 216 |
| Labs / worked examples / architecture-review role-plays | 7 / 1 / 14 |
| Designs | 56: 30 README classics + 14 ★ (incl. 2 AI) + 1 README exercise + 5 README staff + 6 ★ staff |
| Design attempts | ≥ 2 per classic (learning + cold); evolved versions: URL Shortener ×2, Ticket Booking ×3, Notification ×2 (+#28 + staff) |
| Gates | 12, each with explicit criteria, a concept map, and calibration |
| ★ rows beyond the README | 93 of 238 tracked sessions |

At ~1 session/day this is well beyond a few months. That's expected, and it's the point.

---

## 3. Topics added beyond the README (★)

| Area | Added | Phase |
|---|---|---|
| Foundations | MTBF/MTTR, availability composition maths, tail-latency amplification, Little's Law, utilisation vs queueing, capacity sizing, interview communication | 0 |
| Networking | CIDR/subnets, layer model, anycast, DNS record types & negative caching, TIME_WAIT, BBR, Nagle, mTLS, TLS termination, API gateway, LB HA & GSLB, origin shield, pull vs push CDN | 1 |
| APIs & real-time | REST design craft (pagination, idempotency, versioning, errors, LROs), REST vs gRPC vs GraphQL, encoding & schema evolution, polling/long-poll/SSE/WebSocket/webhooks, C10K→C10M | 1 |
| Storage | Window functions, planner basics, partial/GIN indexes, pages/WAL/buffer pool, LSM trees & compaction, B-tree vs LSM amplification, row vs column | 2 |
| Transactions | Anomalies (lost update, write skew, read skew, phantoms), 2PL vs SI vs SSI, gap/predicate locks | 2 |
| Replication & sharding | Logical vs physical replication, CDC, lag-handling patterns, rendezvous/jump hashing, local vs global secondary indexes | 2 |
| Caching | Hit-ratio maths, write-around, refresh-ahead, LRU implementation, admission, probabilistic early expiry, Bloom filters, cache-DB races | 2 |
| NoSQL & objects | NewSQL, erasure coding, object-store internals | 2 |
| Distributed | 8 fallacies, failure detection (phi-accrual), gray failure, gossip/SWIM, PACELC, full session guarantees, linearisability vs serialisability, sloppy quorum, hinted handoff, read repair, Merkle trees, FLP, coordination services | 3 |
| Reliability | Client vs server discovery, predictive autoscaling, USE method, Amdahl, load testing, retry budgets, metastable failures, hedged requests, DR tiers, PITR, chaos engineering | 4 |
| Messaging | Kafka ISR/acks/compaction/rebalancing, Kafka transactions, schema registry, 3PC, semantic locks, workflow engines, CDC outbox relay, fan-out on write vs read | 5 |
| Advanced data | Fencing tokens, Redlock debate, TrueTime, CRDT types, OT vs CRDT, HLL, Count-Min, UUIDv7, ledgers & double-entry, geo-partitioning & data residency | 6 |
| Specialised | Analysers, BM25, doc- vs term-partitioned indexes, search-DB sync, columnar, star schemas, lakehouse, Parquet, MapReduce/Spark, windows & watermarks, Lambda vs Kappa, Gorilla compression, cardinality, geohash/quadtree/R-tree/S2/H3, recsys pipeline & feature store | 7 |
| Production | Log sampling, RED/USE, tail sampling, alerting & on-call, burn-rate alerts, SSO, OAuth+PKCE, OIDC, JWT pitfalls, ReBAC, envelope encryption, L3/L4 vs L7 DDoS, bot defence, multi-tenancy, zero-downtime migrations, namespaces/cgroups, probe types, HPA, service mesh, video pipeline, cost awareness | 8 |
| Staff | Ambiguity handling, strangler fig/dual writes/shadow traffic, build vs buy, Conway's law, design docs/ADRs | 10 |
| Single machine | CPU/threads/context switches, memory & storage hierarchy, page cache & fsync, event loop vs thread pool | 0 |
| Architecture styles | Monolith/modular monolith/SOA/microservices/serverless, DDD bounded contexts & aggregates, BFF, contract testing, hexagonal architecture, cell-based architecture, shuffle sharding, static stability | 4 |
| Data engineering | ETL/ELT, orchestration, backfills, data quality, lineage, governance, data mesh, lakehouse table formats | 7 |
| AI systems | Embeddings, ANN (HNSW/IVF/PQ), vector DBs, hybrid search, LLM inference (prefill/decode, KV cache, batching), LLM serving, RAG, agents & tool use, evals & guardrails, prompt injection | 7 |
| Cloud & platform | VPC networking, managed-services map, serverless, IaC & GitOps, platform engineering, FinOps | 8 |
| Security depth | Passkeys, workload identity, zero trust, policy engines, STRIDE, supply chain, GDPR erasure, PCI scope, audit logs, incident response | 8 |
| Architect's toolkit | C4, ADRs, design docs/RFCs, ATAM-lite, fitness functions, tech debt, team topologies, influence without authority | 0, 10 |
| Interview | Company formats, Meta Product Architecture, "system you built" stories, curveball drills, architect-conversation role-plays | 11 |

## 4. Designs added beyond the README (★)

Leaderboard · Distributed Key-Value Store · Web Crawler · Stock Exchange · Object Storage (S3-like) ·
Search Autocomplete/Typeahead · Top-K/Ad-Click Aggregator · Metrics & Monitoring · Proximity/Yelp ·
Distributed Logging · Online Judge/Code Execution · Email Service · Enterprise RAG Assistant · LLM Chat Service.
**Staff:** Multi-tenant SaaS · Monolith→services migration · 40% cost cut · Global API platform ·
Feature-flag/config platform · Internal AI platform.

---

## 5. Retention system

- **Spaced review queue** (`progress/review-queue.md`): every topic reaching 🟨 gets reviews at
  **+2, +7, +21, +60 days**. Every session opens with due reviews (≤ 10 min) before new material.
  A failed review resets that topic to +2 and logs a weak area.
- **Explain-back:** every lesson ends with your own 2-minute explanation, graded and stored in the
  lesson note. I'll quote it back to you later.
- **Interleaving:** designs deliberately reuse earlier concepts; quizzes mix phases.
- **Build your own references** (you write them, I verify): `reference/numbers.md` and
  `reference/patterns.md`, which becomes your internal architecture library (README §24).
- **Weak-area loop:** every mistake is logged verbatim and resurfaced until you get it right twice.
- **Evolving designs:** URL Shortener (v1 simple → v2 100× scale), Ticket Booking (v1 correctness →
  v2 flash-sale surge → v3 distributed holds), Notification (v1 sync → v2 queues → #28 global → staff).

---

## 6. Interview-realism protocol

1. **Talk out loud:** dictate full-design answers by voice. I score communication from them.
2. **Draw for real:** Excalidraw or paper for full designs; save the image to `journal/assets/` and
   I'll critique it. Mandatory in Phases 9–11, encouraged from Phase 5.
3. **Timed:** I timestamp each interview phase and flag overruns.
4. **Human mocks:** ≥ 6 in total, starting in Phase 5. Their feedback enters the weak-area log.
5. **Cold starts:** Phase 9 onward, every design is unseen-order and unprepared.
6. **Curveballs:** mid-design requirement changes, scale jumps, region loss, legal constraints.

---

## 7. Company calibration (refined after intake)

- **Google:** estimation, clean abstractions, one deep dive into the hardest component.
- **Meta:** *System Design* (backend) vs *Product Architecture* (API, data model, client contract,
  pagination, real-time). Practise both (11.1.2).
- **Amazon:** operations, ownership, SLAs and cost tied to customer impact.
- **Uber/Stripe/fintech:** correctness under failure, idempotency, auditability.
- **Startups/scale-ups:** pragmatism; the simplest thing that works, then evolution.

---

## 8. Reading, papers, labs

**Primary text:** *Designing Data-Intensive Applications* (Kleppmann). Read the matching chapter
alongside each phase (2nd edition reorganises chapters; map by title):
reliability/scalability → P0 · encoding & evolution → P1 · data models, storage & retrieval,
transactions, replication, partitioning → P2 · trouble with distributed systems, consistency &
consensus → P3 · stream processing → P5/P7 · batch processing → P7.

**Interview books** (e.g. Alex Xu vol. 1–2): read a chapter **only after** your learning pass of
that design is scored. Use it to compare, never to memorise.

**Papers** (scheduled in the roadmap): *The Tail at Scale* (0.2.3) · *GFS* (2.9.3) · *Scaling Memcache at
Facebook* (2.11.3) · *Dynamo* (3.4.4) · *Raft* (3.5.2) · *Kafka* (5.2.2) · *Spanner* (6.2.2).

**Labs** (Docker): indexes (2.2.4) · isolation anomalies (2.4.4) · replication lag (2.6.6) ·
cache stampede (2.11.4) · etcd elections (3.5.5) · Redis rate limiter (4.2.4) · Kafka consumer
groups (5.2.3).

---

## 9. Pace without deadlines

- **Rhythm, not dates:** aim for a session most days (45–75 min; full designs 60–120). The next
  session is simply the next undone ID.
- **Unfinished sessions continue** next time. Splitting a deep dive across 2–3 sittings is normal.
- **Floor day:** on a bad day, do a 15-min `/quiz` or the due reviews. This keeps the habit and the
  retention going without starting new material half-focused.
- **Long gaps:** after 7+ days away, the next session starts with a re-entry review of the last cycle.
- **Never** rush a gate to "catch up". There's nothing to catch up to.

---

## 10. Traps I'll call out by name

- Drawing boxes before requirements and numbers.
- Naming a technology instead of a property ("use Kafka" vs "we need a durable, replayable,
  partitioned log because…").
- "Eventually consistent" without saying *what the user sees* and *for how long*.
- Adding microservices/queues/caches without a stated bottleneck (Rule 6).
- Ignoring the write path, deletes, or the unhappy path.
- Spending 20 minutes on the easy part and none on the hard part.
- Treating reading about system design as the same thing as doing it.

---

## 11. Risks

| Risk | Mitigation |
|---|---|
| Momentum loss over a long programme | Floor days, visible gate progress, re-entry reviews |
| Passive learning | Every session ends in an exercise; designs in every phase |
| Forgetting early phases | Spaced review queue; interleaved designs; Phase 9 cold circuit |
| AI-only feedback bias | Human mocks; strict rubric; baseline vs final comparison |
| Knowing without performing | Phases 9 & 11: timed, voiced, drawn, cold |

---

## 12. Job-switch track (added 2026-09-25)

**Why:** the learner now wants to switch jobs within 12 months (22 → 30–35 LPA at Amazon, Microsoft,
Uber, Atlassian, Google, Flipkart, PhonePe, Razorpay, Swiggy, Walmart Global Tech, Adobe, Salesforce).
These are mostly **SDE-2** loops; HLD rounds are expected ~Apr–Jun 2027. An SDE-2 HLD round rewards
solid fundamentals, the 45-min framework, estimation and ~12–18 classic designs done well, not the
architect-level and internals depth of the full course.

**What:** `plan/roadmap/TRACK-switch.md` orders existing roadmap rows by interview value: framework,
estimation, building blocks, networking/APIs at interview level, databases/indexing/replication/
sharding/caching, consistency basics, queues/async, rate limiting, resilience, and 16 design learning
passes (15 systems), then 5 timed cold mocks, 1 unseen prompt and 3 human mocks, with 3 trimmed gates.
Internals that the sibling `FAANG-CS-Core-Master` course teaches are deferred here (DECISIONS D27).

**Numbers:**

| | Sessions | Hours (incl. 20% overhead) |
|---|---|---|
| 🎯 Switch track | 98 + 3 trimmed gates | **189 h** (budget 190 h) |
| Full course (all roadmap rows + 12 gates + 11 DDIA chapters + 7 papers) | 486 sittings (incl. 7 human mocks) | **≈ 907 h** |

Full-course estimate: 684 h of sessions (124 L, 60 DD, 32 C, 27 M, 53 F, 55 cold/staff, 30 P, 14 AR,
74 R, 7 LAB, 1 WE, intake, baseline, 7 human mocks) + 36 h gates + 36 h reading = 756 h × 1.2.
The full course therefore continues well beyond the switch year as the depth track, which is fine (D2).

**Nothing is cut.** Deferred rows and the "what waits" part of every `switch:` row form the **depth
track**, run in roadmap order after the switch (or earlier by choice). The rules, the mastery bar and
the full gates are unchanged (DECISIONS D22–D27).

