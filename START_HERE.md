# Start Here

这是给 Profile owner（xixinikl）和新 Agent 的最短入口。

## Profile owner 只需要记这一句

```text
先读我的 Agent Profile，再处理当前项目。
```

如果 Agent 不知道 Agent Profile 是什么，发这个链接：

```text
https://github.com/xixinikl/xixi-agent-profile
```

## Agent 必须做什么

读完本文件后，按顺序读取：

1. `AGENTS.md`
2. `GLOSSARY.md`
3. `WORKFLOW_INDEX.md`
4. `USER_PREFERENCES.md`
5. `ENGINEERING_WORKFLOW.md`
6. `INDUSTRIAL_WORKFLOW.md`
7. `PREVIEW_WORKFLOW.md`
8. `PROJECT_ONBOARDING.md`
9. `UI_PREFERENCES.md`
10. `PORTABILITY.md`
11. `OPERATING_SYSTEM.md`
12. `PROJECTS.md`
13. `CONVERSATION_HANDOFF.md`
14. `MEMORY_UPDATE_PROTOCOL.md`
15. `MAINTENANCE.md`
16. 长期任务读取 `CDS_GOAL_WORKFLOW.md`
17. 跨项目学习读取 `EVIDENCE_LEARNING_WORKFLOW.md`

然后进入当前项目，读取项目自己的：

1. `AGENTS.md`
2. `CURRENT_STATUS.md`
3. `TASKS.md`
4. `doc/ENVIRONMENT.md`

开始修改前先运行 Profile 与项目自检：

```bash
bash /path/to/xixi-agent-profile/scripts/profile-doctor.sh --project .
npm run doctor
```

如果项目尚未接入，先运行：

```bash
bash /path/to/xixi-agent-profile/scripts/onboard-project.sh --target . --name "项目名" --repo "https://github.com/owner/repo"
```

如果 Profile owner 提到“不只是这个项目”“很多仓库”“所有项目都要预览”，先读取 `PROJECTS.md` 和 `EVIDENCE_LEARNING_WORKFLOW.md`，优先用 `xixi-dev-system projects discover --owner xixinikl` 按本机origin过滤；不得把账号过滤理解成读取远端仓库正文的授权。

## 如果 Profile owner 忘记提醒

只要 Agent 看到了本仓库，就必须主动执行本文件。不要等待 Profile owner 再次解释偏好。

如果当前项目有自己的 `AGENTS.md`，也必须主动读取项目规则。

不要让 Profile owner 背长提示词。Profile owner 只要表达“预览”“继续项目”“按我的系统”“整理工作流”等自然语言，Agent 就应按 `WORKFLOW_INDEX.md` 主动选择对应工作流。

## 任务结束前

按 `MEMORY_UPDATE_PROTOCOL.md` 检查是否需要更新长期记忆。
如果涉及项目状态变化，同时检查 `PROJECTS.md` 和项目自己的 `CURRENT_STATUS.md`。
如果本次使用了每日验收，按 `GROWTH_LOOP.md` 将报告沉淀为项目复盘候选。
