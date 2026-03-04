# Svellheim: Act 3 — The Burning

A Foundry VTT content module for the [Draw Steel](https://mcdm.gg/DrawSteel) system containing montage tests, negotiation tests, player journals, and director journals for **Act 3** of the Svellheim campaign.

![Foundry VTT v13](https://img.shields.io/badge/Foundry_VTT-v13-informational)
![Draw Steel System](https://img.shields.io/badge/System-Draw_Steel-orange)

---

## Compendium Packs

| Pack | Type | Contents |
|---|---|---|
| Svellheim Act 3: Montage Tests | Item | Montage test definitions (beats 20–25) |
| Svellheim Act 3: Negotiation Tests | Item | Negotiation definitions (beats 22–23) |
| Svellheim Act 3: Player Journals | JournalEntry | Player handout journals |
| Svellheim Act 3: Director Journals | JournalEntry | GM-facing director journals |

## Requirements

| Requirement | Version |
|---|---|
| [Foundry VTT](https://foundryvtt.com/) | v11+ (verified v13) |
| [Draw Steel System](https://github.com/MetaMorphic-Digital/draw-steel) | Any |
| [Svellheim: Entities](https://github.com/bruceamoser/Svellheim-Entities) | v0.1.0+ |

This module **only** works with the Draw Steel system.

## Installation

### Manifest URL (recommended)

1. In Foundry VTT, go to **Settings → Manage Modules → Install Module**.
2. Paste the manifest URL into the **Manifest URL** field:
   ```
   https://github.com/bruceamoser/Svellheim-Act3/releases/latest/download/module.json
   ```
3. Click **Install**.

### Manual

1. Download the latest release zip from the [Releases](https://github.com/bruceamoser/Svellheim-Act3/releases) page.
2. Extract the zip into your Foundry `Data/modules/` folder. The folder should be named `svellheim-act3`.
3. Restart Foundry and enable the module in your Draw Steel world.

## File Structure

```
svellheim-act3/
├── module.json                       # Module manifest
├── data/
│   ├── montage-tests/                # Montage test source JSON
│   ├── negotiation-tests/            # Negotiation source JSON
│   ├── player-journals/              # Player handout journals
│   └── director-journals/            # Director (GM) journals
├── tools/                            # Build scripts
└── README.md
```

## License

Content is setting-specific homebrew for Draw Steel by MCDM Productions. Draw Steel is a trademark of MCDM Productions, LLC.

## Acknowledgements

- [Foundry VTT](https://foundryvtt.com/) — Virtual tabletop platform.
- [Draw Steel](https://mcdm.gg/DrawSteel) by MCDM Productions — The RPG system this module supports.
- [MetaMorphic Digital](https://github.com/MetaMorphic-Digital/draw-steel) — Draw Steel system implementation for Foundry VTT.
