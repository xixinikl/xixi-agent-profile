#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  profile-doctor.sh [--project PATH]

Validates the personal profile repository. With --project, also validates a
project's memory contract. The command is read-only.
USAGE
}

PROJECT=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --project) PROJECT="${2:-}"; shift 2 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown argument: $1" >&2; usage >&2; exit 2 ;;
  esac
done

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FAILED=0

check_file() {
  local path="$1"
  if [[ -f "$path" ]]; then
    echo "PASS file  ${path#$ROOT/}"
  else
    echo "FAIL file  ${path#$ROOT/}" >&2
    FAILED=1
  fi
}

check_dir() {
  local path="$1"
  if [[ -d "$path" ]]; then
    echo "PASS dir   ${path#$ROOT/}"
  else
    echo "FAIL dir   ${path#$ROOT/}" >&2
    FAILED=1
  fi
}

echo "Profile doctor: $ROOT"
for file in \
  START_HERE.md AGENTS.md OPERATING_SYSTEM.md MEMORY_UPDATE_PROTOCOL.md \
  GROWTH_LOOP.md LEARNINGS.md PROJECTS.md PORTABILITY.md; do
  check_file "$ROOT/$file"
done
for directory in templates/project-memory scripts; do
  check_dir "$ROOT/$directory"
done
for script in onboard-project.sh ingest-acceptance-report.sh profile-doctor.sh; do
  if [[ -x "$ROOT/scripts/$script" ]]; then
    echo "PASS exec  scripts/$script"
  else
    echo "FAIL exec  scripts/$script is not executable" >&2
    FAILED=1
  fi
done

if [[ -n "$PROJECT" ]]; then
  [[ -d "$PROJECT" ]] || { echo "Project directory does not exist: $PROJECT" >&2; exit 2; }
  PROJECT_ROOT="$(cd "$PROJECT" && pwd)"
  echo "Project doctor: $PROJECT_ROOT"
  for file in AGENTS.md CURRENT_STATUS.md TASKS.md 错误复盘.md doc/ENVIRONMENT.md .agent-profile.json; do
    if [[ -f "$PROJECT_ROOT/$file" ]]; then
      echo "PASS file  $file"
    else
      echo "FAIL file  $file" >&2
      FAILED=1
    fi
  done
  if [[ -d "$PROJECT_ROOT/doc/retrospectives" ]]; then
    echo "PASS dir   doc/retrospectives"
  else
    echo "FAIL dir   doc/retrospectives" >&2
    FAILED=1
  fi
  if [[ -f "$PROJECT_ROOT/.agent-profile.json" ]]; then
    if python3 - "$PROJECT_ROOT/.agent-profile.json" <<'PY'
import json
import sys

with open(sys.argv[1], encoding="utf-8") as handle:
    data = json.load(handle)
missing = [key for key in ("schemaVersion", "projectName", "repository", "doctorCommand", "retrospectiveDirectory") if not data.get(key)]
if missing:
    print("Missing required metadata: " + ", ".join(missing), file=sys.stderr)
    raise SystemExit(1)
PY
    then
      echo "PASS json  .agent-profile.json"
    else
      echo "FAIL json  .agent-profile.json" >&2
      FAILED=1
    fi
  fi
fi

if [[ "$FAILED" -eq 0 ]]; then
  echo "VERDICT: pass"
else
  echo "VERDICT: fail" >&2
fi
exit "$FAILED"
