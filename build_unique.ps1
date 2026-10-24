# Build one merged unique list + issue bodies in bodylines format
$files = "issues_a.txt","issues_b.txt","issues_c.txt"
$all = @()
foreach ($f in $files) {
    $p = Join-Path $PSScriptRoot $f
    $parts = Get-Content -Path $p
    foreach ($line in $parts) {
        $t = $line.Trim()
        if ($t -ne "") { $all += $t }
    }
}
$seen = @{}
$uniq = @()
foreach ($t in $all) {
    $k = $t.ToLower()
    if (-not $seen.ContainsKey($k)) { $seen[$k] = $true; $uniq += $t }
}
$uniq | Set-Content -Path (Join-Path $PSScriptRoot "issues_unique.txt")
Write-Host "Total assembled: $($all.Count)   Unique: $($uniq.Count)"