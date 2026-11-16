#!/usr/bin/env bash
# Print host environment info for benchmark evidence capture. Read-only.
set -euo pipefail

echo "=== environment-info ==="
echo "date_utc: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
echo "cwd: $(pwd)"
echo "uname: $(uname -a)"
for cmd in docker kind kubectl python3 make openssl; do
  if command -v "$cmd" >/dev/null 2>&1; then
    echo "$cmd: $(command -v "$cmd")"
    case "$cmd" in
      docker) docker version --format 'docker_server={{.Server.Version}}' 2>/dev/null || true ;;
      kind) kind version 2>/dev/null || true ;;
      kubectl) kubectl version --client --output=yaml 2>/dev/null | head -n 5 || true ;;
      python3) python3 --version 2>/dev/null || true ;;
      make) make --version 2>/dev/null | head -n 1 || true ;;
      openssl) openssl version 2>/dev/null || true ;;
    esac
  else
    echo "$cmd: not found"
  fi
done

if [[ -d .git ]]; then
  echo "git_head: $(git rev-parse HEAD 2>/dev/null || echo unknown)"
  echo "git_branch: $(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo unknown)"
fi
