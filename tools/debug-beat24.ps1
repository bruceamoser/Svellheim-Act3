$files = @('grafvitnir-stage-1-the-grave-wolf','grafvitnir-stage-2-rot-given-shape','grafvitnir-stage-3-hunger-made-manifest','rot-beast','rot-echo','barrow-warden','oath-broken-draugr','frost-draugr','grave-wisp')
foreach ($f in $files) {
    $d = Get-Content "D:\Repos\Svellheim-Entities\data\monsters\$f.json" | ConvertFrom-Json
    Write-Host "$f | L$($d.system.level.value) $($d.system.role) | EV=$($d.system.ev.value) | id=$($d._id)"
}
