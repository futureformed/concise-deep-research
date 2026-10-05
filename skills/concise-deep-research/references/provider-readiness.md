# Provider readiness

## Discover and count

Inspect available tools and, where supported, deferred tool discovery. Read the chosen providers' current local skill/help or live schemas before calling them. Do not enumerate secrets or copy API keys into reports. A CLI can be usable even when no chatbot tool is listed; check only documented, installed interfaces.

Maintain:

| Service | Interface | Search capability | Readiness | Underlying backend | Qualifies? |
|---|---|---|---|---|---|
| Actual service name | Observed tool/CLI | Observed operation | available / succeeded / failed / unavailable | known name or unknown | yes/no and why |

Possible services, not guaranteed integrations:

- **Exa:** discover connected search and fetch tools. Read current Exa guidance when present.
- **Tavily:** discover connected tools or its installed CLI and current help. Do not demand an API key before trying a supported keyless or existing authenticated interface.
- **Firecrawl:** discover its search operation separately from scraping. Scraping alone cannot satisfy a discovery-provider slot.
- **Parallel:** use only a verified installed integration and documented search operation. Do not assume “Parallels” means this service or invent an integration URL.
- **Native search:** identify the actual provider where possible. Different chatbot brands do not establish separate provider identities. Unknown infrastructure must be disclosed and cannot fill the strict three-provider minimum.

Three named independent services qualify as provider diversity even when their underlying indexes are not fully disclosed; note that limitation. If evidence shows two services merely proxy the same backend without independent discovery, count that backend once. Never claim index independence unless established.

## First query

Use a concise public-topic query relevant to the brief. Log success only after usable relevant results return. Empty/off-topic results merit one revised query; authentication failures need a connection fix, not repeated calls. Retry transient faults once. A queued research job counts only when its result has been retrieved and inspected. Respect rate limits and known budgets.

## Ask only for missing activation

Example, populated from observed state:

> I can search with Exa and Tavily. This workflow requires three providers. Please enable or connect Firecrawl, Parallel, or another supported search provider in this chatbot's app/plugin/MCP settings. Use its secure connection flow rather than posting an API key here. Once its search tool is available, I can resume from the saved brief.

State the real observed error if authentication or credits failed. If zero providers work, request three; if two work, request one. Mention already-working providers so the user does not repeat setup. Name precise menus only when supported by current documentation or observed UI. Use a host's installation flow only where available and authorized; this skill does not grant permission to change global settings or purchase services.

If the host requires a new chat to expose newly connected tools, explain that only when verified, and give the saved run path and a resume prompt. Otherwise re-discover tools in the current session.

Do not block useful preparation: complete the brief and save gathered evidence. If the user explicitly accepts reduced coverage, record the exception in the appendix and label the brief “Reduced coverage: N of 3 required providers succeeded.” Report actual N. Do not repeatedly request an already accepted exception.

## Resume

Read saved scope, provider log and evidence; retry only missing or stale coverage. Keep previous useful results and mark dates. Providers need not run simultaneously. Do not call a local-file-only audit a completed three-provider web research run.
