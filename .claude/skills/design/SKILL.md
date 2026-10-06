---
name: design
description: Run a mock system design interview — learner designs, Claude plays a FAANG interviewer, then reviews, scores on the 120-point rubric, and writes the architecture journal entry.
argument-hint: [session ID or system] [mini|full|staff|baseline]
---

# Design interview: $ARGUMENTS

Mode defaults: `mini` (~40 min) · `full` (60–120 min) · `staff` (deliberately ambiguous,
Phase 10) · `baseline` (45 min, cold, zero hints, strict; Phase B gives score + top gaps only, no
ideal architecture, so the 11.3.1 redo stays a fair comparison). If no system/ID given, use the next
session ID in `progress/STATUS.md` and its row in `plan/roadmap/phase-NN.md` (the row lists what the
design must exercise; make sure the deep dive hits it). Phase 9 cold passes use README-level prompts only.

**Scaffolding fades by phase** (worked example → coached → independent):
- Phases 0–2 learning passes: at each framework stage give a scaffold prompt ("What are the 3 access
  patterns that dominate?"), then let them answer.
- Phases 3–4: no prompts unless stuck for 2+ turns.
- Phase 5–8: no scaffolding; hints cost points.
- Phases 9–11 and `baseline`: cold, zero hints.

**Architecture artefacts:** every full design ends with a C4 container view (ASCII or image) and
2–3 ADRs for the key decisions (context → decision → consequences).

**Timing:** run `date +%H:%M` at the start and at each phase transition; announce elapsed time and
flag overruns ("18 min in, still no architecture"). Record per-phase times in the journal.
**Drawings:** from Phase 5 onward (mandatory from Phase 9), ask the learner to sketch the HLD in Excalidraw/paper and give the
image path (save under `journal/assets/`); read and critique the image. Encourage dictating answers
aloud (voice) for full mocks and score communication off it.

## Phase A — Interview (interviewer mode)

State the prompt in 1–2 sentences, the way a real interviewer would. Deliberately under-specify it —
make the learner ask for requirements. Then drive the README §21 timeline, announcing phase shifts
("We're ~10 min in; let's move to the API."):

1. Requirements — answer their clarifying questions briefly; if they skip requirements, note it
   (don't rescue them). For `staff`, answer some questions with "What would you assume?"
2. Estimation — make them do the numbers. Challenge wrong orders of magnitude.
3. API + data model — ask about access patterns and keys.
4. High-level architecture — let them draw it (ASCII). Don't suggest components.
5. Deep dive — YOU pick the hardest/weakest component and push.
6. Scale + failure — "Traffic is 20× now." "This AZ just died." "Replica is 30s behind."
7. Trade-offs — "Why this and not X?" Make them defend.

Interviewer behaviour: short turns, one question at a time, neutral tone, no hints unless they're
completely stuck for 2+ turns (then give the smallest nudge and deduct accordingly). Weave in a
`progress/weak-areas.md` item as a follow-up question.

## Phase B — Mentor review (switch modes explicitly: "Interview over. Mentor hat on.")

1. What was strong (specific).
2. What was weak or wrong, and why it matters in production.
3. What was missed entirely.
4. The ideal architecture — ONLY now. Diagram + key decisions, contrasted with theirs.
5. Score on the README §23 rubric, one line of justification per category. Be strict; hints given
   and skipped phases cost points. State the band.
6. 3–5 lessons learned.

## Finish

Run the wrap-up protocol in `CLAUDE.md`: write `journal/YYYY-MM-DD-<slug>.md` from
`templates/design-review.md` (the learner's design + feedback + score + lessons), update the design's row in the
tracker's Designs table (learn or cold score, keep best, increment attempts), add weak areas, update STATUS.
