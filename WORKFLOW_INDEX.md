# 工作流索引

本文件是个人 Agent Profile 的总目录。Agent 不应让 Profile owner 背长提示词；应根据任务类型主动读取对应工作流。

## Profile owner 最小负担

Profile owner 可以只说自然语言，例如：

- “按我的系统来”
- “做成可预览”
- “整理一下我的工作流”
- “继续这个项目”
- “这个错误以后别再犯”

Agent 必须自己从本索引判断要读取哪些文件，不得要求 Profile owner 重复粘贴大段提示词。

## 工作流目录

| 场景 | 必读文件 | 产物 |
|---|---|---|
| 接手任何长期项目 | `START_HERE.md`、`GLOSSARY.md`、`AGENTS.md`、项目 `AGENTS.md` | 明确当前项目、分支、任务、环境 |
| 发现/登记多个仓库 | `PROJECTS.md`、`scripts/discover_projects.py` | 已登记项目和本机候选项目 |
| 工业化工程开发 | `INDUSTRIAL_WORKFLOW.md`、`ENGINEERING_WORKFLOW.md` | 分支、小切片、验证、预览、记忆更新 |
| 预览/部署/给别人看 | `PREVIEW_WORKFLOW.md`、项目 `doc/PREVIEW.md` 或 `preview.config.json` | 可点开的预览入口和状态 |
| 新项目接入系统 | `PROJECT_ONBOARDING.md`、`templates/project-memory/` | 项目入口、状态、预览配置 |
| 多对话框并行 | `CONVERSATION_HANDOFF.md` | 分支、改动范围、冲突边界 |
| 记忆更新/经验复用 | `MEMORY_UPDATE_PROTOCOL.md` | 更新个人 Profile 或项目复盘 |
| 跨项目证据学习/系统进化 | `EVIDENCE_LEARNING_WORKFLOW.md`、`PROJECTS.md` | owner过滤的证据组合包、晋升候选、系统/Profile更新 |
| 长期任务/开启Goal | `CDS_GOAL_WORKFLOW.md` | 唯一权威Goal、可执行状态、阶段证据与完成审计 |
| UI/学习产品体验 | `UI_PREFERENCES.md` | 稳定、正式、可验证的界面体验 |
| 跨电脑/新 Codex | `PORTABILITY.md` | 不依赖旧聊天或单台机器 |
| 体系维护 | `OPERATING_SYSTEM.md`、`MAINTENANCE.md` | 去重、归档、修正过期规则 |

## 写入规则

- 跨项目长期有效的方法，写入本 Profile。
- 某个项目的当前状态、任务、环境、预览入口，写入项目仓库。
- 不创建平行重复文档；如果现有文件能承载，就更新现有文件。
- 新增工作流文件时，必须同步更新 `START_HERE.md`、`README.md` 和本索引。

## Agent 自检

任务开始前问自己：

```text
这是什么场景？
对应工作流在哪里？
项目自己的事实源在哪里？
我是否在让 Profile owner 背本该由我读取的规则？
如果 Profile owner 提到“很多仓库/所有项目”，我是否先查看了 PROJECTS.md 并扫描候选仓库？
```

任务结束前问自己：

```text
这次有没有形成新的可复用规则？
应该写到个人 Profile，还是项目仓库？
有没有更新预览入口和当前状态？
```
