# Architecture Overview — open-data-platform

## Logical planes (from README + docs/architecture)

```text
Data sources (DB / SaaS / APIs / files / events)
        │
   Batch │ CDC │ Streaming
        ▼
Ingestion & messaging (object storage + Kafka)
        ▼
Lakehouse (Iceberg + Polaris REST catalog)
        │
   Spark │ Trino │ (Flink optional — not shipped)
        ▼
Data products / serving
```

Cross-cutting: security/identity, governance/quality, observability, CI/CD & GitOps, FinOps.

## Standalone physical topology (verified manifests)

| Namespace | Components (kustomization resources) |
|---|---|
| `odp-system` | Apache Polaris (+ bootstrap jobs), Apache Airflow |
| `odp-data` | Garage, Kafka, Debezium Connect, PostgreSQL, Spark client, Trino |
| `odp-observability` | OpenTelemetry Collector, Prometheus, Grafana |

Source of truth: `deployment/kubernetes/standalone/kustomization.yaml`.

## Runtime contracts

Environments share interfaces rather than identical hardware:

- Kubernetes API
- S3 API (Garage locally; cloud object storage in production)
- Iceberg REST (Polaris)
- Kafka API
- Spark jobs / Trino / Airflow

Documented in `docs/architecture/runtime-interfaces.md`.

## Pattern

**Medallion lakehouse** (Bronze / Silver / Gold) with contract-driven data quality (`docs/adr/010`, `012`) and CDC replay semantics (`docs/adr/013`).
