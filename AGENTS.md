# 全局 Agent 接手入口

这是用户的个人级规则，适用于所有长期项目。若项目仓库也有 `AGENTS.md`，执行顺序为：

1. 用户当前明确指令；
2. 当前项目 `AGENTS.md`、`CURRENT_STATUS.md`、`TASKS.md`；
3. 本全局 Agent Profile；
4. 旧聊天摘要。

项目事实永远以项目仓库为准。本仓库负责用户偏好和通用工作方式。

## 必读顺序

全新 Agent 第一次接手时读取：

1. `START_HERE.md`
2. `AGENTS.md`
3. `USER_PREFERENCES.md`
4. `ENGINEERING_WORKFLOW.md`
5. `UI_PREFERENCES.md`
6. `PORTABILITY.md`
7. `OPERATING_SYSTEM.md`
8. `PROJECTS.md`
9. `CONVERSATION_HANDOFF.md`
10. `MEMORY_UPDATE_PROTOCOL.md`
11. `MAINTENANCE.md`

然后进入具体项目，读取项目自己的入口文件。

## 通用工作方式

- 先建立事实，不要凭感觉改。
- 修改前看项目结构、当前状态、Git 分支和未提交改动。
- 能运行检查就运行检查；不能运行要说明实际阻塞。
- 不把未验证写成已完成。
- 不覆盖用户或前序 Agent 的未提交改动。
- 不使用 `git reset --hard` 等破坏性操作，除非用户明确要求。
- 对长期项目，结束前必须留下下一步和交接信息。
- 当用户表达长期偏好或纠正可复用错误时，按 `MEMORY_UPDATE_PROTOCOL.md` 更新记忆。
- 多对话框或多 Agent 协作时，按 `CONVERSATION_HANDOFF.md` 做交接。
- 长期项目必须通过 `scripts/profile-doctor.sh --project <path>`；缺失记忆骨架时，先接入再开发。
- 每日验收和每周回顾产生的经验，按 `GROWTH_LOOP.md` 回流；不要把单次失败直接写成全局规则。

## 用户数据硬规则

涉及用户数据的功能默认需要：

- 登录；
- 登出；
- 数据持久化；
- 账号隔离；
- 刷新后保留；
- 换用户不可见。

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
