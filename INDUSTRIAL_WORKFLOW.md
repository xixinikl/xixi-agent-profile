# 工业化开发工作流

本文件定义 Profile owner（xixinikl）期望的默认开发方式。Profile owner 不需要每次显式调用 `$standard-project-workflow`；凡是长期项目中的代码、产品、预览、部署、数据或 UI 任务，Agent 都应默认按本流程执行。

## 与 standard-project-workflow skill 的关系

`standard-project-workflow` 是执行引擎，负责事实发现、需求契约、计划、实现、验证、交付和记忆更新。

本文件是总装配规则，把执行引擎接入：

- 多项目索引；
- Git 分支；
- GitHub 上传与 CI；
- 预览状态；
- Profile owner 的 UI 审美；
- 经验沉淀；
- 项目接入模板。

如果当前 Codex 环境有 `standard-project-workflow` skill，开发任务必须读取并遵守它。若没有该 skill，也必须按本文件和 `ENGINEERING_WORKFLOW.md` 执行同等门禁。

## Profile owner 最小指令

Profile owner 可以只说：

```text
按我的工业化流程来。
```

或：

```text
按我的系统来。
```

Agent 不得要求 Profile owner 粘贴长提示词。Agent 应自己读取 `START_HERE.md`、`WORKFLOW_INDEX.md` 和当前项目入口文件。

## 默认执行顺序

1. 读取个人 Profile：
   - `START_HERE.md`
   - `WORKFLOW_INDEX.md`
   - `INDUSTRIAL_WORKFLOW.md`
   - `ENGINEERING_WORKFLOW.md`
   - `PREVIEW_WORKFLOW.md`
   - `MEMORY_UPDATE_PROTOCOL.md`
   - 涉及 UI 时读取 `UI_PREFERENCES.md`
2. 定位当前项目：
   - 优先读取项目 `AGENTS.md`
   - 再读 `CURRENT_STATUS.md`、`TASKS.md`、`doc/ENVIRONMENT.md`
   - 若 Profile owner 提到很多仓库，读 `PROJECTS.md` 并运行 `scripts/discover_projects.py`
3. 检查 Git：
   - 当前分支
   - 远端
   - 未提交改动
   - 是否需要新建 `cx/` 分支
4. 检查环境：
   - 运行项目 doctor 或等价只读自检
   - 区分版本、依赖、数据库、端口、密钥、代码错误
5. 小切片开发：
   - 一次只做一个可验证纵向切片
   - 不覆盖其他分支或其他 Agent 的改动
6. 验证：
   - 静态检查
   - 测试
   - 真实入口行为验证
   - UI/预览检查
7. 预览：
   - 更新 `preview.config.json` 或 `doc/PREVIEW.md`
   - 告诉 Profile owner 预览中心里该看哪个入口
8. 状态与记忆：
   - 更新项目 `CURRENT_STATUS.md`、`TASKS.md`
   - 有跨项目经验时更新个人 Profile
   - Profile owner 纠正非显而易见错误时，写项目 `错误复盘.md`
9. GitHub：
   - 仅在 Profile owner 或项目规则授权时提交、推送、看 CI、建 PR
   - 提交前必须检查 diff

## 分支默认

- 不直接改 `main`。
- 新开发分支默认使用 `cx/` 前缀。
- 如果项目已有分支规则，以项目 `AGENTS.md` 为准。
- 多个 Agent 并行时，默认每个任务使用独立分支或独立 worktree。

## 完成标准

不得只因为代码写完就说完成。至少要说明：

- 改了什么；
- 从哪里预览；
- 验证了什么；
- 未验证什么；
- 是否更新了状态和经验；
- 是否提交/推送/CI，若没有，说明原因。

## UI 默认

涉及页面、组件、学习产品体验时，必须读取 `UI_PREFERENCES.md`。若当前项目有更具体的 UI 指南，项目规则优先。

## 经验晋升规则

经验不应该散落在聊天里：

- 只影响当前项目：写项目 `错误复盘.md`、`CURRENT_STATUS.md` 或项目文档。
- 跨项目复用：写个人 Profile 对应文件。
- 可自动执行：沉淀为脚本或 skill。
- 反复用于所有项目：写入本文件或 `WORKFLOW_INDEX.md`。
