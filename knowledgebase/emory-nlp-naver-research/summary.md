# Emory NLP Lab — Research Collaboration with Naver Corporation

**Role:** Researcher, Emory NLP Lab
**Topic:** User modeling & personalization — turning raw user interaction
logs into a reusable short-term "memory" representation for personalized AI
agents.
**Status:** Ongoing / in-progress research (internal experimentation —
no indication of publication or venue submission yet).

## What the project is

A user-personalization research project (collaboration context: Naver-style
agent products). The project's overall scope includes both a **short-term
memory (STM)** — a recent-interest summary — and a longer-term, higher-level
"tendency"/persona layer (**LTM**) built on top of it; **my own work was
scoped to the STM side**: extracting a reusable interest representation from
a user's search/click logs, going beyond "what did the user look at" to
infer *why* (an explainable interest signal that generalizes better than a
raw topic label).

## What I contributed

- **STM representation design:** designed the short-term memory schema
  (`interest_profile` + `analysis`/reasoning field) used to summarize a
  user's recent interests from their interaction logs — adding the
  reasoning field measurably improved extraction quality over a bare
  interest label.
- **Literature review → applied research:** reviewed and synthesized ideas
  from several recent papers on persona modeling, dual (episodic/semantic)
  memory, and prediction-feedback reinforcement learning, and translated
  them into concrete modeling choices for this project (RL/DPO training,
  prediction-based reward signals, QA-style representation learning).
- **Model training experiments:** ran fine-tuning experiments (LoRA on a
  mid-size open LLM) using a **groupwise preference-optimization (DPO)**
  objective with an **offline, multi-component reward function** — combining
  cohesion, groundedness, truthfulness, coverage, and non-duplication signals
  — over a several-hundred-user interaction dataset.
- **Reward engineering / reward-hacking diagnosis:** identified and fixed a
  reward-hacking failure mode where the model learned to over-produce
  trivial single-evidence "intents" to game the reward; redesigned the
  cohesion signal to add an inter-cluster penalty (discouraging duplicate or
  overlapping clusters), correcting the behavior.
- **Root-cause analysis of an apparent quality regression:** during training,
  automated scoring showed the model's outputs appearing to degrade over
  time. I diagnosed that most of this was an **output-format regression**
  (the model started emitting IDs in a slightly different but still valid
  format) rather than a true semantic/quality regression — re-scoring with
  format-tolerant parsing recovered the true best checkpoint and showed a
  genuine, meaningful improvement over the baseline once the format issue
  was accounted for.
- **Prompt/model ablations:** ran comparative studies across model sizes and
  prompting strategies (e.g., explicit step-by-step reasoning vs. direct
  answering) to characterize trade-offs between specificity and
  generalization in the extracted user profiles, informing the final
  modeling approach.

## Skills demonstrated

- LLM fine-tuning (LoRA, preference optimization / DPO)
- Reward-function design for open-ended generation tasks, including
  diagnosing and fixing reward hacking
- Applied literature review translated into a concrete experimental design
- Rigorous root-cause analysis of a model-evaluation regression (didn't
  accept "line went down" at face value — traced it to a parsing artifact)
- Short-term memory / interest-representation design for personalization
  systems

## Possible resume bullet angles

- "Designed a short-term user-memory (interest) representation for a
  personalization research project, and fine-tuned an open LLM (LoRA +
  groupwise DPO) with a custom multi-signal reward function to extract it
  from interaction logs."
- "Diagnosed a reward-hacking failure mode causing the model to over-produce
  trivial outputs, and redesigned the reward signal to fix it — recovering a
  meaningful, verified improvement over baseline."
- "Root-caused an apparent training regression to an output-formatting
  artifact rather than a real quality drop, correctly identifying the true
  best checkpoint through targeted re-evaluation."

## Notes / open items

- Emory NLP Lab affiliation and the Naver collaboration framing come from
  your own context (not explicit in the source documents) — double check
  exact official title/dates before using on the resume/LinkedIn.
- Consider whether this belongs as a resume `experience` entry (parallel to
  internships) since it's a formal research role, not a course project.
- If you want a paper/PACLIC-style credential like the Sionic AI bullet,
  note current status is "ongoing research," not yet published — phrase
  accordingly (present tense / "ongoing").
