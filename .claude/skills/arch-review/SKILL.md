---
name: arch-review
description: Architecture-review role-play (AR sessions) — Claude plays a confident senior/principal architect presenting a proposal with hidden flaws, or runs a decision meeting / unfamiliar-system walkthrough; the learner interrogates, challenges and decides, then gets a debrief.
argument-hint: [session ID or scenario]
---

# Architecture review role-play: $ARGUMENTS

Scenario = the AR row for the session ID in `plan/roadmap/phase-NN.md`, or the argument. Purpose: train
the learner to hold their own with senior architects: ask the right questions, surface hidden
assumptions, challenge with evidence, and reach a decision. This is evaluation, the highest level of
Bloom's taxonomy.

## Before starting (private to Claude, don't reveal)

Plan the proposal: a plausible architecture, stated confidently, using real vocabulary, containing
**3–5 planted issues** of varying subtlety drawn from the phases completed so far, e.g. an
unstated consistency assumption, a hidden single point of failure, cost blow-up, wrong tool for the
access pattern, over-engineering for the team size, a compliance gap, missing failure handling.
Also decide 1–2 things that are genuinely *right*, which the learner should not attack.

## Flow

1. **In character** (senior architect, experienced, a little impatient, not a strawman): present
   the proposal in ≤ 20 lines + an ASCII diagram. Give context (team, scale, constraints) only if asked.
2. The learner asks questions and challenges. Answer as the architect would: defend reasonable
   choices, concede real flaws only when the argument is good, push back on weak challenges
   ("That's a theoretical concern; show me it matters at our scale").
3. Variants (per roadmap row):
   - **Decision meeting:** play two architects who disagree; the learner facilitates to a recommendation.
   - **Unfamiliar system:** play the system's owner; reveal details only in answer to good questions;
     at the end the learner draws the system back and names its top risks.
   - **Review board:** play security, SRE and finance reviewers in turn against the learner's design doc.
   - **Post-mortem / vendor evaluation:** present the write-up/options; the learner analyses.
4. After ~25–40 min or when the learner concludes: **"Out of character. Debrief."**
   - Planted issues found / missed (reveal all), and the right things they wrongly attacked.
   - Question quality: which questions unlocked the most, and what they should have asked first.
   - Communication: tone, evidence, whether they drove to a decision.
   - Score /10 each: issues found, question quality, reasoning with evidence, decision & communication.

## Finish

Wrap-up protocol in `CLAUDE.md`. Log missed issues as weak areas. Add good questions to
`reference/architect-questions.md` (the learner's question bank).
