# Svellheim-Act3 — Copilot Instructions

Story beat data for **Act 3** of the Svellheim campaign (Beats 19–27).

## File Layout
- `data/director-journals/` — GM-facing beat narratives (JSON)
- `data/player-journals/` — Player handout journals (JSON)
- `data/montage-tests/` — Montage test encounter items (JSON)
- `data/negotiation-tests/` — Negotiation test encounter items (JSON)

## Mandatory Workflows

### Creating Beat Content
- `scaffold_beat` — generates all beat components (journal, tests, encounters) at once
- `generate_montage_test` — individual montage test
- `generate_negotiation_test` — individual negotiation test
- `generate_journal_entry` — journal entries

### Validation (ALWAYS before committing)
- `validate_montage_deep` for montage tests
- `validate_negotiation_deep` for negotiation tests
- `validate_document` for any JSON document

### Searching This Act
- `search_campaign_entities` to find entities in this act
- `search_campaign_docs` to find the AsciiDoc beat narratives in Era-of-Embers

## Conventions
- File naming: `beat-{NN}-{slug}.json` (e.g., `beat-23-the-final-ember.json`)
- Encoding: UTF-8 without BOM
- Known issue: some journals have mojibake (`â€"` → `—`) — fix during encoding pass

## Issue Workflow

See [bruceamoser/Era-of-Embers CONTRIBUTING.md](https://github.com/bruceamoser/Era-of-Embers/blob/main/CONTRIBUTING.md) for the full issue workflow SOP — branch naming, commit conventions, PR process, and release procedures apply to all workspace repos.
