# Application Data Flow — open-data-platform

## Batch snapshot golden path

Documented and coded in `examples/golden-paths/batch-orders`:

```text
PostgreSQL source.orders
  → Spark JDBC read
  → Bronze (append / audit)
  → Silver (+ quarantine on DQ fail)
  → Gold
  → Iceberg via Polaris on Garage
  → Trino query validation
```

Supports contract-driven quality, OpenLineage run events (as implemented in pipeline observability modules), reconciliation and replay checks (`make batch-golden-path-test`).

## CDC golden path

`examples/golden-paths/cdc-orders`:

```text
PostgreSQL (logical replication)
  → Debezium PostgresConnector
  → Kafka topics
  → Spark Structured Streaming
  → Bronze → Silver MERGE/DELETE → Gold
  → Iceberg/Polaris → Trino
```

Includes update/insert/delete handling and replay after checkpoint loss (per example README + ADR 013).

## Orchestrated batch

Airflow DAG `batch_orders_snapshot.py` triggers the batch golden path through the Airflow standalone deployment (`make airflow-batch-test`).
