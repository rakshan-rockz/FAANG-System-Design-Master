---
name: gate
description: Run a phase exit gate from the roadmap — tests every criterion cold; pass unlocks the next phase, any failure creates a targeted remediation cycle and a retry.
argument-hint: [phase number]
---

# Phase gate: $ARGUMENTS

Phase = argument, or the current phase in `progress/STATUS.md`. Read the **Gate** section at the
bottom of `plan/roadmap/phase-NN.md`, plus `progress/tracker.md` and `progress/weak-areas.md`.

**Active track** (STATUS). On the **switch** track the gate is a *trimmed* gate row of
`plan/roadmap/TRACK-switch.md` (e.g. `Gate 0-2` = Gates 0, 1, 2 in one sitting): test only the
criteria whose sessions are in the switch track (its Scope cell lists what's deferred), mark the
others `deferred`, apply design-score bars only to included designs, and draw one concept map of the
included material. Pass → Gates table `🟨 trimmed pass <date>` for each phase covered; next session =
the next track row. On the **depth** track the full gate tests the deferred criteria plus a spot-check
of the trimmed-passed ones; pass → ✅.

## Rules

- Interviewer mode. Cold: no notes, no hints, no teaching during the gate.
- Test **every** criterion with fresh questions/prompts the learner hasn't seen (don't reuse lesson
  exercises). Design-score criteria use the best learning-pass scores already in the tracker; if a
  score is below the bar, that design must be re-attempted as part of remediation.
- May span multiple sittings. Record progress per criterion in STATUS between sittings.

## Flow

1. Announce the gate and its criteria list. **Calibration:** before testing, the learner predicts
   pass/fail and a 1–5 confidence for each criterion. Record predictions and compare at the end;
   note systematic over- or under-confidence in `progress/profile.md`.
1a. The learner draws the phase **concept map** (key concepts + labelled links); critique missing or
   wrong links. It's required, not optional.
2. Test each criterion (a few questions, an estimation, a mini design, or a defend-under-follow-up
   exchange, whichever the criterion calls for). Mark ✅ / ❌ with a 1-line reason each.
3. Result:
   - **All ✅** → gate passed. Mark it in the tracker's Gates table; set next session to the first
     session of the next phase (switch track: the next track row); refresh `progress/profile.md` self-assessment with the learner (2 min).
   - **Any ❌** → write a **remediation cycle** into STATUS: for each failed criterion, the specific
     roadmap sessions to redo (as harder deep-dives, not replays) plus a fresh exercise. Next session
     = first remediation item. Retry the gate (only the failed criteria + one spot-check of a passed
     one) after remediation.
4. Tell the learner plainly what passed, what didn't, and why. No softening, no discouragement.
   Attempts are unlimited.

## Finish

Wrap-up protocol in `CLAUDE.md` (Gates table: status, attempts, date passed).
