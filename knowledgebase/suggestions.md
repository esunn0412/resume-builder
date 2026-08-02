# Suggested updates — resume.yaml & LinkedIn (draft, not yet applied)

Generated from `linkedin-intern-acacia/summary.md`,
`emory-nlp-naver-research/summary.md`, and a review of the current
`resume.yaml` + verified GitHub activity. Nothing in this file has been
applied to `resume.yaml` yet — review, tweak, then copy in what you want.

---

## 0. General resume audit — the core problem you now have

You currently have **4 experience-shaped things that all want an
`experience` entry**: Lablup, Park My Ride, Sionic AI, plus the two new ones
(LinkedIn/Acacia, Emory research) = **5 total**, on a resume that is already
a tight 1-pager with 3. You cannot keep all 5 at full bullet-count. Below is
a keep/cut/trim pass across every section, ranked by what a SWE/ML-recruiter
skim actually rewards.

### Experience — priority order (most → least resume-space-worthy)

1. **LinkedIn (Acacia) — keep, full 3 bullets, put first.** Most recognizable
   name, most recent, highest quantified impact ($10M+ scope), and the
   auth/networking root-cause story is your single strongest "I can operate
   independently in a real production system" proof point on the whole
   resume. Non-negotiable keep.
2. **Sionic AI — keep, but this is now your #2, not filler.** It has
   something *neither* new entry has: a **published result** (PACLIC 38) and
   a clean, single-number win (+4.87 MTEB). Published + quantified beats
   ongoing + unpublished every time a recruiter skims. Keep all 3 bullets.
3. **Emory NLP research — keep if you're targeting ML/research-adjacent
   roles; cut or shrink to 1-2 bullets if targeting general SWE.** It's a
   strong *second* ML-research credential (reward-hacking diagnosis and the
   format-vs-quality root-cause story are genuinely good "rigor" signals),
   but it's largely thematically redundant with Sionic AI (both are "ML
   research: fine-tuning + reward/eval design"). Two ML-research entries
   back-to-back reads a little unbalanced on a resume that's otherwise
   full-stack/backend-heavy — decide based on what roles you're applying to.
4. **Lablup — trim to 2 bullets.** Bullet 1 (PyCon booth page) and bullet 3
   (FastTrack UI/UX polish) are the weakest, most interchangeable "did some
   frontend work" bullets on the resume. Cut bullet 1 or 3; keep bullet 2
   (the actual product feature work with GraphQL/Relay).
5. **Park My Ride — trim to 1 bullet.** Bullet 2 (CI/CD, 80% error
   reduction) is the strongest bullet in this whole entry — has a real
   number. Bullet 1 (relational models + JWT auth) is generic "built a CRUD
   app" language you now have stronger versions of elsewhere (Curaitor,
   Rendezvous already cover backend/auth work). Consider cutting bullet 1
   entirely and keeping this as a 1-bullet entry, or cutting the whole entry
   if you need the room and are prioritizing Emory + Acacia instead.

**Net suggestion:** LinkedIn (3) + Sionic AI (3) + Lablup (2) + Park My Ride
(1) + Emory (2, if targeting research/ML roles) = still tight but workable;
the bullet-count trims above claw back roughly the space 2 new entries need.
If it still doesn't fit after trimming, cut Park My Ride entirely before
cutting anything from Sionic AI, LinkedIn, or Emory.

### Projects — keep/cut

- **Curaitor — keep as-is.** Most technically interesting project (Actor
  model, goroutines/channels, concurrency) — differentiates you beyond "yet
  another web app."
- **Good Hangul — keep.** It's a real shipped product with a live URL and a
  custom fine-tuned model in production — rare for a projects section.
- **Rendezvous — weakest of the three, first to cut if you need space.** A
  Pinterest/Reddit-style social app with Django+Docker+Nginx is a very
  common portfolio-project shape and doesn't showcase anything the other
  entries (or Park My Ride, if kept) don't already cover. If you need to
  make room for the two new experience entries, cut this one first, before
  touching Curaitor or Good Hangul.

### Leadership — keep as-is, but see new "Open Source" item below

`Project Emory` stays; it's your only leadership/impact-beyond-code entry
and it has real numbers (20+ students, founded a 70+ person hackathon).

### Skills — small additions

Add `Kubernetes` / `kubectl` to the Tools line (see §2 below) — it's now
backed by both a course cert and real merged OSS PRs, not just a buzzword.

---

## 1. Resume — new `experience` entries

Your resume is currently a tight 1-pager. Adding both entries below will
overflow to 2 pages unless you trim something. Suggested trim: cut the
weakest bullet from Park My Ride (bullet 2 restates bullet 1's theme) and/or
one Lablup bullet. Recompile with `make pdf` after inserting and check.

### LinkedIn — Software Engineering Intern (insert first, most recent)

```yaml
  - title: "LinkedIn"
    role: "Software Engineering Intern"
    date: "Jun 2026 – Aug 2026"
    bullets:
      - "Built the recommendations agent and *LLM-as-judge* evaluation harness for a multi-agent Azure cost-optimization assistant, targeting cloud-waste categories worth *\\$10M+* in identified annual savings opportunity across the org."
      - "Root-caused and fixed production authentication and networking failures (credential chains, permission scoping, service reachability) to bring the recommendations agent from dev-only to serving live production traffic."
      - "Designed hard, config-level routing enforcement for the project's multi-agent orchestrator and shipped a platform-level bug fix to the shared eval runner, unblocking every other team's test suite org-wide."
```

*Note:* in YAML double-quoted strings, a literal Typst-escaped dollar sign
needs `\\$` (double backslash) so YAML itself doesn't choke on `\$` as an
unknown escape — `$` alone triggers Typst math mode and breaks the PDF
export with an "unclosed delimiter" error. (Learned this the hard way
building `resume-suggested.yaml`.)

*Why this framing:* leads with the dollar-impact number (per your ask),
keeps the auth/networking bullet as your strongest "independently
root-caused a hard bug" story, and folds routing-design + platform-fix into
one bullet to save space. Drop the 3rd bullet first if you need to trim.

### Emory NLP Lab — Researcher

```yaml
  - title: "Emory NLP Lab"
    role: "Researcher (collaboration with Naver Corporation)"
    date: "20XX – Present"
    bullets:
      - "Designed a short-term user-memory (interest) representation for a personalization research project, and fine-tuned *Qwen3-14B* (*LoRA* + groupwise *DPO*) with a custom multi-signal reward function to extract it from user interaction logs."
      - "Diagnosed a reward-hacking failure mode causing the model to over-produce trivial single-evidence outputs, and redesigned the reward signal to fix it — recovering a verified improvement over baseline."
      - "Root-caused an apparent training-quality regression to an output-formatting artifact rather than a real quality drop, correctly recovering the true best checkpoint through targeted re-evaluation."
```

*Fill in the actual start date.* If space is too tight for a full 3-bullet
entry, cut to 2 (drop the 3rd — it's the most "inside baseball" of the
three) or fold this into a `projects`/`research` line instead of a full
`experience` entry — your call once you see the layout with both entries in.

---

## 2. Kubernetes open source, CKA course cert, Hackcon Scholarship

**Verified via GitHub API** (not just taking it on faith): your GitHub
(`esunn0412`) has **5 merged pull requests into `kubernetes/website`**, the
official Kubernetes documentation repo (a real CNCF/Kubernetes project, not
a fork or personal repo) — Dec 2025 through Jul 2026, ongoing:

- [#53300](https://github.com/kubernetes/website/pull/53300) — `[ko]` update contributor-docs page (Dec 2025)
- [#53962](https://github.com/kubernetes/website/pull/53962) — `[ko]` full translation of `services-networking/gateway.md` (Jan 2026)
- [#56430](https://github.com/kubernetes/website/pull/56430) — `[ko]` fix broken links in `gateway.md` (Jul 2026)
- [#56443](https://github.com/kubernetes/website/pull/56443) — fix GRPCRoute reference link (Jul 2026)
- [#56478](https://github.com/kubernetes/website/pull/56478) — `[ko]` update `custom-resources.md` (Jul 2026)

This is a genuinely strong, verifiable credential — "merged PRs in
kubernetes/website" is a concrete, checkable line, stronger than most
"open source contributor" claims recruiters see. Recommend giving it real
visibility, not burying it in a skills line only.

### Suggested placement — small new `leadership` entry

```yaml
  - title: "Kubernetes (CNCF)"
    role: "Open Source Contributor — Documentation Localization (SIG Docs)"
    date: "Dec 2025 – Present"
    bullets:
      - "Merged 5 pull requests to kubernetes/website, including a full Korean translation of the Gateway API networking concepts page and multiple broken-link/reference fixes."
```

If you don't have room for a whole new entry, fold it into the Skills
section instead (see below) — but the dedicated-entry version is worth the
space if you can fit it.

### CKA course certificate — be precise about what it is

Word this carefully: it's KodeKloud/Mumshad Mannambeth's **CKA prep course
completion certificate**, not the official Linux Foundation/CNCF Certified
Kubernetes Administrator exam credential. Listing it as just "CKA
Certified" or "CKA" without qualification risks misrepresentation if a
recruiter knows the difference. Suggested exact wording:

> "KodeKloud CKA (Certified Kubernetes Administrator) Course — Certificate
> of Completion, Mumshad Mannambeth"

Add this as a new row in `skills`:

```yaml
  - label: "Certifications"
    items: "KodeKloud CKA (Certified Kubernetes Administrator) Course – Certificate of Completion"
```

And add Kubernetes to your Tools line:

```yaml
  - label: "Tools"
    items: "Git, Linux, Docker, Kubernetes, AWS, Jira, Gemini SDK"
```

### Hackcon Scholarship (2026) — LinkedIn only, resume optional

A hackathon/conference scholarship award is a nice-to-have but lower-signal
than the OSS PRs or the internships — I'd keep it on LinkedIn (where you
already have it) rather than spend scarce resume space on it, unless you
add a compact "Awards" line to `leadership` or `education` once everything
else is placed and you still have room:

```yaml
  # optional, only if space allows — could append to education `detail` or a new leadership bullet
  - "2026 Hackcon Scholarship Award recipient."
```

---

## 3. LinkedIn profile text (copy-paste, more narrative than resume bullets)

### Experience entry: LinkedIn — Software Engineering Intern

> Owned the recommendations agent, multi-agent orchestrator, and evaluation
> harness for an internal AI assistant that helps engineers make Azure cost
> and architecture decisions. Built detectors for idle/underutilized cloud
> resources (unattached disks, idle compute, low-usage databases, and more)
> spanning cloud-waste categories worth $10M+ in identified annual savings
> opportunity — several of which had no existing automated detection before
> this project. Built the routing logic and hard enforcement boundaries for
> the system's multi-agent orchestrator, and built an evaluation harness
> from scratch (~130 test cases: per-agent correctness, cross-agent routing
> accuracy, and a zero-tolerance hallucination gate) that became the
> merge/release gate for the whole project and was adopted by every other
> intern on the team. Independently root-caused and fixed multiple
> production authentication and networking issues to bring the agent from
> working-in-dev to serving live traffic, and shipped a fix to a shared
> platform bug that was silently breaking every team's evals org-wide, not
> just my own.

### Experience entry: Emory NLP Lab — Researcher

> Researching user modeling and personalization for LLM-based agents, in
> collaboration with Naver Corporation. Designed a short-term memory
> representation that turns a user's raw interaction history into a
> reusable, explainable interest signal, and fine-tuned an open LLM (LoRA +
> groupwise DPO) with a custom multi-signal reward function to extract it.
> Diagnosed and fixed a reward-hacking failure mode where the model learned
> to game the reward with trivial outputs, and separately root-caused an
> apparent training regression to an output-formatting artifact rather than
> a true quality drop — correctly identifying the actual best checkpoint
> through targeted re-evaluation instead of trusting the raw metric.

### About section — suggested addition/tweak

> ...Most recently, I've been building multi-agent LLM systems at LinkedIn
> (routing, evaluation harnesses, and production reliability for an AI
> assistant with $10M+ in identified cost-savings scope) and researching
> user-modeling/personalization methods at Emory NLP Lab in collaboration
> with Naver Corporation.

*(Insert this as a closing paragraph to whatever your current About text
already says — I don't have your current profile text to edit in place.)*

### Kubernetes open-source contributions — LinkedIn "Featured"/experience note

You already have the Hackcon Scholarship on your LinkedIn; the Kubernetes
work isn't reflected there yet. Since LinkedIn supports adding a
"Licenses & certifications" entry and standalone project/volunteer entries
distinct from work experience, suggest:

**Licenses & certifications entry:**
> Name: KodeKloud CKA (Certified Kubernetes Administrator) — Course
> Completion
> Issuing organization: KodeKloud (Mumshad Mannambeth)
> *(Do not select/imply "Linux Foundation" as issuer — that would
> misrepresent it as the official exam credential.)*

**Volunteer/Open Source experience entry (or add to your existing GitHub
"Featured" links):**
> Contributing to Kubernetes documentation localization (SIG Docs) as part
> of the CNCF Kubernetes project. Merged 5 pull requests to
> kubernetes/website, including a full Korean translation of the Gateway
> API networking concepts page, plus reference-link fixes — ongoing since
> December 2025.

---

## 5. Two role-targeted resume variants: SWE vs. ML/AI research

You're applying to both tracks, so instead of one compromise resume, there
are now two renderable files sharing the same YAML→Typst pipeline:

- `resume-swe.yaml` / `resume-swe.typ` → `make swe-pdf`, `make swe-preview`,
  `make swe-watch`
- `resume-ml.yaml` / `resume-ml.typ` → `make ml-pdf`, `make ml-preview`,
  `make ml-watch`

Both are separate from `resume.yaml` (your live resume) and
`resume-suggested.yaml` (the general-audit sandbox from §0–§4) — nothing
here touches those.

### Title/leadership fixes applied to both variants
- Emory NLP entry retitled **"Emory NLP/Naver"** per your instruction.
- **Project Emory** role updated to **"President"** (was "Co-Hackathon
  Director/Director of Projects").
- **Emory Hacks** split out as its own leadership entry with role
  **"Co-Founder"** (dropping "Vice President" — the old `ml-nov10.pdf` had
  "Vice President and Co-Founder"; tell me if VP should stay).

### `resume-swe.yaml` — engineering-track resume (applying prompts #2, #3, #6)
Prioritizes shipped/production impact and infra breadth; cut the purest
research entry to keep it scannable in <10 seconds (prompt #6):
- **Kept full**: LinkedIn (3 bullets), Park My Ride (both bullets, CI/CD +
  auth), Lablup (2 of 3 bullets — cut the ReactFlow UI/UX one as lowest
  signal), Sionic AI (2 of 3 bullets — cut the BGE-M3 metric bullet, kept
  the BLEU/SOTA-comparison one since it still reads as an engineering
  benchmark).
- **Cut entirely**: Emory NLP/Naver (pure research entry — the least
  relevant for a SWE screener, and cutting it was what got this back to 1
  page; see below if you'd rather keep 1 trimmed bullet instead and cut
  something else).
- **Projects**: cut Rendezvous (kept Curaitor + Good Hangul) — same
  page-budget tradeoff.
- **Leadership**: kept all 3 (Project Emory, Emory Hacks, Kubernetes/CNCF)
  — OSS + hackathon leadership reads well for SWE roles.
- **Skills**: unchanged from `resume-suggested.yaml` (web/infra frameworks
  + Kubernetes + CKA cert).

### `resume-ml.yaml` — ML/AI research-track resume (applying prompts #2, #3, #8)
Pulled in the MAIX Lab entry from your `ml-nov10.pdf` (you hadn't shared
this with me before — it's your most current and most research-forward
role, so it now leads):
- **New**: Nell Hodgson Woodruff School of Nursing – MAIX Lab | AI
  Researcher (both bullets — ECG multimodal alignment + FAISS retrieval).
- **Kept full**: Emory NLP/Naver (both bullets), Sionic AI (all 3 bullets —
  this is your strongest pure-research entry, unlike the SWE cut above).
- **Reframed**: Lablup trimmed to the vLLM/GPU-benchmarking research bullet
  only (cut the PyCon/FastTrack SWE bullets — not ML-relevant here).
  LinkedIn trimmed to the eval-harness + multi-agent-routing bullets only
  (cut the auth/networking bullet — not ML-relevant here).
- **Cut entirely**: Park My Ride (zero ML relevance).
- **Projects**: swapped Rendezvous → **MBTI Dating Simulation App**
  (RAG/Langflow/Claude/Cohere/Pinecone — much stronger ML signal), kept
  Curaitor + Good Hangul.
- **Leadership**: kept Project Emory + Emory Hacks (trimmed to 1 bullet
  each); cut Kubernetes/CNCF (not ML-relevant, saves space for research
  content).
- **Skills**: added a dedicated `ML/AI` row (PyTorch, LoRA, DPO, RAG,
  FAISS, Hugging Face, Qwen3, LLM-as-judge, Pandas) for ATS keyword
  coverage (prompt #3) against ML/research job descriptions; added Azure
  and reordered Languages to lead with Python.

### One thing to verify before you use either (prompt #10, hiring-manager-style catch)
Your two source materials disagree on the Emory Hacks numbers:
- Old resume.yaml bullet (via Project Emory): "70+ participants"
- `ml-nov10.pdf`: "MLH-certified", "200+ participants", "$20K+" secured
  sponsorship

I used the more detailed/likely-more-current `ml-nov10.pdf` numbers in
both new files, but **please confirm 70+ vs. 200+ before sending these
out** — a reviewer who knows the actual event size will catch an inflated
number immediately, which is worse than a modest one.

### Recurring gotcha (same as §1/§2): escaping `$`
Every dollar-figure bullet (`$10M+`, `$20K+`) needs `\\$` in the YAML
(not just `\$`) — see the note under §1 for why. Already handled correctly
in both new files.

## 7. Huddle Surety — added, but corrected vs. teammate's LinkedIn draft

Your teammate's LinkedIn post credits the team with: "Founding Engineer &
CTO," Sep 2025 – Present, and lists frontend (Next.js role-based UI),
OTel tracing, RAG pipeline design, the Go API, Redis/ReBAC, and audit
logging all together. You confirmed your actual scope is narrower than
that combined list, so here's what got used vs. dropped:

**Kept (your confirmed work):**
- Core Go REST API (100+ endpoints), ReBAC, Redis caching.
- Temporal — used to orchestrate RAG-backend communication, audit
  logging, and auth/authz workflows (this is *your* addition; the
  teammate's post didn't mention Temporal at all).
- RAG pipeline contribution (you confirmed you did contribute here, just
  not the frontend).
- PostgreSQL data systems / contractor-agent management (from your own
  one-line summary).
- OpenTelemetry — but **metrics + dashboards only**, not tracing (the
  teammate's post says "tracing across services"; you specifically said
  you didn't do the tracing part).

**Dropped (not your work, per your correction):**
- The role-based Next.js/TypeScript frontend — that's the teammate's
  contribution, not yours.
- "reducing bond processing time by 90%" / "95% accuracy" — these are
  team-level product metrics from the teammate's post, not tied to a
  specific bullet you confirmed doing; left out rather than risk claiming
  someone else's measured result as your own. Add them back in only if
  you can attribute them to your own work specifically.

**Title/dates discrepancy — needs your confirmation:**
- Teammate's LinkedIn: "Founding Engineer & CTO," Sep 2025 – Present.
- Your own note: "Founding Backend Engineer," Jan 2026 – Jul 2026.
- I used **your** title and dates in `resume-suggested.yaml` and
  `resume-swe.yaml` since you're the one confirming scope, but "CTO" is a
  notably different (and more senior-sounding) title than "Founding
  Backend Engineer" — worth deciding deliberately whether you also hold
  the CTO title, since that's a meaningful signal on a resume if true.

**Page-fit note:** adding this entry pushed both `resume-swe.yaml` and
`resume-suggested.yaml` to 2 pages, so **Park My Ride was cut entirely**
from both (previously trimmed to 1 bullet) to get back to 1 page — Huddle
Surety is a stronger, more recent, more relevant entry for a SWE-track
resume than Park My Ride ever was. Not added to `resume-ml.yaml` since
it's backend/infra work with limited ML-research signal for that track —
say the word if you'd rather it appear there too.

## 8. Open items before you finalize

- [ ] Decide: cut Park My Ride entirely, or trim to 1 bullet, to make room?
- [ ] Decide: include Emory research at 3 bullets, 2 bullets, or skip it
      depending on the roles you're targeting (see §0 reasoning).
- [ ] Decide: dedicated Kubernetes leadership entry, or fold into Skills
      only, based on remaining space.
- [ ] Cut Rendezvous from `projects` first if you still need more room.
- [ ] Confirm exact Emory start date and official title.
- [ ] Pick what to trim from existing entries once both new ones are in and
      you can see the real page-fit (`make pdf`).
- [ ] Regenerate `resume-preview.png` (`make preview`) once resume.yaml is
      final, so the README image matches before you zip/share it.
- [ ] LinkedIn's own "About" text isn't accessible to me — the paragraph
      above is a suggested addition, not a full rewrite; merge it with what
      you already have.
- [ ] **Confirm Emory Hacks participant count: 70+ (old) vs. 200+
      (`ml-nov10.pdf`)** before using either new resume variant — see §5.
- [ ] Confirm "Vice President" should be dropped from the Emory Hacks
      title, or kept alongside "Co-Founder".
- [ ] Review `resume-swe.yaml` / `resume-ml.yaml` trim choices (§5) — same
      "not yet approved by you" caveat as `resume-suggested.yaml`.
- [ ] **Confirm Huddle Surety title/dates**: "Founding Backend Engineer,"
      Jan–Jul 2026 (yours) vs. "Founding Engineer & CTO," Sep 2025–Present
      (teammate's LinkedIn post) — see §7.
- [ ] Decide whether Huddle Surety should also appear on `resume-ml.yaml`
      (currently SWE/suggested-only).
