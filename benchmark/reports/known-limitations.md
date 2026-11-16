# Known Limitations — open-data-platform

1. **No docker-compose** — local path is Kind/Kubernetes only.
2. **Heavy standalone footprint** — Kafka + Spark + Trino + Airflow + Polaris etc. on one Kind cluster.
3. **dbt not in repo** — README lists dbt; roadmap still open; no `dbt_project.yml`.
4. **Flink optional only** — not shipped.
5. **Startup unverified** — Phase 1 docs did not run platform.
6. **Demo schema only** — `source.orders` is sample e-commerce-like data, not HR PII domain.
7. **Secrets ephemeral** — `.local/credentials.env` standalone-only.
8. **Pre-v1.0** — APIs/layouts may evolve upstream.
