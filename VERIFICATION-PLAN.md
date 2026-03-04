# Act 3 — The Burning: Verification Plan

> **Source of Truth**: `Era-of-Embers/campaign/docs/04-Campaign/01-Restore-the-Flame/Act-3/`
> **Target**: `Svellheim-Act3/data/`
>
> **Key Principle**: The director will NOT have access to the campaign adocs during play.
> The Foundry journal entries are the **runtime game documents** — they must be
> complete, self-sufficient references for running each beat at the table.
> Nothing the director needs to know can be missing from the journals.

---

## Campaign Doc → Journal Page Mapping

| # | Campaign Doc (Source of Truth) | Journal Page | Status |
|---|-------------------------------|-------------|--------|
| 0 | `00-Act-3-Overview.adoc` | *(no journal page — overview only)* | — |
| 20 | `20-Into-the-Cold.adoc` | Beat 20 — Into the Cold | ✅ |
| 21 | `21-Through-the-Graveyard.adoc` | Beat 21 — Through the Graveyard | ✅ |
| 22 | `22-The-Green-Heart.adoc` | Beat 22 — The Green Heart | ✅ |
| 23 | `23-The-Ashen-Road.adoc` | Beat 23 — The Ashen Road | ✅ |
| 24 | `24-The-Shape-Walkers-Road.adoc` | Beat 24 — The Shape-Walker's Road | ✅ |
| 25 | `25-The-Last-Flame.adoc` | Beat 25 — The Last Flame | ✅ |
| 26 | `26-Grafvitnir-Rises.adoc` | Beat 26 — Grafvitnir Rises | ✅ |
| 27 | `27-Epilogue.adoc` | Beat 27 — Epilogue | ✅ |

## Campaign Doc → Montage Test Mapping

| Campaign Doc | Montage Test Data File | Status |
|-------------|----------------------|--------|
| `montages-act3.adoc` | `beat-20-white-waste-crossing.json` | ✅ |
| `montages-act3.adoc` | `beat-21-bone-fields-traversal.json` | ✅ |
| `montages-act3.adoc` | `beat-23-long-walk-west.json` | ✅ |
| `montages-act3.adoc` | `beat-24-djupa-approach.json` | ✅ |
| `montages-act3.adoc` | `beat-25-three-crisis-siege.json` | ✅ |

## Campaign Doc → Negotiation Test Mapping

| Campaign Doc | Negotiation Test Data File | Status |
|-------------|--------------------------|--------|
| `negotiations-act3.adoc` | `beat-22-negotiation-grenvordr-green-heart-audience.json` | ✅ |
| `negotiations-act3.adoc` | `beat-23-negotiation-brynja-waystation-refugees.json` | ✅ |

## Player Handouts

| Campaign Doc | Player Journal | Status |
|-------------|---------------|--------|
| Various beat docs → player-facing sections | `Act-3-The-Burning-Player-Handouts.journal.json` | ✅ |

## Supporting Reference Docs

| Campaign Doc | Purpose |
|-------------|---------|
| `encounters-act3.adoc` | Encounter stat blocks / compositions |
| `items-act3.adoc` | Item definitions → cross-ref with Svellheim-Entities |
| `monsters-act3.adoc` | Monster definitions → cross-ref with Svellheim-Entities |
| `npcs-act3.adoc` | NPC definitions → cross-ref with Svellheim-Entities |
| `required-art-act3.adoc` | Art asset checklist |

---

## Verification Rules

### Purpose
The campaign adocs are the source of truth for **what** content the journals must contain.
The Foundry journals are the **runtime documents** the director uses at the table — they
must be complete enough to run each beat without referencing the adocs.

### Content Completeness
1. **Every beat's journal page must contain everything the director needs to run it:**
   - Read-aloud / narrative text (exact wording from campaign doc)
   - GM notes, pacing guidance, and tone cues
   - Encounter composition and when to trigger it
   - NPC motivations, dialogue cues, and key information
   - Loot and rewards
   - Transition instructions to the next beat
2. **Narrative text** — read-aloud text, GM notes, transitions must match campaign doc wording exactly.
3. **No missing information** — if the campaign doc says it, the journal must have it.

### Entity References
4. **Entities (monsters, NPCs, items)** — reference via `@UUID[Item.xxx]{Name}` links to the Svellheim-Entities module. Do NOT duplicate full stat blocks or item descriptions inline. The director clicks the link to open the entity in Foundry.
5. **Context around references** — the journal MUST still contain enough context to know *when* and *why* to use an entity (e.g. "2× @UUID[...]{Draugr Thrall} emerge when the party enters the chamber").

### Process
6. **One beat at a time** — read campaign doc, then journal page, compare, fix.
7. **Montage/Negotiation data files** — verify stats (SL, FL, difficulty, motivations, arguments, twists) match campaign docs.

---

## Progress Log

| Date | Beat | Action | Notes |
|------|------|--------|-------|
| 2025-07-24 | 20 | Journal verified | All sections present: overview, Kaelen deterioration (Day 1-5), montage (White Waste, Hard SL6/FL3), Director Secret (Heat Decision), outcomes (4 tiers), Heitfolk encounter (Hildvarð), Narrative Payoff (Beat 17 alliance), Director Secret (Silence Oath), rewards (Cold-Wraps ×4, Iron Lantern, Tunnel-Key), level-up to 6, Lew's First Night, transition. Complete and self-sufficient. |
| 2025-07-24 | 20 | Montage verified | `beat-20-white-waste-crossing.json` — Hard, SL 6, FL 3. 12 challenges across 2 rounds with correct characteristics and TNs (Reason 13, Presence 12, Might 13, Intuition 14, Agility 14). Disturbed Cairns + Steam-Oasis interludes. 4-tier outcomes (Hard Success = Iron Lantern + 2V, Success = 1V, Partial = 2 Heat, Hard Failure = lose 1 Recovery). Lew NPC (Int +2 / Rea +2). All matches source. |
| 2025-07-24 | 21 | Journal verified | All sections present: overview (Bone-Fields, Kaelen beacon/liability), Beinvaka discovery (ritual diagram, parchment, not combat), Lew Wyrd-Eye upgrade (Int +3 / Rea +2), montage (Bone-Fields, Hard SL6/FL3), Director Secret (Escalating Visibility TN 12→13), Green Heart First Sighting, Lew's Full Understanding, outcomes + Threshold Skirmish contingent, transition. Complete and self-sufficient. |
| 2025-07-24 | 21 | Montage verified | `beat-21-bone-fields-traversal.json` — Hard, SL 6, FL 3. 12 challenges across 2 rounds. Lew NPC (upgraded Int +3 / Rea +2). R2 includes TN 13 shield-glow challenge (escalation). Green Heart Appears + Arrival interludes. 4-tier outcomes (Hard Success = 2V, Success = 1V + Sickened, Partial = 2 Heat + Drowned Wolf, Hard Failure = lose 1 Recovery + Threshold Skirmish). All matches source. |
| 2025-07-24 | 22 | Journal verified | All sections: grove entry (3 access layers, elves Grénvörðr/Síl/Þrúðr), Director Secret (witnesses not combatants), negotiation (Interest 3/Patience 3/Target 5, 3 motivations, 3 pitfalls, graduated responses), 3 outcome tiers (Full = slow transformation + Root-Shard, Partial = fast + dimmer, Failure = 5 rounds in B26), transformation (Director Secret), Lew's departure, Root-Shard item (Champion wondrous). Complete. |
| 2025-07-24 | 22 | Negotiation verified | `beat-22-negotiation-grenvordr-green-heart-audience.json` — Grénvörðr (Elder), Interest 3/0/5, Patience 3/0/3. 3 Motivations (Willing Sacrifice + Kaelen edge, World's Future, Old Compact + demeanor shift). 3 Pitfalls (Urgency, Instrumentalizing, False authority) with flavour text. Freeform. 3 outcome tiers with correct effects. All matches source. |
| 2025-07-24 | 23 | Journal verified | All sections: departure (no Lew), Ashen Woods (Director Secret — 3 changed landmarks), montage (Moderate SL5/FL3, -1 without Lew, refugee variant), R1+R2 challenges, Smoke interlude, outcomes, Waystation Brynja (40 refugees, Moderate negotiation Interest 2/Patience 3), motivations/pitfalls, Director Secret (Demeanor Tells), outcomes (+1 Beat 25 on success), closing scene, GM Notes (Vigmund Oath, thematic notes). Complete. |
| 2025-07-24 | 23 | Montage verified | `beat-23-long-walk-west.json` — Moderate, SL 5, FL 3. No Lew -1 penalty noted. Refugee variant described. 12 challenges across 2 rounds (Navigation, Supplies, Disorientation, Presences, Morale, Scouting; Frostfen, Refugees, Siege ring, Patrols, Calm, Crossing). Split R1/R2 outcomes. R1: Hard Success (+1 edge Brynja), Partial (-1 Recovery -1 Brynja). R2: Hard Success (+1 edge B24), Hard Failure (intercepted). All matches source. |
| 2025-07-24 | 23 | Negotiation verified | `beat-23-negotiation-brynja-waystation-refugees.json` — Brynja Steinsdóttir, Interest 2/0/5, Patience 3/0/3. 3 Motivations (Truth about Hrafnborg, Safety for children, Green Heart/northern lights hope). 3 Pitfalls (Empty reassurance, Dismissiveness, Urgency trampling). Oath interactions (Vigmund/Silence) noted. Freeform. Full Success (4+) = refugees + +1 Beat 25, Partial (3) = follow at distance, Failure (≤2) = decline. All matches source. |
| 2025-07-24 | 24 | Journal verified | All sections: Dreyfus interception (Director Secret — Beat 9 callback), boss encounter (L5 Elite, Stam 64, Speed 7, Stability 2, 2 turns, combat flow R1-R2, key abilities: Talon Strike, Void Pulse, Shift Form, Flickering Body), aftermath + Dreyfus's Eye (Wondrous), Director Secret (IT DOESN'T MATTER — Grafvitnir independent, 11 days in root-tunnels), Dreyfus's dying info (Djupá 12 hours), Hard Montage Djupá (SL6/FL3 timed), R1+R2 challenges, Hrafnborg visible interlude, 4-tier outcomes, Hrafnborg arrival + Harald, level-up to 7. Complete. |
| 2025-07-24 | 24 | Montage verified | `beat-24-djupa-approach.json` — Hard, SL 6, FL 3. Timed (12 hours from Dreyfus's info). Refugee variant noted. 12 challenges across 2 rounds (Valley navigation, Scout walls, Move quickly, Cold/pace, Intelligence, Tactical; Patrol timing, Valley mouth, North gate, Refugees, Spot windows, Final push). R1 outcome = Interlude (Hrafnborg visible). R2 outcomes: 4 tiers (Hard Success = undetected, Success = minor alarm, Failure = gate fight, Hard Failure = siege ring). All matches source. |
| 2025-07-24 | 25 | Journal verified | All sections: Hrafnborg assessment (Harald briefing, 3 crises), Söldís arrives (clay pot, 22-year ember, Director Secret), Hildvarð + Heitfolk (tunnels, Director Secret — Grafvitnir's route, rises regardless), Three-Crisis Montage (CRITICAL: CANNOT BE WON, declaration mechanic, resources ~18 bodies, 3 crises × R1+R2 challenges, per-crisis scoring 0-1/2/3+, Beat 23 bonus, Oath of Witness bonus, Director Secret — ALWAYS CONTRIBUTES for Crisis B), closing transition. Complete. |
| 2025-07-24 | 25 | Montage verified | `beat-25-three-crisis-siege.json` — Custom Hard, SL 9, FL 9 (3 tracks). Special rules: impossible triage, per-crisis tracking, declaration mechanic, 3 successes needed per crisis. Beat 23 bonus (+1 test), Oath of Witness bonus (edge on Crisis A rally). R1: Crisis A (4), B (4), C (4) challenges. R2: Crisis A (3), B (3), C (3) challenges. Per-crisis outcomes (0-1/2/3+). Closing transition (floor stops, cracks, Söldís). All matches source. |
| 2025-07-24 | 26 | Journal verified | All sections: 3 opening variants (A/B/C from Beat 25 results), Stage 1 Grave-Wolf (L7 Solo Huge, 200 Stam, Speed 8, 2 turns, 3 VAs, Primordial Resilience cap 20, R1-4 pacing, dissolves at 0), Stage 2 Rot-Given-Shape (L7 Solo Gargantuan, 200 Stam, Speed 6, Undying Hunger 5 regen, Spectral Instability -3, Director Secret — The Clock, Lew arrives, Grafvitnir extinguishes flame, Söldís's Act with 22-year ember), Stage 3 Hunger Made Manifest (L8 Solo Titanic, 150 Stam, 4-round survival counter, VA pacing, Prison Madness), The Sealing, post-combat aftermath. Complete. |
| 2025-07-24 | 27 | Journal verified | All sections: morning after (siege over, people emerging), NPC vignettes (Harald at shrine — "You held", Söldís — empty pot, first time travels light, carved tokens; Green Heart — trees lit gold, Grénvörðr "She is learning", "I remember you"; Lew — stays days, leaves note "Tell them I came back", Director Secret at inner grove), settlements (Thyra "You gave us a reason to believe"), final image (light in Green Heart, pulses like heartbeat, "Lew has"), campaign reflection (optional debrief). Complete. |
| 2025-07-24 | All | Player handouts verified | `Act-3-The-Burning-Player-Handouts.journal.json` — 19 pages across all 8 beats. Beat 20 (3 pages: Dawn, Cairns, Heitfolk), Beat 21 (3: Stronghold, Green Heart Appears, Threshold), Beat 22 (3: Arrival, Transformation, Lew's Farewell), Beat 23 (2: Departure/Ashen Woods, Waystation/Approach), Beat 24 (2: Confrontation, Hrafnborg Arrival), Beat 25 (2: City on Fire, Three Things), Beat 26 (2: Grafvitnir Rises, Seal Closes), Beat 27 (2: Morning After, Final Image). All read-aloud text present, properly styled, correctly attributed. Complete. |
