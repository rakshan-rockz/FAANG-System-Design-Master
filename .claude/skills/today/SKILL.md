---
name: today
description: Start the next system design session — runs due spaced reviews, then resumes the next roadmap session ID from STATUS with the right skill.
---

# Start the next session

1. Run `date +%F`. Read `progress/STATUS.md`, `progress/profile.md`, `progress/review-queue.md`,
   `progress/weak-areas.md`, and the current phase file `plan/roadmap/phase-NN.md`. Note the
   **Active track** in STATUS; if it's `switch`, also read `plan/roadmap/TRACK-switch.md`.
2. If `progress/profile.md` is blank → run the intake flow (`.claude/skills/intake/SKILL.md`).
   If there's no baseline in `journal/` → the next session is 0.0.2 (baseline mock).
3. Locate the **Next session** ID in the phase file (switch track: also its row in `TRACK-switch.md`;
   a `switch:` Scope limits the session to the part before the semicolon and says what waits; a
   depth-track session on a row already done at switch scope covers only what waited, after a quick
   cold check of the rest; combined gate rows like `Gate 0-2` run `/gate` trimmed). If STATUS says it was partly done, resume at the
   noted point. If the last log entry is 7+ days old, start with a 10-min re-entry review of the
   last cycle.
4. Present a ≤ 6-line plan: due reviews (count + topics), session ID + type + title, the sub-points
   it must cover (from the roadmap row, limited by the switch Scope if any), one weak area to resurface. If the learner says they're
   short on time, offer the 15-min floor day (`/quiz` 5 questions + due reviews). Ask "Ready?"
5. On go: due reviews first (≤ 10 min, rapid recall; update the queue), then follow the skill for
   the session type:
   | Type | Skill |
   |---|---|
   | L / DD / C / LAB | lesson (`learn` / `deep-dive` / `compare`; LAB = guided hands-on) |
   | M / F | design (`mini` / `full`; Phase 10 → `staff`; 0.0.2 → `baseline`) |
   | Baseline | design `baseline` |
   | Cold (switch track) | design `full` under the Phase 9 cold rules (timed, no hints, curveball) |
   | WE | lesson flow, but the mentor demonstrates end-to-end first, narrating reasoning; the learner annotates and then critiques |
   | AR | arch-review |
   | P | drill |
   | R | weekly-review |
   | Gate | gate |
   | Intake | intake |
   | 👥 | help plan the human mock, then log its feedback via wrap |
6. Finish with the wrap-up protocol in `CLAUDE.md`.
