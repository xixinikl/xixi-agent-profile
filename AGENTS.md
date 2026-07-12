# 全局 Agent 接手入口

这是 Profile owner（xixinikl）的个人级规则，适用于所有长期项目。若项目仓库也有 `AGENTS.md`，执行顺序为：

1. Profile owner 当前明确指令；
2. 当前项目 `AGENTS.md`、`CURRENT_STATUS.md`、`TASKS.md`；
3. 本全局 Agent Profile；
4. 旧聊天摘要。

项目事实永远以项目仓库为准。本仓库负责 Profile owner 偏好和通用工作方式。

## 必读顺序

全新 Agent 第一次接手时读取：

1. `START_HERE.md`
2. `AGENTS.md`
3. `GLOSSARY.md`
4. `WORKFLOW_INDEX.md`
5. `USER_PREFERENCES.md`
6. `ENGINEERING_WORKFLOW.md`
7. `INDUSTRIAL_WORKFLOW.md`
8. `PREVIEW_WORKFLOW.md`
9. `PROJECT_ONBOARDING.md`
10. `UI_PREFERENCES.md`
11. `PORTABILITY.md`
12. `OPERATING_SYSTEM.md`
13. `PROJECTS.md`
14. `CONVERSATION_HANDOFF.md`
15. `MEMORY_UPDATE_PROTOCOL.md`
16. `MAINTENANCE.md`
17. 长期、多阶段任务读取 `CDS_GOAL_WORKFLOW.md`；
18. 跨项目经验整理读取 `EVIDENCE_LEARNING_WORKFLOW.md`。

然后进入具体项目，读取项目自己的入口文件。

## 通用工作方式

- 先建立事实，不要凭感觉改。
- 修改前看项目结构、当前状态、Git 分支和未提交改动。
- 能运行检查就运行检查；不能运行要说明实际阻塞。
- 不把未验证写成已完成。
- 不覆盖 Profile owner 或前序 Agent 的未提交改动。
- 不使用 `git reset --hard` 等破坏性操作，除非 Profile owner 明确要求。
- 对长期项目，结束前必须留下下一步和交接信息。
- 当 Profile owner 表达长期偏好或纠正可复用错误时，按 `MEMORY_UPDATE_PROTOCOL.md` 更新记忆。
- 当 Profile owner 要求“开Goal”或任务跨阶段、跨仓库时，按 `CDS_GOAL_WORKFLOW.md` 建立唯一权威入口、可执行状态和完成审计。
- 当 Profile owner 要求从“我的项目”学习时，以本机Git origin owner过滤范围，按 `EVIDENCE_LEARNING_WORKFLOW.md` 生成候选；不得把账号过滤当成读取远端正文的授权。
- 多对话框或多 Agent 协作时，按 `CONVERSATION_HANDOFF.md` 做交接。
- 长期项目必须通过 `scripts/profile-doctor.sh --project <path>`；缺失记忆骨架时，先接入再开发。
- 每日验收和每周回顾产生的经验，按 `GROWTH_LOOP.md` 回流；不要把单次失败直接写成全局规则。
- 不要求 Profile owner 粘贴长提示词。Agent 应根据 `WORKFLOW_INDEX.md` 主动选择工程、预览、交接、记忆更新等工作流。

## 产品用户数据硬规则

涉及产品用户数据的功能默认需要：

- 登录；
- 登出；
- 数据持久化；
- 账号隔离；
- 刷新后保留；
- 换产品用户不可见。

后端数据归属必须来自可信认证信息，不能相信前端传入的 `user_id`。

## 交接格式

每次暂停、额度用完、换 Agent、换电脑前，必须留下：

```text
当前项目：
当前分支：
当前任务：
已改文件：
已验证：
未验证：
下一步：
风险/注意：
```
