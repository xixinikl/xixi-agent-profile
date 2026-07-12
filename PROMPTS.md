# 常用短口令

Profile owner 不应该背长提示词。本文件提供几句可复制的短口令。

优先原则：能不发就不发。只要当前项目的 `AGENTS.md` 已经指向本 Profile，Agent 应主动读取这些规则。

## 自然语言也可以

```text
按我的系统来。
```

```text
按我的工业化流程来。
```

```text
做成可预览。
```

```text
整理一下我的工作流。
```

## 日常最短版

```text
先读我的 Agent Profile，再处理当前项目。
```

## 多对话框继续旧项目

```text
先读我的 Agent Profile，按 CONVERSATION_HANDOFF.md 接手。再读当前项目的 AGENTS.md、CURRENT_STATUS.md 和 TASKS.md，运行 doctor 后告诉我当前分支、任务、环境状态和下一步。
```

## 全新 Codex

```text
先读 https://github.com/xixinikl/xixi-agent-profile 的 START_HERE.md，再读当前项目的 AGENTS.md 和 CURRENT_STATUS.md。
先运行项目 doctor，只报告环境状态，不要先改代码。
```

## 新项目

```text
先读我的 Agent Profile，然后给这个新项目建立项目记忆：AGENTS.md、CURRENT_STATUS.md、TASKS.md、错误复盘.md、doc/ENVIRONMENT.md 和 doctor 自检命令。建好后再开始写功能。
```

## 任务结束

```text
结束前按 MEMORY_UPDATE_PROTOCOL.md 检查是否需要更新长期记忆；该写就提交推送，不需要就说明没有新增长期记忆。
```

## 整理体系

```text
按 xixi-agent-profile 的 OPERATING_SYSTEM.md 和 MAINTENANCE.md 做一次轻量整理：检查项目索引、活跃项目状态、记忆是否有冲突，以及是否需要更新长期规则。
```
# 常用短口令

## 接手长期项目

```text
先读取我的个人 Agent Profile 和当前项目的 AGENTS.md、CURRENT_STATUS.md、TASKS.md、错误复盘.md、doc/ENVIRONMENT.md、.agent-profile.json。
运行 Profile doctor 和项目 doctor，只报告事实；确认 Git 状态后再开始任务。
```

## 接入新项目

```text
把当前项目接入 xixi-agent-profile：创建项目记忆骨架、.agent-profile.json、复盘目录和环境说明；不得覆盖既有文件。完成后运行 profile doctor，并报告实际创建文件与未验证项。
```

## 每日验收后回流

```text
按每日验收工厂运行低成本验收。对于 conditional、fail、自动修复或未覆盖项，把报告沉淀为项目 doc/retrospectives 候选；周检才决定是否把重复且可复用的经验升级到个人 Profile 的 LEARNINGS.md。
```
