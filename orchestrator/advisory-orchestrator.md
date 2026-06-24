# 投顾服务流程编排器

编排完整投顾服务流程，协调 skills 执行和 Gate 检查。

**核心原则：** 执行 pipeline，不遗漏任何 Gate。

## 触发条件

当用户请求：
- "新客户" / "开户" / "做投顾"
- "完整投顾流程"
- "帮我走一遍从KYC到建议书"
- 任何需要多 skill 协作的完整投顾请求

**不使用时：** 用户只做单个任务（"帮我筛选基金"→直接路由到 public-fund-screening）

## Pipeline 读取

首先读取 `../pipeline.md` 获取完整流程：

```
Stage 1: KYC + 风险测评
Stage 2: 资产配置方案
Stage 3: 产品筛选
Stage 4: 组合构建
Stage 5: 适当性复核
Stage 6: 建议书交付
Stage 7: 投后陪伴
```

## 执行流程

### Stage 1: KYC + 风险测评

**输入:** 新客户基本信息

**执行:**
1. 调用 `skills/kyc-interview` — 收集客户信息
2. 调用 `skills/risk-assessment` — 风险测评
3. CEO role 确认风险等级

**Gate 1 检查:**
- [ ] 投资目标已填写
- [ ] 投资期限已明确
- [ ] 流动性需求已评估
- [ ] 风险偏好已确认
- [ ] 投资经验已记录

**通过 → Stage 2**

---

### Stage 2: 资产配置方案

**输入:** Stage 1 的客户画像

**执行:**
1. 调用 `skills/asset-allocation` — 大类资产配置
2. 如有养老/教育金需求，调用 `skills/pension-planning`

**EM role 分配任务**

**通过 → Stage 3**

---

### Stage 3: 产品筛选

**输入:** Stage 2 的配置方案

**执行:**
1. 调用 `skills/public-fund-screening` — 公募基金筛选
2. 如有私募需求，调用 `skills/private-fund-evaluation`

**通过 → Stage 4**

---

### Stage 4: 组合构建

**输入:** Stage 3 的候选产品

**执行:**
1. 调用 `skills/portfolio-construction` — 组合构建

**Gate 2 检查:**
- [ ] 产品风险等级 ≤ 客户风险等级

**通过 → Stage 5**

---

### Stage 5: 适当性复核

**输入:** Stage 4 的组合方案

**执行:**
1. QA role 调用 `skills/suitability-management` — 适当性复核

**Gate 3 检查:**
- [ ] 风险揭示书完整
- [ ] 所有产品特有风险已披露

**Gate 4 检查:**
- [ ] 单一产品占比未超限
- [ ] 单一资产类别占比未超限

**通过 → Stage 6**

---

### Stage 6: 建议书交付

**输入:** Stage 5 的复核通过意见

**执行:**
1. Release role 整合建议书
2. 向客户交付

**Gate 5 检查:**
- [ ] 换手率是否过高

**Gate 6 检查:**
- [ ] 费用表完整（申购/管理/业绩报酬/赎回）

**Gate 7 检查:**
- [ ] 历史业绩引用已标注合规声明

**客户签署确认 → Stage 7**

---

### Stage 7: 投后陪伴

**输入:** 客户签署确认

**执行:**
1. 启动定期报告流程
2. 调用 `skills/client-lifecycle-management` — 管理客户生命周期
3. 市场波动时调用 `skills/volatility-communication`
4. 定期调用 `skills/performance-review`

**每次客户沟通后:**
- 更新 KYC（如有变化）
- 检查流失预警
- 回到 Stage 1（如需调整配置）

## 输出格式

```json
{
  "stage": "Stage 6: 建议书交付",
  "status": "completed | pending_gate | blocked",
  "gate_checks": {
    "gate_1": {"passed": true, "notes": "KYC完成"},
    "gate_2": {"passed": true, "notes": "适当性匹配"},
    "gate_3": {"passed": true, "notes": "风险揭示完整"},
    "gate_4": {"passed": true, "notes": "集中度合规"},
    "gate_5": {"passed": true, "notes": "换手率正常"},
    "gate_6": {"passed": true, "notes": "费用已披露"},
    "gate_7": {"passed": true, "notes": "历史业绩合规"}
  },
  "customer_id": "kyc_xxx",
  "risk_level": "C3",
  "portfolio": {
    "total_amount": 10000000,
    "holdings": [...]
  },
  "documents": {
    "investment_proposal": "已生成",
    "risk_disclosure": "已签署",
    "suitability_confirmation": "已签署"
  },
  "next_steps": "进入投后陪伴阶段"
}
```

## Gate 检查规则

| Gate | 触发时机 | 未通过 |
|------|----------|-------|
| Gate 1 | Stage 1 结束后 | 返回补充KYC信息 |
| Gate 2 | Stage 4 结束后 | 返回调整产品/降级风险 |
| Gate 3 | Stage 5 结束后 | 返回补充风险揭示 |
| Gate 4 | Stage 5 结束后 | 返回分散组合 |
| Gate 5 | Stage 6 之前 | 提示换手率风险 |
| Gate 6 | Stage 6 之前 | 返回补充费用披露 |
| Gate 7 | Stage 6 之前 | 自动追加合规声明 |

## 错误处理

| 错误 | 处理 |
|------|------|
| Stage 执行失败 | 记录错误，继续下一 Stage（或中止，取决于 Gate） |
| Gate 未通过 | 输出未通过原因 + 需要补充什么 |
| Skill 路由失败 | 尝试直接调用 skill，或返回"暂不支持该分析类型" |

## 与 advisory-assistant 的关系

```
advisory-assistant
    ↓ 读取 pipeline.md
    ↓ 调用 advisory-assistant（多次）
        ↓ 路由到具体 skills
    ↓ 触发 Gate 检查
    ↓ 汇总结果
```

**注意:** orchestrator 不做具体分析，委托给 skills 执行。
