# Concise Deep Research

An agent skill that produces short, evidence-led research briefs. Every standard run searches through at least three distinct search providers, reads the sources it cites, labels each claim as supported, partly supported, disputed or unverified, and delivers a 600–900 word brief with a separate evidence appendix. Cheap models and a System One classifier do the searching and sorting; the strongest model plans, challenges and writes.

It follows the open [SKILL.md](https://agentskills.io) format, so one folder works in Claude Code, Codex CLI, OpenCode and any other host that reads agent skills.

## Install

Claude Code, as a plugin:

```bash
claude plugin marketplace add futureformed/concise-deep-research
```

```bash
claude plugin install concise-deep-research@concise-deep-research
```

Any other agent, with the skills installer (add `-g` for a global install):

```bash
npx skills add futureformed/concise-deep-research --skill concise-deep-research
```

By hand: copy `skills/concise-deep-research` into your host's skills folder (for example `~/.claude/skills/` or `~/.agents/skills/`), keeping the `references`, `agents` and `scripts` subfolders.

## Use

Ask your agent:

> Use concise-deep-research to research [question]. The audience is [audience], the decision is [decision], and the scope is [scope].

The skill discovers the search tools your host exposes, runs the first query as a readiness test, and asks you to connect more providers only if fewer than three work. Exa, Tavily, Firecrawl and Parallel are examples; no brand is required. Keys belong in your host's credential settings, never in the chat.

Optional: set `TYPESAFE_API_KEY` to run reranking, source-type labels, origin grouping, citation pre-checks and injection flags on TypeSafe's Jev classifier at a fraction of language-model cost. Without it the skill runs the same steps on the cheapest language model and says so in the appendix.

## What you get

- `brief.md`: a 2–3 sentence answer, up to five cited findings, up to three implications, the uncertainties that could change the decision, and one coverage line naming the providers and date.
- `evidence.md`: scope, provider log, source register, claim ledger, challenge record, remaining gaps, and a model and cost log.

## Contents

| Path | Purpose |
|---|---|
| `skills/concise-deep-research/SKILL.md` | The skill: six stages from scope to delivery |
| `skills/concise-deep-research/references/provider-readiness.md` | How providers are discovered, counted and activated |
| `skills/concise-deep-research/references/deliverables.md` | Templates for the brief, the appendix and run notes |
| `skills/concise-deep-research/references/model-routing.md` | Which model tier and which classifier runs each stage, with dated prices |
| `skills/concise-deep-research/references/delegation-templates.md` | Sub-agent contracts and agent files for Claude Code and Codex |
| `skills/concise-deep-research/scripts/typesafe_sort.py` | Runs the classifier steps over JSONL rows, standard library only |
| `METHODS.md` | Why the method is shaped this way |
| `APPROACH.md` | The agreed research method in prose |
| `EVALUATION.md` | Behavioural acceptance scenarios |

## Limits

The skill is instructions. It does not install providers, hold keys or buy subscriptions, and it orchestrates whatever search tools the host exposes. Package validation checks structure and links; research quality needs a live run. Prices and model names in the references are dated and will go stale.

## Licence

MIT. See [LICENSE](LICENSE).
