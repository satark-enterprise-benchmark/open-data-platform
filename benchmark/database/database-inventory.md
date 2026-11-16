# Database Inventory — open-data-platform

## Stores verified in repository

| Store | Role | Definition location |
|---|---|---|
| PostgreSQL (`postgres` in `odp-data`) | Demo OLTP source (`source.orders`) + host for Polaris metadata DB creation | `deployment/kubernetes/standalone/postgres.yaml` ConfigMap `postgres-init` |
| Apache Iceberg tables | Lakehouse Bronze/Silver/Gold (created by Spark jobs at runtime) | Pipeline code under `examples/golden-paths/*/`; not static DDL files for Iceberg tables |
| Polaris metastore | Catalog persistence (PostgreSQL database `polaris`) | Created via init SQL `CREATE DATABASE polaris;` in postgres ConfigMap; Polaris deployment manifests |
| Garage buckets | S3-compatible object storage for Iceberg data files | `garage.yaml` + local secrets script |

## PostgreSQL objects explicitly defined in manifests

From `postgres.yaml` init scripts:

- Database: `polaris`
- Schema: `source`
- Table: `source.orders` columns: `order_id`, `customer_id`, `order_ts`, `status`, `amount`, `country`
- Seed: six sample order rows (ON CONFLICT upsert)

## Messaging-adjacent persistence

- Kafka topics created dynamically by Debezium / applications (no static topic inventory file beyond connector registration script).
- Debezium connector name in script: `orders-postgres-cdc` (`scripts/register-cdc-connector.py`).

## Not present

- No MySQL / SQL Server / Oracle
- No checked-in production warehouse dumps
- No dbt models / warehouse dimensional DDL
