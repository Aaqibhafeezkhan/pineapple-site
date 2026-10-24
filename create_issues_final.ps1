$repo = "kiinshuk/pineapple-site"
$titles = Get-Content "D:\pineapple-site\issues_100.txt"
$labBase = "good first issue,ui/ux,design"
foreach ($t in $titles) {
    $lab = $labBase
    switch -Regex ($t) {
        "HTML|markup|navigation bar|skip|semantics" { $lab += ",html" }
        "CSS|spacing|padding|radius|font|theme|color"   { $lab += ",css" }
        "JavaScript|JS|keyboard|clipboard"            { $lab += ",javascript" }
        "accessibility|a11y|focus|contrast"             { $lab += ",accessibility" }
    }
    $body = (Get-Content "D:\pineapple-site\body_tmp.txt" -Raw) -replace '\$TITLE', $t
    Set-Content -Path "D:\pineapple-site\body_tmp.txt" -Value $body -NoNewline
    gh issue create --repo $repo --title "$t" --label "$lab" --body-file "D:\pineapple-site\body_tmp.txt" 2>&1 | Out-File -Append "D:\pineapple-site\issues_created.log" -Encoding utf8
    Start-Sleep -Seconds 1
    Write-Host "created: $t"
    Set-Content -Path "D:\pineapple-site\body_tmp.txt" -Value (Get-Content -Raw "D:\pineapple-site\body_tmp.txt").Replace($t, "$TITLE") -NoNewline 2>$null
    # reset via a hard copy back from template using a fresh rewritten file
    $template = "Good-first-issue candidate...`nScope: `$TITLE`n"
    # (placeholder; actual contents regenerated each loop)
}
Write-Host "done"
PYEOF:
