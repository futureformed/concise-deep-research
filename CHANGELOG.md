# Changelog

## 1.3.0 (2026-10-05)

- Default brief length raised from 600–900 to 1,200–1,800 words. The first live run showed that a brief at the old length sent the reader into the appendix for every claim. The extra words go into the evidence behind each finding (figure, denominator, period, method, main caveat), not into process narration. `SKILL.md`, `deliverables.md`, `METHODS.md`, `APPROACH.md` and the README updated.
- README: a "Where your API keys go" section in plain English, with a "What you need" column in the provider table (nothing, a browser sign-in, or a key), the order of steps, and one table saying where the key lives for Claude Code, Codex CLI, the Claude apps and the classifier.

## 1.2.2 (2026-10-05)

- The scope stage asks for, or states, the folder the run will save into, so the user knows where `brief.md` will appear before the run starts. Default: `research/<date>-<slug>/` in the current working directory. README prompt template updated.

## 1.2.1 (2026-10-05)

- The appendix holds only the register and ledger rows the brief relies on; full ledgers go to `work/evidence-full.md`.
- The skill and README now say plainly what `work/` is for (audit trail and resume checkpoint), that it is not meant to be read, and that it can be deleted once the brief is accepted.
- README states how long a run takes and why.

## 1.2.0 (2026-10-05)

Changes from the first live run (three providers, TypeSafe Jev sort and triage, Sonnet readers, Opus challenge).

- Output layout: the user gets `brief.md` and `evidence.md` at the top of the run folder; every working file goes in `work/`. The appendix opens with a three-line "How to use this" note.
- Reader contract now returns a verbatim excerpt (at most 40 words) per claim row and says whether the page, the PDF or a fetch summary was read. The citation pre-check needs the excerpt; it cannot run on a paraphrase.
- Triage and citation pre-check take the claim and excerpt only. Reader caveats in the classifier state pushed 57 of 75 rows over the threshold in the live run.
- Figures from fetch summaries must be confirmed against the page or PDF before they appear in the brief, or be labelled.
- Parallel keyless MCP over HTTP: use a curl user agent and space calls; noted in `search-providers.md`.

## 1.1.1 (2026-10-05)

- A missing classifier key now triggers one clear request that names the System One options (TypeSafe Jev, Cloudflare Clef, rerank or classify endpoints, local models) with setup instructions (new "Add a classifier key" section in `model-routing.md`) instead of a silent fallback to a language model. The scope stage reports missing host controls with their one-line fix before the run spends anything.

## 1.1.0 (2026-10-05)

- README: pipeline diagram, a plain explanation of System One models, and a table of eight search providers with sign-up links.
- New `references/search-providers.md`: keys, free allowances, prices, page-text support, distinct-provider notes, and connect commands for Claude Code and Codex.
- `references/model-routing.md`: what a System One model is and the current options (TypeSafe Jev, Cloudflare Clef, rerank and classify endpoints, local zero-shot classifiers, small language models as fallback).
- `assets/`: the pipeline diagram and a square version for social posts, as SVG and PNG.

## 1.0.0 (2026-10-05)

First public release.

- Six-stage workflow: scope, provider preflight, discovery, inspection, challenge, delivery.
- Three-provider minimum, verified by a real query, with an explicit reduced-coverage exception.
- Source register and claim ledger with four claim statuses and origin groups.
- Model routing: top tier for scope, challenge and synthesis; small tier for searches; mid tier for reading; code for mechanical checks.
- System One classifier steps (TypeSafe Jev, with a small-tier fallback): rerank, source type, origin group, citation pre-check, paywall, injection, escalation triage.
- Sub-agent contracts and agent files for Claude Code and Codex CLI.
- `typesafe_sort.py`: standard-library script for the classifier steps over JSONL rows.
- Model and cost log in the evidence appendix.
