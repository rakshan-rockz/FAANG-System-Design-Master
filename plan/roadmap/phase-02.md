# Phase 2 — Data & Storage

README §8–12, the most important phase, done at full depth. Relational internals, scaling,
NoSQL, object storage, caching. ★ storage engines and isolation anomalies added.

## Cycle 2.1 — Relational model & SQL

| ID | Type | Session |
|---|---|---|
| 2.1.1 | L | 8.1 **Relational databases**: tables, rows, columns, primary keys, foreign keys, constraints, joins; ★ surrogate vs natural keys |
| 2.1.2 | DD | **Normalisation** (1NF → 3NF, BCNF; update/insert/delete anomalies) vs **denormalisation** (why, when, what it costs) |
| 2.1.3 | L | 8.2 **SQL I**: SELECT, WHERE, JOIN types (inner/left/right/full/self/cross), GROUP BY, HAVING, ORDER BY, aggregation |
| 2.1.4 | L | **SQL II**: subqueries (correlated vs not), CTEs, ★ window functions, ★ how a query planner reads a query |
| 2.1.5 | M | **Access-pattern-first modelling**: model an e-commerce catalogue + orders; write the 8 key queries |
| 2.1.6 | R | Review (SQL exercise set, timed) |

## Cycle 2.2 — Indexes

| ID | Type | Session |
|---|---|---|
| 2.2.1 | L | 8.3 **Why indexes exist**: full scans vs lookups, B-tree, B+ tree (fan-out, height, leaf links), hash index |
| 2.2.2 | DD | **Composite indexes** (leftmost prefix, column order), **covering**, **clustered vs secondary**, selectivity & cardinality, index maintenance cost on writes |
| 2.2.3 | DD | **"When does an index stop helping?"**: low selectivity, functions on columns, OR conditions, sort + filter conflicts, too many indexes, planner choosing a scan. ★ Partial, expression, GIN/bitmap indexes |
| 2.2.4 | LAB | `EXPLAIN ANALYZE` on a 10M-row table: no index → single → composite → covering; measure |
| 2.2.5 | P | Drill: a query went from 5 ms to 5 s after a data growth spike · index build locks a hot table |
| 2.2.6 | R | Review |

## Cycle 2.3 — ★ Storage engines

| ID | Type | Session |
|---|---|---|
| 2.3.1 | L | ★ **How a database stores data**: pages, heap files, buffer pool, write-ahead log (WAL), checkpoints, crash recovery |
| 2.3.2 | DD | ★ **LSM trees**: memtable, SSTables, compaction strategies, bloom filters, tombstones |
| 2.3.3 | C | ★ **B-tree vs LSM**: read/write/space amplification; why Cassandra/RocksDB write fast and Postgres/MySQL read well. ★ Row vs column storage |
| 2.3.4 | R | Review |

## Cycle 2.4 — Transactions & isolation

| ID | Type | Session |
|---|---|---|
| 2.4.1 | L | 8.4 **Transactions / ACID**: atomicity, consistency, isolation, durability. What each letter *actually* promises and what it doesn't |
| 2.4.2 | L | 8.5 **Isolation levels**: read uncommitted, read committed, repeatable read, serializable |
| 2.4.3 | DD | ★ **Anomalies**: dirty read/write, non-repeatable read, read skew, lost update, write skew, phantoms; which level prevents which. ★ How they're implemented: 2PL, snapshot isolation, SSI |
| 2.4.4 | LAB | Reproduce lost update and write skew in Postgres at two isolation levels |
| 2.4.5 | R | Review |

## Cycle 2.5 — Concurrency control

| ID | Type | Session |
|---|---|---|
| 2.5.1 | L | 8.6 **Concurrency**: locks, shared vs exclusive, ★ row/table/gap/predicate locks, deadlocks (detection, prevention, timeouts) |
| 2.5.2 | DD | **MVCC**: versions, visibility, vacuum/garbage, long-transaction hazards |
| 2.5.3 | C | **Optimistic vs pessimistic concurrency**: version columns, compare-and-set, `SELECT … FOR UPDATE`, retry costs under contention |
| 2.5.4 | M | "Sell the last seat exactly once": 3 correct approaches and their trade-offs |
| 2.5.5 | P | Drill: deadlock storm after a deploy · long-running report blocks writes · connection-pool exhaustion |
| 2.5.6 | F | **#16 Ticket Booking, v1** (single region, single DB: correctness first) |
| 2.5.7 | R | Review |

## Cycle 2.6 — Scaling a database I: replication

| ID | Type | Session |
|---|---|---|
| 2.6.1 | L | 9.1 **Vertical scaling**: CPU, memory, disk (★ IOPS, throughput), network; where it stops working and what it costs |
| 2.6.2 | L | 9.2 **Read replicas**: primary/replica, replication lag, read-after-write problems, failover |
| 2.6.3 | DD | 9.3 **Synchronous vs asynchronous vs semi-synchronous replication**; ★ physical vs logical replication; ★ change data capture (CDC) |
| 2.6.4 | DD | **Failover mechanics**: detection, promotion, lost-writes window, ★ split brain preview, client redirection |
| 2.6.5 | C | ★ Handling lag in apps: read-your-writes routing, monotonic-read pinning, version tokens |
| 2.6.6 | LAB | Postgres primary + async replica: measure lag under load; reproduce and fix a read-after-write bug |
| 2.6.7 | P | Drill: primary dies mid-write · replica 30 s behind · failover promotes a stale replica |
| 2.6.8 | R | Review |

## Cycle 2.7 — Scaling a database II: partitioning & sharding

| ID | Type | Session |
|---|---|---|
| 2.7.1 | L | 9.4 **Partitioning**: horizontal vs vertical; ★ in-DB table partitioning vs cross-node sharding |
| 2.7.2 | L | 9.5 **Sharding I**: why shard, hash vs range vs directory-based |
| 2.7.3 | DD | **Consistent hashing**: the ring, virtual nodes, ★ rendezvous hashing, ★ jump hash; what moves when nodes join/leave |
| 2.7.4 | DD | **Sharding II**: shard-key selection, hot partitions, shard rebalancing (★ fixed partitions vs split/merge), cross-shard queries, cross-shard transactions |
| 2.7.5 | C | ★ **Secondary indexes in a sharded system**: local (scatter-gather) vs global (async), and their failure modes |
| 2.7.6 | L | 16.7 **Distributed unique IDs I** (moved earlier: sharding needs them): why auto-increment breaks across shards, UUID, ticket/sequence servers, timestamp-based and Snowflake-style IDs, ★ sortability & index locality. (Clock-skew depth returns in 6.2) |
| 2.7.7 | M | Shard the URL Shortener and Ticket Booking data. Pick and defend the keys |
| 2.7.8 | P | Drill: celebrity creates a hot shard · rebalancing saturates the network · one shard's disk fills · ID collisions after a restore |
| 2.7.9 | F | **#6 Unique ID Generator** (learning pass) |
| 2.7.10 | R | Review |

## Cycle 2.8 — NoSQL

| ID | Type | Session |
|---|---|---|
| 2.8.1 | L | 10 **Key-value stores**: Redis (data structures, single-threaded model, persistence RDB/AOF, replication, cluster mode) and Dynamo-style systems |
| 2.8.2 | L | **Document stores**: MongoDB-style architecture, embedding vs referencing, replica sets, sharding |
| 2.8.3 | DD | **Wide-column stores**: Cassandra-style architecture, partition key & clustering key, query-first modelling, tunable consistency, tombstones & compaction |
| 2.8.4 | L | **Graph databases**: property graphs, relationships, traversals, when a graph model wins |
| 2.8.5 | C | ★ NewSQL / distributed SQL (Spanner/CockroachDB-style) vs sharded SQL vs NoSQL; ★ time-series & search stores (preview) |
| 2.8.6 | M | Model the same app (chat messages) in SQL, document, and wide-column. Compare |
| 2.8.7 | F | ★ **Leaderboard** (sorted sets, sharding a leaderboard, top-N vs rank-of-me) |
| 2.8.8 | R | Review |

## Cycle 2.9 — Object storage & choosing a database

| ID | Type | Session |
|---|---|---|
| 2.9.1 | L | 11 **Object storage**: blob storage, S3-style systems, multipart uploads, presigned URLs, metadata, lifecycle policies, replication, storage classes |
| 2.9.2 | DD | ★ Inside an object store: metadata vs data plane, ★ erasure coding vs replication, consistency model, listing at scale |
| 2.9.3 | C | ★ **Block vs file vs object storage**; ★ distributed file systems (GFS/HDFS-style: master, chunks, replication) 📄 *GFS*; ★ storage tiering (hot/warm/cold/archive), data lifecycle & retention |
| 2.9.4 | C | 10 **Choosing a database**: access pattern, consistency, scale, query flexibility, transactions, latency, operational complexity, cost; 10 scenario decisions |
| 2.9.5 | P | Drill: upload service overloaded by large files · presigned URL leaked · accidental bucket deletion |
| 2.9.6 | F | **#2 Pastebin** (learning pass: metadata DB + blob store) |
| 2.9.7 | F | **#3 File Upload Service** (learning pass) |
| 2.9.8 | R | Review |

## Cycle 2.10 — Caching I: fundamentals & strategies

| ID | Type | Session |
|---|---|---|
| 2.10.1 | L | 12 **Why cache? What to cache? Where?** Client, CDN, edge, reverse proxy, app-local, distributed. ★ Hit-ratio maths: the effect of 90% vs 99% on DB load |
| 2.10.2 | L | **Strategies**: cache-aside, read-through, write-through, write-back, ★ write-around, ★ refresh-ahead |
| 2.10.3 | L | **Eviction**: LRU, LFU, FIFO, TTL; ★ implementing LRU (hash map + doubly linked list); ★ admission policies |
| 2.10.4 | C | Strategy × workload matrix; ★ Redis vs Memcached; local vs distributed cache |
| 2.10.5 | R | Review |

## Cycle 2.11 — Caching II: failure modes & distributed caches

| ID | Type | Session |
|---|---|---|
| 2.11.1 | DD | **Problems I**: cache stampede (locking, request coalescing, ★ probabilistic early expiry), cache penetration (★ Bloom filters, negative caching), cache avalanche (jittered TTLs) |
| 2.11.2 | DD | **Problems II**: hot keys (local caching, replication, key splitting), stale data, **invalidation** (TTL, event-driven, versioned keys, ★ CDC-driven), ★ cache-DB consistency races |
| 2.11.3 | L | ★ Distributed cache internals: partitioning, replication, Redis Cluster vs client-side sharding 📄 *Scaling Memcache at Facebook* |
| 2.11.4 | LAB | Redis cache-aside under k6 load: trigger a stampede, fix with coalescing |
| 2.11.5 | P | Drill: Redis cluster down · cold cache after restart · thundering herd at TTL expiry · stale price shown after update |
| 2.11.6 | F | **#1 URL Shortener, v2**: 100× scale: sharded storage, ID/key generation at scale, cache layer for redirects, hot links, analytics counts |
| 2.11.7 | AR | ★ **Architecture review role-play**: a "senior architect" proposes MongoDB + Redis write-back cache for a payments ledger; interrogate it |
| 2.11.8 | R | Review + concept map of Phase 2 → **Gate** |

## Gate 2

- [ ] Models data from access patterns; normalises or denormalises with explicit reasons.
- [ ] Writes correct SQL for joins, aggregation, subqueries, window functions (timed set ≥ 90%).
- [ ] Designs indexes for 5 queries and explains when each stops helping.
- [ ] Explains B-tree vs LSM and the amplification trade-offs.
- [ ] Names the anomaly each isolation level allows; solves the last-seat problem 3 ways.
- [ ] Explains sync/async/semi-sync replication, failover data loss, and how apps handle lag.
- [ ] Picks and defends a shard key against hot spots; explains consistent hashing and rebalancing.
- [ ] Chooses among SQL, KV, document, wide-column, graph, object storage for 10 scenarios.
- [ ] Designs a cache layer (location, strategy, eviction, invalidation) and names its failure modes & mitigations.
- [ ] Explains block vs file vs object storage and how a GFS-style file system works.
- [ ] Ticket Booking v1, ID Generator, Leaderboard, Pastebin, File Upload, URL Shortener v2 ≥ 75/120.
