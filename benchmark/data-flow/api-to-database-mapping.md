# API-to-Database Mapping — open-data-platform

This repository does **not** expose a conventional business REST/ASMX API over domain entities. Interfaces are platform APIs:

| Interface | Maps to |
|---|---|
| Debezium Connect REST | Registers/updates connector `orders-postgres-cdc` reading PostgreSQL → Kafka |
| Polaris Iceberg REST | Catalog operations for Iceberg tables on object storage |
| Trino SQL | Federated/analytical reads over Iceberg catalogs |
| Airflow API (`/api/v2/version` in smoke-test) | Orchestration control plane health |
| Kubernetes API | Job/deployment lifecycle for Spark and platform services |
| S3 API (Garage) | Object storage for table data files |
| Kafka protocol | CDC and event transport |

## Demo relational mapping

| Logical entity | Physical |
|---|---|
| Orders (source) | `source.orders` in PostgreSQL |
| Orders (lakehouse) | Iceberg Bronze/Silver/Gold tables created by Spark jobs |

No employee/HR PII schema exists in this repository; PII benchmark value is in **pipeline / multi-store movement** patterns and contract metadata, not an HR domain model.
