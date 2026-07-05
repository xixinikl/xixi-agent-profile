# Xixi Agent Profile

这是用户的个人 Agent 总记忆仓库，用来跨电脑、跨 Codex、跨项目复用协作习惯。

它解决的问题：

- 换公司电脑、个人电脑或全新 Codex 时，不从零解释用户偏好；
- 新项目启动时，先建立项目记忆，再写功能；
- 旧项目接手时，先读全局习惯，再读项目规则；
- Agent 犯过的错能沉淀为防复发规则。

## 第一入口

所有 Agent 先读：

```text
START_HERE.md
```

然后按任务类型读取：

- `START_HERE.md`：最短入口；
- `PROMPTS.md`：用户可复制的短口令；
- `AGENTS.md`：全局 Agent 规则；
- `USER_PREFERENCES.md`：用户沟通、产品、审美偏好；
- `ENGINEERING_WORKFLOW.md`：工程化开发方式；
- `UI_PREFERENCES.md`：界面和体验偏好；
- `PORTABILITY.md`：跨电脑、跨 Codex 使用方式；
- `OPERATING_SYSTEM.md`：个人层、项目层、对话层的整体协作制度；
- `PROJECTS.md`：长期项目索引；
- `CONVERSATION_HANDOFF.md`：多对话框和换 Agent 交接规范；
- `MEMORY_UPDATE_PROTOCOL.md`：什么时候更新记忆、写到哪里、怎么提交；
- `MAINTENANCE.md`：记忆维护节奏；
- `templates/project-memory/`：新项目记忆模板。

## 与项目仓库的关系

本仓库记住“用户是谁、喜欢怎么协作”。

具体项目仓库记住“这个项目是什么、怎么跑、当前做到哪”。

每个长期项目仍应有自己的：

- `AGENTS.md`
- `CURRENT_STATUS.md`
- `TASKS.md`
- `错误复盘.md`
- `doc/ENVIRONMENT.md`

## 给全新 Codex 的第一句话

```text
先读取我的个人 Agent Profile 仓库：
https://github.com/xixinikl/xixi-agent-profile

按其中 START_HERE.md 的规则理解我的长期偏好。
然后读取当前项目的 AGENTS.md、CURRENT_STATUS.md、TASKS.md 和 doc/ENVIRONMENT.md。
先运行项目的 doctor 自检命令，只报告环境状态，不要先修改代码。
```
