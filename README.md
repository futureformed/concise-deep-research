# Concise Deep Research

![How concise deep research works: a question goes to three search providers, a System One classifier sorts the results, mid-tier readers build a claim ledger, a top-tier challenger attacks the findings, and the top tier writes a short brief with a separate evidence appendix.](assets/pipeline.svg)

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

## Connect search providers

The skill needs three search services that return real results. Four of these work with no key for light use, so you can try the skill before you spend anything. Sign up, create a key in the console, and give it to your host through its credential settings or the provider's MCP sign-in. Never paste a key into a chat.

| Provider | Get a key | Free allowance | Page text? |
|---|---|---|---|
| [Exa](https://dashboard.exa.ai/api-keys) | dashboard.exa.ai | $10 credit a month; keyless MCP | Yes |
| [Tavily](https://app.tavily.com) | app.tavily.com | 1,000 credits a month | Yes |
| [Brave Search](https://api-dashboard.search.brave.com/register) | api-dashboard.search.brave.com | $5 credit a month | Snippets |
| [Parallel](https://platform.parallel.ai) | platform.parallel.ai | 5,000 requests a month; keyless MCP | Excerpts |
| [Firecrawl](https://www.firecrawl.dev/app/api-keys) | firecrawl.dev | 1,000 credits a month; keyless with limits | Yes |
| [Linkup](https://app.linkup.so) | app.linkup.so | 4,000 queries | Yes |
| [Perplexity](https://console.perplexity.ai) | console.perplexity.ai | None documented | Snippets |
| [You.com](https://you.com/platform) | you.com/platform | 100 queries a day keyless | Yes |

Prices, one-line connect commands for Claude Code and Codex, and notes on which services count as distinct providers are in [search-providers.md](skills/concise-deep-research/references/search-providers.md).

## Use

Ask your agent:

> Use concise-deep-research to research [question]. The audience is [audience], the decision is [decision], and the scope is [scope].

The skill discovers the search tools your host exposes, runs the first query as a readiness test, and asks you to connect more providers only if fewer than three work.

## What you get

- `brief.md`: a 2–3 sentence answer, up to five cited findings, up to three implications, the uncertainties that could change the decision, and one coverage line naming the providers and date.
- `evidence.md`: scope, provider log, source register, claim ledger, challenge record, remaining gaps, and a model and cost log.

## What a System One model is

A language model writes text. A System One model decides. You give it a passage and a question with a fixed set of allowed answers, and it returns the answer and a probability. It does not write prose or reason in steps, so it answers in about a tenth of a second at a few cents per million tokens, roughly a thousandth of a language-model call.

This skill uses one for the clerical half of research: ranking results, labelling source types, spotting sources that share one origin, pre-checking citations, flagging paywalls and injected instructions, and deciding which claims need the expensive challenge pass. Reading, challenging and writing stay with language models.

TypeSafe's Jev is one option, and the bundled script targets its API. Cloudflare's Clef, launched in October 2026, is another, with open weights. Rerank and classify endpoints from Voyage, Cohere and Jina cover parts of the job, and a small language model with a JSON schema is the fallback when nothing else is configured. Set `TYPESAFE_API_KEY` to use Jev; without it the skill runs the same steps on the cheapest language model and says so in the appendix. The options and their prices are in [model-routing.md](skills/concise-deep-research/references/model-routing.md).

## Contents

| Path | Purpose |
|---|---|
| `skills/concise-deep-research/SKILL.md` | The skill: six stages from scope to delivery |
| `skills/concise-deep-research/references/provider-readiness.md` | How providers are discovered, counted and activated |
| `skills/concise-deep-research/references/search-providers.md` | Eight search providers: keys, prices, connect commands |
| `skills/concise-deep-research/references/deliverables.md` | Templates for the brief, the appendix and run notes |
| `skills/concise-deep-research/references/model-routing.md` | Which model tier and which classifier runs each stage, with dated prices |
| `skills/concise-deep-research/references/delegation-templates.md` | Sub-agent contracts and agent files for Claude Code and Codex |
| `skills/concise-deep-research/scripts/typesafe_sort.py` | Runs the classifier steps over JSONL rows, standard library only |
| `METHODS.md` | Why the method is shaped this way |
| `APPROACH.md` | The agreed research method in prose |
| `EVALUATION.md` | Behavioural acceptance scenarios |
| `assets/` | The pipeline diagram and a square version for social posts |

## Limits

The skill is instructions. It does not install providers, hold keys or buy subscriptions, and it orchestrates whatever search tools the host exposes. Package validation checks structure and links; research quality needs a live run. Prices and model names in the references are dated and will go stale.

## Licence

MIT. See [LICENSE](LICENSE).
