# Concise multi-provider deep research

Version 1.0 · 5 October 2026

## Purpose

Produce research that is credible enough to support decisions and concise enough to use. The default is a 600–900 word decision brief, backed by a separate evidence appendix. Shorter is better when sufficient; requested detail takes precedence over the default length.

This is an original implementation. The Trust Insights Deep Research Suite was a functional reference, not a source of proprietary skill instructions. Its public description is at https://academy.trustinsights.ai/products/digital_downloads/deep-research-suite. This version adds mandatory multi-provider discovery and can conduct research with the tools available in its host.

## Non-negotiable defaults

- Use at least three distinct search-provider services for every standard research run.
- Verify that the services actually return usable search results; installed plugins alone do not qualify.
- Prefer credible, relevant original evidence and strong independent analysis.
- Trace material claims to inspected source content, not just search snippets or AI-generated summaries.
- Distinguish facts, interpretation, hypotheses and unresolved uncertainty.
- Separate a short answer from the audit trail. Never shorten by removing a caveat that could change the conclusion.

## Provider readiness and activation

Start by discovering the host's available search tools, connected apps, MCP tools and supported CLIs. Candidate services include Exa, Tavily, Firecrawl and Parallel, plus native search where its provider identity can be established. These are candidates, not mandatory brands. “Firecall” is interpreted as Firecrawl; check an ambiguous “Parallels” reference before configuring a service.

Use existing working connections without asking the user to activate them again. Run the first useful research query as the connection check. If fewer than three providers can succeed, make one concise request naming the working providers and the missing connections. Ask the user to enable/connect/re-authenticate enough services in their chatbot or tool environment. Use current host guidance rather than inventing menu names. Never ask for API keys in chat; use the host's credential settings or an approved secret mechanism.

If activation remains necessary, save the brief and any evidence already gathered, then state the blocker. A reduced-coverage report is permitted only when the user explicitly accepts the exception. Label it clearly. Never silently pass off two providers as three.

Three distinct services broaden discovery but do not guarantee independent indexes or viewpoints. Record shared or unknown underlying search infrastructure. Two interfaces to the same backend count once; an unidentified native backend is supplementary and does not satisfy the strict three-provider minimum. Source independence is checked separately.

## Research workflow

| Stage | Required result |
|---|---|
| Brief | Decision, audience, questions, geography, date window, exclusions and deliverable |
| Discovery | Independent initial searches through at least three providers, with logged queries and URLs |
| Evidence | Relevant source content inspected; claims mapped to supporting passages |
| Challenge | Counterevidence and alternative explanations sought; discrepancies reconciled or retained |
| Synthesis | Concise conclusions weighted by evidence quality, not provider votes |
| Delivery | Brief, evidence appendix and an honest coverage statement |

Ask one batched clarification only when material information is missing. Make reasonable assumptions for routine details. Give each provider the core question and an appropriate source angle before sharing other providers' conclusions. After the initial pass, use targeted follow-ups to fill gaps. One agent can orchestrate all providers; multiple agents are optional and depend on host permissions.

Default budget: approximately 2–4 searches per provider, followed by at most two targeted gap/challenge rounds. This is a planning limit, not a quota. Respect explicit cost and time limits and stop earlier when coverage is sufficient. Paid long-running research jobs require an established budget; ordinary connected search is the default. Search credits and API charges remain those of the chosen services.

## Evidence quality

Prefer sources according to their fitness for the claim:

1. Original research, systematic reviews, official statistics, regulators, standards bodies and original datasets.
2. Filings, official technical documentation and attributable business records for facts about an organisation or product.
3. Established journalism, reputable professional bodies and transparent industry analysis for context and independent scrutiny.
4. Vendor reports and company announcements, with incentives and methodological limits acknowledged.
5. Aggregators and social posts mainly as discovery leads, unless the claim concerns the post itself or directly documented testimony.

Academic affiliation and publication prestige are signals, not proof. Examine methods, sample, dates, funding, corrections, peer-review status and relevance where they affect the conclusion. Avoid false balance: unsupported fringe claims do not deserve equal weight. Seek geographic, disciplinary and stakeholder diversity when relevant.

Three websites quoting one press release are one evidence origin. Trace syndication and shared datasets. A material claim should have two independent credible sources where feasible; an authoritative original may suffice for a straightforward fact. Conflicting or high-impact claims need a targeted corroboration effort, with unresolved limits visible.

## Model routing and cost

Pay for judgement once. The top tier sets the plan, runs the adversarial challenge and writes the brief. Small-tier models run searches and return register rows. Mid-tier models read sources and draft claim rows. A System One classifier (TypeSafe Jev, at about four cents per million input tokens) reranks results, labels source type, groups shared origins, flags paywalls and injection text, pre-checks citations and triages claims for escalation. Code does word counts, link checks and deduplication. Where TypeSafe is not configured, the small tier runs the same questions with a fixed schema.

Cost rules never relax evidence rules. The three-provider minimum, claim statuses and visible caveats stand. A failed cheap step escalates one tier and is logged. Every run records a model and cost log in the appendix. Judge cost per accepted brief, not per call. Details, prices and host mechanics are in `concise-deep-research/references/model-routing.md` and `delegation-templates.md`.

## Deliverables

The main brief opens with a 2–3 sentence answer, then up to five key findings, up to three practical implications and only decision-relevant uncertainties. Inline citations should support the exact nearby claims. Add one short coverage line naming the successful providers and research date. Do not pad the output to reach a word count.

The separate evidence appendix records the scope, provider/query log, sources actually inspected, claim statuses, contradictions and open questions. Requested result counts are not sources read. Keep full URLs and source IDs in exported files so citations remain usable outside the originating chat.

Default claim statuses: supported, partly supported, disputed and unverified. Label inference separately. An absent public reference is not evidence that an activity does not exist.

For company meeting preparation, an optional structure is business context, evidenced AI activity, opportunities labelled as hypotheses, and meeting questions. Do not impose this structure on unrelated research.

## Implementation and limits

The accompanying `concise-deep-research` folder is a portable instruction-based skill with provider guidance and output templates. It uses whichever search tools the host exposes. It does not contain API keys, install providers, supply subscriptions, or secretly launch other chatbot sessions. Compatibility and automatic discovery depend on the host; explicit file-based invocation is available in this workspace.

Start with this workflow, then test it on real research. Evaluate source support, independence, coverage and usefulness rather than number of searches or report length. No workflow guarantees an error-free result.
