---
name: kyc-interview
description: Use when collecting customer information — KYC interviews, risk assessment, generating customer profiles for investment advisory services.
version: 1.0.0
stage: prod
trigger:
  - "新建客户"
  - "了解客户"
  - "KYC"
  - "风险评估"
  - "客户尽调"
  - "风险测评"
---

# KYC 深度访谈 (KYC Interview)

## Overview

通过结构化提问了解客户的投资目标、期限、流动性需求、风险偏好和投资经验，生成完整客户画像。

**核心定位**：投顾服务的起点，决定后续所有方案的基准。

## When to Use

- 新客户开户
- 老客户年度复访
- 客户重大信息变更（婚姻、继承、职业变化等）

## 访谈框架

### 维度一：基本信息

| 问题 | 目的 | 字段 |
|------|------|------|
| 姓名/年龄/职业 | 基础画像 | personal_info |
| 家庭状况 | 责任负担 | family_status |
| 资产规模/可投资资产 | 方案规模 | investable_assets |

### 维度二：投资目标

| 问题 | 目的 | 字段 |
|------|------|------|
| 投资的主要目的是什么？ | 保值/增值/养老/子女教育 | investment_goals |
| 预期收益范围是多少？ | 设定合理预期 | expected_return |
| 有没有具体的财务目标？ | 量化目标 | financial_targets |

### 维度三：投资期限

| 问题 | 目的 | 字段 |
|------|------|------|
| 这笔钱可以放多久不用？ | 封闭期接受度 | investment_horizon |
| 什么时候可能需要用到这笔钱？ | 流动性规划 | liquidity_needs |
| 分阶段的目标还是一次性？ | 资金安排 | fund_stages |

### 维度四：流动性需求

| 问题 | 目的 | 字段 |
|------|------|------|
| 近期（1年内）有大额支出计划吗？ | 资金缺口 | large_expenses |
| 月/年固定支出多少？ | 现金流 | cash_flow |
| 应急资金准备情况？ | 风险缓冲 | emergency_fund |

### 维度五：风险偏好

| 问题 | 目的 | 字段 |
|------|------|------|
| 能接受多大的本金损失？ | 亏损容忍度 | loss_tolerance |
| 市场下跌时你会怎么做？ | 行为特征 | behavior_under_loss |
| 偏好稳定收益还是高波动高收益？ | 收益预期 | return_preference |

### 维度六：投资经验

| 问题 | 目的 | 字段 |
|------|------|------|
| 投资过哪些产品？ | 经验范围 | experience_products |
| 持有过多长时间？ | 持有习惯 | holding_period |
| 最长一次亏损多少？ | 实际风险承受 | actual_loss |
| 对哪些产品比较了解？ | 能力圈 | knowledge_areas |

## 输出格式

```json
{
  "customer_id": "kyc_xxx",
  "status": "complete | partial",
  "profile": {
    "personal_info": {
      "name": "张三",
      "age": 45,
      "occupation": "企业主",
      "family_status": "已婚，子女2人"
    },
    "investment_goals": ["资产增值", "养老储备"],
    "expected_return": "8-12%",
    "investment_horizon": "5年以上",
    "liquidity_needs": "短期内无大额支出",
    "loss_tolerance": "最大可接受30%回撤",
    "risk_level": "C4（成长型）",
    "experience": {
      "years": 10,
      "products": ["股票", "基金", "银行理财"],
      "knowledge_level": "中等"
    }
  },
  "kyc_complete": true,
  "customer_confirmed": false
}
```

## 访谈技巧

1. **先听后问**：让客户先说，再针对性追问
2. **量化优先**：把"能承受一些风险"变成"最多能接受多少亏损"
3. **行为探测**：不问"你觉得"而问"你会怎么做"
4. **家庭维度**：重大决策是否与家人商量

## 与其他Skills的关系

| Skill | 后续位置 |
|-------|---------|
| risk-assessment | 基于KYC信息进行风险测评 |
| asset-allocation | 基于风险等级确定配置方向 |
| suitability-management | 验证产品与客户匹配 |

## 合规要求

- 必须获取客户书面确认
- 信息变更需重新确认
- 客户拒绝提供的信息需记录

## Example

**访谈记录示例：**

客户：张先生，45岁，企业主，可投资资产3000万

| 问题 | 客户回答 | 提取字段 |
|------|---------|---------|
| 投资目标 | "资产保值增值，5年内不用的钱" | investment_goals: 资产增值 |
| 投资期限 | "5年以上" | investment_horizon: 5年以上 |
| 亏损容忍 | "最多接受30%，再跌就睡不着了" | loss_tolerance: 30% |
| 投资经验 | "做过股票基金，15年了" | experience: 15年，股票/基金 |
| 流动性 | "2年内可能买套房" | liquidity_needs: 有大额支出计划 |

**输出：**
```json
{
  "customer_id": "kyc_001",
  "profile": {
    "name": "张先生",
    "age": 45,
    "risk_level": "C4",
    "investment_horizon": "5年以上",
    "loss_tolerance": "30%",
    "investable_assets": 30000000
  }
}
```
