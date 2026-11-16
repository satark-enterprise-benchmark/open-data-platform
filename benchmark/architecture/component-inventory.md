# Component Inventory — open-data-platform

Inventoried from repository tree at baseline `30591c18`.

## Top-level directories

| Path | Role |
|---|---|
| `config/versions.yaml` | Central version pins for images/artifacts |
| `docs/` | Architecture, ADRs, ops, security, governance |
| `specs/data-contracts/` | JSON Schema + example contracts |
| `specs/data-products/` | Data product schema + examples |
| `platform/processing/spark/` | Spark runtime Dockerfile + README |
| `platform/orchestration/airflow/` | Airflow Dockerfile, DAG `batch_orders_snapshot.py` |
| `platform/governance/data-quality/python/` | `odp_data_quality` Python package |
| `infrastructure/` | OpenTofu bootstrap, AWS modules, Kind config |
| `deployment/kubernetes/` | Base namespaces + standalone manifests |
| `examples/golden-paths/` | `batch-orders`, `cdc-orders` apps + tests + K8s jobs |
| `scripts/` | doctor, validate, local-up/down, smoke & golden-path tests |
| `.github/workflows/` | ci, security, iac, standalone |

## Docker images built in-repo

| Dockerfile | Purpose |
|---|---|
| `platform/processing/spark/Dockerfile` | `odp/spark-iceberg` runtime |
| `platform/orchestration/airflow/Dockerfile` | `odp/airflow-orchestrator` |
| `examples/golden-paths/batch-orders/Dockerfile` | `odp/batch-orders` |
| `examples/golden-paths/cdc-orders/Dockerfile` | `odp/cdc-orders` |

Build entry: `scripts/build-local-images.sh` / `make build-local-images`.

## Not present as components

- No `docker-compose` stack
- No dbt project (`dbt_project.yml` absent)
- No Flink deployment
- No application Web UI beyond Grafana in observability stack
