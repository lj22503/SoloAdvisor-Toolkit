# 一人投顾工具包

> 让独立理财师用AI提供专业投顾服务，从KYC到投后管理，全流程标准化。

## 解决什么问题？

独立理财师面临三大挑战：

| 挑战 | 现状 | 用这个skill |
|------|------|------------|
| **合规风险高** | 适当性匹配、风险揭示容易漏项 | 7个Gate自动检查，漏项拦截 |
| **客户多跟不过来** | 靠脑子记，谁该联系谁快流失了 | 客户生命周期管理 + 流失预警 |
| **每次从零开始** | KYC/配置/报告每次重头来 | 13个Skills模板化，填空就用 |

## 适用对象

- 独立理财师 / 独立投顾
- 小型财富管理团队
- 想要标准化投顾服务的券商/银行个金部门

## 核心功能

### 1. 投顾全流程（7步）

```
KYC → 风险测评 → 资产配置 → 产品筛选 → 组合构建 → 适当性复核 → 投后报告
  ↓          ↓           ↓           ↓           ↓           ↓         ↓
Gate1      Gate2      Gate3       Gate4      Gate5       Gate6    Gate7
```

### 2. 13个可复用技能

| 阶段 | 技能 | 用途 |
|------|------|------|
| 建仓前 | kyc-interview | 结构化收集客户信息 |
| | risk-assessment | 量化风险等级（C1-C5）|
| | asset-allocation | 股/债/商品配置方案 |
| | pension-planning | 养老/教育金规划 |
| | public-fund-screening | 筛选公募基金 |
| | private-fund-evaluation | 评估私募/信托 |
| | suitability-management | 适当性检查 |
| 建仓后 | portfolio-construction | 构建组合 |
| | performance-review | 归因分析 + 报告 |
| | investment-communication | 定期/波动时沟通 |
| | client-lifecycle-management | 全周期客户管理 |
| | volatility-communication | 波动场景专项沟通 |
| | churn-prevention | 流失预警 + 挽回 |

### 3. 7个合规门禁

| Gate | 检查什么 | 拦截强度 |
|------|---------|---------|
| Gate 1 | KYC五项是否完整 | HARD |
| Gate 2 | 产品风险 ≤ 客户风险 | **SUPER-HARD** |
| Gate 3 | 风险揭示是否完整 | HARD |
| Gate 4 | 单一产品占比超限 | MEDIUM |
| Gate 5 | 换手率是否过高 | SOFT |
| Gate 6 | 费用是否完整披露 | HARD |
| Gate 7 | 历史业绩是否标注合规声明 | HARD |

## 快速开始

### 安装

```bash
# 方式1：运行安装脚本
git clone <仓库地址> investment-advisory-skills
cd investment-advisory-skills
bash install.sh

# 方式2：手动安装
# 1. Clone仓库
git clone <仓库地址> investment-advisory-skills

# 2. 在项目CLAUDE.md中添加引用
# 在你的项目CLAUDE.md中加入：
# 使用 investment-advisory-skills 处理投顾任务

# 3. 或配置 skills_dir
# 在 .claude/settings.json 中：
# { "skills_dir": "/path/to/investment-advisory-skills/skills" }
```

### 使用方式

**方式1：完整流程（新客户开户）**

```
用户：帮我服务一个新客户，李女士，500万可投资资产
AI：自动走完KYC→配置→筛选→组合→合规复核全流程
```

**方式2：单技能调用**

```
用户：帮我做个KYC访谈
AI：调用 kyc-interview，按模板提问，生成客户画像

用户：筛选几只沪深300基金
AI：调用 public-fund-screening，输出评分表

用户：客户亏钱了怎么安抚
AI：调用 investment-communication，输出话术模板
```

**方式3：投后管理**

```
用户：检查一下有没有客户要流失了
AI：调用 churn-prevention，扫描预警客户列表
```

## 典型使用场景

### 场景A：新客户开户（30分钟→5分钟）

```
原来：翻文档/问问题/手填表格/算风险等级
现在：AI引导访谈 → 自动生成客户画像 → 自动计算风险等级
      ↓
     自动触发Gate1检查，五项不全AI会拦截
```

### 场景B：产品推荐（1小时→10分钟）

```
原来：翻基金库/对比指标/写推荐理由/检查适当性
现在：输入客户风险等级 → AI筛选候选基金 → 自动评分排序
      ↓
     自动触发Gate2（适当性）+ Gate3（风险揭示）检查
```

### 场景C：季度客户回顾

```
原来：拉净值/算收益/写报告/担心客户流失
现在：AI自动归因分析 → 生成报告模板 → 输出沟通话术
      ↓
     同时检查流失预警，主动提示需要关注的客户
```

## 用户个性化扩展

每个Skill支持用户自定义扩展：

### 1. 自定义Trigger

在Skill的trigger中追加你的常用说法：

```yaml
trigger:
  - "筛选基金"      # 原有
  - "帮我选基"       # 你自定义
  - "基金怎么挑"     # 你自定义
```

### 2. 自定义模板

在Skill的Example章节追加你自己的案例，形成私有知识库。

### 3. 调整Gate阈值

| Gate | 原阈值 | 可调整范围 |
|------|--------|-----------|
| Gate 4 集中度 | 单产品<30% | 按你的客户风险偏好调整 |
| Gate 5 换手率 | 年换手<200% | 按策略风格调整 |

## 反馈与迭代

遇到问题或有好想法？

1. 打开 `feedback-loop.md` 记录反馈
2. 格式：场景 → 问题 → 建议
3. 可自行更新Skill或等待社区更新

**反馈类型：**
- Skill不匹配你的说法 → 更新trigger
- 模板缺失 → 补充Example
- 新场景覆盖不了 → 新增Skill

## 免责声明

- 本skill是辅助工具，不能替代投顾的专业判断
- 合规检查是提示性质，最终合规责任由持牌投顾承担
- 历史业绩数据需自行核实，AI输出的业绩数据需标注"过往不代表未来"

## 🔗 工具链联动

本仓库是 FinAI 工具生态的一部分，与其他仓库协作：

| 仓库 | 定位 | 与本仓库的关系 |
|------|------|---------------|
| [awesome-finai-tools-zn](https://github.com/lj22503/awesome-finai-tools-zn) | 数据底座 | 提供工具清单+机构Skill数据 |
| [invest-brain](https://github.com/lj22503/invest-brain) | 工具推荐引擎 | 基于场景自动推荐工具 |
| [investment-buddy-pet](https://github.com/lj22503/investment-buddy-pet) | 人格化投顾 | 按投资人格匹配工具箱 |
| [SoloAdvisor-Toolkit](https://github.com/lj22503/SoloAdvisor-Toolkit) | 投顾流程工具包 | KYC→配置→组合→报告 |
| [knowledge-workflow](https://github.com/lj22503/knowledge-workflow) | 知识管理 | 收集→打标→存储→产出 |

## 授权

MIT License — 可免费使用，商用请注明来源

## 技能来源说明

本skill借鉴了以下开源项目的格式和思路：
- pm-skills（产品管理技能库）
- gstack（角色驱动工程团队）
- Superpowers（AI编程纪律框架）

---

**Q：这个skill能帮我获客吗？**

A：不能直接获客，但能提升服务质量（标准化流程、专业报告、合规保障），间接提升转介绍率。

**Q：需要什么资质才能用？**

A：需要有投顾相关资质（基金从业资格/投顾牌照），本skill是辅助工具，不是替代品。

**Q：数据存在哪里？**

A：本skill不存储数据，只提供方法论模板。客户数据请按监管要求存储。
