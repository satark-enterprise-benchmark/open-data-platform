# Configuration — open-data-platform

## Central version pin

`config/versions.yaml` — component versions and image tags for standalone/production policy.

## Local secrets

`scripts/local-secrets.sh` generates standalone credentials under `.local/credentials.env` (gitignored). Exports include Garage keys, Polaris client secret, PostgreSQL user/password.

## Kubernetes configuration

- Cluster: `infrastructure/environments/local/kind-config.yaml`
- Namespaces: `deployment/kubernetes/base/namespaces.yaml`
- Standalone services: `deployment/kubernetes/standalone/*.yaml`
- Network policies: default-deny base + standalone allow rules

## Pipeline configuration

Golden-path Python packages use config modules:

- `examples/golden-paths/batch-orders/src/orders_pipeline/config.py`
- `examples/golden-paths/cdc-orders/src/cdc_orders_pipeline/config.py`

## Cloud

`infrastructure/cloud/aws/dev/` OpenTofu variables + `backend.hcl.example` for remote state.
