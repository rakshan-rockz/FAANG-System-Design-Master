# Phase 1 — Networking & Web Foundations

README §7, full depth, plus ★ API design, web auth basics and real-time communication (prerequisites
for chat, notifications, live location and collaboration designs).

## Cycle 1.1 — The network underneath

| ID | Type | Session |
|---|---|---|
| 1.1.1 | L | 1.1 **Internet fundamentals**: IP, IPv4 vs IPv6 (address space, ★ CIDR & subnets), ports, sockets, NAT (why it exists, what it breaks), firewalls (stateful vs stateless). ★ The layer model (L3/L4/L7) and where each future component sits |
| 1.1.2 | L | 1.2 **DNS**: domain names, recursive resolution, root → TLD → authoritative, record types (A/AAAA/CNAME/NS/MX/TXT ★), TTL, caching at every layer |
| 1.1.3 | DD | **DNS in architecture**: DNS-based routing (GeoDNS, latency, weighted), DNS failover and why TTLs make it slow, ★ anycast, negative caching, DNS as SPOF |
| 1.1.4 | L | 1.3 **TCP I**: connection establishment, 3-way handshake, reliable delivery, ordering, sequence numbers & ACKs, retransmission, connection termination (FIN, ★ TIME_WAIT) |
| 1.1.5 | DD | **TCP II**: flow control (receive window), congestion control (slow start, cwnd, AIMD, ★ BBR conceptually), ★ what this means for latency over long-distance links, ★ Nagle/delayed ACK |
| 1.1.6 | C | 1.4 **UDP**: characteristics, when it makes sense (DNS, video, games, QUIC). **TCP vs UDP** across reliability, ordering, latency, overhead |
| 1.1.7 | P | Drill: "Cross-region calls went from 80 ms to 400 ms", "Connections stuck in TIME_WAIT exhausted ports", "DNS change didn't take effect for hours" |
| 1.1.8 | R | Review |

## Cycle 1.2 — HTTP and security in transit

| ID | Type | Session |
|---|---|---|
| 1.2.1 | L | 1.5 **HTTP**: request/response anatomy, methods (★ safe vs idempotent), status codes (families + the ones that matter), headers, cookies, sessions (server-side vs token), keep-alive, connection pooling |
| 1.2.2 | DD | 1.6 **HTTP versions**: 1.1 (pipelining, HOL), HTTP/2 (multiplexing, streams, header compression, TCP-level HOL), HTTP/3 & QUIC (UDP, 0-RTT, connection migration) |
| 1.2.3 | L | 1.7 **HTTPS / TLS**: symmetric vs asymmetric encryption, certificates, CAs & chains of trust, the TLS 1.2 vs 1.3 handshake, ★ session resumption, ★ mTLS, ★ where TLS terminates (edge/LB/service) |
| 1.2.4 | L | ★ **Web auth basics** (spiral; depth in 8.3): server sessions vs tokens, cookie security flags (HttpOnly, Secure, SameSite), CSRF & CORS in one picture, JWT at a glance, "OAuth = delegated authorisation" at a glance. Enough to put auth correctly into every design from here on |
| 1.2.5 | C | HTTP/1.1 vs 2 vs 3 decision table · ★ connection pooling to DBs vs to HTTP services (why pools exhaust) |
| 1.2.6 | P | Drill: certificate expired at 2 am · connection pool exhausted · HTTP/2 over lossy mobile network · session store down, so everyone is logged out |
| 1.2.7 | R | Review |

## Cycle 1.3 — Proxies, load balancers, CDNs

| ID | Type | Session |
|---|---|---|
| 1.3.1 | L | 1.8 **Proxies**: forward vs reverse proxy; ★ API gateway (auth, routing, rate limiting, aggregation) |
| 1.3.2 | L | 1.9 **Load balancers I**: L4 vs L7, round robin, weighted, least connections, ★ least response time, ★ hash-based / consistent-hash routing, session affinity (and its costs) |
| 1.3.3 | DD | **Load balancers II**: health checks (active/passive, shallow vs deep), failover, connection draining ★, ★ who balances the balancer (VRRP, anycast, DNS), ★ global server load balancing |
| 1.3.4 | L | 1.10 **CDN**: edge locations, origin, caching, TTL, cache invalidation/purge, static vs dynamic content, ★ pull vs push CDN, ★ origin shield, ★ cache keys & vary |
| 1.3.5 | C | L4 vs L7 LB · reverse proxy vs API gateway vs service mesh (preview) · CDN vs app-level cache |
| 1.3.6 | M | **Design exercise: basic web service**, evolved 1 → 1k → 100k → 10M users (README §7) |
| 1.3.7 | P | Drill: instance hangs but passes shallow health check · CDN origin down · LB itself fails · sticky sessions pin traffic to a dying node |
| 1.3.8 | F | **Design exercise: global static-content delivery** (README §7) |
| 1.3.9 | R | Review |

## Cycle 1.4 — ★ API design & encoding

| ID | Type | Session |
|---|---|---|
| 1.4.1 | L | ★ **REST API design craft**: resource modelling, verbs, status codes, pagination (offset vs cursor/keyset), filtering & sorting, versioning, idempotency keys, error contracts, rate-limit headers, ★ bulk & long-running operations (202 + polling) |
| 1.4.2 | C | ★ **REST vs gRPC vs GraphQL**: contracts, performance, streaming, caching, client flexibility, when each fits |
| 1.4.3 | DD | ★ **Data encoding & schema evolution**: JSON vs Protobuf/Avro/Thrift, forward/backward compatibility, why schema evolution matters for rolling deploys (DDIA "Encoding and Evolution") |
| 1.4.4 | M | API-only mini: design the public API for a Todo/Notes product including pagination, idempotent create, errors |
| 1.4.5 | R | Review |

## Cycle 1.5 — ★ Real-time communication + first classic design

| ID | Type | Session |
|---|---|---|
| 1.5.1 | L | ★ **Real-time patterns**: short polling, long polling, Server-Sent Events, WebSockets, webhooks; what each costs the server |
| 1.5.2 | DD | ★ **Holding millions of connections**: C10K→C10M, event loops, memory per connection, sticky routing for WebSockets, reconnect storms, heartbeats |
| 1.5.3 | C | Polling vs long-poll vs SSE vs WebSocket vs webhooks for 6 scenarios |
| 1.5.4 | M | Narrative drill: "what happens when you type a URL and press enter", end to end in 3 min, then interviewer follow-ups |
| 1.5.5 | P | Drill: WebSocket gateway node restarts, 200k clients reconnect at once |
| 1.5.6 | F | **#1 URL Shortener, v1**: single region, one DB. Focus: API, 301 vs 302 redirects, key generation basics, LB + CDN. Compare explicitly with the baseline. (v2 at 2.11.6 adds sharding + caching) |
| 1.5.7 | AR | ★ **Architecture review role-play**: a "senior architect" proposes WebSockets everywhere + a single global LB for a news site; interrogate it |
| 1.5.8 | R | Review + concept map of Phase 1 → **Gate** |

## Gate 1

- [ ] Narrates URL → response (DNS, TCP, TLS, LB, app, CDN) in 3 min and survives 5 follow-ups.
- [ ] Explains TCP handshake, flow vs congestion control, and TCP vs UDP choices with examples.
- [ ] Explains HTTP/1.1 → 2 → 3 and head-of-line blocking at each layer.
- [ ] Explains the TLS handshake, the role of certificates/CAs, and where to terminate TLS.
- [ ] Chooses L4 vs L7, LB algorithm, and health-check design for 3 scenarios with reasons.
- [ ] Designs CDN caching (keys, TTL, invalidation) for static + semi-dynamic content.
- [ ] Designs a clean REST API (pagination, idempotency, errors, versioning) and picks REST/gRPC/GraphQL justifiably.
- [ ] Picks the right real-time mechanism for 5 scenarios and explains the server-side cost.
- [ ] Places authentication (sessions or tokens) correctly in a design and explains cookie flags/CSRF/CORS basics.
- [ ] URL Shortener v1 ≥ 70/120.
