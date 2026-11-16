# Schema Overview — open-data-platform

## Source OLTP (PostgreSQL)

Defined in `deployment/kubernetes/standalone/postgres.yaml`:

```sql
CREATE SCHEMA IF NOT EXISTS source;
CREATE TABLE IF NOT EXISTS source.orders (
  order_id BIGINT PRIMARY KEY,
  customer_id VARCHAR(32) NOT NULL,
  order_ts TIMESTAMP NOT NULL,
  status VARCHAR(16) NOT NULL,
  amount NUMERIC(18,2) NOT NULL CHECK (amount >= 0),
  country CHAR(2) NOT NULL
);
```

This is the **only** relational application table fully specified as static SQL in the standalone manifests. It is demo/sample data for golden paths, not an enterprise HR/CRM schema.

## Lakehouse layers (logical)

Documented and implemented in Spark Python code (`examples/golden-paths/batch-orders/src/orders_pipeline/layers/` and CDC transforms):

| Layer | Intent |
|---|---|
| Bronze | Append-only / raw ingest |
| Silver | Cleaned / MERGE-DELETE for CDC |
| Gold | Aggregated / product-facing |

Exact Iceberg table names are created at job runtime against Polaris; treat pipeline code + contracts as source of truth rather than a checked-in DDL dump.

## Data contracts / products

Machine-readable examples:

- `specs/data-contracts/examples/orders.yaml`, `batch-orders.yaml`
- `specs/data-products/examples/customer-360.yaml`, `daily-order-summary.yaml`

These describe expectations and ownership metadata; they are not RDBMS DDL.
