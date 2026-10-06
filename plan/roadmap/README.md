# Roadmap — Mastery-Gated, No Dates

**Principle:** progress is measured by what you can *do*, not by the calendar. Nothing is cut or
skimmed. Every README topic is covered in full, plus the ★ topics the README missed. You advance
past a gate only when you pass it. Some sessions will take two or three sittings. That's normal and expected.

## Structure

```
Phase  →  Cycles  →  Sessions  →  Gate
```

- **Phase** = a README phase (0–10), plus Phase 11 *Interview Mastery* (from the README §4 table).
- **Cycle** = one pass of the README weekly rhythm, **in order but not tied to weekdays**:
  `L` learn → `DD` deep dive → `C` compare → `M` mini design → `P` production drill →
  `F` full design (or `LAB`) → `R` review. Big topics span several cycles, and a cycle can have
  several `L`/`DD` sessions.
- **Session** = one sitting (~45–75 min; `F` 60–120 min). If a session isn't finished, it continues
  next time. Don't rush it to "stay on track".
- **Gate** = the end-of-phase exit test. Pass = every criterion met. Fail = a *remediation cycle*
  (targeted re-teach on the failed criteria + a fresh test), then retry the gate. There's no
  limit on attempts and no penalty for needing them.

## Session IDs

`<phase>.<cycle>.<n>` e.g. `2.3.2` = Phase 2, Cycle 3, session 2. `progress/STATUS.md` records the
next session ID. `/today` resumes from it.

## Mastery definition (a topic becomes ✅ in the tracker only when all four are true)

1. **Explain**: 2-minute explanation from memory, accurate, including *why it exists*.
2. **Apply**: used correctly in a mini or full design.
3. **Defend**: survives 3+ interviewer follow-ups ("why not X?", "what if it fails?", "at 100×?").
4. **Retain**: recalled correctly at the +21-day spaced review.

Until then it's 🟨. Confidence 1–5 is tracked separately.

## Design passes: every design is done at least twice

1. **Learning pass**, inside the phase whose concepts it exercises. Mentor review, ideal
   architecture, score.
2. **Timed cold pass**, in Phase 9's circuit: 45 min, no warm-up, strict score. Target ≥ 95/120.

Designs that recur (Ticket Booking, Notification, URL Shortener) are deliberately *evolved*: the
same system under new requirements or 100× scale (README Rule 8).

## Legend

`L` learn · `DD` deep dive · `C` compare · `M` mini design · `P` production drill · `F` full design ·
`LAB` hands-on lab (Docker) · `WE` worked example (mentor demonstrates) · `AR` architecture-review
role-play (mentor plays a senior architect; learner interrogates) · `R` review · `📄` paper/reading ·
★ added topic (not in README) · `#n` README classic-design number

## Pedagogical design (why the roadmap is shaped this way)

| Principle | Evidence base | Where it shows up |
|---|---|---|
| **Mastery learning** | Bloom (1968, 1984): advance on demonstrated mastery, remediate the gaps | Gates + remediation cycles; ✅ needs explain + apply + defend + retain |
| **Spiral curriculum** | Bruner: revisit ideas at increasing depth | Auth (1.2 → 8.3), IDs (2.7 → 6.4), observability (4.1 → 8.1), consistency (0.2 → 2.6 → 3.3), evolving designs (URL Shortener v1/v2, Ticket Booking v1–v3, Notification v1/v2/#28/staff) |
| **Prerequisites before application** | Cognitive load theory | Every design's learning pass sits after the concepts it needs (e.g. ID Generator moved to Phase 2 with sharding; Pastebin after object storage; microservices before sagas) |
| **Worked examples → faded scaffolding → independent** | Sweller; expertise-reversal effect | 0.4.6 worked example; scaffolded prompts in Phases 0–2 designs, fewer in 3–4, none from 5; cold in 9 |
| **Productive failure** | Kapur: attempt first, then instruction | Every lesson opens with a problem to attempt; designs before ideal solutions (README Rule 7) |
| **Retrieval practice** | Roediger & Karpicke: testing beats re-reading | Explain-back every lesson, `/quiz`, gates, cold circuit |
| **Spaced repetition** | Ebbinghaus; Cepeda et al. | +2/+7/+21/+60 review queue |
| **Interleaving** | Rohrer & Taylor | Designs mix concepts from several phases; quizzes mix phases; Phase 9 shuffled order |
| **Elaborative interrogation** | Pressley; Dunlosky et al. | The README's 11 questions on every concept |
| **Dual coding** | Paivio | Every concept gets a diagram; designs drawn, not just described |
| **Critique & error detection** | Higher-order (Bloom's "evaluate") | `AR` architecture-review role-plays at the end of every phase |
| **Cognitive apprenticeship** | Collins, Brown & Newman: model → coach → fade | WE (model), mentor review (coach), cold passes (fade) |
| **Desirable difficulties** | Bjork | Cold starts, curveballs, unseen prompts, timed conditions |
| **Metacognition & calibration** | Self-assessment accuracy predicts learning | Predict your gate score per criterion before each gate; compare |
| **Concept mapping** | Novak | Concept map of the phase in every final R session and at each gate |
| **Deliberate practice** | Ericsson | Remediation targets the weakest rubric categories specifically |

## Phase files

| Phase | File | Cycles |
|---|---|---|
| 0 System Design Foundations | [phase-00.md](phase-00.md) | 0.0 – 0.4 |
| 1 Networking & Web Foundations | [phase-01.md](phase-01.md) | 1.1 – 1.5 |
| 2 Data & Storage | [phase-02.md](phase-02.md) | 2.1 – 2.11 |
| 3 Distributed Systems Foundations | [phase-03.md](phase-03.md) | 3.1 – 3.5 |
| 4 Scalability & Reliability (+ ★ architecture styles) | [phase-04.md](phase-04.md) | 4.1 – 4.5 |
| 5 Messaging & Event-Driven Systems | [phase-05.md](phase-05.md) | 5.1 – 5.6 |
| 6 Advanced Distributed Data | [phase-06.md](phase-06.md) | 6.1 – 6.6 |
| 7 Search, Analytics, Data & AI Systems | [phase-07.md](phase-07.md) | 7.1 – 7.10 |
| 8 Production Architecture (+ ★ cloud & platform) | [phase-08.md](phase-08.md) | 8.1 – 8.8 |
| 9 Classic Designs: timed circuit | [phase-09.md](phase-09.md) | 9.1 – 9.7 |
| 10 Staff-Level / Ambiguous (+ ★ architect's toolkit) | [phase-10.md](phase-10.md) | 10.1 – 10.4 |
| 11 Interview Mastery & Architect Conversations | [phase-11.md](phase-11.md) | 11.1 – 11.3 |

## Rules that never bend

- No skipping. If the learner already knows a topic, **prove it**: pass that topic's gate
  questions cold. Then the session becomes a deep-dive extension, not a skip.
- No moving on with an open ❌ gate criterion.
- Spaced reviews (`progress/review-queue.md`) run before new material, every session.
- Phase 9 cold passes happen only after that design's learning pass.
- **Scaffolding fades:** design learning passes in Phases 0–2 get stage-by-stage prompts; Phases 3–4
  get prompts only when stuck; Phase 5+ none; Phase 9+ cold.
- Every phase ends with an `AR` role-play and a concept map before its gate.
