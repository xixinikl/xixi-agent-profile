# Start Here

这是给用户和新 Agent 的最短入口。

## 用户只需要记这一句

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
2. `USER_PREFERENCES.md`
3. `ENGINEERING_WORKFLOW.md`
4. `UI_PREFERENCES.md`
5. `PORTABILITY.md`
6. `OPERATING_SYSTEM.md`
7. `PROJECTS.md`
8. `CONVERSATION_HANDOFF.md`
9. `MEMORY_UPDATE_PROTOCOL.md`
10. `MAINTENANCE.md`

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

## 如果用户忘记提醒

只要 Agent 看到了本仓库，就必须主动执行本文件。不要等待用户再次解释偏好。

如果当前项目有自己的 `AGENTS.md`，也必须主动读取项目规则。

## 任务结束前

按 `MEMORY_UPDATE_PROTOCOL.md` 检查是否需要更新长期记忆。
如果涉及项目状态变化，同时检查 `PROJECTS.md` 和项目自己的 `CURRENT_STATUS.md`。
如果本次使用了每日验收，按 `GROWTH_LOOP.md` 将报告沉淀为项目复盘候选。
