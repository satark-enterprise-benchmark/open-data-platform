# Dependency Map — open-data-platform

## Runtime dependency graph (standalone)

```text
Docker daemon
  └─ Kind cluster odp-local
       ├─ odp-system: Polaris (needs PostgreSQL polaris DB), Airflow
       ├─ odp-data: Garage, Kafka, Debezium (→ Kafka + PostgreSQL),
       │            PostgreSQL, Spark client (→ Iceberg/Polaris/Garage/Kafka),
       │            Trino (→ Polaris/Garage)
       └─ odp-observability: OTel, Prometheus, Grafana
```

## Golden-path dependencies

| Path | Depends on |
|---|---|
| batch-orders | PostgreSQL JDBC source, Spark Iceberg runtime, Polaris, Garage, Trino |
| cdc-orders | PostgreSQL logical replication, Debezium Connect, Kafka, Spark streaming, Polaris, Garage |
| airflow-batch-test | Airflow deployment + batch-orders job path |

## Developer tool dependencies (`scripts/doctor.sh`)

Required commands: `docker`, `kind`, `kubectl`, `openssl`, `python3`, plus Python package `PyYAML`.

## Soft / future dependencies

- dbt (documented alternative / roadmap — not a hard runtime dep today)
- Cloud IAM / secret managers for production profiles
- Argo CD for GitOps (deployment/gitops README present; not required for Kind standalone)
