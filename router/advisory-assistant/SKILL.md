# 投顾服务主路由器

接收用户请求，路由到最合适的技能。

## 路由规则

### 完整流程（编排器）

| 用户意图 | 路由目标 |
|---------|---------|
| "新客户" / "开户" / "投顾流程" | `advisory-orchestrator` |
| "帮我走一遍投顾流程" | `advisory-orchestrator` |

### 单技能路由

| 用户意图 | 路由目标 |
|---------|---------|
| "了解客户" / "KYC" / "访谈" | `skills/kyc-interview` |
| "风险测评" / "风险等级" | `skills/risk-assessment` |
| "资产配置" / "怎么配置" | `skills/asset-allocation` |
| "养老金" / "教育金" / "规划" | `skills/pension-planning` |
| "筛选基金" / "选基金" / "公募" | `skills/public-fund-screening` |
| "私募" / "信托" / "产品评估" | `skills/private-fund-evaluation` |
| "构建组合" / "组合权重" | `skills/portfolio-construction` |
| "适当性" / "合规" | `skills/suitability-management` |
| "绩效回顾" / "归因" / "报告" | `skills/performance-review` |
| "市场沟通" / "安抚客户" / "波动" | `skills/investment-communication` |
| "客户生命周期" / "客户管理" | `skills/client-lifecycle-management` |
| "流失预警" / "防止流失" | `skills/churn-prevention` |
| 其他 | 返回"请告诉我你想做什么：KYC、资产配置、筛选产品、还是做绩效回顾？" |

## 输出

JSON格式：
```json
{
  "intent": "...",
  "skill": "...",
  "params": {}
}
```

**注意:** 当路由到 `advisory-orchestrator` 时，输出格式不变，由 orchestrator 内部处理完整 pipeline。

## 层级说明

```
advisory-assistant（主路由器）
├── orchestrator-route → 完整流程
│   └── advisory-orchestrator（流程编排器）
├── kyc-route → 客户理解
│   ├── kyc-interview（KYC深度访谈）
│   └── risk-assessment（风险测评）
├── allocation-route → 资产配置
│   ├── asset-allocation（配置方案）
│   └── pension-planning（养老/教育金规划）
├── product-route → 产品筛选
│   ├── public-fund-screening（公募基金筛选）
│   └── private-fund-evaluation（私募/信托评估）
├── portfolio-route → 组合管理
│   ├── portfolio-construction（组合构建）
│   └── suitability-management（适当性管理）
├── post-investment-route → 投后服务
│   ├── performance-review（绩效回顾）
│   └── investment-communication（投资沟通）
└── crm-route → 客户关系
    ├── client-lifecycle-management（生命周期管理）
    ├── volatility-communication（波动沟通）
    └── churn-prevention（流失预警）
```

## 使用场景

| 用户需求 | 使用路由 |
|----------|---------|
| "新客户李女士500万，做投顾服务" | → orchestrator |
| "帮我做个KYC" | → kyc-interview |
| "筛选几只沪深300基金" | → public-fund-screening |
| "客户亏损了怎么安抚" | → investment-communication |
| "检查一下有没有客户要流失" | → churn-prevention |
