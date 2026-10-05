# Search providers: keys and connections

The skill needs three distinct search services that return real results. This page lists eight that work well for research, where to get a key, what each costs, and how to connect it to a coding agent. Figures were checked on 5 October 2026 and will drift; the vendor page wins.

## How keys work

1. Sign up on the vendor's console page below. Most give a free monthly allowance with no card.
2. Create an API key in the console. Treat it like a password.
3. Give the key to your agent host through its credential settings, an environment variable, or the MCP server's own sign-in flow. Never paste a key into a chat or a prompt file. A key in a URL query string leaks into shell history; use a header or an environment variable.
4. Start a new session so the host loads the new tool, then run one real query. Installed is not connected; a successful result is.

Four of the eight work with no key at all for light use: Exa, Parallel, You.com (free profile) and Firecrawl. That is enough to try the skill before you spend anything.

## The eight

| Provider | Get a key | Free allowance | Starting price | Returns page text? | Index |
|---|---|---|---|---|---|
| [Exa](https://dashboard.exa.ai/api-keys) | dashboard.exa.ai | $10 credit a month, about 2,500 searches | $4 per 1k searches; contents $1 per 1k pages | Yes: highlights, full text, summaries | Own |
| [Tavily](https://app.tavily.com) | app.tavily.com | 1,000 credits a month, no card | $8 per 1k basic searches | Yes, with raw content on | Not stated |
| [Brave Search](https://api-dashboard.search.brave.com/register) | api-dashboard.search.brave.com | $5 credit a month | $5 per 1k requests | No, snippets only; pair with a fetch tool | Own, independent |
| [Parallel](https://platform.parallel.ai) | platform.parallel.ai | 5,000 requests a month; MCP works keyless | $1 to $5 per 1k requests | Excerpts; fetch tool and Extract API for full text | Own, per vendor |
| [Firecrawl](https://www.firecrawl.dev/app/api-keys) | firecrawl.dev | 1,000 credits a month, no card | 2 credits per 10 results; $16 a month for 5,000 credits | Yes, with scrape options; the MCP search tool finds only, then scrape | Not named; treat as a wrapper |
| [Linkup](https://app.linkup.so) | app.linkup.so | 4,000 free queries | $5 to $6 per 1k searches | Yes, with sourced answers | Likely own; not stated outright |
| [Perplexity](https://console.perplexity.ai) | console.perplexity.ai | None documented | Search $5 per 1k; Fast $1 per 1k | Snippets; Sonar gives an answer with citations | Not stated |
| [You.com](https://you.com/platform) | you.com/platform | 100 queries a day keyless on the free profile | $5 per 1k calls; full-page fetch $1 per 1k pages | Yes, full-page mode | Own, per vendor |

Two more, with caveats. Serper wraps Google and returns snippets only, with 2,500 free queries. Jina's s.jina.ai is token-priced, with 10M free tokens per key, and does not name its search engine.

## Counting distinct providers

The skill counts services with their own discovery, not interfaces. Brave states an independent index. Exa, Parallel and You.com state or imply their own. Treat Firecrawl as a wrapper, and Tavily and Perplexity as unknown, and say so in the appendix. Three named services still count as provider diversity even where index details are undisclosed; the appendix records the limitation.

For reading sources, Exa, Tavily, Firecrawl, Linkup and You.com return page text. Brave, Parallel and Perplexity return snippets or excerpts, so pair them with a fetch tool. Fetching does not fill a provider slot.

## Connect to Claude Code

Exa, as the official plugin:

```bash
claude plugin install exa@claude-plugins-official
```

Tavily (signs in with OAuth on first use):

```bash
claude mcp add tavily-remote-mcp --transport http https://mcp.tavily.com/mcp/
```

Parallel (keyless):

```bash
claude mcp add --transport http Parallel-Search-MCP https://search.parallel.ai/mcp
```

Linkup:

```bash
claude mcp add --transport http linkup https://mcp.linkup.so/mcp --header "Authorization: Bearer $LINKUP_API_KEY"
```

Perplexity:

```bash
claude mcp add perplexity --env PERPLEXITY_API_KEY="$PERPLEXITY_API_KEY" -- npx -y @perplexity-ai/mcp-server
```

You.com:

```bash
claude mcp add --transport http ydc-server https://api.you.com/mcp --header "Authorization: Bearer $YDC_API_KEY"
```

Brave and Firecrawl document a JSON block rather than a one-line command. Add these to your host's MCP settings:

```json
{
  "mcpServers": {
    "brave": {
      "command": "npx",
      "args": ["-y", "@brave/brave-search-mcp-server", "--transport", "stdio"],
      "env": { "BRAVE_API_KEY": "<your key>" }
    },
    "firecrawl": {
      "type": "http",
      "url": "https://mcp.firecrawl.dev/v2/mcp-oauth"
    }
  }
}
```

## Connect to Codex CLI

Parallel:

```bash
codex mcp add parallel-search --url https://search.parallel.ai/mcp
```

Linkup:

```bash
codex mcp add linkup -- npx -y linkup-mcp-server apiKey=$LINKUP_API_KEY
```

Perplexity:

```bash
codex mcp add perplexity --env PERPLEXITY_API_KEY=$PERPLEXITY_API_KEY -- npx -y @perplexity-ai/mcp-server
```

For the others, add the same remote URL or npx command in `~/.codex/config.toml` under `[mcp_servers.<name>]`.

## Claude Cowork and claude.ai

Add providers through the app's connectors or MCP settings, using each vendor's sign-in flow. The skill discovers whatever tools the host exposes; it does not need a specific brand.

## Sources

Vendor pricing and docs pages for each provider, read on 5 October 2026: exa.ai/pricing and docs, docs.tavily.com and tavily.com/pricing, brave.com/search/api and the Brave MCP repository, docs.parallel.ai and parallel.ai/pricing, docs.firecrawl.dev and firecrawl.dev/pricing, docs.linkup.so and linkup.so/pricing, docs.perplexity.ai, you.com/docs.
