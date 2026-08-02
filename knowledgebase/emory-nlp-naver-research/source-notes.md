# Source notes (PRIVATE — do not share, zip, or publish)

Raw extracted detail from the two Notion-export PDFs (`notion-page1.pdf` =
"User Modeling and Personalization", `notion-page2.pdf` = "Progress"), kept
for your own reference. Contains internal/Korean-language project detail not
meant for the public-facing `summary.md`.

## Project framing (from "User Modeling and Personalization")

- Overall project goal: build STM/LTM for personalization material across
  Naver's various agents ("네이버 내 다양한 에이전트에 개인화 재료") — note:
  **LTM was not my work**; my scope was the STM side only.
- Target applications mentioned: daily briefing ("gpt pulse"-style),
  follow-up topic briefings, action induction (reservations/purchases),
  shopping/content recommendation personalization.
- STM format (my scope): `interest_profile` + `analysis` (adding the
  reasoning field improved extraction quality).
- LTM designs (project context / other contributors, NOT my work — keep out
  of resume bullets): design A (evidence-backed) — `interest_profile`,
  `evidence=[STM, ...]`, `analysis`; design B (multi-perspective reasoning)
  — `name`, `description`, `reasoning.grouping`, `reasoning.uniqueness`,
  `reasoning.abstraction`, `reasoning.prediction_test`.
- Open-model PoC logic: "big model 이 할 수 있어야 small model 도 할 수
  있을 것이다" — prove the task on a big model before distillation/RL.
- Candidate models for PoC: OpenAI API, Qwen, Gemma.

## Training setup (from "Progress")

- Model: Qwen3-14B + LoRA (`r=16`, `lora_alpha=32`, target modules
  `q_proj`/`v_proj`).
- Method: Groupwise DPO (G=5), offline reward.
- Data: 600 users total, split train/val/test = 300/100/200.
- Optimization: LR 5e-5, Beta 0.1, ACCUM_STEPS 4.
- Constraints: batch size 2, max-token-size 4096, max events per user 324
  (OOM-driven limits).

## Reward function

- `0.25*cohesion + 0.25*groundedness + 0.25*truthfulness + 0.125*coverage
  + 0.125*non-duplicate`.
- cohesion = intra-cluster tightness; groundedness = summary matches
  evidence; truthfulness = no overstatement/hallucination beyond evidence;
  coverage = fraction of logs covered; non-duplicate = logs not reused
  across intents.

## Reward-hacking diagnosis (singleton overproduction)

- Avg evidence-per-intent collapsed across epochs: 3.1585 → 1.8615 → 1.0042
  (model learned to emit mostly single-evidence "intents" to game the
  reward).
- Fix: redesigned cohesion as `combined = 0.6*intra - 0.4*inter_penalty`,
  where inter_penalty = max cosine similarity to other cluster centroids —
  penalizes duplicate/overlapping and trivial singleton clusters.
- Cohesion stats after fix: old cohesion mean 0.4467 → combined mean -0.0546
  (combined max 0.3741 vs old cohesion max 0.8752) — i.e. the raw score
  dropped, but by design (it now punishes the previously-rewarded trivial
  clusters).

## Format-regression diagnosis (the "did quality actually drop?" investigation)

Strict-parsing scores by checkpoint (out of 102 test cases), with reward:

| Step | Strict score | Reward |
|---|---|---|
| 0 (base) | 102/102 | 0.607 |
| 200 | 102/102 | 0.613 |
| 400 | 99/102 | 0.630 |
| 600 | 76/102 | 0.659 |
| 800 | 42/102 | 0.660 |
| 1000 | 32/102 | 0.653 |

- Root cause from step 400 onward: evidence IDs emitted as strings like
  `"log_id 5"` instead of plain ints — valid JSON, but failed strict integer
  parsing.
- Re-scoring with lenient parsing: step 800 → 101/102 (reward 0.662); step
  1000 → 44/102 (reward 0.658).
- Conclusion: **step 800 is the real best checkpoint**, a genuine **+0.055**
  improvement over the 0.607 baseline once the format artifact is corrected
  for. Quote: "포맷 오류를 제외하면 품질 저하 없음" (no quality
  degradation once format errors are excluded); "모델은 올바른 로그를
  참조하고 있었으며, 포맷만 틀렸음" (model referenced the correct logs —
  only the format was wrong).

## Prompt/model ablations

- "Think" (explicit reasoning) connects more logs into broader categories
  but can overgeneralize; "No-Think" produces more specific interests.
- Qwen3-14B produced more distinctive interest profiles than Qwen3-4B/8B,
  which tended to repeat/blur profiles across users.
- A truthfulness-judge prompt bug was found and fixed: the judge initially
  flagged `[검색어]`/`[클릭 문서]` (search query / clicked document — i.e.
  actual user actions in the log format) as hallucinated content; prompt
  was corrected to clarify these are user behavior, not model-invented text.

## Status / venue

- No evidence in either PDF of publication or venue submission — reads as
  active internal research notes/experiment logs with open "Todo" items and
  "considerations for real service" sections. Treat as ongoing when writing
  bullets (present tense, not "published").

## Reminder

Don't copy Korean-language internal notes, exact reward-formula weights, or
the raw checkpoint table into any public-facing text — the `summary.md` in
this folder already has the resume-safe version. This file is for your
reference only.
