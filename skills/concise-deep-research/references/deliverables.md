# Deliverable templates

Use these as schemas, not instructions to produce empty sections. Omit fields genuinely inapplicable, but retain provenance and uncertainty. Evidence IDs must remain stable throughout a run.

## brief.md

```markdown
# [Question or decision]

[2–3 sentence direct answer. Cite material factual claims.]

## Key findings

- **[Finding].** [Evidence and meaningful qualification.] [S01](actual-source-url)

## Implications

- [Action or decision implication. Label inference where appropriate.]

## What could change the answer

[Only decision-relevant conflicts or gaps. Omit if none.]

Research date: [date]. Search providers: [actual successful services].
[Coverage shortfall if any.] Evidence: [link to evidence.md].
```

Aim for up to five findings and three implications. A requested table, result count or meeting-question structure takes precedence. The default 600–900 words is a ceiling-oriented target, not a minimum. Do not compress a complex required answer into misleading brevity.

## evidence.md

### Scope

Question, decision, audience, geography, date window, assumptions, exclusions, mode and budget. Record any explicitly accepted provider exception.

### Provider log

| Provider | Interface/backend | Query | Run date | Result/status | Discovered source IDs |
|---|---|---|---|---|---|

Separate number of results returned, unique URLs discovered and sources actually inspected. Do not describe a requested result limit as a source-review count. Note shared or unknown index infrastructure.

### Source register

| ID | Title and URL or local path/page | Author/publisher | Published / evidence period | Retrieved | Type/access | Origin group | Quality or incentive note |
|---|---|---|---|---|---|---|---|

Type/access examples: peer-reviewed paper/full text; preprint/abstract only; regulator/full page; company filing/pages 4–6; journalism/paywalled and unverified. Use “unknown” for missing dates, not invented ones.

Origin group identifies sources based on the same underlying evidence, not merely the same website. Two papers sharing a dataset may not provide independent corroboration for every claim.

### Claim ledger

| Claim ID | Precise claim | Supporting source IDs and passage/page | Opposing evidence | Status | Reason/limitation |
|---|---|---|---|---|---|

Passages can be concise paraphrases with locations; quote only within the host's copyright limits. Split compound claims if different parts have different support. Use these statuses:

- **Supported:** inspected evidence supports the exact wording and scope.
- **Partly supported:** evidence supports only part, or a narrower claim; narrow the brief's wording.
- **Disputed:** credible evidence conflicts and the discrepancy remains unresolved.
- **Unverified:** evidence cannot be inspected or is insufficient; exclude from established findings or identify it explicitly.

Inferences should identify their premise claims and reasoning. They are analysis, not newly verified facts.

### Challenge and remaining gaps

Record the counterevidence queries, material alternative explanations, discrepancy resolutions, unanswered questions and reason for stopping. Keep entries compact and relevant. Do not dump raw tool responses or reproduce entire source documents.

### Model and cost log

| Stage | Model or classifier | Calls | Input tokens | Output tokens | Notes |
|---|---|---|---|---|---|

One row per stage from [model-routing.md](model-routing.md). Use the host's usage figures where exposed; otherwise record the tier and "tokens not exposed". Record search-provider calls on their own row, since they bill per query. Note any escalation (a cheap step redone on a higher tier) and whether System One steps ran on TypeSafe or on the small-tier fallback. Classifier thresholds used go in Notes.

## Checkpoints

For a long or interrupted task save `run-notes.md` with completed questions, outstanding searches, successful/failed providers, evidence IDs, the tier plan, cost so far and next action. Never save credentials. Resume from these notes rather than repeating the whole run; a resume should not re-run classifier steps whose inputs have not changed.
