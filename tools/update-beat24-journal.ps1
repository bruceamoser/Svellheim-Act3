$journalPath = "D:\Repos\Svellheim-Act3\data\director-journals\Act-3-The-Burning-Director-Journal.journal.json"
$enc = [System.Text.Encoding]::UTF8
$c = [System.IO.File]::ReadAllText($journalPath, $enc)

# Find Beat 24 page — apostrophe stored as \u0027 in the JSON file
$pageMarker = "Shape-Walker\u0027s Road"
$pageStart = $c.IndexOf($pageMarker)
if ($pageStart -lt 0) { Write-Host "ERROR: Beat 24 page not found"; exit 1 }
Write-Host "Beat 24 page at: $pageStart"

# The JSON stores HTML with Unicode escapes: < => \u003c, > => \u003e
$ulEsc   = "\u003c/ul\u003e"
$hrEsc   = "\u003chr\u003e"
$h2Part3 = "\u003ch2\u003ePart 3"
$insertMarker = $ulEsc + $hrEsc + $h2Part3
$insertIdx = $c.IndexOf($insertMarker, $pageStart)
if ($insertIdx -lt 0) { Write-Host "ERROR: insertion marker not found"; exit 1 }
Write-Host "Insertion marker at: $insertIdx"

# We will insert after </ul> (i.e., after the $ulEsc block)
$splitPoint = $insertIdx + $ulEsc.Length

# Build the wave div as plain HTML, then convert to JSON-escaped form
$dash = [char]0x2014  # em dash
$plainHtml = '<div style="background:#f5f0e6;border-left:4px solid #8b6914;padding:0.75em 1em;margin:1em 0;border-radius:4px">' +
    '<h3>Wave Encounter: Dreyfus Final Duel (EV 444 ' + $dash + ' Hard)</h3>' +
    '<p><em>Waves represent enemies Dreyfus has hidden in the shadow-road, certain he would not need them. He was wrong.</em></p>' +
    '<h4>Wave 1 ' + $dash + ' The Ambush (EV 240)</h4>' +
    '<table border="1" cellpadding="4" style="border-collapse:collapse;width:100%">' +
    '<thead><tr><th>Monster</th><th>Count</th><th>EV ea.</th><th>Subtotal</th></tr></thead>' +
    '<tbody>' +
    '<tr><td>@UUID[Actor.HP2k1RmfKk7aMlt2]{Dreyfus, the Shape-Walker} (L5 Elite)</td><td>1</td><td>28</td><td>28</td></tr>' +
    '<tr><td>@UUID[Actor.SoaF8auEd59PcVrV]{Dreyfus Shape-Walker Agent} (L4 Elite)</td><td>4</td><td>24</td><td>96</td></tr>' +
    '<tr><td>@UUID[Actor.sCrszDJhuSeWPmsz]{Wyrd-Draugr} (L3 Elite)</td><td>4</td><td>20</td><td>80</td></tr>' +
    '<tr><td>@UUID[Actor.SrqOaBihqsBabzmG]{Wight-Commander} (L4 Platoon)</td><td>3</td><td>12</td><td>36</td></tr>' +
    '<tr><td><strong>Wave 1 Total</strong></td><td><strong>12</strong></td><td></td><td><strong>240</strong></td></tr>' +
    '</tbody></table>' +
    '<h4>Wave 2 ' + $dash + ' Last Reserves (EV 204)</h4>' +
    '<p><em>Triggers when Dreyfus is reduced to ~20 Stamina or fewer.</em></p>' +
    '<table border="1" cellpadding="4" style="border-collapse:collapse;width:100%">' +
    '<thead><tr><th>Monster</th><th>Count</th><th>EV ea.</th><th>Subtotal</th></tr></thead>' +
    '<tbody>' +
    '<tr><td>@UUID[Actor.SoaF8auEd59PcVrV]{Dreyfus Shape-Walker Agent} (L4 Elite)</td><td>3</td><td>24</td><td>72</td></tr>' +
    '<tr><td>@UUID[Actor.1vdJcDkeRFewA0tQ]{Wight-Lord} (L4 Elite)</td><td>2</td><td>24</td><td>48</td></tr>' +
    '<tr><td>@UUID[Actor.MAuyKNADyEShV23S]{Dire Draugr Wolf} (L4 Elite)</td><td>2</td><td>24</td><td>48</td></tr>' +
    '<tr><td>@UUID[Actor.SrqOaBihqsBabzmG]{Wight-Commander} (L4 Platoon)</td><td>3</td><td>12</td><td>36</td></tr>' +
    '<tr><td><strong>Wave 2 Total</strong></td><td><strong>10</strong></td><td></td><td><strong>204</strong></td></tr>' +
    '</tbody></table>' +
    '<p><strong>Total EV: 444</strong> (Hard; party target ~444)</p>' +
    '</div>'

# Convert plain HTML to JSON-escaped form (matching existing journal encoding)
$waveDiv = $plainHtml -replace '<', '\u003c' -replace '>', '\u003e' -replace '"', '\"'

# 2) Update VP block if it contains "Hard (Level 5 Elite)"
$vpOld = "Hard (Level 5 Elite) | VP Award: 2 VP on victory"
$vpNew = "Hard (EV 444) | VP Award: 2 VP on victory"
$vpIdx = $c.IndexOf($vpOld, $pageStart)
if ($vpIdx -gt 0 -and $vpIdx -lt $insertIdx) {
    $c = $c.Substring(0, $vpIdx) + $vpNew + $c.Substring($vpIdx + $vpOld.Length)
    Write-Host "VP block updated"
    $insertIdx = $c.IndexOf($insertMarker, $pageStart)
    $splitPoint = $insertIdx + $ulEsc.Length
} else {
    Write-Host "VP block not found or out of range - skipping"
}

# 3) Insert the wave div after </ul> and before <hr>
$c = $c.Substring(0, $splitPoint) + $waveDiv + $c.Substring($splitPoint)
Write-Host "Wave div inserted."

[System.IO.File]::WriteAllText($journalPath, $c, $enc)
Write-Host "Done. Journal written."
