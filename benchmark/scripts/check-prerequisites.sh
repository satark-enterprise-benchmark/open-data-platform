#!/usr/bin/env bash
# Benchmark-only prerequisite check (read-only). Does not modify system state.
set -euo pipefail

required=(docker kind kubectl openssl python3 make)
missing=0

echo "=== open-data-platform benchmark prerequisite check ==="
for cmd in "${required[@]}"; do
  if command -v "$cmd" >/dev/null 2>&1; then
    printf "OK   %s\n" "$cmd"
  else
    printf "MISS %s\n" "$cmd"
    missing=1
  fi
done

if python3 -c 'import yaml' >/dev/null 2>&1; then
  echo "OK   PyYAML"
else
  echo "MISS PyYAML"
  missing=1
fi

if command -v docker >/dev/null 2>&1; then
  if docker info >/dev/null 2>&1; then
    echo "OK   Docker daemon"
  else
    echo "WARN Docker installed but daemon not reachable"
    missing=1
  fi
fi

if [[ -f config/versions.yaml ]]; then
  echo "OK   config/versions.yaml present"
else
  echo "MISS config/versions.yaml (run from repo root)"
  missing=1
fi

if [[ -f deployment/kubernetes/standalone/kustomization.yaml ]]; then
  echo "OK   standalone kustomization present"
else
  echo "MISS standalone kustomization"
  missing=1
fi

if [[ -f docker-compose.yml ]] || [[ -f docker-compose.yaml ]] || [[ -f compose.yaml ]]; then
  echo "INFO docker-compose file found"
else
  echo "INFO no docker-compose (expected — Kind/Kubernetes runtime)"
fi

exit "$missing"
