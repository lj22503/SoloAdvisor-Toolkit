# investment-advisory-skills — neat-freak 知识收尾报告

**收尾时间**：2026-07-24
**收尾路径**：轻量路径（多 Agent 编排 skill 包，文档驱动，无运行时代码/部署流程）
**收尾者**：neat-freak（v3.0.0）

---

## 一、影响（用户视角）

- **🔴 暴露三重命名不一致**：本地目录 `investment-advisory-skills`、CLAUDE.md 标题 `SoloAdvisor-Toolkit`、GitHub remote `lj22503/SoloAdvisor-Toolkit` —— 三个名字全不同。下次会话 agent 按 CLAUDE.md 看是 SoloAdvisor，clone 下来发现目录叫 investment-advisory-skills，push 又会推到 SoloAdvisor-Toolkit 仓库（这是该项目之前所有 commit 都推向 SoloAdvisor-Toolkit 的原因）。
- **暴露未跟踪的 landing 页面**：`docs/landing.html`（未提交、未 gitignore）—— 推测为项目对外展示页。
- **暴露无 .gitignore 文件**：未跟踪的 docs/landing.html + topics-suggested.md + .impeccable/ 都未被 ignore 规则管理，未来类似文件会反复混入 git status。
- **暴露上次 commit 推送异常**：HEAD `05f3837 docs: 移除内部 TODO 注释`（本地操作）实际推送到了 `lj22503/SoloAdvisor-Toolkit`，而非仓库同名仓库 `lj22503/investment-advisory-skills`（后者是否存在未确认）。**所有 neat-freak 自动化 commit 默认会推到 SoloAdvisor-Toolkit**。

## 二、现役事实矩阵

| 事实面 | 状态 | 证据 |
|--------|------|------|
| 代码 | `verified-current` | 6 roles（ceo/em/engineer/qa/release/devops）+ 13 skills（kyc-interview / risk-assessment / asset-allocation 等）+ 7 gates + orchestrator + router，结构完整 |
| 运行态 | `not-applicable` | skill 包，无部署流程；install.sh 是本地初始化脚本 |
| 文档 | `verified-current` | CLAUDE.md 详细（93 行 + 三层架构 + 服务流程图 + 投研/投顾对比）；README.md 中英文各一版 + llms.txt |
| 规则 | `verified-current` | CLAUDE.md 充当 agent 规则文件，含核心原则（适当性/风险对称/收费透明/决策留痕 4 条）+ 使用方式 |
| 记忆 | `not-applicable` | 无 |
| 工作区 | `changed-and-verified` | 新建 `.neat-freak/`；未跟踪 docs/landing.html + topics-suggested.md；.impeccable/ 历史 audit 残留 |

## 三、关键发现

### 3.1 🔴 三重命名不一致

| 维度 | 名字 | 证据 |
|------|------|------|
| 本地目录 | `investment-advisory-skills` | `D:\claudework\investment-advisory-skills\` |
| GitHub remote | `SoloAdvisor-Toolkit` | `git remote -v` |
| GitHub URL | `https://github.com/lj22503/SoloAdvisor-Toolkit.git` | 同上 |
| CLAUDE.md 标题 | `# SoloAdvisor-Toolkit（一人投顾工具包）` | CLAUDE.md 第 1 行 |
| README.md 标题 | `# 一人投顾工具包 (SoloAdvisor Toolkit)` | README.md 第 1 行 |
| CLAUDE.md 树状图根 | `investment-advisory-skills/` | CLAUDE.md 第 28 行 |
| README.md 徽章链接 | `lj22503/SoloAdvisor-Toolkit` | README.md 第 8 行 |

→ 三层名字错位：
1. **GitHub 仓库名**：`SoloAdvisor-Toolkit`
2. **本地目录名**：`investment-advisory-skills`（与 GitHub 仓库名不匹配）
3. **文档内统一标识**：标题/正文用 `SoloAdvisor Toolkit`（与 GitHub 一致），但 CLAUDE.md 树状图根用 `investment-advisory-skills/`（与本地目录一致）

→ 处置建议（**用户决策**）：
- 选项 A：把 GitHub 仓库 rename 为 `investment-advisory-skills`，与本地目录和 CLAUDE.md 树状图一致
- 选项 B：本地目录 rename 为 `SoloAdvisor-Toolkit`，与 GitHub 仓库一致
- 选项 C：接受现状，文档中所有"本地目录"统一改写为 `SoloAdvisor-Toolkit`

无论选哪个，**本次 neat-freak commit 都会继续推到 `lj22503/SoloAdvisor-Toolkit`**（除非用户先调整 remote）。

### 3.2 docs/landing.html 未跟踪

| 属性 | 值 |
|------|-----|
| 路径 | `D:\claudework\investment-advisory-skills\docs\landing.html` |
| 状态 | `?? docs/`（未跟踪） |
| 性质 | 项目落地页（推测），按 docs/landing.html 命名习惯 |

未 commit 也未 gitignore（项目根无 .gitignore）。

### 3.3 topics-suggested.md 未跟踪

| 属性 | 值 |
|------|-----|
| 路径 | `D:\claudework\investment-advisory-skills\topics-suggested.md` |
| 用途 | GitHub Topics 推荐清单（操作完 UI 应删） |
| 状态 | `?? topics-suggested.md`（未跟踪） |

按 investment-framework-skill 报告 §五 的同类问题，列此处作类比。

### 3.4 无 .gitignore 文件

本地根目录无 `.gitignore`：
- `docs/landing.html` 未被 ignore
- `topics-suggested.md` 未被 ignore
- `.impeccable/` 历史残留未被 ignore
- 未来 `__pycache__/`、`node_modules/` 等若误入也未被规则保护

### 3.5 CLAUDE.md 与实际目录一致（好）

CLAUDE.md 第 39-43 行列出 6 个 roles，本地实际 6 个 ✓
CLAUDE.md 第 52-65 行列出 13 个 skills，本地实际 13 个 ✓
→ 文档与代码对齐，**这是这个项目的优势**。

### 3.6 与 investment-skills（投研）的关系

CLAUDE.md 第 98-106 行明确区分"投研 vs 投顾"：
- 投研（investment-skills）：内部投资研究，项目制
- 投顾（investment-advisory-skills）：对客户顾问服务，持续服务

queue.md 第 27 行 `investment-advisory-skills` 与第 30 行 `investment-skills`（无 remote，待定）区分清晰。

## 四、改动 / 新建

| 文件 | 动作 | 原因 |
|------|------|------|
| `.neat-freak/reports/investment-advisory-skills-2026-07-24.md` | 新建 | 本次 audit trail |

## 五、待你确认（未确认前不动作）

1. **🔴 处置命名不一致**（A/B/C 三选一，见 §3.1）
2. **建立 .gitignore**：建议规则
   ```
   topics-suggested.md
   docs/landing.html          # 若不想让 landing 进 git
   .impeccable/
   __pycache__/
   *.pyc
   .DS_Store
   ```
3. **docs/landing.html 是否 commit**：若要发布到 SoloAdvisor-Toolkit GitHub Pages，建议 commit；若仅本地预览则 gitignore
4. **topics-suggested.md**：操作完 GitHub UI 后删除
5. **.impeccable/**：是否 gitignore

## 六、遗留

- CLAUDE.md 第 30 行 `feedback-loop.md` + `pipeline.md` 未读全文确认是否与 SKILL 设计一致
- README_EN.md（8KB）未与 README.md 对照差异
- router/advisory-assistant/ 内容未读

---

*收尾完成度：5 事实面已标注（运行态 not-applicable，记忆 not-applicable）。报告基于 commit `05f3837`（HEAD），commit 实际推送到 `lj22503/SoloAdvisor-Toolkit`，如需重新跑请清空 `.neat-freak/reports/` 后重跑。*