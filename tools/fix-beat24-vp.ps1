$c = [System.IO.File]::ReadAllText("D:\Repos\Svellheim-Act3\data\director-journals\Act-3-The-Burning-Director-Journal.journal.json", [System.Text.Encoding]::UTF8)
$pageStart = 61785
$vpOld = "Hard (Level 5 Elite)"
$vpNew = "Hard (EV 444)"
$vpIdx = $c.IndexOf($vpOld, $pageStart)
Write-Host "VP idx: $vpIdx"
if ($vpIdx -lt 0) { Write-Host "ERROR: VP block not found"; exit 1 }
$c = $c.Substring(0, $vpIdx) + $vpNew + $c.Substring($vpIdx + $vpOld.Length)
Write-Host "VP block updated"
[System.IO.File]::WriteAllText("D:\Repos\Svellheim-Act3\data\director-journals\Act-3-The-Burning-Director-Journal.journal.json", $c, [System.Text.Encoding]::UTF8)
Write-Host "Done."
