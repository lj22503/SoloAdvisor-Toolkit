# Gate 6: 收费透明度门禁

## 触发条件

投资建议书提交给客户之前。

## 检查清单

- [ ] 费用表包含所有费用类型：
  - [ ] 申购费（前端）
  - [ ] 管理费（年化）
  - [ ] 业绩报酬（如有）
  - [ ] 赎回费（后端）
  - [ ] 其他费用（托管费、审计费等）
- [ ] 费用计算示例已提供
- [ ] 客户已确认理解费用结构

## 通过条件

费用表完整，所有费用类型已列出，客户已确认理解。

## 如果失败

**BLOCKING ACTION:** 提示"请补充费用结构说明"。

## 强度

**HARD** — 未经完整费用披露不得向客户交付建议书。

## 记录

```
{
  "gate": "gate-6-fee-transparency",
  "status": "pass | fail",
  "fee_types_covered": ["申购费", "管理费", "业绩报酬", "赎回费"],
  "fee_types_missing": [],
  "fee_example_provided": true | false,
  "customer_confirmed": true | false,
  "timestamp": "..."
}
```
