# 🎯 Switch Track — System Design (HLD)
**Goal:** pass SDE-2 HLD rounds at product companies (Amazon, Microsoft, Uber, Atlassian, Google, Flipkart, PhonePe, Razorpay, Swiggy, Walmart Global Tech, Adobe, Salesforce) in the ~Apr–Jun 2027 loops, for a 22 → 30–35 LPA switch within 12 months of 2026-09-25 · **Budget:** 190 h · **Track total (est.):** 189 h

A prioritised **ordering** of the existing roadmap, not a replacement. Every ID below is a real row in
`plan/roadmap/phase-NN.md` (except the combined trimmed gates and the split human-mock rows `11.1.5a/b`),
so all progress lands in the same tracker. Nothing is deleted: rows not listed here, and the "what
waits" part of every `switch:` row, form the **depth track**, run afterwards in roadmap order.

- **Est h** = session duration × 1.2 (20% overhead for reviews, wrap-up, re-sittings). Durations: L/C/WE/M 1.25 ·
  DD/cold design/Intake/Baseline/human mock 1.5 · F 2.5 · P/AR/R 1 · Gate 3.
- **Scope** `full` = the roadmap row as written. `switch: <covered now; what waits>` = interview-level
  pass now; the row's tracker entry stays 🟨 with `depth pass pending` until the depth track re-runs it.
- **Gates** here are trimmed: only criteria of included sessions are tested; the rest are marked
  *deferred* and tested in the full gate during the depth track.
- **Contents:** 98 sessions + 3 trimmed gates · 16 design learning passes (15 systems) + baseline ·
  5 minis · 5 timed cold mocks + 1 unseen cold prompt · 3 human mocks · 2 AR role-plays · 2 drills.
- Prerequisites respected: each design comes after its concepts; IDs out of numeric order (e.g. 6.5.2
  before 6.3.5) have no dependency between them.

## Order
| # | ID | Type | Topic | Scope | Est h |
|---|---|---|---|---|---|
| 1 | 0.0.1 | Intake | Intake: profile, targets, calibration | full | 1.8 |
| 2 | 0.0.2 | Baseline | Baseline mock: URL Shortener, cold, sealed score | full | 1.8 |
| 3 | 0.1.2 | L | Functional requirements | switch: FRs, out-of-scope, plus the 0.1.1 vocabulary (stateful vs stateless, boundaries) in 5 min; 0.1.1 as its own session waits | 1.5 |
| 4 | 0.1.3 | L | Non-functional requirements (turned into numbers) | full | 1.5 |
| 5 | 0.1.4 | C | Quality-attribute trade-offs | switch: plus consistency & CAP intuition from 0.2.6 (what a user sees); 0.2.6 as its own session waits | 1.5 |
| 6 | 0.2.1 | L | Availability & reliability | switch: nines ↔ downtime, budgets, serial/parallel composition, reliability vs availability, "stored ≠ durable" (0.2.5 folded in); MTBF/MTTR depth and 0.2.2 availability math wait | 1.5 |
| 7 | 0.2.3 | L | Latency & throughput | switch: percentiles, tail latency, fan-out amplification, RPS/read-write ratios, Little's Law (0.2.4 folded in); utilisation-vs-queueing depth and *The Tail at Scale* wait | 1.5 |
| 8 | 0.4.1 | L | Scale estimation & back-of-the-envelope | switch: plus the latency-numbers sheet (in-memory vs SSD vs network, from 0.3.4); single-machine internals 0.3.1–0.3.4 wait (CS-Core covers them) | 1.5 |
| 9 | 0.4.2 | DD | Estimation gym I | full | 1.8 |
| 10 | 0.4.3 | L | The interview framework | full | 1.5 |
| 11 | 0.4.5 | L | Building blocks I + II | switch: client/server, APIs, services, DBs (0.4.4 folded in), caches, queues, LBs, replication, partitioning, HLD diagrams; C4 + ADR vocabulary only, depth waits for 10.2.1 | 1.5 |
| 12 | 0.4.6 | WE | Worked example (mentor designs out loud) | full | 1.5 |
| 13 | 0.4.7 | M | First mini design: blog view counter | full | 1.5 |
| 14 | 1.1.2 | L | DNS | switch: resolution, TTL & caching, GeoDNS/weighted routing, DNS failover (interview level); record-type detail, anycast and 1.1.3 depth wait | 1.5 |
| 15 | 1.2.1 | L | HTTP (+ TCP vs UDP at interview level) | switch: methods (safe/idempotent), status codes, headers, cookies, keep-alive, pooling, HTTP/2 multiplexing in one paragraph, TLS termination points, TCP vs UDP trade-off (1.1.6 core); TCP/IP internals (1.1.1, 1.1.4–1.1.6), 1.2.2 versions and 1.2.3 TLS handshake depth wait (CS-Core) | 1.5 |
| 16 | 1.2.4 | L | Web auth basics | full | 1.5 |
| 17 | 1.3.2 | L | Proxies, API gateway & load balancers | switch: forward/reverse proxy + API gateway (1.3.1 folded in), L4 vs L7, algorithms, affinity, health checks & draining (1.3.3 core); who-balances-the-balancer and GSLB depth wait | 1.5 |
| 18 | 1.3.4 | L | CDN | full | 1.5 |
| 19 | 1.3.6 | M | Basic web service, 1 → 10M users | full | 1.5 |
| 20 | 1.4.1 | L | REST API design craft (+ REST vs gRPC vs GraphQL) | switch: full 1.4.1 plus a 15-min REST/gRPC/GraphQL decision table (1.4.2 core); 1.4.2 and 1.4.3 encoding/schema evolution wait | 1.5 |
| 21 | 1.5.1 | L | Real-time patterns | full | 1.5 |
| 22 | 1.5.2 | DD | Holding millions of connections | full | 1.8 |
| 23 | 1.5.6 | F | #1 URL Shortener v1 | full | 3 |
| 24 | 2.1.5 | M | Access-pattern-first data modelling | switch: normalise vs denormalise decided inline; SQL (2.1.1–2.1.4) and normal-form theory (2.1.2) wait (CS-Core) | 1.5 |
| 25 | 2.2.1 | L | Indexes | switch: B-tree/B+ tree/hash, plus composite (leftmost prefix), covering, clustered vs secondary, 3 commonest "index stops helping" cases (2.2.2 core); 2.2.2–2.2.3 depth and the 2.2.4 lab wait | 1.5 |
| 26 | 2.3.3 | C | B-tree vs LSM (interview level) | switch: write-heavy vs read-heavy choice, amplification in one picture, row vs column; pages/WAL/LSM internals (2.3.1–2.3.2) wait (CS-Core) | 1.5 |
| 27 | 2.4.2 | L | Transactions & isolation levels | switch: ACID in plain words (2.4.1 folded in), the 4 levels, lost update and write skew by example; 2.4.3 anomaly/implementation depth and 2.4.4 lab wait (CS-Core) | 1.5 |
| 28 | 2.5.3 | C | Optimistic vs pessimistic concurrency | switch: plus row locks and deadlock basics from 2.5.1; MVCC (2.5.2) waits | 1.5 |
| 29 | 2.5.4 | M | Sell the last seat exactly once | full | 1.5 |
| 30 | 2.5.6 | F | #16 Ticket Booking v1 | switch: correctness first, plus the flash-sale surge (waiting room, backpressure) as the deep-dive discussion; v2 (4.3.6) and v3 (6.1.6) learning passes wait | 3 |
| 31 | 2.6.2 | L | Read replicas & handling lag | switch: plus read-your-writes routing, monotonic-read pinning (2.6.5 core); 2.6.5 as its own compare session waits | 1.5 |
| 32 | 2.6.3 | DD | Sync vs async vs semi-sync replication, failover | switch: plus the failover lost-writes window and split brain from 2.6.4; physical vs logical replication detail and 2.6.4 depth wait | 1.8 |
| 33 | 2.7.2 | L | Sharding I | full | 1.5 |
| 34 | 2.7.3 | DD | Consistent hashing | full | 1.8 |
| 35 | 2.7.4 | DD | Sharding II: shard keys, hot partitions, rebalancing, cross-shard | full | 1.8 |
| 36 | 2.7.6 | L | Distributed unique IDs I | switch: UUID vs ticket server vs Snowflake as a design discussion; the #6 ID Generator full design (2.7.9) waits | 1.5 |
| 37 | 2.8.1 | L | Key-value stores (Redis, Dynamo-style) | full | 1.5 |
| 38 | 2.8.3 | DD | Wide-column stores | switch: plus a 10-min document-store comparison; 2.8.2 document and 2.8.4 graph sessions wait | 1.8 |
| 39 | 2.9.1 | L | Object storage | full | 1.5 |
| 40 | 2.9.4 | C | Choosing a database | full | 1.5 |
| 41 | 2.10.1 | L | Why / what / where to cache | full | 1.5 |
| 42 | 2.10.2 | L | Cache strategies & eviction | switch: all 6 strategies, plus LRU/LFU/TTL and the LRU hash-map + list implementation (2.10.3 core); admission policies wait | 1.5 |
| 43 | 2.11.1 | DD | Cache problems I: stampede, penetration, avalanche | full | 1.8 |
| 44 | 2.11.2 | DD | Cache problems II: hot keys, invalidation, cache-DB races | full | 1.8 |
| 45 | 2.11.5 | P | Drill: Redis down, cold cache, thundering herd, stale price | full | 1.2 |
| 46 | 2.11.6 | F | #1 URL Shortener v2 (100× scale) | full | 3 |
| 47 | 2.11.8 | R | Review + concept map: Phases 0–2 | switch: map of the included sessions only; the full per-phase reviews (0.4.10, 1.5.8, 2.11.8) wait | 1.2 |
| 48 | Gate 0-2 | Gate | Trimmed Gates 0–2 (one sitting) | switch: only criteria for included sessions; single-machine diagnosis, TCP flow/congestion, HTTP/1.1→3, TLS handshake, SQL timed set, storage-engine internals, full anomaly list, GFS/block-vs-file criteria deferred; design bar ≥ 75 applies to URL Shortener v1/v2 and Ticket Booking v1 only | 3.6 |
| 49 | 3.2.1 | L | CAP theorem & PACELC | switch: plus the 3 common misconceptions (3.2.2) and PACELC in one example (3.2.3); those sessions wait | 1.5 |
| 50 | 3.3.1 | L | Strong vs eventual consistency | switch: plus read-your-writes and monotonic reads with an implementation sketch; 3.3.2–3.3.4 depth waits | 1.5 |
| 51 | 3.4.1 | L | Single-leader, multi-leader, leaderless (+ leader election) | switch: plus why consensus exists, leader election, split brain, terms and "use etcd/ZooKeeper for this" (3.5.1 core); Raft (3.5.2), Paxos, coordination services wait | 1.5 |
| 52 | 3.4.3 | L | Quorums (N, W, R) | switch: plus sloppy quorum, hinted handoff, read repair at a glance; 3.4.4 Dynamo depth waits | 1.5 |
| 53 | 3.4.6 | F | Distributed Key-Value Store | full | 3 |
| 54 | 3.5.8 | F | #21 Distributed Cache | full | 3 |
| 55 | 4.1.1 | L | Horizontal scaling, discovery, autoscaling, bottlenecks | switch: full 4.1.1 plus the bottleneck list (4.1.2 core); 4.1.2 as its own session and 4.1.3 methodical bottleneck-finding wait | 1.5 |
| 56 | 4.2.1 | L | Rate-limiting algorithms | full | 1.5 |
| 57 | 4.2.2 | DD | Distributed rate limiting & backpressure | switch: full 4.2.2 plus load shedding and bounded queues (4.2.3 core); 4.2.3 priority shedding/admission control and the 4.2.4 lab wait | 1.8 |
| 58 | 4.2.5 | F | #4 Rate Limiter | full | 3 |
| 59 | 4.3.1 | L | Resilience patterns | switch: timeouts, retries, backoff, jitter, retry budgets, circuit breaker, bulkhead, graceful degradation (4.3.3 core); 4.3.2 metastable failures, hedging and 4.3.4 depth wait | 1.5 |
| 60 | 4.3.5 | P | Drill: slow downstream, retry storm, thread-pool exhaustion | full | 1.2 |
| 61 | 4.4.1 | L | Redundancy & DR: multi-AZ, multi-region, RPO/RTO | switch: active-active vs passive, plus RPO/RTO and DR tiers from 4.4.3; 4.4.2 multi-region depth, 4.4.4 cells/shuffle sharding and 4.4.5 chaos wait | 1.5 |
| 62 | 4.5.1 | L | Architecture styles (monolith ↔ microservices) | switch: plus database-per-service and the distributed-monolith anti-pattern; DDD (4.5.2) and 4.5.3–4.5.4 wait | 1.5 |
| 63 | 4.5.8 | AR | AR role-play: 25 microservices for a 6-person startup | full | 1.2 |
| 64 | 4.5.9 | R | Review + concept map: Phases 3–4 | switch: map of the included sessions only; the full per-phase reviews (3.5.10, 4.5.9) wait | 1.2 |
| 65 | Gate 3-4 | Gate | Trimmed Gates 3 + 4 (one sitting) | switch: failure-detector design, Raft internals, cells/shuffle sharding and DDD criteria deferred; design bar ≥ 80 applies to KV Store, Distributed Cache, Rate Limiter only | 3.6 |
| 66 | 5.1.1 | L | Queues & pub/sub | switch: full 5.1.1 plus topics, fan-out, push vs pull (5.1.2 core); 5.1.2 as its own session waits | 1.5 |
| 67 | 5.1.6 | F | #5 Notification Service | switch: one pass, v1 synchronous path evolved into the queue-based v2 inside the session; channel basics (APNs/FCM tokens, email/SMS providers, webhook retries) taught in the deep-dive; 4.5.7 v1 learning pass, 5.1.4 scheduled work and 5.1.5 channel depth wait | 3 |
| 68 | 5.2.1 | L | Kafka-style log I (+ queue vs pub/sub vs log) | switch: full 5.2.1 plus broker-style vs log-style and queue vs pub/sub vs log (5.1.3 core); 5.1.3 as its own compare session waits | 1.5 |
| 69 | 5.2.2 | DD | Kafka II (interview level) | switch: partition/key choice, ordering, consumer groups, rebalancing, acks; ISR internals, compaction, the Kafka paper and the 5.2.3 lab wait | 1.8 |
| 70 | 5.3.1 | L | Delivery semantics & effectively-once | switch: plus idempotent consumers and dedupe stores (5.3.2 core); Kafka transactions and 5.3.2 depth wait | 1.5 |
| 71 | 5.4.5 | F | #18 Chat System (WhatsApp-style) | switch: 1:1 + groups, WebSocket gateway, per-conversation ordering, receipts, presence, offline delivery; E2E-encryption and multi-device (#9 WhatsApp, 5.6.2) wait | 3 |
| 72 | 5.5.2 | L | Sagas (+ 2PC's blocking problem) | switch: choreography vs orchestration, compensations, plus 2PC from 5.5.1; semantic locks and workflow-engine depth wait | 1.5 |
| 73 | 5.5.3 | DD | Transactional outbox, inbox, idempotency | full | 1.8 |
| 74 | 5.6.1 | L | Fan-out on write vs read | full | 1.5 |
| 75 | 5.6.3 | F | #7 Twitter/X (news feed) | switch: timeline, fan-out, celebrity problem, feed caching, ranking hooks; #29 Social Media Feed (5.6.4) waits | 3 |
| 76 | 5.6.5 | F | #8 Instagram | full | 3 |
| 77 | 5.6.6 | F | Web Crawler | full | 3 |
| 78 | 6.1.1 | L | Distributed locks | switch: leases plus fencing tokens from 6.1.2 in one example; Redlock debate waits | 1.5 |
| 79 | 6.1.3 | L | Idempotency keys end to end | full | 1.5 |
| 80 | 6.4.2 | DD | Bloom filter, HyperLogLog, Count-Min sketch | switch: plus sharded vs approximate counters from 6.4.1; 6.4.1 as its own session waits | 1.8 |
| 81 | 6.5.2 | F | #23 Payment System | switch: includes double-entry ledger basics (6.5.1 core) in the data-model stage; 6.5.1 as its own session waits | 3 |
| 82 | 6.6.4 | AR | AR role-play: Redis SETNX lock guarding money transfers | full | 1.2 |
| 83 | 6.3.5 | F | #11 Dropbox (file storage & sync) | switch: chunking, dedupe, delta sync, metadata, conflict copies via versioning (6.3.1 at a glance); offline-first (6.3.3) and CRDT depth wait | 3 |
| 84 | 7.1.5 | F | Search Autocomplete / Typeahead | switch: tries, top-k per prefix, caching, update pipeline; inverted-index/search cycle 7.1.1–7.1.4 waits | 3 |
| 85 | 7.6.1 | L | Geospatial indexes | switch: geohash vs quadtree vs S2/H3 for static vs moving objects (7.6.2 core) | 1.5 |
| 86 | 7.6.5 | F | #13 Uber (incl. ride matching) | switch: dispatch/matching, location writes, ETA at interview level; #26 Ride Matching (7.6.6) and #30 Location Tracking (7.6.4) wait | 3 |
| 87 | 8.8.1 | L | Video pipeline | full | 1.5 |
| 88 | 8.8.2 | F | #10 YouTube (+ Netflix basics) | switch: upload → transcode → ABR → CDN, plus Netflix-style CDN appliances in 5 min; #15 Netflix (8.8.3) waits | 3 |
| 89 | 8.8.8 | R | Review + concept map: Phases 5–8 | switch: map of the included sessions only; the full per-phase reviews (5.6.8, 6.6.5, 7.10.10, 8.8.8) wait | 1.2 |
| 90 | Gate 5-8 | Gate | Trimmed Gates 5–8 (one sitting) | switch: only criteria for included sessions; event sourcing/CQRS, clocks, CRDTs, search/analytics/AI, security depth, K8s, cloud criteria deferred; design bar ≥ 85 applies to included designs only | 3.6 |
| 91 | 11.1.1 | L | Company formats (Google, Meta PA, Amazon, fintech) | full | 1.5 |
| 92 | 11.1.3 | M | "Tell me about a system you built" (2 stories) | full | 1.5 |
| 93 | 9.2.1 | Cold | Timed cold mock: #7 Twitter/X | full | 1.8 |
| 94 | 9.2.3 | Cold | Timed cold mock: #9 WhatsApp | switch: cold pass with E2E/multi-device asked as curveballs; the full 5.6.2 learning pass still waits | 1.8 |
| 95 | 9.4.1 | Cold | Timed cold mock: #13 Uber | full | 1.8 |
| 96 | 11.1.5a | 👥 | Human mocks #1–#2 | switch: 2 of the ≥ 6 human mocks now; the rest continue in the depth track | 3.6 |
| 97 | 9.3.3 | Cold | Timed cold mock: #11 Dropbox | full | 1.8 |
| 98 | 9.6.3 | Cold | Timed cold mock: #23 Payment System | full | 1.8 |
| 99 | 11.3.2 | F | Unseen intermediate prompt, cold (interviewer picks, curveballs included) | full | 3 |
| 100 | 11.1.5b | 👥 | Human mock #3 (dress rehearsal before real loops) | switch: 1 more of the ≥ 6 human mocks | 1.8 |
| 101 | 11.1.6 | R | Switch-track retrospective → hand-over to the depth track | switch: score trajectory, weak areas, which deferred rows to bring forward; the full 11.1.6 review waits | 1.2 |

## Deferred to the depth pass (not deleted)
Everything below runs in roadmap order after the switch track (the depth track), together with the
"what waits" part of each `switch:` row above. Bring any row forward if a target company's loop needs it.

| ID | Topic | Why deferred |
|---|---|---|
| 0.1.1, 0.1.5, 0.1.6 | What is system design? · requirements-only mini · review | Vocabulary folded into 0.1.2; every design rehearses requirements in its first 5 min |
| 0.2.2, 0.2.4, 0.2.5, 0.2.6, 0.2.7, 0.2.8 | Availability math · throughput · reliability vs availability · CAP intuition · drill · review | Cores folded into 0.2.1, 0.2.3 and 0.1.4; the maths and the drill are depth |
| 0.3.1–0.3.6 | The single machine (compute, memory hierarchy, concurrency models, where time goes, drill) | OS internals: the FAANG-CS-Core course covers them; HLD needs only the latency numbers (in 0.4.1) |
| 0.4.4, 0.4.8, 0.4.9, 0.4.10 | Building blocks I · view-counter drill · AR · Phase 0 review | 0.4.4 folded into 0.4.5; drill/AR/review replaced by the combined review + trimmed Gate 0–2 |
| 1.1.1, 1.1.3–1.1.8 | Internet fundamentals · DNS in architecture · TCP I/II · UDP · drill · review | TCP/IP internals: CS-Core networks; HLD needs only DNS basics (1.1.2) and TCP vs UDP (in 1.2.1) |
| 1.2.2, 1.2.3, 1.2.5–1.2.7 | HTTP versions · TLS handshake · HTTP decision table · drill · review | Rarely probed in SDE-2 HLD; one-paragraph versions in 1.2.1; depth in CS-Core |
| 1.3.1, 1.3.3, 1.3.5, 1.3.7–1.3.9 | Proxies · LB II · LB/gateway compare · drill · static-content design · review | 1.3.1/1.3.3 cores folded into 1.3.2; static delivery overlaps CDN + URL Shortener |
| 1.4.2–1.4.5 | REST vs gRPC vs GraphQL · encoding & schema evolution · API mini · review | 1.4.2 core folded into 1.4.1; schema evolution is senior-level; every design has an API stage |
| 1.5.3, 1.5.4, 1.5.5, 1.5.7, 1.5.8 | Real-time compare · "type a URL" narrative · reconnect drill · AR · Phase 1 review | Compare folded into 1.5.1/1.5.2; reconnect storms discussed in Chat; review merged into 2.11.8 |
| 2.1.1–2.1.4, 2.1.6 | Relational model · normalisation · SQL I/II · SQL review | SQL and normal forms: CS-Core databases; HLD uses access-pattern modelling (2.1.5) |
| 2.2.2–2.2.6 | Composite/covering indexes · when indexes stop helping · EXPLAIN lab · drill · review | Interview-level core folded into 2.2.1; depth and lab in CS-Core |
| 2.3.1, 2.3.2, 2.3.4 | Pages/WAL/buffer pool · LSM trees · review | Storage-engine internals (★ deep dives); CS-Core |
| 2.4.1, 2.4.3–2.4.5 | ACID · anomalies & 2PL/SI/SSI · isolation lab · review | ACID folded into 2.4.2; implementation depth in CS-Core |
| 2.5.1, 2.5.2, 2.5.5, 2.5.7 | Locks & deadlocks · MVCC · drill · review | Interview-level locks folded into 2.5.3; MVCC internals in CS-Core |
| 2.6.1, 2.6.4–2.6.8 | Vertical scaling · failover mechanics · lag handling · replication lab · drill · review | Cores folded into 1.3.6, 2.6.2, 2.6.3; lab/drill depth |
| 2.7.1, 2.7.5, 2.7.7–2.7.10 | Partitioning · sharded secondary indexes · sharding mini · drill · #6 ID Generator · review | Basics inside 2.7.2; ID generation discussed in 2.7.6 and URL Shortener v2; the full ID design waits |
| 2.8.2, 2.8.4–2.8.8 | Document · graph · NewSQL · same-app modelling · ★ Leaderboard · review | Less asked; comparisons inside 2.8.3 and 2.9.4; Leaderboard below the chosen designs in frequency |
| 2.9.2, 2.9.3, 2.9.5–2.9.8 | Object-store internals · block/file/object + GFS · drill · #2 Pastebin · #3 File Upload · review | Internals belong to the S3 design (depth); Pastebin/File Upload subsumed by URL Shortener + Dropbox |
| 2.10.3–2.10.5 | Eviction · strategy matrix · review | Eviction + LRU folded into 2.10.2; matrix covered in 2.10.2/2.9.4 |
| 2.11.3, 2.11.4, 2.11.7 | Distributed cache internals + Memcache paper · stampede lab · AR (Mongo + write-back ledger) | Internals/lab depth; the Distributed Cache design covers the interview level; two other ARs chosen |
| 3.1.1–3.1.6 | Why distributed is hard · timeouts & failure detection · failure models · gossip · drill · review | Theory HLD tests through designs; timeouts/retries covered in 4.3.1 |
| 3.2.2–3.2.5 | CAP misconceptions · PACELC · like-counter mini · review | Folded into 3.2.1 |
| 3.3.2–3.3.6 | Session guarantees · causal/sequential/linearisable · ladder · drill · review | RYW/monotonic reads in 3.3.1; formal models rarely examined at SDE-2 |
| 3.4.2, 3.4.4, 3.4.5, 3.4.7 | Multi-leader conflicts · Dynamo machinery · replication compare · review | Basics in 3.4.1/3.4.3 and the KV Store design; Dynamo paper depth |
| 3.5.1–3.5.7, 3.5.9, 3.5.10 | Consensus · Raft · Paxos · coordination services · etcd lab · config mini · drill · AR · Phase 3 review | Consensus internals (★ deep dives); HLD needs "why + which tool" (in 3.4.1) |
| 4.1.2–4.1.6 | Bottlenecks · methodical bottleneck-finding · metrics mini · drill · review | Bottleneck list folded into 4.1.1; USE/Amdahl/load testing depth |
| 4.2.3, 4.2.4, 4.2.6 | Backpressure · Redis limiter lab · review | Backpressure folded into 4.2.2; the Rate Limiter design covers the atomic script |
| 4.3.2–4.3.4, 4.3.6, 4.3.7 | Retry storms/metastable · circuit breakers · pattern numbers · #16 Ticket Booking v2 · review | Cores folded into 4.3.1; surge handling discussed in Ticket Booking v1 |
| 4.4.2–4.4.8 | Multi-region depth · DR · cells/shuffle sharding · chaos · multi-region mini · drill · review | DR tiers folded into 4.4.1; blast-radius engineering is senior/staff |
| 4.5.2–4.5.7 | DDD · service communication · monolith vs microservices · decomposition mini · drill · #5 Notification v1 | Architect material (one-liner in 4.5.1); Notification v1 merged into 5.1.6 |
| 5.1.2–5.1.5, 5.1.7 | Pub/sub · queue vs log · scheduled work · delivery channels · review | Folded into 5.1.1, 5.2.1 and the Notification design |
| 5.2.3–5.2.5 | Kafka lab · drill · review | Hands-on depth |
| 5.3.2–5.3.4 | Exactly-once depth · effectively-once mini · review | Idempotent consumers folded into 5.3.1; mini overlaps 5.1.6 |
| 5.4.1–5.4.4, 5.4.6 | Event notification vs state transfer · event sourcing · CQRS · event- vs request-driven · review | Rarely required in SDE-2 HLD; architect-level |
| 5.5.1, 5.5.4–5.5.7 | 2PC · 2PC vs saga vs outbox · drill · #17 Food Delivery · review | 2PC folded into 5.5.2; Food Delivery overlaps Uber + Payment |
| 5.6.2, 5.6.4, 5.6.7, 5.6.8 | #9 WhatsApp · #29 Social Media Feed · AR (event sourcing for CRUD) · Phase 5 review | WhatsApp = 5.4.5 + cold 9.2.3; Social Feed overlaps Twitter; two other ARs chosen |
| 6.1.2, 6.1.4–6.1.7 | Fencing/Redlock · charge-card mini · drill · #16 Ticket Booking v3 · review | Fencing folded into 6.1.1; charge-card lifecycle inside Payment |
| 6.2.1–6.2.6 | Ordering · physical clocks · logical clocks · compare · drill · review | Clock theory rarely asked at SDE-2 |
| 6.3.1–6.3.4, 6.3.6, 6.3.7 | LWW/versioning · CRDTs/OT · offline-first · #20 Google Docs · #12 Google Drive · review | Versioning at a glance in Dropbox; Docs is near-staff; Drive overlaps Dropbox |
| 6.4.1, 6.4.3–6.4.5 | Distributed counters · IDs II · view-count mini · review | Counters folded into 6.4.2 |
| 6.5.1, 6.5.3–6.5.5 | Ledgers · ★ Stock Exchange · payment drill · review | Ledger basics inside 6.5.2; Stock Exchange niche and expensive |
| 6.6.1–6.6.3, 6.6.5 | Multi-region data & residency · #22 Distributed MQ · ★ Object Storage · Phase 6 review | Infrastructure designs are more senior/infra-loop |
| 7.1.1–7.1.4, 7.1.6 | Inverted index · ranking · index sharding · search sync · review | Autocomplete chosen as the search-flavoured design |
| 7.2.1–7.2.4 | OLTP/OLAP · lake/lakehouse · batch · review | Analytics rarely an SDE-2 HLD focus |
| 7.3.1–7.3.6 | Stream processing · stateful streaming · Lambda/Kappa · drill · ★ Top-K/Ad-Click · review | First candidate to bring forward if time remains (Top-K is asked at Amazon/Meta) |
| 7.4.1–7.4.5 | Data engineering cycle | Data-platform roles, not SDE-2 HLD |
| 7.5.1–7.5.3 | Time-series · ★ Metrics & Monitoring · review | Second candidate to bring forward |
| 7.6.2–7.6.4, 7.6.6, 7.6.7 | Geo compare · ★ Yelp · #30 Location Tracking · #26 Ride Matching · review | Folded into 7.6.1 and Uber |
| 7.7.1–7.7.4 | Recommendations · #25 Recsys · #24 Ad Serving · review | ML-platform loops |
| 7.8.1–7.8.4 | #19 Google Search · #14 Airbnb · notification revisit · review | Overlap with crawler/autocomplete and ticket booking |
| 7.9.1–7.9.5, 7.10.1–7.10.10 | Embeddings & vector search · LLM/AI systems (incl. 2 designs, AR, Phase 7 review) | Not the SDE-2 HLD core at these companies; bring forward if a target team is AI-focused |
| 8.1.1–8.1.6 | Logs · metrics · traces · alerting · ★ Distributed Logging · review | Observability named in every design's failure stage; depth later |
| 8.2.1–8.2.4 | SLI/SLO/SLA · error budgets · SLO mini · review | Ops talk covered by 11.1.1 (Amazon) and design failure stages |
| 8.3.1–8.3.6 | Authn · OAuth/OIDC/JWT · authz · service identity · ★ Online Judge · review | Web auth basics (1.2.4) suffice for HLD |
| 8.4.1–8.4.8 | Secrets/KMS · WAF/DDoS · threat modelling · compliance · multi-tenancy · mini · drill · review | Security depth |
| 8.5.1–8.5.5, 8.6.1–8.6.5, 8.7.1–8.7.7 | Deployment & testing · containers & K8s · cloud & platform engineering | Rarely HLD-round topics; SDE-2 meets them in experience rounds |
| 8.8.3–8.8.7 | #15 Netflix · #27 Video Streaming · ★ Email · #28 Global Notification · AR (multi-cloud) | Netflix basics in YouTube; the rest depth |
| 9.1.1–9.7.3 (all but 9.2.1, 9.2.3, 9.3.3, 9.4.1, 9.6.3) | Rest of the timed cold circuit | 5 cold mocks now; full circuit after all learning passes |
| 10.1.1–10.4.7 | Staff thinking · architect's toolkit · all staff prompts | Above the SDE-2 bar |
| 11.1.2, 11.1.4, 11.1.5 (mocks #4+) | Meta Product Architecture drill · curveball drills · remaining human mocks | Meta not a stated target; curveballs are built into the cold mocks |
| 11.2.1–11.2.5 | Architect conversations | Architect goal, not the switch |
| 11.3.1, 11.3.3–11.3.6 | Baseline redo · unseen advanced/staff · final human mock · retrospective | Programme-end assessment of the full course |
| 📄 | DDIA chapters (11) and the 7 papers | Reading waits for the depth track (≈ 36 h); optional companion now |
