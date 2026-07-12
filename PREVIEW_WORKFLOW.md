# 预览工作流

目标：让 Profile owner 不用记命令、不用反复叫 Agent 打开页面，也能知道每个项目当前哪些内容可预览。

## 核心原则

- Profile owner 不负责背预览命令。
- Agent 每做完一个可看的小切片，就要更新预览状态。
- 预览状态必须是机器可读或人可扫的，不能只藏在聊天里。
- 本机开发预览、分支预览、下载版/容器版预览要分清。

## 三类预览

| 类型 | 用途 | 典型入口 |
|---|---|---|
| 本机开发预览 | 改一点马上看一点 | `npm run preview`、`preview.html`、本机端口 |
| 分支/功能预览 | 多个对话框各自看自己的进度 | `preview.config.json` 的页面清单 |
| 封装预览 | 给别人下载或打开统一地址 | Docker、桌面 app、托管平台 |

## 项目必须提供

每个长期项目应逐步具备：

- `doc/PREVIEW.md`：人读的预览说明；
- `preview.config.json`：预览中心可读的页面、状态、启动方式；
- 一个稳定启动入口：如 `npm run preview`、`docker compose up` 或桌面 app；
- `CURRENT_STATUS.md`：记录当前可预览进度和未完成项。

## Codex 每次改功能后必须更新

如果本次改动影响产品用户可见页面、API、数据或启动方式，Agent 必须检查并更新：

```text
preview.config.json
doc/PREVIEW.md
CURRENT_STATUS.md
TASKS.md
```

更新内容至少包括：

- 当前分支；
- 预览入口；
- 状态：`可预览`、`开发中`、`阻塞`、`需登录`、`仅后台`；
- 已验证；
- 未完成；
- 是否需要 Docker/后端/数据库/密钥。

## 多分支预览规则

- 每个分支可以有自己的预览状态。
- 不要求所有分支完成后再预览。
- 谁完成一个可看的小切片，谁更新自己的预览入口。
- 如果多个分支都改共享文件，如 `package.json`、数据库、登录、启动脚本，必须在 `CURRENT_STATUS.md` 标明冲突风险。

## API 地址规则

前端不能把生产/分享预览写死为 `127.0.0.1`。

推荐规则：

```js
const API_BASE =
  window.__APP_API_BASE__ ||
  (location.port === "8080" ? "http://127.0.0.1:8888" : location.origin);
```

本机静态开发可以访问本机后端；Docker 或线上同源预览必须使用当前域名。

## 给 Profile owner 的交付方式

不要让 Profile owner 看一串命令。最终回复应优先给：

```text
预览中心：...
本次该点：...
状态：可预览 / 开发中 / 阻塞
注意：...
```

只有在 Profile owner 要配置环境、部署或排错时，才展示命令。
