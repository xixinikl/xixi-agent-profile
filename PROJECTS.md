# 项目索引

本文件登记长期项目入口。它只记录项目级入口，不展开具体任务细节。

## 已登记长期项目

| 项目 | GitHub | 本地常用路径 | 状态 | 入口 | 质量报告 |
|---|---|---|---|---|---|
| 公途 gongtu-project | `https://github.com/xixinikl/gongtu-project` | `/Users/miduoduo/Documents/xixi_gongtu`、`/Users/miduoduo/Documents/xixi_gongtu-main-app` | 活跃 | 项目 `AGENTS.md` | `https://xixinikl.github.io/gongtu-project/` |
| CanvasStorm | `https://github.com/xixinikl/canvas-storm` | `/Users/miduoduo/Documents/思维风暴` | 活跃 | `CURRENT_STATUS.md`、`HANDOFF.md` | - |
| Xixi Dev System | `https://github.com/xixinikl/xixi-dev-system` | `/Users/miduoduo/Documents/xixi-dev-system` | 活跃 | `README.md`、`SYSTEM.md` | - |
| 个人 Agent Profile | `https://github.com/xixinikl/xixi-agent-profile.git` | `/Users/miduoduo/Documents/xixi-agent-profile` | 活跃 | `START_HERE.md` | - |
| Quality Hub | `https://github.com/xixinikl/quality-hub` | - | 活跃 | `README.md` | `https://xixinikl.github.io/quality-hub/` |

## 本机扫描候选

候选只使用本机Git `origin` owner过滤，不把其他用户、组织仓库或无匹配origin的目录写入个人项目范围。同一远端的多个工作副本分别记录，避免漏掉并行分支。

优先使用统一系统入口：

```bash
xixi-dev-system projects discover \
  --owner xixinikl \
  --root /Users/miduoduo/Documents \
  --output /tmp/xixi-projects.json
```

全新环境还未安装统一系统时，可使用Profile备用命令：

```bash
python3 scripts/discover_projects.py /Users/miduoduo/Documents --owner xixinikl
```

两个命令都只读本机Git元数据，不修改项目，也不读取GitHub远端正文。发现新工作副本后先作为候选审查，不直接标成活跃长期项目。

## 新项目登记规则

新项目进入长期开发后，必须补齐：

- GitHub 仓库地址；
- 本地常用路径；
- 项目状态；
- 项目 `AGENTS.md`；
- 项目 `CURRENT_STATUS.md`；
- 项目 `TASKS.md`；
- 项目环境说明；
- doctor 自检命令；
- `.agent-profile.json` 接入信息；
- 验收报告入口（如已接入质量工厂）；
- 预览说明或 `preview.config.json`（如果项目需要及时预览）。

## 项目状态定义

- `活跃`：正在频繁开发；
- `维护`：偶尔修复或小改；
- `暂停`：暂不开发，但未来可能恢复；
- `归档`：不再维护，只保留历史。
