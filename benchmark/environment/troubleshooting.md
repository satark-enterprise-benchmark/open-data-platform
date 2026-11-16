# Troubleshooting — open-data-platform

| Symptom | Likely cause | Action |
|---|---|---|
| `make doctor` fails | Missing docker/kind/kubectl/openssl/python/PyYAML | Install tools; ensure Docker daemon running |
| Kind create fails | Insufficient CPU/RAM/disk | Raise Docker resources (README: 8 CPU / 12 GiB / 20 GiB) |
| Image pull / build errors | Network or Docker disk | Retry `make build-local-images`; prune images |
| Rollout timeouts in local-up | Resource pressure or prior partial install | `make local-down` then `make local-up` |
| Smoke test step fails | Dependent service not ready | `make local-status`; check pods in odp-* namespaces |
| Looking for docker-compose | Not provided | Use Kind path; see known-limitations |
| Expecting dbt | Not implemented | Use Spark/contracts path; see roadmap |

Benchmark helpers: `./benchmark/scripts/check-prerequisites.sh` and `validate-environment.sh`.
