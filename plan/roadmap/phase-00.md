# Phase 0 — System Design Foundations

README §6, §30. The mental model everything else builds on. No technology names yet.
★ Cycle 0.3 (the single machine) added: every number and bottleneck later traces back to hardware.

## Cycle 0.0 — Kickoff

| ID | Type | Session |
|---|---|---|
| 0.0.1 | Intake | `/intake`: profile, targets, background, diagnostic questions |
| 0.0.2 | Baseline | `/design url-shortener baseline`: cold, 45 min, zero hints, sealed score. Redone at 11.3.1 |

## Cycle 0.1 — What a system is, and how we judge one

| ID | Type | Session |
|---|---|---|
| 0.1.1 | L | 0.1 **What is system design?** System, architecture, component, service, dependency, interface, boundary, state (stateful vs stateless), data flow vs control flow. Exercise: dissect an app you use daily into these terms |
| 0.1.2 | L | 0.2 **Functional requirements**: core use cases, user actions, inputs, outputs, business rules, out-of-scope. Exercise: extract FRs from 3 deliberately vague prompts |
| 0.1.3 | L | 0.3 **Non-functional requirements**: availability, reliability, scalability, latency, throughput, durability, consistency, security, maintainability, observability, cost; how to turn each into a *number* |
| 0.1.4 | C | 0.4 **Quality-attribute trade-offs**: consistency↔availability, latency↔durability, cost↔redundancy, performance↔simplicity, freshness↔caching. Why improving one hurts another |
| 0.1.5 | M | Requirements-only mini: "online grocery ordering for one city": FR, NFR with numbers, out-of-scope, top 3 trade-offs |
| 0.1.6 | R | Review + spaced-queue entries |

## Cycle 0.2 — Availability, latency, throughput, durability

| ID | Type | Session |
|---|---|---|
| 0.2.1 | L | 0.5 **Availability**: uptime/downtime, the nines (99 → 99.999%), availability budgets. ★ MTBF, MTTR, and why MTTR is the lever |
| 0.2.2 | DD | ★ **Availability math**: serial vs parallel composition, N+1 redundancy, why 10 × 99.9% dependencies ≠ 99.9% |
| 0.2.3 | L | 0.6 **Latency**: mean vs median vs p90/p95/p99, tail latency, why averages lie, ★ fan-out tail amplification 📄 *The Tail at Scale* |
| 0.2.4 | L | 0.7 **Throughput**: RPS, TPS, messages/s, read/write ratios. ★ Little's Law (L = λW), ★ utilisation vs queueing delay (why 90% busy ≈ slow) |
| 0.2.5 | C | 0.8 **Reliability vs availability** (a system can be up and wrong) · 0.9 **Durability**: "stored" ≠ "never lost": fsync, page cache, replication, backups, correlated failures |
| 0.2.6 | L | **Consistency & CAP intuition** (README §30 Weekend 1): what "consistent" means to a *user*; the partition dilemma in plain terms (formal treatment in Phase 3) |
| 0.2.7 | P | Drill: "You've burned 60% of this month's 99.9% budget in one incident": compute, decide, communicate. "p50 is fine, p99 tripled": where do you look? |
| 0.2.8 | R | Review |

## Cycle 0.3 — ★ The single machine

| ID | Type | Session |
|---|---|---|
| 0.3.1 | L | ★ **Compute**: CPU cores, clock, processes vs threads, context switches, system calls, user vs kernel space; CPU-bound vs I/O-bound work |
| 0.3.2 | L | ★ **Memory & storage hierarchy**: registers → L1/L2/L3 → RAM → SSD/NVMe → HDD → network; sequential vs random access, IOPS vs throughput, the OS page cache, what `fsync` really costs |
| 0.3.3 | DD | ★ **Concurrency models**: thread-per-request, thread pools, event loops (epoll), async/await & coroutines, blocking vs non-blocking I/O; why an event loop holds 100k connections and a thread pool doesn't |
| 0.3.4 | C | ★ **Where time goes in one request**: derive the "latency numbers every engineer should know" from the hardware; compare the in-memory, local-SSD and cross-network paths |
| 0.3.5 | P | Drill: box at 100% CPU vs 100% iowait vs swapping vs out of file descriptors: diagnose each from symptoms and name the fix |
| 0.3.6 | R | Review |

## Cycle 0.4 — Estimation, the interview framework, building blocks

| ID | Type | Session |
|---|---|---|
| 0.4.1 | L | 0.10 **Scale estimation**: DAU/MAU, avg vs peak RPS, storage/day & /year, bandwidth, read/write volume. 0.11 **Back-of-the-envelope**: powers of ten/two, 86,400 s/day. Start `reference/numbers.md` |
| 0.4.2 | DD | **Estimation gym I**: 6 prompts timed (Twitter storage, YouTube egress, WhatsApp QPS, Uber location writes, Search QPS, Photo storage 5 yr). ★ Sizing: servers, DB nodes, cache GB, derived from 0.3 |
| 0.4.3 | L | 0.12 **The interview framework** (README §21): 45-min structure, what each phase must produce. ★ Communication: driving, signposting, time-boxing, thinking aloud, handling "what if", asking vs assuming |
| 0.4.4 | L | **Building blocks I** (README §30 Weekend 2): client/server, requests & responses, APIs, services, databases |
| 0.4.5 | L | **Building blocks II**: caches, queues, load balancers, replication, partitioning; drawing high-level architecture diagrams. ★ How architects communicate: the C4 model (context → container → component) and the Architecture Decision Record (ADR), used in every journal entry from here on |
| 0.4.6 | WE | ★ **Worked example**: the mentor designs a small system out loud end-to-end (requirements → numbers → API → data → HLD → failure → trade-offs), narrating *why* at each step. The learner annotates what the expert did at each stage |
| 0.4.7 | M | **First mini design** (Foundation milestone): "view counter for a blog", following the framework and scaffolded by prompts at each stage |
| 0.4.8 | P | Drill on the view counter: the single server dies; traffic 50×; counts drift. What breaks, in what order? |
| 0.4.9 | AR | ★ **Architecture review role-play**: the mentor, as a senior architect, proposes a flawed design for a simple system; the learner interrogates it and finds ≥ 3 issues |
| 0.4.10 | R | Review + concept map of Phase 0 → **Gate** |

## Gate 0

- [ ] Given any unseen prompt, lists FRs, NFRs *with numbers*, and out-of-scope in ≤ 5 min.
- [ ] Estimates avg/peak RPS, storage/yr, bandwidth in ≤ 3 min, within 3× of reference.
- [ ] Computes composite availability for a serial + parallel diagram; converts nines ↔ downtime.
- [ ] Explains p99 vs mean, tail amplification, and Little's Law with an example.
- [ ] Explains reliability vs availability and why "stored" ≠ durable.
- [ ] Diagnoses CPU-bound vs I/O-bound vs memory-bound from symptoms; explains event loop vs thread pool.
- [ ] Runs the 45-min framework unprompted on a simple problem (mini design ≥ 60/120 equivalent).
- [ ] Draws a C4 context + container diagram and writes one ADR.
- [ ] `reference/numbers.md` filled and verified; Phase 0 concept map drawn.
