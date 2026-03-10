$journalPath = "D:\Repos\Svellheim-Act3\data\director-journals\Act-3-The-Burning-Director-Journal.journal.json"
$enc = [System.Text.Encoding]::UTF8
$c = [System.IO.File]::ReadAllText($journalPath, $enc)

$pageStart = 81166  # Beat 25 "The Last Flame" page

# ====================================================
# EAST GATE BREACH — insert after Crisis A results
# Marker: "holds cleanly." before "\u003ch3\u003eCrisis B"
# ====================================================
$crisisAMarker = "holds cleanly.\u003c/p\u003e\u003ch3\u003eCrisis B"
$crisisAIdx = $c.IndexOf($crisisAMarker, $pageStart)
if ($crisisAIdx -lt 0) { Write-Host "ERROR: Crisis A marker not found"; exit 1 }
Write-Host "Crisis A marker at: $crisisAIdx"

# Insert after </p>, before <h3>Crisis B
# The marker starts at "holds cleanly." so after </p> is at crisisAIdx + length of "holds cleanly.\u003c/p\u003e"
$closingP = "holds cleanly.\u003c/p\u003e"
$splitA = $crisisAIdx + $closingP.Length

$dash = [char]0x2014  # em dash

$eastGateHtml = '<div style="background:#f5f0e6;border-left:4px solid #8b6914;padding:0.75em 1em;margin:1em 0;border-radius:4px">' +
    '<h4>Contingent Combat: East Gate Breach (EV 548 ' + $dash + ' Hard)</h4>' +
    '<p><em>Triggers if Crisis A fails (0-1 successes). The gate buckles; undead flood in.</em></p>' +
    '<strong>Wave 1 ' + $dash + ' The Breach (EV 268)</strong>' +
    '<table border="1" cellpadding="4" style="border-collapse:collapse;width:100%">' +
    '<thead><tr><th>Monster</th><th>Count</th><th>EV ea.</th><th>Subtotal</th></tr></thead>' +
    '<tbody>' +
    '<tr><td>@UUID[Actor.1vdJcDkeRFewA0tQ]{Wight-Lord} (L4 Elite)</td><td>3</td><td>24</td><td>72</td></tr>' +
    '<tr><td>@UUID[Actor.sCrszDJhuSeWPmsz]{Wyrd-Draugr} (L3 Elite)</td><td>5</td><td>20</td><td>100</td></tr>' +
    '<tr><td>@UUID[Actor.SrqOaBihqsBabzmG]{Wight-Commander} (L4 Platoon)</td><td>4</td><td>12</td><td>48</td></tr>' +
    '<tr><td>@UUID[Actor.H571EB4pQN8xF4cn]{Rootbound-Demolisher} (L4 Elite)</td><td>2</td><td>24</td><td>48</td></tr>' +
    '<tr><td><strong>Wave 1 Total</strong></td><td><strong>14</strong></td><td></td><td><strong>268</strong></td></tr>' +
    '</tbody></table>' +
    '<strong>Wave 2 ' + $dash + ' The Surge (EV 280)</strong>' +
    '<table border="1" cellpadding="4" style="border-collapse:collapse;width:100%">' +
    '<thead><tr><th>Monster</th><th>Count</th><th>EV ea.</th><th>Subtotal</th></tr></thead>' +
    '<tbody>' +
    '<tr><td>@UUID[Actor.1vdJcDkeRFewA0tQ]{Wight-Lord} (L4 Elite)</td><td>3</td><td>24</td><td>72</td></tr>' +
    '<tr><td>@UUID[Actor.MAuyKNADyEShV23S]{Dire Draugr Wolf} (L4 Elite)</td><td>4</td><td>24</td><td>96</td></tr>' +
    '<tr><td>@UUID[Actor.Jo7v6BrOOLXhM4rU]{Rot-Warped Landvaettr} (L3 Platoon)</td><td>4</td><td>10</td><td>40</td></tr>' +
    '<tr><td>@UUID[Actor.SrqOaBihqsBabzmG]{Wight-Commander} (L4 Platoon)</td><td>6</td><td>12</td><td>72</td></tr>' +
    '<tr><td><strong>Wave 2 Total</strong></td><td><strong>17</strong></td><td></td><td><strong>280</strong></td></tr>' +
    '</tbody></table>' +
    '<p><strong>Total EV: 548</strong> (Hard; target ~546). Wave 2 triggers when first wave clears the gate.</p>' +
    '</div>'

$eastGateJson = $eastGateHtml -replace '<', '\u003c' -replace '>', '\u003e' -replace '"', '\"'

$c = $c.Substring(0, $splitA) + $eastGateJson + $c.Substring($splitA)
Write-Host "East Gate wave div inserted."

# ====================================================
# MAIN GATE BREACH — insert after Crisis C results
# Need to re-find Crisis C after East Gate insertion shifted offsets
# Marker: "gate holds completely." before "\u003chr\u003e"
# ====================================================
$crisisCMarker = "gate holds completely.\u003c/p\u003e\u003chr\u003e"
$crisisCIdx = $c.IndexOf($crisisCMarker, $pageStart)
if ($crisisCIdx -lt 0) { Write-Host "ERROR: Crisis C marker not found"; exit 1 }
Write-Host "Crisis C marker at: $crisisCIdx"

$closingPC = "gate holds completely.\u003c/p\u003e"
$splitC = $crisisCIdx + $closingPC.Length

$mainGateHtml = '<div style="background:#f5f0e6;border-left:4px solid #8b6914;padding:0.75em 1em;margin:1em 0;border-radius:4px">' +
    '<h4>Contingent Combat: Main Gate Breach (EV 544 ' + $dash + ' Hard)</h4>' +
    '<p><em>Triggers if Crisis C fails (0-1 successes). The Commander reaches the main gate unopposed.</em></p>' +
    '<strong>Wave 1 ' + $dash + " The Commander's Push (EV 272)</strong>" +
    '<table border="1" cellpadding="4" style="border-collapse:collapse;width:100%">' +
    '<thead><tr><th>Monster</th><th>Count</th><th>EV ea.</th><th>Subtotal</th></tr></thead>' +
    '<tbody>' +
    '<tr><td>@UUID[Actor.1vdJcDkeRFewA0tQ]{Wight-Lord} (L4 Elite)</td><td>4</td><td>24</td><td>96</td></tr>' +
    '<tr><td>@UUID[Actor.sCrszDJhuSeWPmsz]{Wyrd-Draugr} (L3 Elite)</td><td>4</td><td>20</td><td>80</td></tr>' +
    '<tr><td>@UUID[Actor.H571EB4pQN8xF4cn]{Rootbound-Demolisher} (L4 Elite)</td><td>2</td><td>24</td><td>48</td></tr>' +
    '<tr><td>@UUID[Actor.SrqOaBihqsBabzmG]{Wight-Commander} (L4 Platoon)</td><td>4</td><td>12</td><td>48</td></tr>' +
    '<tr><td><strong>Wave 1 Total</strong></td><td><strong>14</strong></td><td></td><td><strong>272</strong></td></tr>' +
    '</tbody></table>' +
    '<strong>Wave 2 ' + $dash + ' Reserves Join the Assault (EV 272)</strong>' +
    '<table border="1" cellpadding="4" style="border-collapse:collapse;width:100%">' +
    '<thead><tr><th>Monster</th><th>Count</th><th>EV ea.</th><th>Subtotal</th></tr></thead>' +
    '<tbody>' +
    '<tr><td>@UUID[Actor.1vdJcDkeRFewA0tQ]{Wight-Lord} (L4 Elite)</td><td>4</td><td>24</td><td>96</td></tr>' +
    '<tr><td>@UUID[Actor.MAuyKNADyEShV23S]{Dire Draugr Wolf} (L4 Elite)</td><td>2</td><td>24</td><td>48</td></tr>' +
    '<tr><td>@UUID[Actor.fxoMdG35Ri6ZycOp]{Grave-Singer} (L2 Elite)</td><td>2</td><td>16</td><td>32</td></tr>' +
    '<tr><td>@UUID[Actor.SrqOaBihqsBabzmG]{Wight-Commander} (L4 Platoon)</td><td>8</td><td>12</td><td>96</td></tr>' +
    '<tr><td><strong>Wave 2 Total</strong></td><td><strong>16</strong></td><td></td><td><strong>272</strong></td></tr>' +
    '</tbody></table>' +
    '<p><strong>Total EV: 544</strong> (Hard; target ~546). Wave 2 triggers when battering ram reaches the gate.</p>' +
    '</div>'

$mainGateJson = $mainGateHtml -replace '<', '\u003c' -replace '>', '\u003e' -replace '"', '\"'

$c = $c.Substring(0, $splitC) + $mainGateJson + $c.Substring($splitC)
Write-Host "Main Gate wave div inserted."

[System.IO.File]::WriteAllText($journalPath, $c, $enc)
Write-Host "Done. Journal written."
