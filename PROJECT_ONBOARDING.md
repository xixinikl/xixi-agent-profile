# 项目接入指南

本文件说明如何让任意项目接入 Xixi 工业化开发系统。

## 接入目标

Profile owner 在任何项目里只说一句：

```text
按我的工业化流程来。
```

Agent 就能自动知道：

- 去哪里读取 Profile owner 的长期规则；
- 当前项目怎么启动和验证；
- 当前项目有哪些可预览页面；
- 怎么更新状态和经验；
- 怎么避免多分支、多 Agent 冲突。

## 最小接入文件

每个长期项目至少需要：

```text
AGENTS.md
CURRENT_STATUS.md
TASKS.md
错误复盘.md
doc/ENVIRONMENT.md
```

需要及时预览的项目再加：

```text
doc/PREVIEW.md
preview.config.json
```

## 项目 AGENTS.md 应该很短

项目 `AGENTS.md` 不要复制个人 Profile 的全部内容，只需要：

- 指向 `xixi-agent-profile`；
- 说明本项目事实源；
- 写项目特有规则；
- 写环境自检命令；
- 写交接格式。

## 推荐接入步骤

1. 在项目根目录检查是否已有 `AGENTS.md`。
2. 若没有，从 `templates/project-memory/AGENTS.template.md` 创建。
3. 补齐项目真实命令，不保留模板占位符。
4. 添加 `doc/PREVIEW.md` 和 `preview.config.json`。
5. 运行项目 doctor 或最小启动检查。
6. 更新 `PROJECTS.md`，把项目从候选提升到长期项目。

## 预览配置样例

```json
{
  "schema": "xixi.preview.v1",
  "project": "示例项目",
  "status": "developing",
  "runtime": {
    "type": "docker",
    "start": "docker compose up --build",
    "stop": "docker compose down",
    "health": "http://localhost:8888/api/health"
  },
  "pages": [
    {
      "name": "首页",
      "url": "http://localhost:8888",
      "status": "可预览",
      "notes": "同源 API"
    }
  ]
}
```

## 不要做什么

- 不要把所有项目的具体进度写进个人 Profile。
- 不要在每个项目复制一大份全局规则。
- 不要让 Profile owner 记长提示词。
- 不要把未验证预览标成可预览。
