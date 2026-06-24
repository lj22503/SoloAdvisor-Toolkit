# 投顾服务 Pipeline

## 完整服务循环

```
┌─────────────────────────────────────────────────────────────────────┐
│                        DISCIPLINE LAYER (Gates)                      │
│   Gate 1: KYC   →   Gate 2: Appropriateness   →   Gate 3: Risk     │
│                                       →   Gate 4: Concentration     │
│                                       →   Gate 5: Turnover          │
│                                       →   Gate 6: Fee Transparency  │
│                                       →   Gate 7: Historical Perf    │
│                                                                     │
│                        EXECUTION LAYER                              │
│   CEO   →   EM   →   Engineer   →   QA   →   Release   →   DevOps  │
│                                                                     │
│                        KNOWLEDGE LAYER                              │
│   KYCInterview → RiskAssessment → AssetAllocation → ProductScreening │
│   → PortfolioConstruction → PerformanceReview → Communication       │
│                                                                     │
│                        FEEDBACK LAYER                               │
│   每次客户沟通后 → 更新KYC → 回到 STEP 1                             │
└─────────────────────────────────────────────────────────────────────┘
```

## Stage 1: KYC + 风险测评

| 触发条件 | 角色 | 输出 |
|----------|------|------|
| 新客户开户 | CEO 发起 | 完整客户档案 |
| 老客户年度复访 | EM 分配 | 更新的客户档案 |

**使用的 Skills:**
- `skills/kyc-interview` — 结构化信息收集
- `skills/risk-assessment` — 风险等级判定

**Gate 1 检查点:** KYC信息是否完整？（投资目标/期限/流动性/风险偏好/经验）

---

## Stage 2: 资产配置方案

| 触发条件 | 角色 | 输出 |
|----------|------|------|
| KYC完成 | EM 分配 | 资产配置建议书 |
| 定期调整 | CEO 指令 | 配置调整方案 |

**使用的 Skills:**
- `skills/asset-allocation` — SAA/TAA战略战术配置
- `skills/pension-planning` — 养老/教育金专项规划

---

## Stage 3: 产品筛选

| 触发条件 | 角色 | 输出 |
|----------|------|------|
| 配置方案确定 | EM 分配 | 候选产品列表 |
| 产品池更新 | DevOps 触发 | 产品评估报告 |

**使用的 Skills:**
- `skills/public-fund-screening` — 公募基金筛选
- `skills/private-fund-evaluation` — 私募/信托评估

---

## Stage 4: 组合构建

| 触发条件 | 角色 | 输出 |
|----------|------|------|
| 产品筛选完成 | Engineer 执行 | 组合构建方案 |
| 再平衡触发 | PM 指令 | 调仓方案 |

**使用的 Skills:**
- `skills/portfolio-construction` — 权重分配/再平衡

**Gate 2 检查点:** 产品风险等级是否 ≤ 客户风险等级？

---

## Stage 5: 适当性复核

| 触发条件 | 角色 | 输出 |
|----------|------|------|
| 组合构建完成 | QA 发起 | 合规复核意见 |
| 调仓前 | Compliance 触发 | 调仓合规确认 |

**Gate 3 检查点:** 风险揭示书是否完整？
**Gate 4 检查点:** 单一产品/资产占比是否超限？

---

## Stage 6: 建议书交付

| 触发条件 | 角色 | 输出 |
|----------|------|------|
| 复核通过 | Release 执行 | 投资建议书 |
| 客户确认 | Release 执行 | 签署记录 |

**Gate 5 检查点:** 换手率是否过高？
**Gate 6 检查点:** 所有费用是否披露？

---

## Stage 7: 投后陪伴

| 触发条件 | 角色 | 输出 |
|----------|------|------|
| 定期（季/年） | PM 发起 | 绩效报告 |
| 市场异动 | CEO 指令 | 市场沟通函 |

**使用的 Skills:**
- `skills/performance-review` — 归因分析/报告生成
- `skills/investment-communication` — 波动沟通/投资者教育

**Gate 7 检查点:** 历史业绩引用是否标注合规声明？

---

## 并行任务

以下任务可以并行执行：
- 多个产品同时评估
- 配置方案与产品筛选并行（EM协调）
- 绩效归因与市场研究并行

## 反馈循环

```
客户持仓监控 → 重大事件 → 更新KYC → 配置复审 → 新一轮服务
                                         ↓
                                    触发 Skill 更新
```

**每季度:** KYC更新检查
**每年:** 完整服务复盘 + Skill迭代

## 门禁通过条件

| 门禁 | 通过条件 |
|------|---------|
| Gate 1 | 5个KYC字段全部填写且客户确认 |
| Gate 2 | 产品风险等级 ≤ 客户风险等级 |
| Gate 3 | 风险揭示书包含所有产品特有风险 |
| Gate 4 | 单一产品占比 < 30%（C3客户）|
| Gate 5 | 年换手率 < 200% |
| Gate 6 | 费用表包含申购/管理/业绩报酬/赎回费 |
| Gate 7 | 每个历史业绩数据点旁标注"过往业绩不代表未来" |
