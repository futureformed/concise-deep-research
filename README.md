# Concise Deep Research

![How concise deep research works: a question goes to three search providers, a System One classifier sorts the results, mid-tier readers build a claim ledger, a top-tier challenger attacks the findings, and the top tier writes a short brief with a separate evidence appendix.](assets/pipeline.svg)

An agent skill that produces short, evidence-led research briefs. Every standard run searches through at least three distinct search providers, reads the sources it cites, labels each claim as supported, partly supported, disputed or unverified, and delivers a brief of about 1,200 to 1,800 words with a separate evidence appendix. Cheap models and a System One classifier do the searching and sorting; the strongest model plans, challenges and writes.

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

The skill needs three search services that return real results. Four of these work with no key for light use, so you can try the skill before you spend anything. The last column says what each provider asks for before your agent can use it. The section after the table says where a key goes.

| Provider | Get a key | Free allowance | Page text? | What you need |
|---|---|---|---|---|
| [Exa](https://dashboard.exa.ai/api-keys) | dashboard.exa.ai | $10 credit a month; keyless MCP | Yes | Nothing to start; a key for more use |
| [Tavily](https://app.tavily.com) | app.tavily.com | 1,000 credits a month | Yes | A browser sign-in the first time |
| [Brave Search](https://api-dashboard.search.brave.com/register) | api-dashboard.search.brave.com | $5 credit a month | Snippets | A key |
| [Parallel](https://platform.parallel.ai) | platform.parallel.ai | 5,000 requests a month; keyless MCP | Excerpts | Nothing |
| [Firecrawl](https://www.firecrawl.dev/app/api-keys) | firecrawl.dev | 1,000 credits a month; keyless with limits | Yes | A browser sign-in the first time |
| [Linkup](https://app.linkup.so) | app.linkup.so | 4,000 queries | Yes | A key |
| [Perplexity](https://console.perplexity.ai) | console.perplexity.ai | None documented | Snippets | A key |
| [You.com](https://you.com/platform) | you.com/platform | 100 queries a day keyless | Yes | Nothing to start; a key for more use |

Prices, one-line connect commands for Claude Code and Codex, and notes on which services count as distinct providers are in [search-providers.md](skills/concise-deep-research/references/search-providers.md).

## Where your API keys go

An API key is a long string of letters and numbers that a provider gives you when you sign up. It works like a password for a program. Each time your agent searches through a provider, it sends the key with the request. The provider checks the key, runs the search and counts the cost against your account. Anyone who has your key can spend your credit, so treat it like a password.

You never type the key into a chat, and the skill never asks you for it. The key goes into one place in your agent host, once, before your first run. After that, the host sends it with every search and you do not touch it again.

**When.** Do this once per provider, before you run the skill for the first time. The skill checks for working providers at the start of every run and tells you if one is missing.

**How.**

1. Sign up with the provider and create a key in its console. The links are in the table above.
2. Copy the key. Most consoles show it once. If you lose it, create a new one.
3. Put it in the one place for your host. The table below says where.
4. Start a new session, so the host loads the new connection.
5. Ask your agent to run one search with that provider. A real result means the key works. Installed is not connected.
6. Save the key in your password manager and clear it from your clipboard.

**Where.**

| Host | Where the key lives | What you do |
|---|---|---|
| Claude Code | Claude Code's own config file, `~/.claude.json`, outside your project | Run the provider's `claude mcp add` command from [search-providers.md](skills/concise-deep-research/references/search-providers.md). The key is part of the command, as a `--header` or `--env` option. Claude Code stores it for you. |
| Codex CLI | `~/.codex/config.toml`, under `[mcp_servers.<name>]` | Run the provider's `codex mcp add` command, or add the block by hand with the key in its `env` table. |
| Claude Cowork, claude.ai, ChatGPT | The provider's connector settings in the app | Add the provider as a connector. Paste the key into the field the connector asks for, or sign in when it opens a browser page. |
| Any host, for the classifier | A shell environment variable, `TYPESAFE_API_KEY` | Add `export TYPESAFE_API_KEY="..."` to `~/.zshenv` on macOS or `~/.bashrc` on Linux, then open a new terminal. Details in [model-routing.md](skills/concise-deep-research/references/model-routing.md). |

Three things to know:

- The connect commands write `$LINKUP_API_KEY` and similar. That is a placeholder for a shell variable. Either replace it with your key, between the quotes, or set the variable in your shell first.
- Providers marked "browser sign-in" (Tavily, Firecrawl) open a web page the first time your agent uses them. You log in there and the host keeps a token. You never see or store a key.
- In Claude Code, `claude mcp add --scope project` writes a `.mcp.json` file inside your project, which git will commit. Do not put a real key there. If a team needs a shared `.mcp.json`, write `${LINKUP_API_KEY}` in the file and set the variable in each person's shell.

Where a key must never go: a chat message, a prompt, `SKILL.md`, the run folder, or any file in a git repository.

## Use

First decide where the results should go: a project folder, a synced Google Drive or OneDrive folder, or wherever you keep research. Name it in the request. If you do not, the skill saves to a `research/<date>-<slug>/` folder in the current working directory and tells you so before it starts.

Ask your agent:

> Use concise-deep-research to research [question]. The audience is [audience], the decision is [decision], and the scope is [scope]. Save the results in [folder].

The skill discovers the search tools your host exposes, runs the first query as a readiness test, and asks you to connect more providers only if fewer than three work. It also tells you, before spending anything, if a classifier key or a search provider is missing and how to add it.

## What you get

Two files, in a run folder:

- `brief.md`: the answer, about 1,200 to 1,800 words. A 2–3 sentence conclusion, up to five cited findings, up to three implications, the uncertainties that could change the decision, and one coverage line naming the providers and date. Each finding carries the figure, its denominator, the period, the method and the main caveat, so you can judge it without opening the appendix. This is the file to read.
- `evidence.md`: the receipts. Open it only to check a claim: each source ID in the brief leads to the URL, the passage location, the reader's status and the challenger's verdict. It also holds the provider log, the remaining gaps and a model and cost log.

The run also writes a `work/` subfolder: search registers, classifier input and output, full claim ledgers, the draft findings and the challenge record, plus run notes. It is the audit trail and the checkpoint a resumed run picks up from. It is not meant to be read, and you can delete it once you accept the brief.

## How long it takes

A standard run takes roughly 15 to 40 minutes of wall-clock time, longer on a slow host. The skill searches three providers, reads the sources it cites rather than trusting snippets, labels every claim, and then runs a separate adversarial pass that tries to overturn the findings before anything is written. Most of that time is reading and cross-checking, not searching. If you need an answer in two minutes, this is the wrong tool; ask your agent a plain question instead.

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
