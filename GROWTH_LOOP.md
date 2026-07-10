# 成长闭环

## 目标

让每个项目都能按同一套规则开发、验收、复盘，并把真正可复用的经验带到下一个项目。

## 三类产物

| 产物 | 给谁看 | 保存位置 | 生命周期 |
|---|---|---|---|
| 验收报告 | 用户和质量台 | 项目质量报告页或 Actions artifact | 每日/每周运行记录 |
| 项目复盘候选 | 后续接手当前项目的 Agent | `doc/retrospectives/` | 项目长期事实 |
| 全局经验 | 所有项目的 Agent | 本仓库 `LEARNINGS.md` | 已验证的跨项目规则 |

## 日检

1. 在专用干净 worktree 运行 L0 每日验收。
2. 仅在低风险、可逆且验证通过的情况下自动修复。
3. 报告为 `conditional`、`fail`，或包含自动修复、缺陷、未覆盖项时，执行：

```bash
bash /path/to/xixi-agent-profile/scripts/ingest-acceptance-report.sh \
  --project /path/to/project \
  --report .agent-factory/out/YYYY-MM-DD/report.md
```

4. 将验收报告链接发给用户；复盘候选不替代报告。

## 周检

周检读取本周候选和每日趋势，只提升满足全部条件的经验：

- 有报告或代码证据；
- 有明确、可执行的预防动作；
- 已重复出现，或一次影响足够高；
- 适用于至少两个项目，或能成为通用安全规则。

通过后将条目写入 `LEARNINGS.md`，并标记候选的 `升级状态: 已提升`。否则保留在项目层，避免把偶发噪声变成全局约束。

## 新项目接入

```bash
bash scripts/onboard-project.sh \
  --target /path/to/project \
  --name "项目名" \
  --repo "https://github.com/owner/repo" \
  --doctor "npm run doctor"
```

接入后执行 `scripts/profile-doctor.sh --project /path/to/project`。通过后，项目才算进入长期协作体系。
