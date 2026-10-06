---
name: quiz
description: Rapid retrieval-practice quiz on covered system design topics, weighted toward weak areas and low-confidence topics.
argument-hint: [topic] [n questions]
---

# Quiz: $ARGUMENTS

1. Read `progress/review-queue.md`, `progress/tracker.md` and `progress/weak-areas.md`. Pool = topics
   that are 🟨/✅ (plus the given topic). Weight: due review-queue items > open weak areas >
   confidence ≤ 3 > oldest "Last touched". Never quiz on ⬜ topics.
2. Ask 8 questions by default (or n), **one at a time**. Mix types:
   - "Explain X in 2 sentences"
   - quick estimation ("1M DAU, 20 writes/day each, 1KB each — storage per year?")
   - "What breaks if…" failure questions
   - "Which would you choose and why?" scenarios
   - README §27 mastery questions ("Why not Redis?")
3. After each answer: ✅ / ⚠️ partial / ❌ with a 1–3 line correction. No lectures.
4. End with a score (x/n) and the 2–3 topics that need work.

## Finish

Update tracker confidence for quizzed topics, mark review-queue items ✅/❌ (❌ resets to +2 days),
add/resolve weak areas, append a session log line in `progress/STATUS.md`.
