# Investment Advisory Skills（投顾技能仓库）

## 项目概述

投顾（Investment Advisory）服务商的 AI 技能系统，覆盖从客户了解（KYC）到投资建议、组合管理、合规沟通的完整服务流程。

## 三层架构

```
┌─────────────────────────────────────────────────────────┐
│  Discipline Layer (纪律层) — Hard Gates                │
│  7个硬性门禁，防止不当推荐和合规风险                   │
├─────────────────────────────────────────────────────────┤
│  Execution Layer (执行层) — Roles & Pipeline          │
│  6个角色 + 循环服务流程                                │
├─────────────────────────────────────────────────────────┤
│  Knowledge Layer (知识层) — Skills                     │
│  13个核心技能，覆盖客户生命周期全阶段：                │
│  获客/建仓(8) + 投后(3) + 客户管理(2)               │
└─────────────────────────────────────────────────────────┘
```

## 目录结构

```
investment-advisory-skills/
├── CLAUDE.md              # 本文件
├── README.md              # 快速开始（用户版）
├── feedback-loop.md       # 用户反馈与迭代机制
├── pipeline.md            # 执行层：完整服务循环流程
├── orchestrator/          # 执行层：流程编排器
│   └── advisory-orchestrator.md  # 读取pipeline，编排skills，触发Gates
├── router/                # 执行层：主路由器
│   └── advisory-assistant/  # 自然语言 → 路由到对应skill
├── roles/                 # 执行层：6个角色
│   ├── ceo.md            # 投顾总监（定策略）
│   ├── em.md              # 资深投顾（任务分解）
│   ├── engineer.md        # 投顾助理（执行分析）
│   ├── qa.md              # 合规专员（适当性复核）
│   ├── release.md         # 客户经理（交付/收款）
│   └── devops.md          # 产品研究（数据维护）
├── gates/                 # 纪律层：7个门禁
│   ├── gate-1-kyc.md     # KYC完整性门禁
│   ├── gate-2-appropriateness.md  # 适当性匹配门禁
│   ├── gate-3-risk-disclosure.md   # 风险揭示完整性门禁
│   ├── gate-4-concentration.md     # 组合集中度门禁
│   ├── gate-5-turnover.md          # 换手率预警门禁
│   ├── gate-6-fee-transparency.md  # 收费透明度门禁
│   └── gate-7-historical-performance.md  # 历史业绩合规门禁
└── skills/                # 知识层：13个核心技能
    ├── kyc-interview/    # KYC深度访谈
    ├── risk-assessment/  # 风险测评与解读
    ├── asset-allocation/ # 大类资产配置
    ├── pension-planning/ # 养老金/教育金规划
    ├── public-fund-screening/  # 公募基金筛选
    ├── private-fund-evaluation/  # 私募/信托产品评估
    ├── portfolio-construction/   # 组合构建
    ├── suitability-management/    # 适当性管理
    ├── performance-review/        # 绩效回顾与报告
    ├── investment-communication/  # 投资陪伴与市场沟通
    ├── client-lifecycle-management/  # 客户生命周期管理
    ├── volatility-communication/  # 波动阶段市场沟通
    └── churn-prevention/         # 流失预警与挽回
```

## 核心原则

1. **适当性优先** — 产品风险等级必须 ≤ 客户风险等级
2. **风险对称** — 上涨理由和下跌风险必须同时披露
3. **收费透明** — 所有费用必须明确告知客户
4. **决策留痕** — 所有建议必须有完整记录

## 服务流程（循环）

```
┌─────────────────────────────────────────────────────────────┐
│ STEP 1: KYC + 风险测评（CEO角色）                           │
│    ↓ Gate 1: KYC完整性检查                                  │
│ STEP 2: 资产配置方案（EM + Engineer）                        │
│    ↓ 调用 skills: 资产配置, 养老金规划                        │
│ STEP 3: 产品筛选与组合构建（Engineer）                        │
│    ↓ 调用 skills: 公募筛选, 私募评估, 组合构建              │
│    ↓ Gate 2: 适当性匹配检查                                 │
│ STEP 4: 适当性复核（QA角色）                                 │
│    ↓ Gate 3: 风险揭示完整性检查                              │
│ STEP 5: 建议书交付（Release角色）                            │
│    ↓ Gate 4: 组合集中度检查, Gate 5: 换手率预警             │
│ STEP 6: 投后陪伴（循环）                                    │
│    ↓ 调用 skills: 绩效回顾, 投资沟通                         │
│    ↓ Gate 6: 收费透明度, Gate 7: 历史业绩合规               │
│    ↓ 每周期回到 STEP 1（KYC更新）                           │
└─────────────────────────────────────────────────────────────┘
```

## 与 investment-skills（投研）的区别

| 维度 | 投研 (investment-skills) | 投顾 (investment-advisory) |
|------|-------------------------|---------------------------|
| 目标 | 内部投资研究 | 对外部客户的顾问服务 |
| 流程 | 项目制（做完结束） | 持续服务（长期陪伴） |
| 核心产出 | 研报、交易决策 | 投资建议书、客户报告 |
| 关键约束 | 数据准确、假设验证 | 适当性、合规披露 |
| 服务对象 | 投资团队内部 | 外部客户 |

## 使用方式

| 任务 | 使用方式 |
|------|---------|
| 新客户KYC | 调用 `skills/kyc-interview` |
| 风险测评 | 调用 `skills/risk-assessment` |
| 资产配置 | 调用 `skills/asset-allocation` |
| 产品筛选 | 调用 `skills/public-fund-screening` / `private-fund-evaluation` |
| 组合构建 | 调用 `skills/portfolio-construction` |
| 投后报告 | 调用 `skills/performance-review` |
| 完整服务流程 | 按 `pipeline.md` 执行，触发所有 `gates/` |
