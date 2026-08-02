# Source notes (PRIVATE — do not share, zip, or publish)

Raw internal figures behind the rounded/generalized claims in `summary.md`.
Kept here only for your own reference when writing bullets — never copy
these exact numbers or category names into a public resume/LinkedIn/repo.

## Per-category spend figures (from project plan, last 2 quarters of internal spend data)

| Category | Spend | Notes |
|---|---|---|
| Unattached managed disks | $594K | Pure waste, no existing detection tool caught this |
| Stale snapshots | (rolled into disk cost above) | >90 days old |
| Inactive storage accounts | $3.9M | Existing internal tool's service-tree mapping was broken for LinkedIn |
| Log Analytics tier optimization | $1.6M | Existing tool already flags ~$3M here (Agent D covers additional cases) |
| Idle VMs | $8.3M | Largest single category |
| Azure MySQL low-query instances | $743K | No existing coverage from internal tooling |
| Idle Redis Cache | $164K | Existing tool has an open, unfixed bug for LinkedIn specifically |

**Sum of the above ≈ $15.3M** (my own addition of the individually-cited
figures — no single doc states this total explicitly).

Two categories with **zero prior automated coverage** anywhere in existing
internal tooling: Azure MySQL low-query instances, and (effectively) inactive
storage accounts (existing tool's detection was broken for LinkedIn specifically).

## Eval harness

- ~130 total eval cases across: Agent D (~18), Routing (~30), End-to-end (~20),
  plus per-agent suites for the other 3 domain agents.
- 0% pricing-hallucination target on a dedicated hallucination suite.
- L4 sanity suite: 8 cases, <2 min runtime, wired as pre-demo/post-deploy gate.
- End-to-end pass rate target: ≥80% on cross-agent chain scenarios.

## Orchestrator

- Routes across 4 domain sub-agents (pricing, architecture, spend/quota,
  recommendations) plus itself = "4 Copilot custom_agents subagents."
- Target: ≥90% routing accuracy on a labeled dataset; p95 latency <30s per
  agent call (LangSmith-measured).

## Context for org-wide scale claim

- ~607 subscriptions is the scale figure for the spend/quota agent's data
  source (Agent C), not Agent D specifically — don't conflate these when
  writing bullets; it's useful context but not "your" number.

## Reminder

These are internal LinkedIn financial figures. Public-facing text (resume,
LinkedIn, this repo's summary.md) should stick to the rounded/aggregate
framing already written in `summary.md` ("multi-million-dollar", "$10M+",
"~130 test cases", "≥90%") — never the raw per-category table above.
