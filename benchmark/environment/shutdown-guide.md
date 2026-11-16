# Shutdown Guide — open-data-platform

## Tear down standalone

```bash
make local-down
```

This runs `scripts/local-down.sh`, which deletes the Kind platform and local credentials (per Makefile help text).

## Partial stop

Upstream does not document a partial service stop; prefer full `local-down` for clean state. Manual `kubectl delete` / `kind delete cluster --name odp-local` are possible but outside the supported script path.
