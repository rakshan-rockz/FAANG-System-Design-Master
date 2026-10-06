# Phase 3 — Distributed Systems Foundations

README §13. From one machine to many machines cooperating over an unreliable network.

## Cycle 3.1 — Why distributed systems are hard

| ID | Type | Session |
|---|---|---|
| 3.1.1 | L | 13.1 **The difficulties**: network latency, packet loss, partial failure, machine failure, clock differences, duplicate/lost/delayed/reordered messages. ★ The 8 fallacies of distributed computing |
| 3.1.2 | DD | ★ **Timeouts & ambiguity**: "no reply" ≠ "didn't happen"; choosing timeouts; retries create duplicates. ★ Failure detection: heartbeats, phi-accrual, false positives |
| 3.1.3 | L | 13.2 **Failure models**: crash-stop, crash-recovery, omission, network failure, partial failure, Byzantine (conceptual), ★ gray failure |
| 3.1.4 | L | ★ **Membership & gossip**: how nodes learn who's alive (SWIM-style gossip), convergence time |
| 3.1.5 | P | Drill: a service is "slow but not dead" (gray failure) · network drops 2% of packets · GC pause makes a node look dead |
| 3.1.6 | R | Review |

## Cycle 3.2 — CAP & PACELC

| ID | Type | Session |
|---|---|---|
| 3.2.1 | L | 13.3 **CAP theorem**: consistency (linearisability), availability, partition tolerance, network partitions, CP vs AP |
| 3.2.2 | DD | **Why CAP is commonly misunderstood**: "pick 2 of 3" is wrong, P isn't optional, it's per-operation not per-system, what "available" formally means |
| 3.2.3 | C | ★ **PACELC**: the latency↔consistency trade-off when there's *no* partition; classify 6 real-world style systems |
| 3.2.4 | M | "Like counter across regions": choose CP or AP per operation, justify to a PM |
| 3.2.5 | R | Review |

## Cycle 3.3 — Consistency models

| ID | Type | Session |
|---|---|---|
| 3.3.1 | L | 13.4 **Strong vs eventual consistency**; what a *user* observes under each |
| 3.3.2 | DD | **Session guarantees**: read-your-writes, monotonic reads, ★ monotonic writes, ★ writes-follow-reads; how to implement each |
| 3.3.3 | DD | **Causal, sequential, linearisable**: definitions via timelines; ★ linearisability vs serialisability |
| 3.3.4 | C | The consistency ladder, with cost (latency, availability) at each rung; pick a model for 8 product features |
| 3.3.5 | P | Drill: user posts a comment and it "disappears" on refresh · counter goes backwards · reply shows before the question |
| 3.3.6 | R | Review |

## Cycle 3.4 — Replication models & quorums

| ID | Type | Session |
|---|---|---|
| 3.4.1 | L | 13.5 **Single-leader, multi-leader, leaderless** replication: write paths, failure behaviour |
| 3.4.2 | DD | **Multi-leader conflicts**: when they arise, conflict detection, resolution approaches (preview of Phase 6) |
| 3.4.3 | L | 13.6 **Quorum**: N, W, R; why R + W > N gives overlapping replica sets; and why that's still not linearisable |
| 3.4.4 | DD | ★ **Leaderless machinery**: sloppy quorums, hinted handoff, read repair, anti-entropy with Merkle trees 📄 *Dynamo* |
| 3.4.5 | C | Single vs multi vs leaderless for 5 workloads; choose N/R/W for 4 goals |
| 3.4.6 | F | ★ **Distributed Key-Value Store** (Dynamo-style): partitioning, replication, quorum, failure handling |
| 3.4.7 | R | Review |

## Cycle 3.5 — Consensus & coordination

| ID | Type | Session |
|---|---|---|
| 3.5.1 | L | 13.7 **Why consensus exists**: agreeing on a leader, a value, an order. Leader election, quorum, split brain, terms/epochs |
| 3.5.2 | DD | **Raft**: leader election, log replication, commit index, safety, membership changes 📄 *Raft paper* |
| 3.5.3 | L | **Paxos** (conceptual): roles, phases, why Raft was written; ★ FLP impossibility in one paragraph |
| 3.5.4 | L | ★ **Coordination services**: ZooKeeper/etcd-style: what to use them for (config, leader election, locks, service registry) and what not to |
| 3.5.5 | LAB | ★ 3-node etcd: kill the leader, partition a node, observe elections and write behaviour |
| 3.5.6 | M | Config service with leader election for a fleet of 1,000 workers |
| 3.5.7 | P | Drill: split brain after a partition · leader flaps every 10 s · quorum lost (2 of 3 nodes down) |
| 3.5.8 | F | **#21 Distributed Cache** (learning pass) |
| 3.5.9 | AR | ★ **Architecture review role-play**: a "senior architect" claims "we're AP, so we don't need to think about consistency" for a multi-region inventory service; interrogate it |
| 3.5.10 | R | Review + concept map of Phase 3 → **Gate** |

## Gate 3

- [ ] Explains partial failure and timeout ambiguity; designs a failure detector with trade-offs.
- [ ] States CAP precisely, debunks 3 misconceptions, and applies PACELC.
- [ ] For 8 features, picks a consistency model and explains what the user sees.
- [ ] Compares single/multi/leaderless replication; sets N/R/W for given goals; explains why quorums ≠ linearisable.
- [ ] Explains Raft election + log replication, split brain, and how terms/epochs prevent it.
- [ ] Distributed KV Store and Distributed Cache learning passes ≥ 80/120.
