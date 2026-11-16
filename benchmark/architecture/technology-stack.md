# Technology Stack — open-data-platform

Versions from `config/versions.yaml` unless noted.

| Layer | Technology | In-repo evidence | Status |
|---|---|---|---|
| Local K8s | Kind 0.31.0 + Kubernetes 1.36.1 | kind-config, doctor.sh | Standalone manifests present |
| Object storage | Garage 2.3.0 | garage.yaml | Standalone |
| Streaming | Apache Kafka 4.3.1 (KRaft) | kafka.yaml | Standalone |
| CDC | Debezium Connect 3.6.1.Final | debezium.yaml, register-cdc-connector.py | Standalone |
| RDBMS | PostgreSQL 18.6 | postgres.yaml (source.orders + polaris DB) | Standalone |
| Table format | Apache Iceberg 1.11.0 | versions.yaml, Spark runtime, lakehouse tests | Via Spark/Polaris |
| Catalog | Apache Polaris 1.7.0 | polaris.yaml, polaris-setup.yaml | Standalone |
| Compute | Apache Spark 4.1.3 | spark.yaml, golden paths | Standalone |
| Serving SQL | Trino 483 | trino.yaml | Standalone |
| Orchestration | Apache Airflow 3.3.1 | airflow.yaml + DAG | Standalone |
| Observability | OTel 0.159.0, Prometheus 3.13.2, Grafana 13.1.3 | observability.yaml | Standalone |
| IaC | OpenTofu (HCL) | infrastructure/ | AWS modules present |
| CI | GitHub Actions | .github/workflows | Present |
| Analytics transform | dbt | README claim only | **Not implemented** |
| Stream engine alt | Flink | Architecture diagram only | **Not shipped** |

## Languages / packaging

- Python 3 (pipelines, DQ, CDC registration, Airflow DAG)
- Bash (`scripts/`, Makefile)
- YAML (K8s, contracts, versions)
- HCL (OpenTofu)
