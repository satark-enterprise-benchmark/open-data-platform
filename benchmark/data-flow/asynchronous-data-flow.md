# Asynchronous Data Flow — open-data-platform

## Event-driven / streaming paths present

1. **CDC via Kafka** — Debezium emits change events; Spark Structured Streaming consumes Kafka (`cdc-orders` example).
2. **Spark executors on Kubernetes** — dynamic executors launched by Spark-on-K8s (async relative to driver).
3. **Airflow scheduling** — DAG-driven asynchronous orchestration of batch jobs.
4. **Kubernetes Jobs** — golden-path `kubernetes/job.yaml` manifests for one-shot pipeline runs.
5. **OpenTelemetry export** — telemetry pipeline to collector (observability namespace).

## Not present

- No application-level message queue library inside a monolith (no RabbitMQ/SQS app code).
- No Celery/Temporal workers.
- Flink streaming path not implemented.

## Reliability notes (from docs, not re-tested here)

CDC example claims durable event identity, processing-commit table, quarantine, and replay after checkpoint loss. Treat as **documented behavior**; Phase 1 did not execute `cdc-golden-path-test`.
