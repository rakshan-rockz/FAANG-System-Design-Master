# 🏗️ System Design Mentorship Programme

> **Goal:** Become genuinely strong at System Design — not by memorizing architectures, but by developing the ability to reason about requirements, scale, data, distributed systems, reliability, trade-offs, and production architecture.

**Programme:** Interview Prep Aug'26 – Dec'26
**Track:** System Design
**Target:** Top product companies + real-world engineering ability

---

# 1. Programme Objective

By the end of this programme, I should be able to:

* Understand an unfamiliar system quickly.
* Clarify ambiguous requirements.
* Identify functional and non-functional requirements.
* Estimate traffic, storage, bandwidth, and resource requirements.
* Design APIs and data models.
* Select appropriate databases and storage systems.
* Reason about caching, replication, partitioning, and sharding.
* Design scalable distributed systems.
* Reason about consistency and availability.
* Handle failures and partial failures.
* Design asynchronous and event-driven systems.
* Understand distributed transactions.
* Design for multi-region deployments.
* Reason about observability, security, and operations.
* Explain architectural trade-offs.
* Defend design decisions under interviewer questioning.
* Recognize bottlenecks before they become production failures.
* Design systems without relying on memorized "standard architectures."

The ultimate objective is:

> **Given an unfamiliar system-design problem, independently arrive at a reasonable architecture, explain why it works, identify its limitations, and evolve it as requirements and scale change.**

---

# 2. Core Philosophy

This is **not** a technology memorization programme.

We will not learn:

> Kafka → Redis → Cassandra → Kubernetes → "Design Twitter"

Instead, every major concept should answer:

1. What problem does this solve?
2. Why does that problem exist?
3. How does the solution work?
4. What assumptions does it make?
5. What are the alternatives?
6. What are the trade-offs?
7. What happens when it fails?
8. How does it behave at scale?
9. When should I use it?
10. When should I NOT use it?
11. How would I explain it in an interview?

---

# 3. The System Design Mental Model

Every design should eventually follow this loop:

```text
                 ┌─────────────────────┐
                 │    Requirements     │
                 └──────────┬──────────┘
                            ↓
                 ┌─────────────────────┐
                 │   Scale Estimation  │
                 └──────────┬──────────┘
                            ↓
                 ┌─────────────────────┐
                 │     API / I/O       │
                 └──────────┬──────────┘
                            ↓
                 ┌─────────────────────┐
                 │     Data Model      │
                 └──────────┬──────────┘
                            ↓
                 ┌─────────────────────┐
                 │ High-Level Design   │
                 └──────────┬──────────┘
                            ↓
              ┌─────────────┴─────────────┐
              ↓                           ↓
       Scalability                    Reliability
              ↓                           ↓
       Performance                    Failures
              └─────────────┬─────────────┘
                            ↓
                    Trade-offs
                            ↓
                 Final Architecture
```

---

# 4. Programme Structure

The curriculum is divided into the following phases:

| Phase | Topic                            | Status |
| ----- | -------------------------------- | ------ |
| 0     | System Design Foundations        | 🔒     |
| 1     | Networking & Web Foundations     | 🔒     |
| 2     | Data & Storage                   | 🔒     |
| 3     | Distributed Systems Foundations  | 🔒     |
| 4     | Scalability & Reliability        | 🔒     |
| 5     | Messaging & Event-Driven Systems | 🔒     |
| 6     | Advanced Distributed Data        | 🔒     |
| 7     | Production Architecture          | 🔒     |
| 8     | Classic System Designs           | 🔒     |
| 9     | Advanced / Staff-Level Design    | 🔒     |
| 10    | Interview Mastery                | 🔒     |

The lock icon means the phase has not yet been started.

---

# 5. Daily Learning Structure

Target:

**45–75 minutes on normal days**

Longer sessions are reserved for weekend design exercises.

## Monday — Learn

Introduce a new concept from first principles.

Example:

> Database replication

We learn:

* What it is
* Why it exists
* How it works
* Types
* Trade-offs
* Failure modes
* Real-world use cases

---

## Tuesday — Deep Dive

Go beneath the surface.

Example:

> Replication lag

Questions:

* Why does it occur?
* How large can it become?
* What happens to reads?
* What happens after failover?
* How do applications compensate?

---

## Wednesday — Compare

Compare alternative approaches.

Examples:

* SQL vs NoSQL
* Redis vs Memcached
* Kafka vs RabbitMQ
* SQL replication vs sharding
* Synchronous vs asynchronous replication

The goal is architectural judgment.

---

## Thursday — Mini Design

Apply the week's concepts to a small system.

Example:

> Design a notification service.

---

## Friday — Production Thinking

Focus on failure and operational scenarios.

Examples:

* What if Redis goes down?
* What if the database becomes slow?
* What if Kafka is unavailable?
* What if traffic suddenly increases 20×?
* What if one availability zone disappears?

---

## Saturday — Full Design

60–120 minute system-design session.

Format:

1. Requirements
2. Scale
3. APIs
4. Data model
5. Architecture
6. Deep dive
7. Bottlenecks
8. Failure scenarios
9. Trade-offs

---

## Sunday — Review

Review:

* Concepts
* Mistakes
* Weak areas
* Design decisions
* Interview questions
* Architecture journal

---

# 6. Phase 0 — System Design Foundations

## 0.1 What Is System Design?

* System
* Architecture
* Component
* Service
* Dependency
* Interface
* Boundary
* State
* Data flow
* Control flow

## 0.2 Functional Requirements

* What must the system do?
* Core use cases
* User actions
* Inputs
* Outputs
* Business rules

## 0.3 Non-Functional Requirements

* Availability
* Reliability
* Scalability
* Latency
* Throughput
* Durability
* Consistency
* Security
* Maintainability
* Observability
* Cost

## 0.4 The Quality Attribute Trade-off

Understand why improving one property can hurt another.

Examples:

* Consistency vs availability
* Latency vs durability
* Cost vs redundancy
* Performance vs simplicity
* Freshness vs caching

## 0.5 Availability

* Uptime
* Downtime
* Nines
* 99%
* 99.9%
* 99.99%
* 99.999%
* Availability budgets

## 0.6 Latency

* Average latency
* Median
* p90
* p95
* p99
* Tail latency

## 0.7 Throughput

* Requests/second
* Transactions/second
* Messages/second
* Read/write ratios

## 0.8 Reliability vs Availability

Understand the distinction.

## 0.9 Durability

Why "successfully stored" does not necessarily mean "never lost."

## 0.10 Scale Estimation

Learn to estimate:

* DAU
* MAU
* Requests/sec
* Peak requests/sec
* Storage/day
* Storage/year
* Bandwidth
* Read/write volume

## 0.11 Back-of-the-Envelope Calculations

Essential powers of ten:

```text
1 thousand       = 10³
1 million        = 10⁶
1 billion        = 10⁹
1 trillion       = 10¹²
```

And:

```text
1 day ≈ 86,400 seconds
```

## 0.12 The Interview Framework

Learn how to structure a 45–60 minute design interview.

### Foundation milestone

Before moving forward, I should be able to take a simple problem and:

* clarify requirements
* estimate scale
* propose APIs
* sketch a basic architecture
* explain the major trade-offs

---

# 7. Phase 1 — Networking & Web Foundations

## 1.1 Internet Fundamentals

* IP
* IPv4
* IPv6
* Ports
* Sockets
* NAT
* Firewalls

## 1.2 DNS

* Domain names
* Recursive resolution
* Root servers
* TLD servers
* Authoritative servers
* TTL
* DNS caching
* DNS-based routing
* Failover

## 1.3 TCP

* Connection establishment
* 3-way handshake
* Reliable delivery
* Ordering
* Retransmission
* Flow control
* Congestion control
* Connection termination

## 1.4 UDP

* Characteristics
* When it makes sense
* TCP vs UDP

## 1.5 HTTP

* HTTP request/response
* Methods
* Status codes
* Headers
* Cookies
* Sessions
* Keep-alive
* Connection pooling

## 1.6 HTTP Versions

* HTTP/1.1
* HTTP/2
* HTTP/3
* Multiplexing
* Head-of-line blocking
* QUIC

## 1.7 HTTPS

* TLS
* Certificates
* Certificate authorities
* Handshake
* Symmetric encryption
* Asymmetric encryption

## 1.8 Proxies

* Forward proxy
* Reverse proxy

## 1.9 Load Balancers

* L4
* L7
* Round robin
* Weighted routing
* Least connections
* Health checks
* Failover
* Session affinity

## 1.10 CDN

* Edge locations
* Origin
* Cache
* Cache invalidation
* TTL
* Static content
* Dynamic content

### Design exercises

* Basic web service
* Global static-content delivery
* URL shortener

---

# 8. Phase 2 — Data & Storage

This is one of the most important phases.

# 8.1 Relational Databases

* Tables
* Rows
* Columns
* Primary keys
* Foreign keys
* Constraints
* Joins
* Normalization
* Denormalization

## 8.2 SQL

* SELECT
* WHERE
* JOIN
* GROUP BY
* ORDER BY
* Aggregation
* Subqueries

## 8.3 Indexes

* Why indexes exist
* B-tree
* B+ tree
* Hash index
* Composite index
* Covering index
* Clustered index
* Secondary index
* Selectivity
* Index maintenance cost

Important question:

> When does an index stop helping?

## 8.4 Transactions

* ACID
* Atomicity
* Consistency
* Isolation
* Durability

## 8.5 Isolation Levels

* Read uncommitted
* Read committed
* Repeatable read
* Serializable

## 8.6 Concurrency

* Locks
* Shared locks
* Exclusive locks
* Deadlocks
* MVCC
* Optimistic concurrency
* Pessimistic concurrency

---

# 9. Database Scaling

## 9.1 Vertical Scaling

* CPU
* Memory
* Disk
* Network

## 9.2 Read Replicas

* Primary
* Replica
* Replication lag
* Read-after-write problems
* Failover

## 9.3 Replication

* Synchronous
* Asynchronous
* Semi-synchronous

## 9.4 Partitioning

* Horizontal partitioning
* Vertical partitioning

## 9.5 Sharding

* Why shard?
* Hash sharding
* Range sharding
* Directory-based sharding
* Consistent hashing
* Hot partitions
* Shard rebalancing
* Cross-shard queries
* Cross-shard transactions
* Shard-key selection

---

# 10. NoSQL

## Key-Value

* Redis
* Dynamo-style systems

## Document

* MongoDB-style architecture

## Wide Column

* Cassandra-style architecture

## Graph

* Graph databases
* Relationships
* Traversals

## Choosing a Database

Decision factors:

* Access pattern
* Consistency
* Scale
* Query flexibility
* Transaction requirements
* Latency
* Operational complexity
* Cost

---

# 11. Object Storage

* Blob storage
* S3-style systems
* Multipart uploads
* Presigned URLs
* Metadata
* Lifecycle policies
* Replication
* Storage classes

---

# 12. Caching

## Fundamentals

* Why cache?
* What to cache?
* Where to cache?

## Strategies

* Cache-aside
* Read-through
* Write-through
* Write-back

## Eviction

* LRU
* LFU
* FIFO
* TTL

## Problems

* Cache stampede
* Cache penetration
* Cache avalanche
* Hot keys
* Stale data
* Invalidation

Critical principle:

> **Caching is not simply "put Redis in front of the database."**

---

# 13. Phase 3 — Distributed Systems Foundations

Now we move from:

> one machine

to:

> many machines cooperating over an unreliable network.

## 13.1 Why Distributed Systems Are Difficult

* Network latency
* Packet loss
* Partial failure
* Machine failure
* Clock differences
* Duplicate messages
* Lost messages
* Delayed messages
* Reordering

## 13.2 Failure Models

* Crash failure
* Network failure
* Partial failure
* Byzantine failure — conceptual understanding

## 13.3 CAP Theorem

Understand:

* Consistency
* Availability
* Partition tolerance
* Network partitions
* CP
* AP
* Why CAP is commonly misunderstood

## 13.4 Consistency Models

* Strong consistency
* Eventual consistency
* Read-your-writes
* Monotonic reads
* Causal consistency
* Sequential consistency
* Linearizability

## 13.5 Replication Models

* Single leader
* Multi-leader
* Leaderless
* Quorum systems

## 13.6 Quorum

Understand:

```text
N = number of replicas
W = write quorum
R = read quorum
```

and why:

```text
R + W > N
```

can provide overlapping replica sets.

## 13.7 Consensus

* Why consensus exists
* Leader election
* Quorum
* Raft
* Paxos — conceptual understanding
* Split brain
* Terms/epochs
* Log replication

---

# 14. Phase 4 — Scalability & Reliability

## 14.1 Horizontal Scaling

* Stateless services
* Load balancing
* Service discovery
* Autoscaling

## 14.2 Bottlenecks

* CPU
* Memory
* Database
* Network
* Disk
* Lock contention
* Hot keys
* Hot partitions

## 14.3 Rate Limiting

* Fixed window
* Sliding window
* Token bucket
* Leaky bucket
* Distributed rate limiting

## 14.4 Backpressure

* Queues
* Load shedding
* Bounded buffers
* Consumer slowdown

## 14.5 Resilience Patterns

* Timeout
* Retry
* Exponential backoff
* Jitter
* Circuit breaker
* Bulkhead
* Fail-fast
* Graceful degradation

## 14.6 Redundancy

* Replication
* Multi-AZ
* Multi-region
* Active-active
* Active-passive

## 14.7 Disaster Recovery

* Backup
* Restore
* RPO
* RTO
* Failover
* Recovery testing

---

# 15. Phase 5 — Messaging & Event-Driven Systems

## 15.1 Queues

* Producer
* Consumer
* Queue
* Visibility timeout
* Retry
* Dead-letter queue

## 15.2 Pub/Sub

* Topics
* Subscribers
* Fan-out
* Delivery

## 15.3 Kafka-Style Architecture

* Broker
* Topic
* Partition
* Producer
* Consumer
* Consumer group
* Offset
* Retention
* Replication
* Ordering

## 15.4 Delivery Semantics

* At-most-once
* At-least-once
* Exactly-once

## 15.5 Event-Driven Architecture

* Event notification
* Event-carried state
* Pub/sub
* Event sourcing
* CQRS

## 15.6 Distributed Transactions

* 2PC
* Saga
* Choreography
* Orchestration
* Transactional outbox
* Inbox pattern
* Idempotency

---

# 16. Phase 6 — Advanced Distributed Data

## 16.1 Distributed Locks

* Why they are needed
* Lock ownership
* Lease
* Expiration
* Failure scenarios

## 16.2 Idempotency

* Idempotency keys
* Duplicate requests
* Retries
* Exactly-once effects

## 16.3 Ordering

* Global ordering
* Per-key ordering
* Partition ordering
* Causal ordering

## 16.4 Time

* Physical clocks
* Clock skew
* Logical clocks
* Lamport clocks
* Vector clocks
* Hybrid logical clocks

## 16.5 Conflict Resolution

* Last-write-wins
* Versioning
* Vector clocks
* CRDT concepts

## 16.6 Distributed Counters

* Atomic counters
* Sharded counters
* Approximate counters

## 16.7 Distributed Unique IDs

* UUID
* Snowflake-style IDs
* Timestamp-based IDs
* Sequence-based IDs

---

# 17. Phase 7 — Search, Analytics & Specialized Systems

## Search

* Inverted index
* Tokenization
* Ranking
* Query processing
* Index sharding
* Replication
* Elasticsearch-style architecture

## Analytics

* OLTP vs OLAP
* Data warehouse
* Data lake
* Batch processing
* Stream processing
* Aggregation pipelines

## Specialized Systems

* Recommendation systems
* Notification systems
* Location systems
* Geospatial search
* Time-series systems

---

# 18. Phase 8 — Production Architecture

## 18.1 Observability

### Logs

* Structured logs
* Log levels
* Correlation IDs

### Metrics

* Counters
* Gauges
* Histograms
* Rates

### Traces

* Distributed tracing
* Spans
* Trace propagation

## 18.2 SLI / SLO / SLA

Understand:

* What each means
* How they relate
* Error budgets

## 18.3 Security

* Authentication
* Authorization
* RBAC
* ABAC
* OAuth
* JWT
* API keys
* Secrets
* Encryption in transit
* Encryption at rest
* Key management
* WAF
* DDoS protection

## 18.4 Deployment

* CI/CD
* Rolling deployment
* Blue-green deployment
* Canary deployment
* Feature flags
* Rollback

## 18.5 Containers

* Containers
* Images
* Networking
* Storage

## 18.6 Kubernetes Concepts

Only what is useful for architecture:

* Pods
* Services
* Ingress
* Config
* Secrets
* Health checks
* Autoscaling
* Service discovery

---

# 19. Phase 9 — Classic System Designs

We will NOT begin these until the relevant foundations have been covered.

## Beginner

1. URL Shortener
2. Pastebin
3. File Upload Service
4. Rate Limiter
5. Notification Service
6. Unique ID Generator

## Intermediate

7. Twitter/X
8. Instagram
9. WhatsApp
10. YouTube
11. Dropbox
12. Google Drive
13. Uber
14. Airbnb
15. Netflix
16. Ticket Booking
17. Food Delivery
18. Chat System

## Advanced

19. Google Search
20. Google Docs
21. Distributed Cache
22. Distributed Message Queue
23. Payment System
24. Ad Serving System
25. Recommendation System
26. Ride Matching System
27. Video Streaming Platform
28. Global Notification Platform
29. Social Media Feed
30. Real-Time Location Tracking

---

# 20. Phase 10 — Staff-Level / Ambiguous Designs

These will deliberately have incomplete requirements.

Examples:

> Design a global payment platform processing hundreds of millions of transactions per day.

> Design a globally distributed notification platform.

> Design a ride-sharing platform operating across multiple continents.

> Design a globally consistent inventory system.

> Design a distributed job scheduling platform.

The objective is no longer just architecture.

We will evaluate:

* Requirement discovery
* Assumption quality
* Architectural judgment
* Trade-offs
* Failure reasoning
* Cost awareness
* Operational maturity

---

# 21. System Design Interview Framework

For a typical 45-minute interview:

## 0–5 min — Requirements

Clarify:

* Users
* Core use cases
* Out-of-scope features
* Scale
* Latency
* Availability
* Consistency requirements

## 5–10 min — Estimation

Estimate:

* DAU
* Requests/sec
* Peak traffic
* Storage
* Bandwidth

## 10–15 min — API + Data Model

Define:

* Major APIs
* Entities
* Important relationships
* Access patterns

## 15–25 min — High-Level Architecture

Draw:

```text
Client
  ↓
Load Balancer
  ↓
Application Services
  ↓
Cache
  ↓
Database
```

Then progressively expand.

## 25–35 min — Deep Dive

Focus on the most difficult component.

## 35–40 min — Scale + Failure

Discuss:

* Bottlenecks
* Replication
* Partitioning
* Failure
* Recovery

## 40–45 min — Trade-offs

Explain:

* Why this design?
* Alternatives
* Limitations
* Future evolution

---

# 22. Design Review Template

Every major design will be documented using:

```text
System:
Date:

1. Requirements

Functional:

Non-functional:

Out of scope:


2. Scale

Users:

DAU:

Requests/sec:

Peak requests/sec:

Storage:

Bandwidth:


3. APIs


4. Data Model


5. High-Level Architecture


6. Component Deep Dive


7. Scaling Strategy


8. Consistency


9. Failure Handling


10. Security


11. Observability


12. Bottlenecks


13. Trade-offs


14. Alternatives Considered


15. Future Evolution


16. Interview Feedback


17. Score
```

---

# 23. Design Scoring

Each full design will be scored.

| Category         |    Score |
| ---------------- | -------: |
| Requirements     |      /10 |
| Scale estimation |      /10 |
| API design       |      /10 |
| Data modelling   |      /10 |
| Architecture     |      /20 |
| Scalability      |      /10 |
| Reliability      |      /10 |
| Consistency      |      /10 |
| Failure handling |      /10 |
| Trade-offs       |      /10 |
| Communication    |      /10 |
| **Total**        | **/120** |

### Interpretation

**<60:** Foundation required

**60–75:** Beginner

**75–90:** Intermediate

**90–105:** Strong interview level

**105+:** Excellent / advanced

Scores are directional, not absolute.

---

# 24. Architecture Journal

We will maintain a growing collection of designs.

Each design should record:

```text
System
Requirements
Scale
Architecture
Key decisions
Alternatives
Failures
Bottlenecks
Trade-offs
Lessons
```

The purpose is to build an internal architecture library rather than memorize external solutions.

---

# 25. Weekly Review

Every week we should answer:

### Knowledge

* What did I learn?
* Can I explain it without notes?
* What concepts are still unclear?

### Application

* Where did I use the concept?
* Can I recognize when it should be used?

### Architecture

* What trade-offs did I learn?
* What failure modes did I discover?

### Interview

* Could I explain the concept clearly in 2 minutes?
* Could I defend the decision under questioning?

---

# 26. Monthly Milestones

## Month 1

Target:

* Understand the design framework
* Networking fundamentals
* HTTP
* DNS
* Load balancing
* Basic scale estimation

Designs:

* URL Shortener
* Pastebin

---

## Month 2

Target:

* SQL
* Indexes
* Transactions
* Replication
* Caching
* NoSQL fundamentals

Designs:

* File Storage
* Rate Limiter
* Notification Service

---

## Month 3

Target:

* Distributed systems
* CAP
* Consistency
* Replication
* Quorum
* Partitioning

Designs:

* Social Feed
* Chat System

---

## Month 4

Target:

* Messaging
* Kafka
* Event-driven architecture
* Distributed transactions
* Reliability

Designs:

* Uber
* Food Delivery
* Payment System

---

## Month 5+

Target:

* Advanced distributed systems
* Multi-region
* Search
* Observability
* Security
* Production architecture
* Ambiguous designs

---

# 27. What "Mastery" Means

I should eventually be able to answer questions such as:

> Why SQL instead of Cassandra?

> Why Cassandra instead of PostgreSQL?

> Why Redis?

> Why not Redis?

> Why Kafka?

> Why not synchronous communication?

> Why asynchronous communication?

> What happens if the cache fails?

> What happens if the database fails?

> What happens if replication lags?

> What happens if a consumer processes the same message twice?

> How do you guarantee idempotency?

> How do you handle hot keys?

> How do you handle hot partitions?

> How do you rebalance shards?

> What happens if one region goes down?

> How do users continue writing?

> What consistency guarantees do users see?

> How do you recover?

> What is the bottleneck?

> What would you change at 10× scale?

> What would you change at 100× scale?

And most importantly:

> **Why?**

---

# 28. Rules of the Mentorship

## Rule 1 — No Blind Memorization

Understanding > memorization.

## Rule 2 — First Principles First

We learn why a technology exists before learning its implementation details.

## Rule 3 — Trade-offs Always Matter

There is rarely a universally "best" technology.

## Rule 4 — Failure Is Part of the Design

A system that works only when everything works is not a production design.

## Rule 5 — Scale Changes Architecture

A design that works for 1,000 users may fail completely at 100 million.

## Rule 6 — Simplicity Is a Feature

Do not introduce distributed complexity without a reason.

## Rule 7 — We Design Before We Memorize

I should attempt designs before seeing canonical solutions.

## Rule 8 — Repetition

Important concepts will deliberately reappear in multiple designs.

---

# 29. Mentorship Protocol

For concept lessons, the flow will be:

```text
Concept
  ↓
Intuition
  ↓
Why it exists
  ↓
How it works
  ↓
Examples
  ↓
Trade-offs
  ↓
Failure scenarios
  ↓
Interview questions
  ↓
Mini exercise
  ↓
Review
```

For design lessons:

```text
Problem
  ↓
You attempt
  ↓
Interviewer questions
  ↓
You defend decisions
  ↓
Deep dive
  ↓
Failure scenarios
  ↓
Mentor review
  ↓
Ideal architecture
  ↓
Score
  ↓
Lessons learned
```

---

# 30. Starting Point

We will **not** immediately jump into Kafka, Redis, Kubernetes, or "Design YouTube."

First:

## Phase 0 — Foundations

### Weekend Foundation Sprint

**Weekend 1**

* What is system design?
* Functional vs non-functional requirements
* Scalability
* Availability
* Reliability
* Durability
* Latency
* Throughput
* Consistency
* CAP intuition
* Back-of-the-envelope estimation
* Anatomy of a system-design interview

**Weekend 2**

* Client/server model
* Requests and responses
* APIs
* Services
* Databases
* Caches
* Queues
* Load balancers
* Replication
* Partitioning
* High-level architecture diagrams
* First mini design

After this foundation, we start the normal daily curriculum.

---

# 31. Current Progress

## Phase 0 — Foundations

| Topic                       | Status |
| --------------------------- | ------ |
| What is System Design?      | ⬜      |
| Functional Requirements     | ⬜      |
| Non-Functional Requirements | ⬜      |
| Scalability                 | ⬜      |
| Availability                | ⬜      |
| Reliability                 | ⬜      |
| Durability                  | ⬜      |
| Latency                     | ⬜      |
| Throughput                  | ⬜      |
| Consistency                 | ⬜      |
| CAP intuition               | ⬜      |
| Scale estimation            | ⬜      |
| Interview framework         | ⬜      |
| Basic architecture          | ⬜      |

---

# 32. Final Goal

The final goal is not:

> "I completed a System Design course."

It is:

> **I can sit in front of an unfamiliar system-design problem and reason about it like an experienced software engineer.**

I should be able to move naturally between:

```text
Business Requirement
       ↓
User Behaviour
       ↓
Scale
       ↓
API
       ↓
Data Model
       ↓
Architecture
       ↓
Distributed Systems
       ↓
Failure
       ↓
Trade-offs
       ↓
Production Reality
```

That is the skill we are building.

---

# 🚀 Programme Status

**System Design Mentorship Programme: ACTIVE**

**Current Phase:** Phase 0 — Foundations

**Next lesson:**

## Lesson 0.1 — What Actually Is System Design?

We will begin from first principles rather than assuming that "system design = drawing boxes."

The first lesson will establish the mental model that the rest of this entire programme will build upon.
