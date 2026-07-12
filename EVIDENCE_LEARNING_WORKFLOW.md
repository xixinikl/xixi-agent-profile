# 证据驱动的系统成长

本工作流用于把项目经验喂养进个人开发系统，同时防止把一次性事故、项目私有事实或未经验证的偏好污染全局 Profile。

## 本机项目范围

当 Profile owner 要求扫描“我的项目”时，GitHub账号只作为本机归属过滤器：

- 只读取本机 Git 仓库的 `origin`；
- 只纳入 owner 匹配的工作副本；
- 不因为账号过滤而读取GitHub远端正文；
- 同一远端的多个本机工作副本分别记录，避免漏掉并行分支成果；
- 其他用户、组织、第三方clone和无匹配origin的目录默认排除。

推荐命令：

```bash
xixi-dev-system projects discover \
  --owner xixinikl \
  --root /path/to/local/workspace \
  --output /tmp/xixi-projects.json
```

## 经验候选合同

每条候选必须记录：来源项目、证据路径、观察到的问题、重复模式、拟议规则、目标层级、执行方式、反例或边界、验证方法。

晋升层级：

- **项目层**：只影响一个项目的状态、业务事实和短期决策。
- **Profile层**：跨项目长期有效的偏好、协作规则和工程方法。
- **系统层**：可以稳定机器判断的发现、检查、模板或自动化。

自动化只负责发现、索引、lint和生成候选，不得未经人工审阅直接修改Profile或业务仓库。

## 自动摄取状态机

项目复盘优先使用`templates/project-memory/RETROSPECTIVE.template.md`字段。旧版`错误复盘.md`仍可读取：

```text
needs_completion  缺场景、根因、规则或验证，不允许审阅晋升
blocked_sensitive 检出密钥、Token、Cookie、密码或私钥；摘录脱敏并禁止审阅
ready_for_review  字段完整，等待人工决定
needs_re_review   原文在上次摄取后变化，旧审阅不能沿用
project_only      人工确认只留项目
rejected          人工拒绝
approved_for_profile  通过跨项目/高影响纠正门禁，尚未发布
published         已按候选ID幂等写入LEARNINGS.md
```

推荐命令：

```bash
xixi-dev-system learning harvest --owner xixinikl \
  --project /path/to/project \
  --registry /path/to/project/.xds/learning/registry.json

xixi-dev-system learning review --owner xixinikl \
  --registry /path/to/registry.json \
  --candidate-id <id> --decision promote \
  --reviewer "Profile owner" --reason "重复或高影响" \
  --impact high --scope "适用项目" \
  --rule "可执行规则" --verification "直接验证" \
  --owner-corrected

xixi-dev-system learning publish --owner xixinikl \
  --registry /path/to/registry.json --candidate-id <id> \
  --profile /path/to/xixi-agent-profile
```

`review`不会写Profile，`publish`只接受已审阅的`approved_for_profile`候选，并用候选ID防止重复发布。

## 已验证的长期规则

### 完成必须由同范围证据证明

单元测试只能证明被覆盖的单元，静态Demo不能证明真实数据或真实AI，页面无报错不能证明刷新、权限和用户隔离。旧状态与当前事实冲突时，要明确标记旧内容已被取代。

### 高风险资料加工必须声明来源层级

对扫描件、题库、媒体或其他易失真资料：结构化解析优先；OCR可用于定位但不能自动成为事实源；高风险字段要回到原始证据核验；派生数据先隔离再发布。题目作答图与解析辅助图是不同媒体合同，不得互相替代。

此规则不适用于可由可靠结构化解析器无损读取的普通文件。

### 产品模型不清时先停止界面补丁

当用户无法解释下一步、两个按钮语义重叠、同层与下一层混淆，或每次反馈都增加更多控件时，先冻结状态模型、主路径和转换合同，再调整界面。稳定模型下的局部间距或对比度问题仍可直接修复。

### 零状态是必须测试的终态

队列、告警、待修项或任务可以合法为0。自动化应覆盖空、部分和完成三种状态；只有合同明确要求至少一个输入时，空状态才是错误。

### 交接是事实合同

交接必须区分已实现、已验证、未验证、下一步和风险，并标明权威事实源与已被取代的旧结论。聊天摘要只能辅助定位，不能覆盖仓库事实。

## 周期性成长

推荐周复盘顺序：

1. owner-scoped本机项目发现；
2. 为选定来源项目生成只读证据组合包；
3. 查看重复、高影响或用户多次纠正的问题；
4. 形成候选而不是直接晋升；
5. 决定写项目、Profile还是系统；
6. 为可自动执行的规则补测试；
7. 审阅后提交并推送对应仓库。

系统不能靠“收集更多文字”变强；成长必须表现为更准确的范围、更清楚的合同、更强的门禁或更少的重复错误。
