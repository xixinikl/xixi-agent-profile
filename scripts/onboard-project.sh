#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  onboard-project.sh --target PATH --name NAME --repo URL [options]

Options:
  --doctor COMMAND          Project read-only health command (default: npm run doctor)
  --quality-dashboard URL   Published quality dashboard URL
  -h, --help                Show this help

The command never changes application source code. It creates the project
memory skeleton and .agent-profile.json needed by the profile doctor.
USAGE
}

TARGET=""
NAME=""
REPOSITORY=""
DOCTOR="npm run doctor"
QUALITY_DASHBOARD_URL=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target) TARGET="${2:-}"; shift 2 ;;
    --name) NAME="${2:-}"; shift 2 ;;
    --repo) REPOSITORY="${2:-}"; shift 2 ;;
    --doctor) DOCTOR="${2:-}"; shift 2 ;;
    --quality-dashboard) QUALITY_DASHBOARD_URL="${2:-}"; shift 2 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown argument: $1" >&2; usage >&2; exit 2 ;;
  esac
done

[[ -n "$TARGET" && -n "$NAME" && -n "$REPOSITORY" ]] || {
  echo "--target, --name, and --repo are required." >&2
  usage >&2
  exit 2
}

[[ -d "$TARGET" ]] || { echo "Project directory does not exist: $TARGET" >&2; exit 2; }

ROOT="$(cd "$TARGET" && pwd)"
PROFILE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

render_template() {
  local source="$1"
  local destination="$2"
  if [[ -e "$destination" ]]; then
    echo "[skip] $destination already exists"
    return
  fi

  mkdir -p "$(dirname "$destination")"
  PROJECT_NAME="$NAME" PROJECT_REPOSITORY="$REPOSITORY" DOCTOR_COMMAND="$DOCTOR" \
    QUALITY_DASHBOARD_URL="$QUALITY_DASHBOARD_URL" python3 - "$source" "$destination" <<'PY'
import os
import sys

source, destination = sys.argv[1:]
replacements = {
    "{{PROJECT_NAME}}": os.environ["PROJECT_NAME"],
    "{{PROJECT_REPOSITORY}}": os.environ["PROJECT_REPOSITORY"],
    "{{DOCTOR_COMMAND}}": os.environ["DOCTOR_COMMAND"],
    "{{QUALITY_DASHBOARD_URL}}": os.environ["QUALITY_DASHBOARD_URL"],
    "{{PROJECT_RULE_1}}": "修改前必须核对项目状态、Git 分支和既有未提交改动。",
    "{{PROJECT_RULE_2}}": "先运行 doctor；无法验证时必须明确记录阻塞和风险。",
    "{{YYYY-MM-DD}}": "待首次任务更新",
    "{{BRANCH}}": "待确认",
    "{{TASK}}": "初始化项目记忆",
    "{{CURRENT_FACT}}": "项目已接入个人 Agent Profile，尚未执行项目 doctor。",
    "{{COMMAND}}": "待执行",
    "{{RESULT}}": "待执行",
    "{{NOT_VERIFIED}}": "项目环境和首个功能尚未验证。",
    "{{NEXT_STEP}}": "读取 AGENTS.md、运行 doctor、更新当前任务。",
    "{{TASK_ID}}": "MEM-001",
    "{{TASK_TITLE}}": "完成项目首轮环境与规则确认",
}
with open(source, encoding="utf-8") as handle:
    content = handle.read()
for key, value in replacements.items():
    content = content.replace(key, value)
with open(destination, "w", encoding="utf-8") as handle:
    handle.write(content)
PY
  echo "[create] $destination"
}

render_template "$PROFILE_ROOT/templates/project-memory/AGENTS.template.md" "$ROOT/AGENTS.md"
render_template "$PROFILE_ROOT/templates/project-memory/CURRENT_STATUS.template.md" "$ROOT/CURRENT_STATUS.md"
render_template "$PROFILE_ROOT/templates/project-memory/TASKS.template.md" "$ROOT/TASKS.md"
render_template "$PROFILE_ROOT/templates/project-memory/错误复盘.template.md" "$ROOT/错误复盘.md"
render_template "$PROFILE_ROOT/templates/project-memory/.agent-profile.template.json" "$ROOT/.agent-profile.json"

if [[ ! -e "$ROOT/doc/ENVIRONMENT.md" ]]; then
  mkdir -p "$ROOT/doc"
  cat > "$ROOT/doc/ENVIRONMENT.md" <<EOF
# 环境说明

## 项目 doctor

\`$DOCTOR\`

## 首次接手

1. 按 \`AGENTS.md\` 读取项目规则和状态。
2. 先运行 doctor，只报告环境状态。
3. 将实际依赖、版本、端口和数据服务补充到本文件。
EOF
  echo "[create] $ROOT/doc/ENVIRONMENT.md"
else
  echo "[skip] $ROOT/doc/ENVIRONMENT.md already exists"
fi

mkdir -p "$ROOT/doc/retrospectives"
touch "$ROOT/doc/retrospectives/.gitkeep"

echo
echo "Project memory is ready: $ROOT"
echo "Next: bash $PROFILE_ROOT/scripts/profile-doctor.sh --project $ROOT"
