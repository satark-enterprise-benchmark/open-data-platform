# Prerequisites — open-data-platform

From `scripts/doctor.sh` and README standalone guidance.

## Required tools

| Tool | Purpose |
|---|---|
| Docker | Container runtime for Kind nodes and image builds |
| Kind | Local Kubernetes cluster `odp-local` |
| kubectl | Apply manifests / rollout status |
| openssl | Secret generation (`local-secrets.sh`) |
| python3 + PyYAML | Validation and helper scripts |
| make | Convenience targets wrapping scripts |

## Recommended resources (README)

- **8 CPUs**, **12 GiB RAM**, **20 GiB** free disk for Docker

## Optional / production

- OpenTofu + AWS credentials for `infrastructure/cloud/aws/dev`
- GitHub Actions runners already defined for CI (remote)

## Benchmark scripts

This package adds `benchmark/scripts/*` for **host-side checks only**. They do not start the platform.
