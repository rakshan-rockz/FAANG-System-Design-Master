# Phase 6 — Advanced Distributed Data

README §16. Correctness in the hard corners: locks, idempotency, ordering, time, conflicts, counters, IDs.

## Cycle 6.1 — Distributed locks & idempotency

| ID | Type | Session |
|---|---|---|
| 6.1.1 | L | 16.1 **Distributed locks**: why they're needed, lock ownership, leases, expiration, failure scenarios |
| 6.1.2 | DD | ★ **Fencing tokens**; why a lease + GC pause breaks naive locks; ★ the Redlock debate; locks via consensus stores vs Redis vs DB |
| 6.1.3 | L | 16.2 **Idempotency**: idempotency keys, duplicate requests, retries, exactly-once *effects*; key storage, TTL, response replay |
| 6.1.4 | M | Idempotent "charge card" API: full request lifecycle under client retries and server crashes |
| 6.1.5 | P | Drill: lock holder pauses 30 s and wakes up still "holding" it · double charge after timeout + retry |
| 6.1.6 | F | **#16 Ticket Booking, v3**: seat holds with leases across services, payment integration, expiry |
| 6.1.7 | R | Review |

## Cycle 6.2 — Ordering & time

| ID | Type | Session |
|---|---|---|
| 6.2.1 | L | 16.3 **Ordering**: global, per-key, partition, causal; what each costs |
| 6.2.2 | L | 16.4 **Physical clocks**, clock skew & drift, NTP, ★ why timestamps can't order events; ★ TrueTime conceptually 📄 *Spanner* |
| 6.2.3 | DD | **Logical clocks**: Lamport clocks, vector clocks, hybrid logical clocks; what each can and can't tell you |
| 6.2.4 | C | Pick an ordering guarantee + clock mechanism for 5 systems |
| 6.2.5 | P | Drill: clock jumps back 2 s on one node · events processed out of order · leap-second style bug |
| 6.2.6 | R | Review |

## Cycle 6.3 — Conflict resolution

| ID | Type | Session |
|---|---|---|
| 6.3.1 | L | 16.5 **Last-write-wins** (and the data it silently loses), **versioning**, **vector clocks** for conflict detection, siblings |
| 6.3.2 | DD | **CRDT concepts**: ★ G-Counter, PN-Counter, OR-Set, LWW-Register, sequence CRDTs; ★ OT vs CRDT for collaborative editing |
| 6.3.3 | L | ★ **Offline-first & mobile sync**: local stores, sync protocols (change feeds, version vectors), conflict UX, battery/bandwidth constraints, background sync |
| 6.3.4 | F | **#20 Google Docs** (collaborative editing, presence, history, offline) |
| 6.3.5 | F | **#11 Dropbox** (chunking, dedupe, delta sync, conflict handling across devices) |
| 6.3.6 | F | **#12 Google Drive** (sharing/permissions, metadata at scale, search, sync) |
| 6.3.7 | R | Review |

## Cycle 6.4 — Counters, IDs, probabilistic structures

| ID | Type | Session |
|---|---|---|
| 6.4.1 | L | 16.6 **Distributed counters**: atomic counters, sharded counters, approximate counters |
| 6.4.2 | DD | ★ **Probabilistic data structures**: Bloom filter (false-positive maths), HyperLogLog, Count-Min sketch; where each appears in designs |
| 6.4.3 | DD | 16.7 **Distributed unique IDs II** (spiral from 2.7.6): Snowflake under clock skew & rollback, worker-ID assignment, ★ UUIDv4 vs v7, ★ ULID/KSUID, monotonicity guarantees |
| 6.4.4 | M | "YouTube view counts": exact vs approximate, real-time vs eventual |
| 6.4.5 | R | Review |

## Cycle 6.5 — Money & markets

| ID | Type | Session |
|---|---|---|
| 6.5.1 | L | ★ **Ledgers**: double-entry bookkeeping, immutability, reconciliation, auditability |
| 6.5.2 | F | **#23 Payment System** (PSP integration, idempotency, ledger, reconciliation, retries, fraud hooks) |
| 6.5.3 | F | ★ **Stock Exchange** (matching engine, sequencing, low latency, market data fan-out) |
| 6.5.4 | P | Drill: PSP says "timeout". Did the charge happen? · reconciliation finds a mismatch · ledger hot account |
| 6.5.5 | R | Review |

## Cycle 6.6 — Infrastructure as the product

| ID | Type | Session |
|---|---|---|
| 6.6.1 | L | ★ **Multi-region data**: geo-partitioning, data residency (e.g. EU-only data), global vs regional tables |
| 6.6.2 | F | **#22 Distributed Message Queue** (build the Kafka-like system itself) |
| 6.6.3 | F | ★ **Object Storage (S3-like)** (metadata service, data placement, erasure coding, durability maths) |
| 6.6.4 | AR | ★ **Architecture review role-play**: a "senior architect" proposes a Redis SETNX lock with a 10 s TTL to guard money transfers; interrogate it |
| 6.6.5 | R | Review + concept map of Phase 6 → **Gate** |

## Gate 6

- [ ] Explains why naive distributed locks fail; uses leases + fencing tokens correctly.
- [ ] Designs idempotency keys end to end (storage, TTL, concurrency, response replay).
- [ ] Chooses ordering guarantees and clocks; explains Lamport vs vector vs HLC.
- [ ] Explains LWW's data loss, vector-clock conflict detection, and 3 CRDTs; OT vs CRDT.
- [ ] Chooses exact vs sharded vs approximate counters; explains Bloom/HLL/Count-Min.
- [ ] Picks and defends an ID scheme (sortability, coordination, index locality).
- [ ] Phase 6 designs ≥ 85/120.
