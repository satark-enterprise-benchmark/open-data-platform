# Database Dependencies — open-data-platform

| Consumer | Depends on | How |
|---|---|---|
| Polaris | PostgreSQL database `polaris` | JDBC/metastore (deployment wiring in polaris.yaml) |
| Batch Spark job | PostgreSQL `source.orders` via JDBC; Garage; Polaris | `orders_pipeline` config + Spark session |
| CDC path | PostgreSQL logical replication + Debezium + Kafka | `register-cdc-connector.py`, cdc-orders Spark streaming |
| Trino | Polaris / Iceberg / Garage | Trino catalog config in trino.yaml |
| Airflow DAG | Kubernetes API to submit/monitor batch path; Airflow metadata in its own deployment | `batch_orders_snapshot.py` |
| Smoke tests | All of the above | `scripts/smoke-test.sh`, lakehouse/batch/cdc test scripts |

## External/cloud

OpenTofu AWS modules (`infrastructure/modules/aws/*`) provision network, EKS, KMS, object storage, workload identity for production-shaped deployments. These require AWS credentials and are **not** required for Kind standalone docs review.
