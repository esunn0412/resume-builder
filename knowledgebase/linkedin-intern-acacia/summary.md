# LinkedIn — Software Engineering Intern, Project ACACIA

**Dates:** Summer 2026 (12-week internship)
**Role:** One of 3 backend/agent interns on a tech-lead-guided pod. Owned
**Agent D (Recommendations)**, the **multi-agent orchestrator**, and the
**evaluation harness** for the whole project.

## What the project is

ACACIA (Azure Cost Analysis & Contextual Insight Agent) is an AI agent that
helps LinkedIn engineers make Azure cost and architecture decisions. An
orchestrator classifies each incoming question and routes it to one of four
domain sub-agents (pricing, architecture, spend/quota, recommendations),
each backed by internal data sources (negotiated pricing, subscription spend,
quota, cost/idle-resource recommendations).

## What I owned & built

- **Recommendations agent (Agent D):** tools that detect idle/underutilized
  cloud resources (unattached disks, stale snapshots, inactive storage,
  under-used compute) and validate right-sizing recommendations, chaining
  savings estimates to internal discount data.
- **Multi-agent orchestrator:** built the router that classifies a user's
  question and dispatches it to the correct specialist sub-agent, including a
  hard, config-level enforcement so the router can only route — not directly
  call domain tools — closing a gap a design ticket assumed wasn't fixable.
- **Evaluation harness (built from scratch):** a live evaluation runner that
  exercises the *actual* orchestrator end-to-end (not a mocked stand-in),
  with automated grading via deterministic checks + an LLM-as-judge for
  correctness/hallucination detection, plus a routing-accuracy evaluator and
  a tool-call trajectory validator. Later evolved this into a **live,
  fail-closed policy gate** (zero-hallucination / zero-sensitive-data-leak)
  with explicit pass/fail/inconclusive semantics, wired as a pre-demo and
  release gate.
- **Platform-level contribution:** root-caused and fixed a bug in the shared
  agent-runner platform (a config-loading gap) that was silently breaking
  tool availability in *every* team's evals across the org, not just my own
  — shipped as a reviewed/approved platform fix.
- **Production authentication & networking:** diagnosed and fixed multiple
  real staging/production issues to get the recommendations agent actually
  serving traffic from a deployed environment — a credential-chain gap for
  on-prem hosts (added a certificate-based auth tier), a data-plane vs.
  control-plane permissions gap (root-caused via Azure's access-check API
  down to the exact missing permission), and a network-reachability gap
  (made a corp-only internal service reachable without a manual SSH tunnel,
  then found and fixed a second reachability gap once deployed to a
  production pod). Each was root-caused independently with logs/tooling, not
  guessed at.
- **Stretch goal (in progress):** integrating the evaluation harness with
  LangSmith so eval runs are viewable/comparable in an internal experiment
  dashboard — designed as a reporting-only adapter (the local harness stays
  the source of truth) with a strict field allowlist and automatic
  redaction of any sensitive values before anything is uploaded.

## Impact

- **Recommendations agent scope:** the agent's idle-resource/right-sizing
  detectors (unattached disks, stale snapshots, inactive storage accounts,
  idle compute/VMs, low-usage databases, idle cache) together cover
  **multi-million-dollar** categories of cloud spend that weren't previously
  caught by the org's existing cost-management tooling — several of these
  categories had *no* existing automated detection at all before this project.
  In aggregate, the categories this agent targets represent **eight figures
  ($10M+) in identified annual savings opportunity** across the org's cloud
  footprint.
- **Coverage the org didn't have before:** at least two of the resource
  categories the recommendations agent covers had zero prior automated
  coverage from the company's existing cost-optimization tooling — this
  agent closed that gap.
- **Eval harness scale:** grew the evaluation suite from nothing to roughly
  **130 test cases** spanning per-agent correctness, cross-agent routing
  accuracy, and end-to-end scenarios — used as a merge/release gate for the
  whole project, not just my own component, and adopted by the other interns
  for their own agents once it existed.
- **Orchestrator reliability bar:** the router I built was held to a
  **≥90% routing-accuracy** target against a labeled query set, and the
  overall system to a **zero-tolerance bar on pricing hallucinations**,
  enforced automatically by the eval harness I built.
- **Platform fix reach:** the shared-platform bug fix wasn't scoped to my own
  agent — it was silently breaking tool availability in *every* team's evals
  building on the same shared runner, so the fix unblocked test suites
  org-wide, not just mine.

## Skills demonstrated

- Multi-agent LLM orchestration & routing design
- Building an eval harness / LLM-as-judge grading pipeline from scratch
- Cloud cost/resource analysis (Azure Resource Graph, Monitor APIs)
- Root-causing production auth/networking issues across multiple layers
  (credential chains, RBAC, mTLS, network reachability)
- Cross-team platform contribution (fixing a shared tool used by other teams)
- Working from an ambiguous ticket to a verified, working design (reading
  the actual SDK/platform code rather than accepting a ticket's assumptions)

## Possible resume bullet angles

- "Built the recommendations agent and evaluation harness for an LLM-based
  multi-agent system that routes engineer questions to 4 specialist agents,
  including a live LLM-as-judge grading pipeline and hallucination/leak
  policy gate."
- "Diagnosed and resolved production authentication and networking failures
  (credential chains, permission scoping, service reachability) to bring a
  cloud-recommendations agent from working-in-dev to serving live traffic."
- "Shipped a platform-level bug fix to the shared multi-agent eval runner
  used org-wide, unblocking dozens of other teams' test suites."
- "Designed and implemented hard, config-level routing enforcement for a
  multi-agent orchestrator, closing a gap in the original design spec."
