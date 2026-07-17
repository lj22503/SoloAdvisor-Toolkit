# SoloAdvisor Toolkit (One-Person Wealth Advisor)

> AI-powered wealth advisory toolkit for independent financial advisors. Standardize the full workflow from KYC to post-investment reporting.

## What problem does this solve?

Independent wealth advisors face three core challenges:

| Challenge | Current state | How this toolkit helps |
|---|---|---|
| **High compliance risk** | Suitability matching and risk disclosure easily missed | 7 automated compliance Gates, block missing items |
| **Too many clients to manage** | Rely on memory; hard to know who's at risk of churning | Client lifecycle management + churn early warning |
| **Reinvent the wheel each time** | KYC / allocation / report rebuilt from scratch each time | 13 reusable Skills, fill-in-the-blank approach |

## Target Users

- Independent financial advisors
- Small wealth management teams
- Brokerage / bank retail divisions wanting standardized advisory services

## Core Features

### 1. Full Advisory Workflow (7 Steps)

```
KYC → Risk Assessment → Asset Allocation → Product Screening → Portfolio Construction → Suitability Review → Post-Investment Report
  ↓          ↓                ↓                  ↓                    ↓                     ↓                    ↓
Gate1      Gate2            Gate3             Gate4               Gate5                 Gate6                Gate7
```

### 2. 13 Reusable Skills

| Stage | Skill | Use Case |
|---|---|---|
| Pre-Investment | `kyc-interview` | Structured client information collection |
| | `risk-assessment` | Quantified risk rating (C1-C5) |
| | `asset-allocation` | Stocks/bonds/commodities allocation plans |
| | `pension-planning` | Pension / education fund planning |
| | `public-fund-screening` | Public mutual fund screening |
| | `private-fund-evaluation` | Private fund / trust evaluation |
| | `suitability-management` | Suitability checks |
| Post-Investment | `portfolio-construction` | Portfolio construction |
| | `performance-review` | Attribution analysis + reports |
| | `investment-communication` | Regular / volatility-event communication |
| | `client-lifecycle-management` | Full-cycle client management |
| | `volatility-communication` | Volatility-specific communication scripts |
| | `churn-prevention` | Churn early warning + recovery |

### 3. 7 Compliance Gates

| Gate | What it checks | Enforcement |
|---|---|---|
| Gate 1 | KYC five items complete | HARD |
| Gate 2 | Product risk ≤ client risk | **SUPER-HARD** |
| Gate 3 | Risk disclosure complete | HARD |
| Gate 4 | Single product concentration over-limit | MEDIUM |
| Gate 5 | Turnover rate too high | SOFT |
| Gate 6 | Fees fully disclosed | HARD |
| Gate 7 | Historical performance has compliance disclaimer | HARD |

## Quick Start

### Installation

```bash
# Option 1: Run install script
git clone https://github.com/lj22503/SoloAdvisor-Toolkit.git investment-advisory-skills
cd investment-advisory-skills
bash install.sh

# Option 2: Manual install
# 1. Clone the repo
git clone https://github.com/lj22503/SoloAdvisor-Toolkit.git investment-advisory-skills

# 2. Reference in your project's CLAUDE.md
# Add to your project CLAUDE.md:
# Use investment-advisory-skills for wealth advisory tasks

# 3. Or configure skills_dir
# In .claude/settings.json:
# { "skills_dir": "/path/to/investment-advisory-skills/skills" }
```

### Usage Examples

**Option 1: Full workflow (new client onboarding)**

```
User: Help me serve a new client, Ms. Li, with 5M RMB investable assets
AI: Auto-runs KYC → allocation → screening → portfolio → compliance review
```

**Option 2: Single skill invocation**

```
User: Help me run a KYC interview
AI: Invokes kyc-interview, asks questions by template, generates client profile

User: Screen some CSI 300 index funds
AI: Invokes public-fund-screening, outputs score sheet

User: A client lost money — how do I reassure them
AI: Invokes investment-communication, outputs communication template
```

**Option 3: Post-investment management**

```
User: Check if any clients are about to churn
AI: Invokes churn-prevention, scans early-warning client list
```

## Typical Scenarios

### Scenario A: New Client Onboarding (30 min → 5 min)

```
Before: flip through docs / ask questions / fill forms / calculate risk level
Now: AI-guided interview → auto-generate client profile → auto-calculate risk level
      ↓
     Auto-triggers Gate 1; AI blocks if any of the 5 items is incomplete
```

### Scenario B: Product Recommendation (1 hr → 10 min)

```
Before: browse fund database / compare metrics / write rationale / check suitability
Now: input client risk level → AI screens candidate funds → auto-scores and ranks
      ↓
     Auto-triggers Gate 2 (suitability) + Gate 3 (risk disclosure)
```

### Scenario C: Quarterly Client Review

```
Before: pull NAV / calc return / write report / worry about churn
Now: AI auto-attribution analysis → generate report template → output communication scripts
      ↓
     Simultaneously checks churn warnings, proactively flags at-risk clients
```

## User Customization

Each Skill supports user-defined extensions:

### 1. Custom Triggers

Append your common phrasings to a Skill's `trigger`:

```yaml
trigger:
  - "筛选基金"        # original (Chinese)
  - "帮我选基"        # your custom
  - "基金怎么挑"      # your custom
```

### 2. Custom Templates

Append your own cases to a Skill's `Example` section to build a private knowledge base.

### 3. Adjust Gate Thresholds

| Gate | Default | Adjustable Range |
|---|---|---|
| Gate 4 concentration | Single product <30% | Per your client's risk preference |
| Gate 5 turnover | Annual <200% | Per your strategy style |

## Toolchain Integration

This repo is part of the FinAI tool ecosystem and works with:

| Repo | Role | Relationship |
|---|---|---|
| [awesome-finai-tools-zn](https://github.com/lj22503/awesome-finai-tools-zn) | Data foundation | Provides tool list + institutional Skill data |
| [invest-brain](https://github.com/lj22503/invest-brain) | Tool recommendation engine | Recommends tools by scenario |
| [investment-buddy-pet](https://github.com/lj22503/investment-buddy-pet) | Personalized advisor | Matches toolkits to investment personality |
| [SoloAdvisor-Toolkit](https://github.com/lj22503/SoloAdvisor-Toolkit) | Advisory workflow toolkit | KYC → allocation → portfolio → report |
| [knowledge-workflow](https://github.com/lj22503/knowledge-workflow) | Knowledge management | Collect → tag → store → produce |

## Disclaimer

- This toolkit is an aid; it does not replace an advisor's professional judgment
- Compliance checks are advisory; final compliance responsibility lies with the licensed advisor
- Historical performance data must be self-verified; AI output must include "past performance does not represent future results"

## License

MIT License — Free to use, please credit source for commercial use.

## Skill Sources

This toolkit draws on the format and ideas of:
- pm-skills (product management skills library)
- gstack (role-driven engineering team)
- Superpowers (AI programming discipline framework)

---

**Q: Can this toolkit help me get clients?**
A: Not directly, but it improves service quality (standardized processes, professional reports, compliance assurance), indirectly boosting referral rates.

**Q: What qualifications do I need to use it?**
A: You need investment advisory qualifications (e.g., fund practitioner / advisory license). This toolkit is an aid, not a substitute.

**Q: Where is my data stored?**
A: This toolkit does not store data, only provides methodology templates. Store client data per regulatory requirements.

---

**Version**: v1.0
**Website**: (coming soon)
**GitHub**: https://github.com/lj22503/SoloAdvisor-Toolkit
**Other languages**: [简体中文](README.md)