---
name: lesson
description: Teach a system design concept from first principles using the programme's Mentorship Protocol (learn, deep-dive, or compare mode), with checks for understanding and a mini exercise.
argument-hint: [session ID or topic] [learn|deep-dive|compare]
---

# Concept lesson: $ARGUMENTS

If no topic/ID given, use the next session ID in `progress/STATUS.md`; its row in
`plan/roadmap/phase-NN.md` lists **every sub-point that must be covered**. Cover all of them; if the
sitting ends first, record the resume point in STATUS. Mode follows the row type (L → `learn`,
DD → `deep-dive`, C → `compare`, LAB → hands-on: give setup commands, the learner runs them and
reports results, you interpret). Papers marked 📄 are assigned as reading before/after the session.
Read `progress/weak-areas.md` first and plan to resurface one related item. New vocabulary →
ask the learner to define it in `reference/glossary.md` at the end.

## Flow (README §29) — one step per turn, wait for the learner between steps

1. **Hook / prior knowledge** — ask what they already think the concept is, or pose a concrete
   problem that the concept solves ("You have one Postgres box doing 40k reads/s and it's at 95% CPU…").
   Let them attempt a solution first.
2. **Intuition** — a real-world analogy or tiny scenario. Short.
3. **Why it exists** — the underlying problem and why naive approaches fail.
4. **How it works** — mechanism, with an ASCII diagram if it helps. Stop and ask a check question.
5. **Examples** — where real systems use it (named generically: "Dynamo-style", "Kafka-style").
6. **Trade-offs** — ask the learner to name costs before you list them.
7. **Failure scenarios** — "What happens when ___ fails?" Learner answers first.
8. **Interview questions** — 2–3 questions an interviewer would ask; learner answers; you critique.
9. **Mini exercise** — a small applied problem (estimation, pick-a-design, spot-the-bug).
10. **Review** — learner gives the 2-minute explanation in their own words. Grade it: what was
    precise, what was missing, what was wrong.

## Modes

- `learn` — full flow above; breadth over depth.
- `deep-dive` — skip to mechanism; go beneath the surface (edge cases, magnitudes, what the literature
  says, how applications compensate). Heavy on "why does that happen?" and "how big can it get?".
- `compare` — two or more alternatives (e.g. sync vs async replication). Build a comparison table
  *with* the learner across: guarantees, latency, throughput, failure behaviour, operational cost,
  when to pick each. End with 3 "which would you choose and why?" scenarios.

## Style

- ≤ ~25 lines per turn; end each turn with a question.
- Cover the 11 questions of README §2 across the lesson.
- Correct misconceptions immediately and log them for wrap-up.

## Finish

Run the wrap-up protocol in `CLAUDE.md` (tracker, weak areas, STATUS, lesson note in
`lessons/phase-N/<ID>-slug.md` from `templates/lesson-note.md`).
