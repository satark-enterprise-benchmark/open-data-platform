# Startup Guide — open-data-platform

> **Phase 1 status:** steps below are transcribed from upstream `Makefile` / scripts. **Startup was not executed** during documentation.

## Start standalone platform

```bash
cd <repo-root>
make doctor
make validate
make local-up
make smoke-test
```

Optional golden paths:

```bash
make batch-golden-path-test
make cdc-golden-path-test
make airflow-batch-test
```

## What `local-up` does (from `scripts/local-up.sh`)

1. Create Kind cluster `odp-local` if missing
2. Apply base namespaces
3. Ensure secrets (`local-secrets.sh`)
4. Mirror Polaris credentials into `odp-data`
5. Build/load local images
6. `kubectl apply -k deployment/kubernetes/standalone`
7. Wait for rollouts/jobs (postgres, garage, kafka, debezium, polaris, trino, spark, airflow, observability)

## Credentials

After up: inspect `.local/credentials.env` (never commit).
