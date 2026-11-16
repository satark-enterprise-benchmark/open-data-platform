# Phase 1 Benchmark Documentation — open-data-platform

Satark AI Enterprise PII Benchmark preparation package for the forked Open Data Platform reference architecture.

| Field | Value |
|---|---|
| Org fork | https://github.com/satark-enterprise-benchmark/open-data-platform |
| Upstream | https://github.com/MehdiTAZI/open-data-platform-reference-architecture |
| Baseline SHA | `30591c18e1694ff4e14c6adf161c6df228757412` (`main`) |
| Acquisition | `2026-11-16T21:10:24Z` |
| License | Apache License 2.0 (`LICENSE` in repo root) |

## What this repository actually is

Verified from source: this is an **architecture-first, executable reference** for a modern lakehouse data platform. It is **not** a single application binary. Standalone runtime is **Kind + Kubernetes manifests** under `deployment/kubernetes/standalone`, orchestrated by `Makefile` / `scripts/`. There is **no** `docker-compose.yml`.

## Verified stack (present in repo)

| Capability | Evidence |
|---|---|
| Kubernetes / Kind | `infrastructure/environments/local/kind-config.yaml`, `scripts/local-up.sh` |
| PostgreSQL | `deployment/kubernetes/standalone/postgres.yaml` (source.orders + polaris DB) |
| Kafka (KRaft) | `deployment/kubernetes/standalone/kafka.yaml` |
| Debezium / Connect | `deployment/kubernetes/standalone/debezium.yaml`, `scripts/register-cdc-connector.py` |
| Spark + Iceberg | `platform/processing/spark/`, `deployment/kubernetes/standalone/spark.yaml`, golden-path examples |
| Polaris catalog | `deployment/kubernetes/standalone/polaris.yaml` |
| Trino | `deployment/kubernetes/standalone/trino.yaml` |
| Airflow | `platform/orchestration/airflow/`, `deployment/kubernetes/standalone/airflow.yaml` |
| Garage (S3) | `deployment/kubernetes/standalone/garage.yaml` |
| Observability | Prometheus / Grafana / OTel in `observability.yaml` |
| OpenTofu (AWS) | `infrastructure/` modules and cloud compositions |

## Claimed but not implemented here

- **dbt** — listed in README reference stack; roadmap marks “dbt analytical transformations” as remaining V0.3 work. No dbt project files found.
- **Flink** — optional extension in architecture diagram; no manifests/code.
- Full production GitOps / OPA / multi-cloud — documented targets; pre-v1.0.

## Document map

- `architecture/` — overview, components, stack, dependencies
- `database/` — inventory, schema notes, DB dependencies
- `data-flow/` — batch/CDC flows and API-to-store mapping
- `environment/` — prereqs, install, config, start/stop, troubleshooting
- `diagrams/` — Mermaid sources
- `scripts/` — safe local prerequisite / environment helpers (benchmark-only)
- `reports/` — assessment, readiness, limitations

## Startup status

**Not verified in this Phase 1 pass.** Docs describe how to start from upstream scripts; no `make local-up` / smoke-test was executed here.
