#!/usr/bin/env bash
# Structural environment validation for benchmark readiness. Does not start Kind.
set -euo pipefail

root="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$root"
fail=0

echo "=== validate-environment (structural) ==="

check_file() {
  if [[ -f "$1" ]]; then
    echo "OK   $1"
  else
    echo "FAIL missing $1"
    fail=1
  fi
}

check_file LICENSE
check_file Makefile
check_file config/versions.yaml
check_file scripts/doctor.sh
check_file scripts/local-up.sh
check_file scripts/local-down.sh
check_file deployment/kubernetes/standalone/kustomization.yaml
check_file deployment/kubernetes/standalone/postgres.yaml
check_file deployment/kubernetes/standalone/kafka.yaml
check_file deployment/kubernetes/standalone/debezium.yaml
check_file deployment/kubernetes/standalone/spark.yaml
check_file deployment/kubernetes/standalone/trino.yaml
check_file deployment/kubernetes/standalone/airflow.yaml
check_file deployment/kubernetes/standalone/polaris.yaml
check_file examples/golden-paths/batch-orders/README.md
check_file examples/golden-paths/cdc-orders/README.md

# Claimed-but-missing items should be reported, not fatal if expected
if find . -name 'dbt_project.yml' ! -path './.git/*' | grep -q .; then
  echo "OK   dbt project present"
else
  echo "INFO dbt_project.yml absent (matches Phase 1 assessment)"
fi

if command -v kind >/dev/null 2>&1 && kind get clusters 2>/dev/null | grep -qx odp-local; then
  echo "INFO Kind cluster odp-local exists (runtime not validated by this script)"
else
  echo "INFO Kind cluster odp-local not detected (startup not required for Phase 1 docs)"
fi

exit "$fail"
