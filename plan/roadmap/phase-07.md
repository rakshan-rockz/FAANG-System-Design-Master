# Phase 7 — Search, Analytics, Data & AI Systems

README §17, plus ★ data engineering (7.4), ★ vector search (7.9) and ★ LLM/AI systems (7.10): in 2026
these come up in almost every senior architecture conversation.

## Cycle 7.1 — Search

| ID | Type | Session |
|---|---|---|
| 7.1.1 | L | **Inverted index**: postings lists, tokenisation, ★ analysers (stemming, stop words, n-grams) |
| 7.1.2 | DD | **Ranking** (★ TF-IDF, BM25, signals beyond text) and **query processing** (boolean, phrase, ★ top-k retrieval) |
| 7.1.3 | DD | **Index sharding** (★ document- vs term-partitioned), **replication**, **Elasticsearch-style architecture** (nodes, shards, segments, refresh, near-real-time) |
| 7.1.4 | C | DB `LIKE`/full-text index vs a search engine · ★ keeping search in sync with the DB (dual write vs CDC) |
| 7.1.5 | F | ★ **Search Autocomplete / Typeahead** (tries, top-k per prefix, caching, updates) |
| 7.1.6 | R | Review |

## Cycle 7.2 — Analytics: OLTP vs OLAP, batch

| ID | Type | Session |
|---|---|---|
| 7.2.1 | L | **OLTP vs OLAP**; ★ columnar storage & compression; **data warehouse** (★ star/snowflake schemas, facts & dimensions) |
| 7.2.2 | L | **Data lake**, ★ lakehouse & open table formats (Iceberg/Delta-style), ★ file formats (Parquet), partitioning for analytics |
| 7.2.3 | DD | **Batch processing**: ★ MapReduce model, ★ Spark-style DAGs, shuffles, skew |
| 7.2.4 | R | Review |

## Cycle 7.3 — Stream processing

| ID | Type | Session |
|---|---|---|
| 7.3.1 | L | **Stream processing**: ★ event time vs processing time, windows (tumbling/sliding/session), watermarks, late data |
| 7.3.2 | DD | ★ Stateful streaming, checkpoints, exactly-once in stream processors; **aggregation pipelines** |
| 7.3.3 | C | ★ Lambda vs Kappa architecture; batch vs stream for 5 use cases |
| 7.3.4 | P | Drill: stream job falls 6 h behind · late events corrupt yesterday's totals · skewed key overloads one task |
| 7.3.5 | F | ★ **Top-K / Ad-Click Aggregator** (Count-Min, windows, reconciliation with batch) |
| 7.3.6 | R | Review |

## Cycle 7.4 — ★ Data engineering & data platforms

| ID | Type | Session |
|---|---|---|
| 7.4.1 | L | ★ **Pipelines**: ETL vs ELT, CDC-based ingestion, backfills, idempotent re-runs; orchestration (Airflow-style DAGs, dependencies, SLAs) |
| 7.4.2 | L | ★ **Data quality & governance**: schema contracts, validation, lineage, catalogues, PII classification, access control on analytics data |
| 7.4.3 | C | ★ **Centralised data platform vs data mesh**: ownership, data products, federated governance; reverse ETL |
| 7.4.4 | M | Design the pipeline from an OLTP orders DB to a warehouse with hourly freshness, backfills and PII masking |
| 7.4.5 | R | Review |

## Cycle 7.5 — Time-series & monitoring systems

| ID | Type | Session |
|---|---|---|
| 7.5.1 | L | **Time-series systems**: data model, ★ compression (delta-of-delta, Gorilla-style), ★ downsampling & retention, high-cardinality problems |
| 7.5.2 | F | ★ **Metrics & Monitoring System** (collection, storage, querying, alerting) |
| 7.5.3 | R | Review |

## Cycle 7.6 — Geospatial & location

| ID | Type | Session |
|---|---|---|
| 7.6.1 | L | **Location systems & geospatial search**: ★ geohash, quadtree, R-tree, S2/H3 |
| 7.6.2 | C | Geohash vs quadtree vs S2/H3; static vs moving objects |
| 7.6.3 | F | ★ **Proximity Service / Yelp** (static places) |
| 7.6.4 | F | **#30 Real-Time Location Tracking** (high-frequency writes, fan-out to watchers) |
| 7.6.5 | F | **#13 Uber** (end-to-end: rider/driver apps, dispatch, pricing, trips) |
| 7.6.6 | F | **#26 Ride Matching System** (deep dive on matching, supply/demand, ETA) |
| 7.6.7 | R | Review |

## Cycle 7.7 — Recommendations & ads

| ID | Type | Session |
|---|---|---|
| 7.7.1 | L | **Recommendation systems**: ★ candidate generation → ranking → re-ranking, offline vs online features, ★ feature store, ★ model serving & A/B testing infrastructure, cold start (architecture, not ML maths) |
| 7.7.2 | F | **#25 Recommendation System** |
| 7.7.3 | F | **#24 Ad Serving System** (targeting, auction, budgets/pacing, click tracking, low latency) |
| 7.7.4 | R | Review |

## Cycle 7.8 — Search & marketplaces at scale

| ID | Type | Session |
|---|---|---|
| 7.8.1 | F | **#19 Google Search** (crawl → index → serve, ranking, freshness, scale) |
| 7.8.2 | F | **#14 Airbnb** (search with geo + availability, booking correctness, payments) |
| 7.8.3 | M | **Notification systems** revisited (README §17 "Specialized"): what changes for global scale → sets up #28 |
| 7.8.4 | R | Review |

## Cycle 7.9 — ★ Embeddings & vector search

| ID | Type | Session |
|---|---|---|
| 7.9.1 | L | ★ **Embeddings**: what they are, similarity metrics (cosine/dot/L2), dimensionality, embedding-model versioning and re-embedding cost |
| 7.9.2 | DD | ★ **Approximate nearest neighbour**: exact vs ANN, HNSW, IVF, product quantisation; recall vs latency vs memory trade-offs |
| 7.9.3 | C | ★ **Vector database vs vector extension** (pgvector-style) vs search-engine vectors; ★ hybrid search (BM25 + vectors, reciprocal rank fusion), metadata filtering, sharding vector indexes |
| 7.9.4 | M | Semantic search over 100M product descriptions: sizing memory, index choice, update path |
| 7.9.5 | R | Review |

## Cycle 7.10 — ★ LLM & AI application systems

| ID | Type | Session |
|---|---|---|
| 7.10.1 | L | ★ **LLM inference fundamentals for architects**: tokens, context windows, prefill vs decode, TTFT & tokens/s, GPU memory & KV cache, batching (continuous batching), quantisation awareness; cost per token |
| 7.10.2 | DD | ★ **Serving LLMs at scale**: model routing & fallbacks, rate limits & quotas per tenant, streaming responses (SSE), prompt/semantic caching, prefix caching, GPU capacity planning, managed API vs self-hosted |
| 7.10.3 | L | ★ **Retrieval-augmented generation (RAG)**: ingestion, chunking, embedding, retrieval, re-ranking, grounding & citations, freshness, access control on retrieved documents |
| 7.10.4 | L | ★ **Agents & tool use**: tool-calling loops, orchestration, state & memory, timeouts & budgets, sandboxing tools, human-in-the-loop, idempotency of side effects |
| 7.10.5 | DD | ★ **Evaluation, safety & operations**: offline evals, online metrics, guardrails (input/output filtering, PII), prompt-injection risks, observability for LLM calls (traces, token cost), non-determinism in testing |
| 7.10.6 | P | Drill: model provider outage · p99 latency doubles at peak · cost spikes 5× overnight · RAG returns a document the user shouldn't see · prompt injection via a retrieved web page |
| 7.10.7 | F | ★ **Enterprise RAG Knowledge Assistant** (multi-tenant, permissions-aware retrieval, citations, evals) |
| 7.10.8 | F | ★ **LLM Chat Service at scale** (ChatGPT-style: sessions, streaming, history, routing, quotas, GPU fleet) |
| 7.10.9 | AR | ★ **Architecture review role-play**: a "senior architect" proposes fine-tuning a model nightly on all support tickets instead of RAG; interrogate it |
| 7.10.10 | R | Review + concept map of Phase 7 → **Gate** |

## Gate 7

- [ ] Explains inverted indexes, ranking, index sharding, and search-DB sync.
- [ ] Chooses OLTP/OLAP, batch/stream, warehouse/lake/lakehouse for scenarios; explains windows & watermarks.
- [ ] Designs an ingestion pipeline with backfills, data quality checks and PII handling; explains data mesh vs central platform.
- [ ] Designs a time-series store and explains cardinality problems.
- [ ] Chooses a geo index for static vs moving objects with reasons.
- [ ] Describes a recommendation pipeline (candidates, ranking, features, cold start).
- [ ] Explains ANN indexes (HNSW/IVF/PQ) trade-offs and hybrid search.
- [ ] Explains LLM serving economics (prefill/decode, KV cache, batching, cost/token) and designs RAG with permission-aware retrieval and evals.
- [ ] Phase 7 designs ≥ 85/120.
