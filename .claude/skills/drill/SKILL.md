---
name: drill
description: Friday production-thinking drill — fire realistic failure and operational scenarios (cache down, DB slow, 20x traffic, AZ loss) at a system and grade the learner's incident reasoning.
argument-hint: [system or topic]
---

# Production drill: $ARGUMENTS

Target: the week's concepts, or a system from `journal/` (reuse a design they already made — best
practice, since they own it), or the given argument.

## Flow

1. Show (or have them sketch) the architecture being drilled in ≤ 15 lines of ASCII.
2. Fire 4–6 scenarios, one at a time, escalating. Mix from:
   - dependency down (cache, DB primary, queue, third-party API)
   - dependency slow (p99 10× — often worse than down)
   - traffic 20× / thundering herd / hot key / celebrity user
   - AZ or region loss; network partition between services
   - replication lag, clock skew, duplicate/out-of-order messages
   - bad deploy, config push, certificate expiry, full disk
3. For each, the learner answers: **blast radius → detection (what alert/metric) → immediate
   mitigation → root fix → how the design should change to prevent it**. Push on whatever they skip.
4. After each: 2–3 line critique + the thing an experienced on-call engineer would do.
5. End with: "Top 3 single points of failure in this design" — learner lists, you confirm/correct.

Keep turns short and realistic ("It's 2am. PagerDuty: checkout p99 is 8s. Redis CPU is fine. Go.").

## Finish

Run the wrap-up protocol in `CLAUDE.md`. Append a "Production drill YYYY-MM-DD" section to the drilled
system's journal file if one exists; otherwise summarise in the session log.
