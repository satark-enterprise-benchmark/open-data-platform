# Installation — open-data-platform

## Clone / baseline

Fork already acquired at SHA `30591c18e1694ff4e14c6adf161c6df228757412`.

## Install developer tools

Follow upstream expectations:

1. Install Docker Desktop (or equivalent) and ensure the daemon is reachable.
2. Install Kind, kubectl, openssl, Python 3, PyYAML, make.
3. From repo root: `make doctor` (runs `./scripts/doctor.sh`).
4. `make validate` for static repository validations.

## Platform install (standalone) — documented, not executed here

```bash
make local-up          # Kind create + secrets + build images + kubectl apply -k standalone
make smoke-test        # Health / interoperability checks
make local-status      # Resource summary
```

## Note on Docker Compose

**No docker-compose file exists.** Do not expect `docker compose up`. Runtime is Kind/Kubernetes. Benchmark docs intentionally do **not** add a full compose replacement (impractical to faithfully recreate Kafka+Spark+Trino+Polaris+Airflow parity outside the existing Kind path).
