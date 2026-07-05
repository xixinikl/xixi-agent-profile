# 跨电脑与全新 Codex 使用方式

## 原则

不要依赖某台电脑的 `~/.codex`、旧聊天、浏览器状态或 Codex 内置运行时。

稳定可迁移的事实源只有：

- GitHub 上的个人 Agent Profile 仓库；
- GitHub 上的具体项目仓库；
- 仓库内的规则、状态、任务、环境和自检脚本。

## 公司电脑 / 个人电脑

每台电脑第一次使用时：

```bash
git clone https://github.com/xixinikl/xixi-agent-profile.git
git clone <project-repo-url>
```

然后对 Agent 说：

```text
先读 xixi-agent-profile/AGENTS.md，再读当前项目的 AGENTS.md。
然后运行项目 doctor 命令，只报告环境状态。
```

## 全新 Codex

给全新 Codex 的第一句话：

```text
先读取我的个人 Agent Profile：
https://github.com/xixinikl/xixi-agent-profile

再读取当前项目仓库的 AGENTS.md、CURRENT_STATUS.md、TASKS.md、错误复盘.md 和 doc/ENVIRONMENT.md。
先运行项目 doctor 自检，只报告环境状态，不要先修改代码。
```

## 新项目

新项目第一句话：

```text
先读取 https://github.com/xixinikl/xixi-agent-profile。
按其中 templates/project-memory 的结构，在当前新项目内建立项目记忆。
先创建 AGENTS.md、CURRENT_STATUS.md、TASKS.md、错误复盘.md、doc/ENVIRONMENT.md 和 doctor 自检命令，再开始首个功能。
```

## 重要提醒

如果个人 Profile 仓库还没有推到 GitHub，只存在本机，那么它不能解决全新 Codex 问题。
必须推送到 GitHub，才能跨电脑和跨 Codex 使用。

