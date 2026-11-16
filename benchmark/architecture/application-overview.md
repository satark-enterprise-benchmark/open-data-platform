# Application Overview — open-data-platform

## Purpose

Vendor-neutral **Open Data Platform reference architecture** that models capabilities (ingestion, messaging, lakehouse storage, processing, orchestration, serving, governance, observability) and ships a **standalone Kind-based** executable profile plus AWS OpenTofu foundations and two golden-path demo pipelines.

## Product shape

| Aspect | Finding (from source) |
|---|---|
| Application type | Reference platform + demo pipelines (not a SaaS app) |
| Primary users | Platform engineers / data engineers validating lakehouse contracts |
| Dual mode | Standalone (Kind) for learning/integration; production via IaC/K8s |
| Status | Pre-v1.0; V0.2 standalone marked complete; V0.3 golden paths partially complete |

## Executable workloads present

1. **Standalone platform** — Kind cluster `odp-local` with namespaces `odp-system`, `odp-data`, `odp-observability` (`scripts/local-up.sh`).
2. **Batch golden path** — `examples/golden-paths/batch-orders` (PostgreSQL → Spark medallion → Iceberg/Polaris → Trino).
3. **CDC golden path** — `examples/golden-paths/cdc-orders` (PostgreSQL → Debezium → Kafka → Spark Structured Streaming → Iceberg).
4. **Airflow DAG** — `platform/orchestration/airflow/dags/batch_orders_snapshot.py` wraps the batch path.
5. **Shared DQ library** — `platform/governance/data-quality/python/odp_data_quality/`.

## Non-goals of this fork package

- Does not replace upstream application source.
- Does not claim production deployment readiness without cloud credentials and ops hardening.
- Phase 1 docs only; runtime bring-up not executed in this pass.
