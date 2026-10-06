# Phase 10 — Staff-Level / Ambiguous Designs

README §20. Deliberately incomplete requirements. The interviewer answers many questions with
"What would you assume?". Evaluated on: requirement discovery, assumption quality, architectural
judgment, trade-offs, failure reasoning, cost awareness, operational maturity.

**Session format:** 60–90 min. The rubric adds a staff overlay scored /10 each: *problem framing*,
*assumption quality*, *cost awareness*, *evolution/migration plan*, *operational maturity*,
*org/ownership boundaries*.

## Cycle 10.1 — Staff thinking

| ID | Type | Session |
|---|---|---|
| 10.1.1 | L | ★ **How staff engineers approach ambiguity**: finding the real problem, stating assumptions, phasing (v0 → v3), build vs buy, reversibility (one-way vs two-way doors) |
| 10.1.2 | L | ★ **Evolution & migration**: strangler fig, branch by abstraction, dual writes & backfills, shadow traffic, cutovers without downtime, rollback plans |
| 10.1.3 | L | ★ **Cost & organisational design**: cost models, service ownership boundaries, Conway's law & the inverse Conway manoeuvre, team topologies (stream-aligned, platform, enabling), platform vs product teams |
| 10.1.4 | R | Review |

## Cycle 10.2 — ★ The architect's toolkit

| ID | Type | Session |
|---|---|---|
| 10.2.1 | L | ★ **Documenting architecture**: C4 in depth (context/container/component/code, dynamic & deployment views), ADRs (context, decision, consequences, status), design docs & RFC process, how reviews run at large companies |
| 10.2.2 | DD | ★ **Structured trade-off analysis**: quality-attribute scenarios, utility trees, ATAM-lite, weighted decision matrices, sensitivity & risk points, making a recommendation under uncertainty |
| 10.2.3 | L | ★ **Evolutionary architecture**: fitness functions, architectural drift, technical debt (types, interest, how to argue for paying it down), deprecation strategy, API governance & versioning policy |
| 10.2.4 | L | ★ **Influence without authority**: framing decisions for executives vs engineers, disagreeing with a senior architect productively (surface constraints, test assumptions, propose an experiment), writing a one-page decision memo |
| 10.2.5 | M | ★ Write a design doc + 2 ADRs for one of your Phase 9 designs; the mentor reviews it as a principal engineer would |
| 10.2.6 | AR | ★ **Architecture review board role-play**: defend your design doc against 3 reviewers (security, SRE, finance) played by the mentor |
| 10.2.7 | R | Review |

## Cycle 10.3 — README staff prompts

| ID | Design |
|---|---|
| 10.3.1 | Global payment platform processing hundreds of millions of transactions per day |
| 10.3.2 | Globally distributed notification platform |
| 10.3.3 | Ride-sharing platform operating across multiple continents |
| 10.3.4 | Globally consistent inventory system |
| 10.3.5 | Distributed job scheduling platform |
| 10.3.6 | R |

## Cycle 10.4 — ★ Additional staff prompts

| ID | Design |
|---|---|
| 10.4.1 | ★ Multi-tenant SaaS platform with per-tenant isolation and data residency |
| 10.4.2 | ★ Migrate a monolith with a shared database to services, with zero downtime |
| 10.4.3 | ★ "Cut this system's infrastructure cost by 40% without hurting SLOs" |
| 10.4.4 | ★ Global API platform: gateway, auth, rate limiting, quotas, billing |
| 10.4.5 | ★ Feature-flag & configuration platform used by 1,000 services |
| 10.4.6 | ★ Internal AI platform: shared LLM gateway, RAG and evals for 50 product teams |
| 10.4.7 | R + concept map of Phases 0–10 → **Gate** |

## Gate 10

- [ ] Each staff prompt: base rubric ≥ 95/120 and staff overlay ≥ 45/60.
- [ ] Consistently states assumptions explicitly, and proposes a phased evolution with a migration path.
- [ ] Quantifies cost for at least one major decision in every design.
- [ ] Produces a design doc + ADRs that survive the review-board role-play.
