# Numbers I Should Know

**You fill this in** (from session 0.4.1 onward); Claude verifies and corrects. Orders of magnitude matter;
exact values don't. Add a "why" next to anything surprising.

## Conversions & shortcuts
| Fact | Value | Why it's useful |
|---|---|---|
| Seconds per day | | |
| 1M requests/day ≈ ? req/s | | |
| 2^10, 2^20, 2^30, 2^40 | | |
| Peak-to-average ratio (typical assumption) | | |

## Latency (approx.)
| Operation | Latency |
|---|---|
| L1 cache reference | |
| Main memory reference | |
| Read 1 MB sequentially from memory | |
| SSD random read | |
| Read 1 MB sequentially from SSD | |
| HDD seek | |
| Round trip within a datacenter | |
| Round trip cross-continent | |
| TLS handshake (extra RTTs) | |

## Capacity rules of thumb (single node, order of magnitude)
| Component | Throughput | Notes / what limits it |
|---|---|---|
| Stateless web/app server | | |
| Relational DB (simple indexed reads) | | |
| Relational DB (writes) | | |
| Redis / in-memory KV | | |
| Kafka-style broker / partition | | |
| NIC bandwidth | | |
| Connections per server | | |

## Availability
| Nines | Downtime / year | Downtime / month |
|---|---|---|
| 99% | | |
| 99.9% | | |
| 99.99% | | |
| 99.999% | | |

## Storage sizes
| Item | Size |
|---|---|
| UUID / int64 / timestamp | |
| Typical tweet / message row | |
| Photo (compressed) | |
| 1 min of video (HD, streamed) | |

## Rough cloud costs (for senior-level cost reasoning)
| Resource | ~Cost |
|---|---|
| Object storage per TB-month | |
| Egress per TB | |
| Mid-size VM per month | |
