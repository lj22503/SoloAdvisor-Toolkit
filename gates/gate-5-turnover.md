# Gate 5: 换手率预警门禁

## 触发条件

调仓建议提出时。

## 检查清单

- [ ] 计算年度化换手率
- [ ] 判断是否超过阈值

## 换手率阈值

| 客户类型 | 年换手率上限 |
|---------|-------------|
| C1/C2 | 100% |
| C3 | 150% |
| C4/C5 | 200% |

## 通过条件

年换手率在阈值范围内。

## 如果超标

**SOFT BLOCK:** 提示"换手率过高，可能增加摩擦成本，建议调整策略"。

**可继续:** 此门禁为建议级，不阻止交易执行，但需客户确认。

## 强度

**SOFT** — 警告性质，客户确认后可继续。

## 记录

```
{
  "gate": "gate-5-turnover",
  "status": "pass | warning",
  "annual_turnover_rate": "180%",
  "threshold": "150%",
  "customer_informed": true | false,
  "customer_proceeds": true | false,
  "timestamp": "..."
}
```
