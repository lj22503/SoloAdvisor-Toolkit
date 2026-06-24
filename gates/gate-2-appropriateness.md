# Gate 2: 适当性匹配门禁

## 触发条件

产品筛选完成，准备构建组合之前。

## 检查清单

- [ ] 每个拟推荐产品的风险等级已确认
- [ ] 客户风险等级已确认
- [ ] 所有产品风险等级 ≤ 客户风险等级

## 客户风险等级与产品风险等级对照

| 客户风险等级 | 可推荐产品风险等级 |
|-------------|------------------|
| C1（保守型） | R1 |
| C2（稳健型） | R1, R2 |
| C3（平衡型） | R1, R2, R3 |
| C4（成长型） | R1, R2, R3, R4 |
| C5（进取型） | R1, R2, R3, R4, R5 |

## 通过条件

所有产品风险等级 ≤ 客户风险等级。

## 如果失败

**BLOCKING ACTION:** 标记为"不适当销售风险"，拦截输出，提示"建议降级产品或拒绝推荐"。

**特殊豁免:** 需CEO审批并记录原因，且客户签署"超风险确认书"。

## 强度

**SUPER-HARD** — 绝对不可绕过，这是监管红线。

## 记录

```
{
  "gate": "gate-2-appropriateness",
  "status": "pass | fail | exemption",
  "customer_risk_level": "C3",
  "product_risk_levels": [{"product": "XXX", "risk": "R3"}],
  "exemption_reason": "...",
  "ceo_approval": true | false,
  "customer_confirmation": true | false,
  "timestamp": "..."
}
```
