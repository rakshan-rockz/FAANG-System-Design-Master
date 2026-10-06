# Phase 8 — Production Architecture

README §18, full depth. Observability, SLOs, security (split into identity and data/threat/compliance),
deployment & testing, containers & Kubernetes, ★ cloud infrastructure & platform engineering, and
media platforms.

## Cycle 8.1 — Observability

| ID | Type | Session |
|---|---|---|
| 8.1.1 | L | 18.1 **Logs**: structured logs, log levels, correlation IDs, ★ sampling, ★ log pipelines & retention cost |
| 8.1.2 | L | **Metrics**: counters, gauges, histograms, rates; ★ RED & USE methods, golden signals, ★ cardinality |
| 8.1.3 | L | **Traces**: distributed tracing, spans, trace propagation, ★ sampling strategies (head vs tail), ★ OpenTelemetry as the common standard |
| 8.1.4 | DD | ★ **Alerting & incident response**: symptom- vs cause-based alerts, alert fatigue, runbooks, on-call, incident command, blameless postmortems |
| 8.1.5 | F | ★ **Distributed Logging System** |
| 8.1.6 | R | Review |

## Cycle 8.2 — SLI / SLO / SLA

| ID | Type | Session |
|---|---|---|
| 8.2.1 | L | 18.2 **SLI, SLO, SLA**: what each means, how they relate, choosing good SLIs |
| 8.2.2 | DD | **Error budgets**: policies, burn-rate alerts, using budgets to trade velocity vs reliability |
| 8.2.3 | M | Define SLIs/SLOs/alerts for your Payment System and Chat System designs |
| 8.2.4 | R | Review |

## Cycle 8.3 — Security I: identity & access

| ID | Type | Session |
|---|---|---|
| 8.3.1 | L | 18.3 **Authentication**: password storage (hashing, salting), sessions vs tokens, MFA, passkeys/WebAuthn, ★ SSO (SAML/OIDC); **API keys** |
| 8.3.2 | DD | **OAuth 2.0** (flows: auth code + PKCE, client credentials, device), ★ OIDC, **JWT** (structure, signing, ★ pitfalls: revocation, expiry, size, algorithm confusion), token refresh & rotation |
| 8.3.3 | L | **Authorization**: RBAC, ABAC, ★ ReBAC (Zanzibar-style), ★ policy engines (OPA-style), ★ where to enforce (gateway vs service vs data layer) |
| 8.3.4 | L | ★ **Service-to-service identity**: mTLS, workload identity (SPIFFE-style), ★ zero-trust networking |
| 8.3.5 | F | ★ **Online Judge / Code Execution (LeetCode-style)**: sandboxing, isolation, resource limits, queueing |
| 8.3.6 | R | Review |

## Cycle 8.4 — Security II: data protection, threats, compliance

| ID | Type | Session |
|---|---|---|
| 8.4.1 | L | **Secrets** management, **encryption in transit**, **encryption at rest**, **key management** (★ envelope encryption, rotation, KMS/HSM), ★ tokenisation |
| 8.4.2 | L | **WAF**, **DDoS protection** (★ L3/L4 vs L7 attacks, scrubbing, rate limiting), ★ abuse & bot defence, ★ OWASP Top 10 at the architecture level |
| 8.4.3 | DD | ★ **Threat modelling**: STRIDE on a data-flow diagram, trust boundaries, attack surface; ★ supply-chain security (dependencies, SBOM, signed artefacts) |
| 8.4.4 | L | ★ **Privacy & compliance for architects**: GDPR (lawful basis, right to erasure *across* caches, backups, logs and analytics), data residency, PCI-DSS scope reduction, HIPAA/SOC 2 awareness, audit logging |
| 8.4.5 | C | ★ **Multi-tenancy**: isolation models (silo/pool/bridge), noisy neighbours, per-tenant keys, tenant-aware observability |
| 8.4.6 | M | Threat-model and compliance-review your Payment System design; list the changes |
| 8.4.7 | P | Drill: leaked API key on GitHub · KMS key accidentally disabled · user requests deletion of all their data · credential-stuffing attack |
| 8.4.8 | R | Review |

## Cycle 8.5 — Deployment & testing

| ID | Type | Session |
|---|---|---|
| 8.5.1 | L | 18.4 **CI/CD**, **rolling**, **blue-green**, **canary** deployment, **feature flags**, **rollback**; ★ progressive delivery & automated canary analysis |
| 8.5.2 | DD | ★ **Database schema migrations** without downtime (expand/contract), ★ backward-compatible APIs & events during rollout |
| 8.5.3 | L | ★ **Testing distributed systems**: test pyramid at system level, contract tests, integration environments vs ephemeral environments, load/soak tests, testing in production (shadow traffic, dark launches) |
| 8.5.4 | P | Game day: bad deploy · config push breaks all regions · rollback impossible after migration · cert expiry |
| 8.5.5 | R | Review |

## Cycle 8.6 — Containers & Kubernetes

| ID | Type | Session |
|---|---|---|
| 8.6.1 | L | 18.5 **Containers**: containers vs VMs (★ namespaces, cgroups), images (layers, registries), container networking, storage (volumes) |
| 8.6.2 | L | 18.6 **Kubernetes I**: pods, services, ingress, config, secrets; ★ deployments & statefulsets |
| 8.6.3 | L | **Kubernetes II**: health checks (★ liveness vs readiness vs startup probes), autoscaling (★ HPA/cluster autoscaler), service discovery; ★ service mesh (sidecars, mTLS, retries) |
| 8.6.4 | P | Drill: liveness probe kills healthy pods under load · pod evictions during a traffic spike · DNS inside the cluster fails |
| 8.6.5 | R | Review |

## Cycle 8.7 — ★ Cloud infrastructure & platform engineering

| ID | Type | Session |
|---|---|---|
| 8.7.1 | L | ★ **Cloud building blocks**: regions/AZs, VPCs, subnets (public/private), route tables, security groups vs NACLs, NAT gateways, VPC peering vs transit gateways vs private link, hybrid connectivity (VPN/direct connect) |
| 8.7.2 | C | ★ **The managed-services map**: compute (VMs, containers, serverless), storage, databases, queues/streams, caches across AWS/GCP/Azure; managed vs self-hosted trade-offs; lock-in |
| 8.7.3 | DD | ★ **Serverless architecture**: FaaS execution model, cold starts, concurrency limits, event sources, when serverless is cheaper/costlier |
| 8.7.4 | L | ★ **Infrastructure as code & GitOps**: declarative infra (Terraform-style), state & drift, environments, policy-as-code; ★ platform engineering & internal developer platforms |
| 8.7.5 | L | ★ **FinOps & cost architecture**: pricing models (on-demand/reserved/spot), egress as the hidden cost, storage tiering, right-sizing, unit economics (cost per request/user), cost as a design dimension |
| 8.7.6 | M | Map one of your designs onto a concrete cloud (network layout + managed services) and estimate its monthly bill |
| 8.7.7 | R | Review |

## Cycle 8.8 — Media & large-scale platforms

| ID | Type | Session |
|---|---|---|
| 8.8.1 | L | ★ **Video pipeline**: upload, transcoding (DAG of tasks), adaptive bitrate (HLS/DASH), CDN strategy, DRM awareness, ★ egress cost |
| 8.8.2 | F | **#10 YouTube** |
| 8.8.3 | F | **#15 Netflix** (catalogue, playback, CDN appliances conceptually, personalisation hooks) |
| 8.8.4 | F | **#27 Video Streaming Platform** (live vs VOD, latency trade-offs) |
| 8.8.5 | F | ★ **Email Service (Gmail-style)** (SMTP ingest, storage, search, spam) |
| 8.8.6 | F | **#28 Global Notification Platform** (learning pass; its staff-level variant returns in Phase 10) |
| 8.8.7 | AR | ★ **Architecture review role-play**: a "senior architect" proposes going multi-cloud active-active "to avoid lock-in" for a 20-person company; interrogate it |
| 8.8.8 | R | Review + concept map of Phase 8 → **Gate** |

## Gate 8

- [ ] Instruments a design with logs/metrics/traces and defines symptom-based alerts; explains incident response.
- [ ] Defines SLIs/SLOs and error-budget policy for 2 designs.
- [ ] Places authn/authz (OAuth/OIDC/JWT, RBAC/ABAC/ReBAC) and service identity in a design and explains pitfalls.
- [ ] Threat-models a design with STRIDE; places encryption, KMS, WAF/DDoS; explains GDPR erasure across a distributed system.
- [ ] Chooses a deployment strategy, designs zero-downtime schema migration, and outlines a test strategy.
- [ ] Explains containers and K8s objects/probes/autoscaling as they affect architecture.
- [ ] Lays out a VPC network and managed-services mapping for a design, with a cost estimate.
- [ ] Phase 8 designs ≥ 85/120.
