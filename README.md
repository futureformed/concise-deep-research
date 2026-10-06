# Concise Deep Research

![How concise deep research works: a question goes to three search providers, a System One classifier sorts the results, mid-tier readers build a claim ledger, a top-tier challenger attacks the findings, and the top tier writes a short brief with a separate evidence appendix.](assets/pipeline.svg)

An agent skill that produces short, evidence-led research briefs. Every standard run searches through at least three distinct search providers, reads the sources it cites, labels each claim as supported, partly supported, disputed or unverified, and delivers a brief of about 1,200 to 1,800 words with a separate evidence appendix. Cheap models and a System One classifier do the searching and sorting; the strongest model plans, challenges and writes.

It follows the open [SKILL.md](https://agentskills.io) format, so one folder works in Claude Code, Codex CLI, OpenCode and any other host that reads agent skills.

## Install

You install the skill once. After that, Claude uses it when you ask for research. Setup takes about five minutes.

### First, which Claude are you using?

Claude comes in three forms. The steps are different for each, so find yours first.

| You use Claude... | That is | Go to |
|---|---|---|
| In a web browser at claude.ai, or in the Claude app, and you type messages in a chat | **Claude chat** | [Claude chat](#claude-chat) |
| In the Claude desktop app, in the **Cowork** tab, where Claude works on files in a folder on your computer | **Cowork** | [Cowork](#cowork) |
| In a terminal window, where you type `claude` to start it, or in the **Code** tab of the desktop app | **Claude Code** | [Claude Code](#claude-code) |

Not sure? If you only chat with Claude, you use Claude chat. Start there.

You need a paid Claude plan (Pro, Max, Team or Enterprise). The free plan cannot use skills.

### What is a skill, and what is a plugin?

A **skill** is a folder of instructions. It teaches Claude how to do one job. This skill teaches Claude how to do careful research.

A **plugin** is a package that holds one or more skills. It makes the skill easy to install and update. Cowork and Claude Code install plugins. Claude chat uses the skill file directly.

You do not need to understand the files inside. Follow the steps for your app.

### Claude chat

Use this if you chat with Claude at claude.ai, or in the Claude desktop or mobile app.

1. **Download the skill file.** Click this link: [concise-deep-research.zip](https://github.com/futureformed/concise-deep-research/releases/latest/download/concise-deep-research.zip). Your browser saves a zip file, usually to your Downloads folder. Do not open or unzip it.
2. **Open Claude** at [claude.ai](https://claude.ai) on a computer. You cannot upload skills from the mobile app.
3. **Turn on code execution.** Go to **Settings**, then **Capabilities**. Turn on **Code execution and file creation**. Skills need this setting.
4. **Open the skills page.** In the left sidebar, click **Customize**, then **Skills**.
5. **Upload the file.** Click the **+** button, then **Upload a skill**. Choose `concise-deep-research.zip` from your Downloads folder.
6. **Check that it is on.** The skill now shows in your list. Make sure its switch is on.

The skill now works in every new chat, on the web, the desktop app and the mobile app.

Do not use the green **Code > Download ZIP** button on this GitHub page. That zip holds the whole project, and Claude will reject it. Use the link in step 1.

### Cowork

Use this if you use the Cowork tab in the Claude desktop app.

1. **Open the Claude desktop app** and click **Customize** in the left sidebar.
2. Click **Plugins**.
3. Click **Add marketplace**. A marketplace is a list of plugins that someone shares from GitHub.
4. **Type the address** `futureformed/concise-deep-research` and confirm.
5. Find **Concise Deep Research** in the list and click **Install**.
6. **Start a new Cowork task.** Cowork loads new plugins when a task starts, not during one.

Plugins you add here are saved to your Claude account. They also show in Claude Code on any computer where you sign in.

If you cannot add a marketplace (some work accounts turn it off), download [concise-deep-research.zip](https://github.com/futureformed/concise-deep-research/releases/latest/download/concise-deep-research.zip) and use the steps for [Claude chat](#claude-chat) instead.

### Claude Code

Use this if you start Claude by typing `claude` in a terminal.

1. **Open a terminal.** On a Mac, open the **Terminal** app. On Windows, open **PowerShell**.
2. **Copy and run this command.** It tells Claude Code where to find the plugin.

   ```bash
   claude plugin marketplace add futureformed/concise-deep-research
   ```

3. **Copy and run this command.** It installs the plugin.

   ```bash
   claude plugin install concise-deep-research@concise-deep-research
   ```

4. **Start Claude Code again.** Type `claude` and press Return. If Claude Code was already open, type `/reload-plugins` instead.

You can also do steps 2 and 3 inside Claude Code. Type `/plugin`, press Return, and follow the menu.

**In the Code tab of the desktop app:** click the **+** button next to the message box, then **Plugins**, then **Add plugin**. Add the marketplace `futureformed/concise-deep-research` and install **Concise Deep Research**.

### Other agents (Codex, OpenCode, Cursor and others)

Run this in a terminal. Add `-g` at the end to install it for all your projects.

```bash
npx skills add futureformed/concise-deep-research --skill concise-deep-research
```

Or copy the folder `skills/concise-deep-research` into your agent's skills folder, for example `~/.claude/skills/` or `~/.agents/skills/`. Keep the `references`, `agents` and `scripts` folders inside it.

### Check that it works

Start a new chat or session and type:

> What skills do you have for research?

Claude should name **concise-deep-research**. If it does, the install worked. Next, [connect three search providers](#connect-search-providers). The skill cannot do research without them.

### Update or remove

| App | To update | To remove |
|---|---|---|
| Claude chat | Download the zip again. In **Customize > Skills**, delete the old skill and upload the new one. | In **Customize > Skills**, open the skill's menu and delete it. |
| Cowork | In **Customize > Plugins**, open the plugin and click **Update** if it shows. | In **Customize > Plugins**, open the plugin and click **Uninstall**. |
| Claude Code | `claude plugin update concise-deep-research@concise-deep-research` | `claude plugin uninstall concise-deep-research@concise-deep-research` |

### If something goes wrong

- **"Invalid skill" or "SKILL.md not found" in Claude chat.** You uploaded the wrong zip. Download it from the link in step 1 of [Claude chat](#claude-chat), not from the green Code button.
- **No Skills page in Customize.** Your plan may not include skills, or your organisation has turned them off. On a Team or Enterprise plan, ask your admin.
- **`claude: command not found`.** Claude Code is not installed on this computer. Install it from [claude.com/claude-code](https://claude.com/claude-code), or use the Claude chat steps.
- **Claude does not use the skill.** Start a new chat or session. Then name it in your request: "Use concise-deep-research to research ...".
- **The skill says it has fewer than three search providers.** The install worked. Connect more search services, as the next section shows.

Menu names in the Claude apps change from time to time. If a button has a different name, look for the nearest match. These steps were checked on 6 October 2026.

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

### The easy start: three free providers in Claude chat or Cowork

A search provider joins Claude as a **connector**. A connector is a link that lets Claude use another service. These three need no key and no payment:

| Provider | Connector address |
|---|---|
| Parallel | `https://search.parallel.ai/mcp` |
| Tavily | `https://mcp.tavily.com/mcp/` |
| Firecrawl | `https://mcp.firecrawl.dev/v2/mcp-oauth` |

Add each one like this:

1. In Claude, click **Customize** in the left sidebar, then **Connectors**.
2. Click **+**, then **Add custom connector**.
3. Type the provider's name, for example `Parallel`, and paste its address from the table.
4. Click **Add**. If a sign-in page opens (Tavily and Firecrawl do this), make a free account and sign in.
5. Do the same for the next provider.

Connectors you add are saved to your Claude account, so they work in Claude chat and Cowork. Start a new chat after you add them. On a Team or Enterprise plan, an admin may need to add custom connectors for you.

In Claude Code, use the one-line commands in [search-providers.md](skills/concise-deep-research/references/search-providers.md) instead.

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
