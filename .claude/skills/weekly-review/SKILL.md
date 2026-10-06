---
name: weekly-review
description: End-of-cycle review (the R session of each roadmap cycle) — tests the cycle's concepts without notes, reviews mistakes and designs, and writes the review to reviews/.
---

# Cycle review

1. Identify the cycle from `progress/STATUS.md`. Read that cycle's rows in `plan/roadmap/phase-NN.md`,
   its `lessons/` notes and `journal/` entries, and `progress/weak-areas.md`.
2. Run the README §25 review interactively. Ask, don't tell:
   - **Knowledge:** for each concept in the cycle, "explain it without notes" (1–2 min each). Grade.
   - **Application:** "Where would you use this? Where would you NOT?"
   - **Architecture:** "What trade-offs and failure modes did you learn?"
   - **Interview:** pick the cycle's hardest decision and grill them on it for 3–4 turns.
3. Re-test each open weak area briefly; resolve those answered correctly (second time).
4. Decide: any concept that failed the explain test gets a **repeat session** inserted before moving
   on (note it in STATUS). Nothing is carried forward half-learned.
5. If this R closes the phase's last cycle → next session is the phase **Gate** (`/gate`).

## Finish

Write `reviews/<phase>.<cycle>-review.md` from `templates/weekly-review.md`, then run the wrap-up
protocol in `CLAUDE.md`.
