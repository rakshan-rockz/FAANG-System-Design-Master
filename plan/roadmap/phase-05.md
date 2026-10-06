# Phase 5 — Messaging & Event-Driven Systems

README §15. Asynchrony, logs, delivery guarantees, event-driven architecture, distributed transactions.

## Cycle 5.1 — Queues & pub/sub

| ID | Type | Session |
|---|---|---|
| 5.1.1 | L | 15.1 **Queues**: producer, consumer, queue, acknowledgements, visibility timeout, retry, dead-letter queue; ★ why async: load levelling, decoupling, smoothing spikes |
| 5.1.2 | L | 15.2 **Pub/sub**: topics, subscribers, fan-out, delivery; push vs pull consumers |
| 5.1.3 | C | Queue vs pub/sub · ★ broker-style (RabbitMQ/SQS) vs log-style (Kafka) · sync vs async communication: "Why not synchronous?" / "Why asynchronous?" |
| 5.1.4 | L | ★ **Delayed & scheduled work**: delay queues, visibility-timeout tricks, timer wheels, distributed cron, leader-elected schedulers, "run exactly once at time T" |
| 5.1.5 | L | ★ **Delivery channels**: mobile push (APNs/FCM: tokens, collapse keys, quotas), email (SMTP, deliverability, SPF/DKIM/DMARC), SMS gateways, outbound webhooks (signing, retries, backoff, endpoint health) |
| 5.1.6 | F | **#5 Notification Service, v2**: evolve v1 (4.5.7): queues, per-channel workers, retries, DLQ, preferences, rate limits, scheduled sends |
| 5.1.7 | R | Review |

## Cycle 5.2 — Kafka-style logs

| ID | Type | Session |
|---|---|---|
| 5.2.1 | L | 15.3 **Kafka-style architecture I**: broker, topic, partition, producer, consumer, consumer group, offset, retention |
| 5.2.2 | DD | **Kafka II**: replication (ISR, acks, leader election), ordering guarantees (per partition), ★ partition count & key choice, ★ rebalancing, ★ compaction 📄 *Kafka (LinkedIn)* |
| 5.2.3 | LAB | Kafka/Redpanda: consumer groups, kill a consumer mid-batch, observe rebalance & duplicates |
| 5.2.4 | P | Drill: consumer lag growing for hours · poison message blocks a partition · hot partition from a skewed key · broker loses a partition leader |
| 5.2.5 | R | Review |

## Cycle 5.3 — Delivery semantics & idempotency

| ID | Type | Session |
|---|---|---|
| 5.3.1 | L | 15.4 **At-most-once, at-least-once, exactly-once**: where each comes from in the produce/consume/commit sequence |
| 5.3.2 | DD | **"Exactly-once"**: what's really achievable (effectively-once = at-least-once + idempotency); ★ Kafka transactions conceptually; idempotent consumers, dedupe stores |
| 5.3.3 | M | Make the notification pipeline effectively-once end to end |
| 5.3.4 | R | Review |

## Cycle 5.4 — Event-driven architecture

| ID | Type | Session |
|---|---|---|
| 5.4.1 | L | 15.5 **Event notification vs event-carried state transfer**; pub/sub in architecture; ★ schemas, versioning & schema registry |
| 5.4.2 | DD | **Event sourcing**: event store, replay, snapshots, projections; when it hurts |
| 5.4.3 | DD | **CQRS**: separate read models, sync lag, when NOT to use it |
| 5.4.4 | C | Event-driven vs request-driven; choreography vs orchestration (preview) |
| 5.4.5 | F | **#18 Chat System** (1:1 + groups, WebSockets, message store, ordering per conversation, receipts, offline delivery) |
| 5.4.6 | R | Review |

## Cycle 5.5 — Distributed transactions

| ID | Type | Session |
|---|---|---|
| 5.5.1 | L | 15.6 **2PC**: coordinator, prepare/commit, blocking problem; ★ 3PC and why it's rare |
| 5.5.2 | L | **Saga**: choreography vs orchestration, compensating actions, ★ semantic locks, ★ workflow engines (Temporal-style) |
| 5.5.3 | DD | **Transactional outbox** (+ ★ CDC relay), **inbox pattern**, **idempotency** as the glue |
| 5.5.4 | C | 2PC vs saga vs outbox for 5 business flows |
| 5.5.5 | P | Drill: saga compensation fails · outbox relay down for an hour · duplicate order events |
| 5.5.6 | F | **#17 Food Delivery** (order saga across restaurant, payment, courier) |
| 5.5.7 | R | Review |

## Cycle 5.6 — Messaging at product scale

| ID | Type | Session |
|---|---|---|
| 5.6.1 | L | ★ **Fan-out on write vs fan-out on read**; the celebrity problem; hybrid fan-out |
| 5.6.2 | F | **#9 WhatsApp** (E2E-encryption implications, presence, multi-device, group fan-out) |
| 5.6.3 | F | **#7 Twitter/X** (timeline, fan-out, search preview, trends preview) |
| 5.6.4 | F | **#29 Social Media Feed** (ranking hooks, pagination, caching the feed) |
| 5.6.5 | F | **#8 Instagram** (media pipeline + feed + stories TTL) |
| 5.6.6 | F | ★ **Web Crawler** (frontier queues, politeness, dedupe, distributed workers) |
| 5.6.7 | AR | ★ **Architecture review role-play**: a "senior architect" proposes event sourcing + CQRS + Kafka for an internal admin CRUD tool; interrogate it |
| 5.6.8 | R | Review + concept map of Phase 5 → **Gate** |

## Gate 5

- [ ] Chooses queue vs pub/sub vs log for 6 scenarios; explains visibility timeouts, DLQs, retries.
- [ ] Explains Kafka partitions, consumer groups, offsets, ISR/acks, and ordering guarantees.
- [ ] Achieves effectively-once processing and explains why true exactly-once is limited.
- [ ] Explains event sourcing and CQRS including when NOT to use them.
- [ ] Designs a saga with compensations and an outbox; explains 2PC's blocking problem.
- [ ] Explains fan-out on write vs read with the celebrity problem.
- [ ] Designs delayed/scheduled execution and multi-channel delivery (push/email/SMS/webhooks) with retries.
- [ ] Phase 5 designs ≥ 85/120.
