#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  ingest-acceptance-report.sh --project PATH --report PATH [--date YYYY-MM-DD]

Creates a project-level retrospective candidate from an existing acceptance
report. It does not edit global preferences or LEARNINGS.md.
USAGE
}

PROJECT=""
REPORT=""
DATE="$(date +%F)"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project) PROJECT="${2:-}"; shift 2 ;;
    --report) REPORT="${2:-}"; shift 2 ;;
    --date) DATE="${2:-}"; shift 2 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown argument: $1" >&2; usage >&2; exit 2 ;;
  esac
done

[[ -n "$PROJECT" && -n "$REPORT" ]] || { echo "--project and --report are required." >&2; exit 2; }
[[ -d "$PROJECT" ]] || { echo "Project directory does not exist: $PROJECT" >&2; exit 2; }
[[ -f "$REPORT" ]] || { echo "Report does not exist: $REPORT" >&2; exit 2; }
[[ "$DATE" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]] || { echo "Invalid --date: $DATE" >&2; exit 2; }

PROJECT_ROOT="$(cd "$PROJECT" && pwd)"
REPORT_PATH="$(cd "$(dirname "$REPORT")" && pwd)/$(basename "$REPORT")"
OUT_DIR="$PROJECT_ROOT/doc/retrospectives"
OUT_FILE="$OUT_DIR/${DATE}-daily-acceptance.md"

mkdir -p "$OUT_DIR"
if [[ -e "$OUT_FILE" ]]; then
  echo "Refusing to overwrite existing candidate: $OUT_FILE" >&2
  exit 1
fi

VERDICT="$(rg -io -m 1 'verdict[[:space:]]*[:：][[:space:]]*(pass|conditional|fail)' "$REPORT_PATH" | sed -E 's/.*[:：][[:space:]]*//' || true)"
if [[ -z "$VERDICT" ]]; then
  VERDICT="未从报告中解析，待人工确认"
fi

SUMMARY="$(sed -n '1,120p' "$REPORT_PATH")"
cat > "$OUT_FILE" <<EOF
# $DATE 验收复盘候选

- 来源报告：\`$REPORT_PATH\`
- 验收结论：$VERDICT
- 升级状态：待周检

## 已证实事实

以下是来源报告前 120 行的事实快照；周检时应回到原始报告核对，不要据此补充猜测。

\`\`\`text
$SUMMARY
\`\`\`

## 影响

- 待周检根据缺陷、未覆盖项和自动修复记录补全。

## 预防动作

- 待周检：将可执行的预防动作写成检查、测试、规则或项目任务。

## 是否升级为全局经验

- 判断：待周检
- 原因：候选必须先确认是否重复、跨项目有效且有可验证规则。
EOF

echo "Created retrospective candidate: $OUT_FILE"
