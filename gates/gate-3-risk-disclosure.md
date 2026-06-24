# Gate 3: 风险揭示完整性门禁

## 触发条件

投资建议书草稿完成，准备提交给客户之前。

## 检查清单

- [ ] 建议书包含"风险揭示"章节
- [ ] 风险揭示涵盖所有拟推荐产品
- [ ] 每个产品包含：
  - [ ] 投资风险（可能亏损的比例）
  - [ ] 流动性风险（封闭期/赎回限制）
  - [ ] 产品特有风险（如杠杆、衍生品等）
  - [ ] 费率风险（持有成本）
- [ ] 客户已阅读风险揭示确认

## 通过条件

风险揭示章节完整，所有产品特有风险已披露，客户已确认。

## 如果失败

**BLOCKING ACTION:** 提示"请补充XX产品的风险揭示内容"。

## 强度

**HARD** — 未经完整风险揭示不得向客户交付建议书。

## 记录

```
{
  "gate": "gate-3-risk-disclosure",
  "status": "pass | fail",
  "products_covered": ["product_a", "product_b"],
  "products_missing_disclosure": [],
  "customer_confirmed": true | false,
  "timestamp": "..."
}
```
