---
name: client-lifecycle-management
description: Use when managing client relationships across lifecycle — onboarding, post-investment, volatility handling, periodic reviews.
version: 1.0.0
stage: prod
trigger:
  - "客户生命周期"
  - "客户管理"
  - "客户关系"
  - "获客"
  - "老客户"
---

# 客户生命周期管理 (Client Lifecycle Management)

## Overview

覆盖投顾服务全生命周期的客户管理，从获客到流失预防。

**核心定位**：以客户为中心，串联获客 → 建仓 → 投后 → 波动 → 定期各阶段。

## When to Use

- 新客户开发
- 现有客户定期维护
- 市场波动时主动触达
- 客户关系异常预警
- 年度KYC更新

## 用户生命周期阶段

```
┌─────────────────────────────────────────────────────────────────┐
│  获客阶段   →   建仓阶段   →   投后阶段   →   波动阶段   →   定期回顾 │
│  Lead gen      KYC+配置       定期报告      市场沟通       年度复盘   │
│      ↓              ↓             ↓             ↓             ↓      │
│  客户识别      Gate 1-4       Gate 5-7      主动触达       KYC更新   │
└─────────────────────────────────────────────────────────────────┘
```

## 阶段详解

### 1. 获客阶段

**触发条件**：
- 新客户初步接触
- 客户转介绍
- 营销活动引流

**职责**：
- 客户识别与资格初筛
- 初步需求了解
- 投顾服务介绍
- 预约首次面谈

**输出**：
- 潜在客户档案
- 需求预判
- 服务方案初稿

### 2. 建仓阶段

**触发条件**：
- 客户签署投顾协议
- 完成KYC

**职责**：
- 完整KYC + 风险测评
- 资产配置方案
- 产品筛选 + 组合构建
- 适当性复核
- 建议书交付

**Gate检查**：
- Gate 1: KYC完整性
- Gate 2: 适当性匹配
- Gate 3: 风险揭示
- Gate 4: 集中度

### 3. 投后阶段

**触发条件**：
- 组合建仓完成
- 定期（周/月/季/年）

**职责**：
- 持仓监控
- 绩效归因分析
- 定期报告生成
- 再平衡建议

**Gate检查**：
- Gate 5: 换手率
- Gate 6: 收费透明
- Gate 7: 历史业绩合规

### 4. 波动阶段

**触发条件**：
- 市场异动（涨/跌超阈值）
- 持仓产品发生重大事件
- 客户主动询问

**职责**：
- 事件解读（三把尺子：不可逆性/影响半径/认知时差）
- 客户情绪安抚
- 策略解释 + 应对说明
- 必要时调仓建议

**沟通模板**：
- 上涨安抚：防止盲目乐观
- 下跌安抚：理性分析，避免恐慌
- 震荡沟通：保持信心，定期检视

### 5. 流失预警

**触发条件**：
- 客户沉默超期
- 收益率持续不达预期
- 客户投诉/抱怨
- 转介绍率下降

**预警信号**：
- 30天未互动
- 收益率低于基准超20%
- 客户主动询问"取出资金"
- 投诉记录

**应对策略**：
- 优先回访计划
- 高层介入
- 个性化安抚方案

## 客户分类管理

| 客户类型 | 沟通频率 | 服务重点 |
|---------|---------|---------|
| 新客户（<3月） | 每周 | 建仓指导，预期管理 |
| 稳健型（低风险） | 每月 | 定期报告，市场波动主动触达 |
| 活跃型（高风险） | 每季 | 绩效归因，策略回顾 |
| 高净值（专属） | 按需+每季 | 个性化服务 |
| 预警客户 | 立即 | 留存优先 |

## 与其他Skills的关系

| Skill | 在生命周期中的位置 |
|-------|-------------------|
| kyc-interview | 获客 → 建仓 |
| risk-assessment | 建仓 |
| asset-allocation | 建仓 |
| public-fund-screening | 建仓 |
| private-fund-evaluation | 建仓 |
| portfolio-construction | 建仓 |
| suitability-management | 建仓（Gate 2） |
| performance-review | 投后 |
| investment-communication | 波动阶段 |
| churn-prevention | 流失预警 |

## Output Format

```json
{
  "customer_id": "xxx",
  "lifecycle_stage": "onboarding | post_investment | volatility | periodic | churn_risk",
  "last_interaction": "2026-06-01",
  "next_action": {
    "type": "review | communication | rebalance | retention",
    "priority": "high | medium | low",
    "due_date": "2026-06-07"
  },
  "risk_signals": ["30d_silent", "underperformance"]
}
```

## Example

**客户生命周期状态示例：**

张先生，2024年1月开户，3000万，C3客户

**生命周期进展：**
| 阶段 | 时间 | 状态 |
|------|------|------|
| 获客 | 2024-01 | ✅ 完成 |
| 建仓 | 2024-01~03 | ✅ 完成 |
| 投后 | 2024-04~ | 进行中 |
| 当前 | 2026-06 | 投后稳定 |

**当前状态：**
```json
{
  "customer_id": "kyc_001",
  "lifecycle_stage": "post_investment",
  "last_interaction": "2026-06-01",
  "next_action": {
    "type": "periodic_review",
    "priority": "medium",
    "due_date": "2026-09-30"
  },
  "risk_signals": []
}
```

**预警场景示例：**

客户李女士，60天无互动，触发黄色预警

```json
{
  "customer_id": "kyc_002",
  "lifecycle_stage": "churn_risk",
  "last_interaction": "2026-04-01",
  "next_action": {
    "type": "retention",
    "priority": "high",
    "due_date": "2026-06-25"
  },
  "risk_signals": ["60d_silent", "underperformance_10pct"]
}
```

**流失预防处理流程：**
1. 识别预警 → 分配资深投顾
2. 24小时内电话触达
3. 了解不满原因
4. 制定留存方案
5. 记录并跟踪
