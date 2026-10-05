# Changelog

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
