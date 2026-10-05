# Changelog

## 1.1.1 (2026-10-05)

- A missing `TYPESAFE_API_KEY` now triggers one clear request with setup instructions (new "Add a TypeSafe key" section in `model-routing.md`) instead of a silent fallback to a language model. The scope stage reports missing host controls with their one-line fix before the run spends anything.

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
