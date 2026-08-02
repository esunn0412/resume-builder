# Knowledgebase

Source material behind each resume entry — one folder per experience/project.
This is where the *evidence* lives (what actually happened, in detail); the
resume/LinkedIn only ever show a distilled, public-safe summary written *from*
this material.

**⚠️ Private — do not share/zip/publish this folder.** Some entries reference
internal LinkedIn systems, ticket numbers, or internal links that shouldn't
leave the company. When exporting/emailing the resume repo, exclude
`knowledgebase/`.

## Structure

Each experience gets a folder:

```
knowledgebase/
  <experience-slug>/
    summary.md       curated synthesis (dates, scope, achievements, skills) —
                      resume-safe language, no internal codenames/ticket IDs
    source-notes.md  (optional) raw source material — private journal excerpts,
                      exported docs, links — kept for your own reference only
```

## Workflow

1. When you finish (or make progress on) an experience, drop source material
   here — journal entries, project plans, exported docs, PDFs.
2. Distill it into `summary.md` — plain, resume-safe language a public reader
   can see if it ever leaked, with no internal system names or ticket links.
3. Pull from `summary.md` when updating `resume.yaml` or your LinkedIn profile.

## Current folders

- `linkedin-intern-acacia/` — LinkedIn SWE internship, Project ACACIA (Azure
  Cost Analysis & Contextual Insight Agent).
- `emory-nlp-naver-research/` — Emory NLP Lab research collaboration with
  Naver Corp on user modeling & personalization. *(Awaiting source PDFs.)*

Add folders for earlier experiences (Lablup, Park My Ride, Sionic AI,
Curaitor, Rendezvous, Good Hangul, Project Emory) over time if you want their
source material preserved too — not required, since those resume entries are
already finalized.
