# Repository Assessment — open-data-platform

## Summary

Suitable Phase 1 **data-platform / pipeline** benchmark candidate. Rich architecture docs, version-pinned Kind standalone stack, and two executable golden paths. Not a classic CRUD business app.

## Strengths

- Clear ADRs and capability model
- Central `config/versions.yaml`
- Kafka, Debezium, Spark, Iceberg, Polaris, Trino, Airflow, PostgreSQL, Garage evidenced as manifests + scripts
- Batch and CDC Python pipelines with tests
- Apache-2.0 license file present (GitHub may show NOASSERTION; root `LICENSE` is Apache 2.0)

## Gaps

- No docker-compose; heavy local resource needs for Kind
- dbt claimed but unimplemented
- Startup not verified in this documentation pass
- Pre-v1.0 production story incomplete by upstream admission

## License note

Inspected `LICENSE`: Apache License 2.0, Copyright 2026 Mehdi TAZI.
