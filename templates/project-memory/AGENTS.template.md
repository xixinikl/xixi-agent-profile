# {{PROJECT_NAME}} Agent 接手入口

本文件是当前项目的第一入口。全局用户偏好看 `xixi-agent-profile`，本文件只记录项目事实。

## 先读顺序

1. `AGENTS.md`
2. `CURRENT_STATUS.md`
3. `TASKS.md`
4. `错误复盘.md`
5. `doc/ENVIRONMENT.md`
6. `.agent-profile.json`
7. `doc/retrospectives/` 中与任务相关的复盘
8. 与任务相关的代码和文档

## 环境检查

```bash
{{DOCTOR_COMMAND}}
```

接手长期任务前，运行个人 Profile 的项目体检：

```bash
bash /path/to/xixi-agent-profile/scripts/profile-doctor.sh --project .
```

## 项目硬规则

- {{PROJECT_RULE_1}}
- {{PROJECT_RULE_2}}
- 每日验收出现 `conditional`、`fail`、自动修复或未覆盖项时，必须写入 `doc/retrospectives/` 候选；不要把单次问题直接升级为全局规则。

## 交接格式

```text
当前分支：
当前任务：
已改文件：
已验证：
未验证：
下一步：
风险/注意：
```
