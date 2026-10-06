# Phase 4 — Scalability & Reliability

README §14. Scaling services, finding bottlenecks, protecting systems, surviving disasters.
★ Cycle 4.5 adds architecture styles & service design (monolith ↔ microservices, DDD), which Phase 5's
sagas and event-driven designs assume.

## Cycle 4.1 — Horizontal scaling & bottlenecks

| ID | Type | Session |
|---|---|---|
| 4.1.1 | L | 14.1 **Horizontal scaling**: stateless services, where state goes, load balancing revisited, **service discovery** (★ client-side vs server-side, registries), **autoscaling** (★ reactive vs scheduled vs predictive, scaling signals, cooldowns) |
| 4.1.2 | L | 14.2 **Bottlenecks**: CPU, memory, database, network, disk, lock contention, hot keys, hot partitions |
| 4.1.3 | DD | ★ **Finding bottlenecks methodically**: the four golden signals (spiral; depth in 8.1), USE method, queueing theory basics (utilisation → latency curve), Amdahl's law, ★ capacity planning & load testing |
| 4.1.4 | M | Given a metrics snapshot of a struggling system, locate the bottleneck and propose the smallest fix |
| 4.1.5 | P | Drill: autoscaler scales up but latency doesn't improve · noisy neighbour · a single hot row serialises all writes |
| 4.1.6 | R | Review |

## Cycle 4.2 — Rate limiting & backpressure

| ID | Type | Session |
|---|---|---|
| 4.2.1 | L | 14.3 **Rate limiting**: fixed window, sliding window (log & counter), token bucket, leaky bucket |
| 4.2.2 | DD | **Distributed rate limiting**: central store vs local + sync, atomicity, accuracy vs latency, ★ where to enforce (edge, gateway, service) |
| 4.2.3 | L | 14.4 **Backpressure**: queues, load shedding, bounded buffers, consumer slowdown; ★ admission control, ★ priority-based shedding |
| 4.2.4 | LAB | Token-bucket limiter in Redis (atomic script) under concurrent load; verify accuracy |
| 4.2.5 | F | **#4 Rate Limiter** (learning pass) |
| 4.2.6 | R | Review |

## Cycle 4.3 — Resilience patterns

| ID | Type | Session |
|---|---|---|
| 4.3.1 | L | 14.5 **Timeouts** (★ budgets & propagation), **retries**, **exponential backoff**, **jitter** |
| 4.3.2 | DD | ★ **Retry storms & metastable failures**: retry budgets, idempotency requirement, why retries at every layer multiply |
| 4.3.3 | L | **Circuit breaker**, **bulkhead**, **fail-fast**, **graceful degradation**; ★ fallbacks & hedged requests |
| 4.3.4 | C | Which pattern for which failure; set concrete numbers (timeouts, thresholds) for a 3-tier call chain |
| 4.3.5 | P | Drill: downstream p99 10× (slow is worse than down) · retry storm after a blip · one dependency takes down the whole thread pool |
| 4.3.6 | F | **#16 Ticket Booking, v2**: flash sale, 100× surge: virtual waiting room, backpressure, degradation |
| 4.3.7 | R | Review |

## Cycle 4.4 — Redundancy & disaster recovery

| ID | Type | Session |
|---|---|---|
| 4.4.1 | L | 14.6 **Redundancy**: replication, multi-AZ, multi-region, active-active vs active-passive |
| 4.4.2 | DD | ★ **Multi-region in depth**: data replication across regions, routing users, failover & failback, write conflicts, cost |
| 4.4.3 | L | 14.7 **Disaster recovery**: backup, restore, RPO, RTO, failover, recovery testing; ★ backup strategies (full/incremental/PITR), ★ DR tiers (backup-restore → pilot light → warm standby → active-active) |
| 4.4.4 | DD | ★ **Blast-radius engineering**: cell-based architecture, shuffle sharding, static stability, control plane vs data plane, dependency isolation |
| 4.4.5 | L | ★ **Chaos engineering & game days**: hypotheses, blast radius, running one |
| 4.4.6 | M | Take the basic web service to multi-region active-active: what changes? |
| 4.4.7 | P | Drill: an AZ disappears · a whole region down · backups exist but restore takes 14 h · failback corrupts data · a control-plane outage takes the data plane down with it |
| 4.4.8 | R | Review |

## Cycle 4.5 — ★ Architecture styles & service design

| ID | Type | Session |
|---|---|---|
| 4.5.1 | L | ★ **Architecture styles**: monolith, modular monolith, SOA, microservices, serverless, event-driven; the problem each was invented to solve, and what each costs |
| 4.5.2 | DD | ★ **Domain-Driven Design for architects**: ubiquitous language, bounded contexts, context maps, aggregates as consistency boundaries; data ownership & database-per-service; anti-patterns: shared database, distributed monolith, entity services |
| 4.5.3 | L | ★ **Service communication**: sync (REST/gRPC) vs async, API gateway vs backend-for-frontend (BFF), service mesh (preview), API versioning between services, ★ consumer-driven contract testing |
| 4.5.4 | C | ★ **Monolith vs microservices decision**: team size & Conway's law, deploy independence, operational cost, latency of network hops, data consistency. ★ Hexagonal / clean architecture (ports & adapters) inside a service |
| 4.5.5 | M | Decompose an e-commerce monolith into bounded contexts; draw the context map and pick sync vs async per interaction |
| 4.5.6 | P | Drill: cascading failure across 12 microservices · "independent" services that must deploy in lockstep · chatty services blow the latency budget |
| 4.5.7 | F | **#5 Notification Service, v1**: templates, preferences, provider integrations, synchronous send path. Its failure under provider outages and fan-out motivates Phase 5 |
| 4.5.8 | AR | ★ **Architecture review role-play**: a "senior architect" proposes splitting a 6-engineer startup's app into 25 microservices; interrogate it |
| 4.5.9 | R | Review + concept map of Phase 4 → **Gate** |

## Gate 4

- [ ] Locates a bottleneck from metrics and explains utilisation vs latency.
- [ ] Implements and compares 4 rate-limit algorithms; designs a distributed limiter.
- [ ] Adds timeouts/retries/backoff/jitter/circuit breakers with justified numbers; explains retry storms.
- [ ] Designs backpressure and load shedding for a surge.
- [ ] Chooses active-active vs active-passive, states RPO/RTO, and designs DR testing.
- [ ] Explains cell-based architecture, shuffle sharding and static stability, and when each pays off.
- [ ] Chooses monolith / modular monolith / microservices for 3 org contexts; identifies bounded contexts and data ownership; names the distributed-monolith and shared-DB anti-patterns.
- [ ] Rate Limiter, Ticket Booking v2, Notification v1 ≥ 80/120.
