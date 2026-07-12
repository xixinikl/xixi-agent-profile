# Xixi Agent Profile

## 仓库身份

| 项目 | 说明 |
|---|---|
| 类型 | 个人记忆仓库：保存跨项目成立的偏好、协作方式和已验证经验。 |
| 协作关系 | 由 `xixi-dev-system profile sync` 自动同步；项目专属事实仍留在各项目仓库。 |
| 平时需要打开吗 | 不需要手动调用；只有审查或修改长期偏好时打开。 |
| 当前状态 | 使用中，是跨电脑恢复个人偏好的事实源。 |
| 新电脑恢复 | 安装 `xixi-dev-system` 后会自动同步；也可单独 clone 后从 `START_HERE.md` 开始读取。 |

这是 Profile owner（xixinikl）的个人 Agent 总记忆仓库，用来跨电脑、跨 Codex、跨项目复用协作习惯，并让项目经验以受控方式持续回流。

它解决的问题：

- 换公司电脑、个人电脑或全新 Codex 时，不从零解释 Profile owner 偏好；
- 新项目启动时，先建立项目记忆，再写功能；
- 旧项目接手时，先读全局习惯，再读项目规则；
- Agent 犯过的错能沉淀为防复发规则。
- 每日验收、每周回顾和质量台的结论能转成可检索的项目经验。

## 成长闭环

```text
接入项目 -> 每日验收 -> 项目复盘候选 -> 每周筛选 -> 全局经验 -> 下一次项目接手
```

这不是让日志自动淹没规则库：每日结论先写入项目级候选；只有重复出现、跨项目有效且有证据的经验，才由每周回顾提升到 `LEARNINGS.md`。

## 可执行入口

```bash
# 检查个人 Profile 本身
bash scripts/profile-doctor.sh

# 将某个仓库接入项目记忆骨架（默认不覆盖已有文件）
bash scripts/onboard-project.sh --target /path/to/project --name "项目名" --repo "https://github.com/owner/repo"

# 检查已接入的项目
bash scripts/profile-doctor.sh --project /path/to/project

# 把每日验收报告沉淀为项目复盘候选
bash scripts/ingest-acceptance-report.sh --project /path/to/project --report /path/to/report.md
```

## 第一入口

所有 Agent 先读：

```text
START_HERE.md
```

然后按任务类型读取：

- `START_HERE.md`：最短入口；
- `GLOSSARY.md`：术语表，区分 Profile owner（xixinikl）、产品用户、Agent 和项目；
- `WORKFLOW_INDEX.md`：所有工作流的总索引，避免 Profile owner 背长提示词；
- `PROMPTS.md`：Profile owner 可复制的短口令；
- `AGENTS.md`：全局 Agent 规则；
- `USER_PREFERENCES.md`：Profile owner 沟通、产品、审美偏好；
- `ENGINEERING_WORKFLOW.md`：工程化开发方式；
- `INDUSTRIAL_WORKFLOW.md`：工业化开发总流程，默认接入 standard-project-workflow；
- `PREVIEW_WORKFLOW.md`：及时预览、分支预览、封装预览的协作规则；
- `PROJECT_ONBOARDING.md`：让任意项目接入本系统的最小步骤；
- `UI_PREFERENCES.md`：界面和体验偏好；
- `PORTABILITY.md`：跨电脑、跨 Codex 使用方式；
- `OPERATING_SYSTEM.md`：个人层、项目层、对话层的整体协作制度；
- `PROJECTS.md`：长期项目索引；
- `scripts/discover_projects.py`：备用的只读本机Git扫描器，使用`--owner xixinikl`限定归属范围；
- `CONVERSATION_HANDOFF.md`：多对话框和换 Agent 交接规范；
- `MEMORY_UPDATE_PROTOCOL.md`：什么时候更新记忆、写到哪里、怎么提交；
- `CDS_GOAL_WORKFLOW.md`：长期Goal的权威结构、阶段证据和完成审计；
- `EVIDENCE_LEARNING_WORKFLOW.md`：按本机Git归属扫描项目、生成候选并晋升系统经验；
- `MAINTENANCE.md`：记忆维护节奏；
- `GROWTH_LOOP.md`：每日验收、复盘、全局经验的闭环规则；
- `LEARNINGS.md`：已验证、可跨项目复用的经验；
- `scripts/`：项目接入、体检、报告沉淀的可执行工具；
- `templates/project-memory/`：新项目记忆模板。

## 与项目仓库的关系

本仓库记住“Profile owner（xixinikl）是谁、喜欢怎么协作”。

具体项目仓库记住“这个项目是什么、怎么跑、当前做到哪”。

每个长期项目仍应有自己的：

- `AGENTS.md`
- `CURRENT_STATUS.md`
- `TASKS.md`
- `错误复盘.md`
- `doc/ENVIRONMENT.md`
- `.agent-profile.json`

## 给全新 Codex 的第一句话

```text
先读取我的个人 Agent Profile 仓库：
https://github.com/xixinikl/xixi-agent-profile

按其中 START_HERE.md 的规则理解我的长期偏好。
然后读取当前项目的 AGENTS.md、CURRENT_STATUS.md、TASKS.md 和 doc/ENVIRONMENT.md。
先运行项目的 doctor 自检命令，只报告环境状态，不要先修改代码。
```
