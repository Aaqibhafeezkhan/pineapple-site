$repo = "kiinshuk/pineapple-site"
$titles = Get-Content "D:\pineapple-site\issues_100.txt"
$labBase = "good first issue,ui/ux,design"
foreach ($t in $titles) {
    $lab = $labBase
    switch -Regex ($t) {
        "HTML|markup|navigation bar|skip|semantics" { $lab += ",html" }
        "CSS|spacing|padding|radius|font|theme|color"   { $lab += ",css" }
        "JavaScript|JS|keyboard|clipboard"             { $lab += ",javascript" }
        "accessibility|a11y|focus|contrast"            { $lab += ",accessibility" }
    }
    $body = @'
Good-first-issue candidate for the Pineapple website (HTML/CSS/JS/UI).

Scope: __TITLE__

Acceptance criteria:
- Works from 320px to 1440px+ widths
- Keeps brand tokens (#0B0B0D, #FF8A24) and avoids introducing new arbitrary values
- Verifiable via python -m http.server 8765 and Lighthouse mobile
- README.md links back to this issue family
'@
    $body = $body.Replace("__TITLE__", $t)
    Set-Content -Path "D:\pineapple-site\body_tmp.txt" -Value $body
    gh issue create --repo $repo --title "$t" --label "$lab" --body-file "D:\pineapple-site\body_tmp.txt" 2>&1 | Out-File -Append -FilePath "D:\pineapple-site\issues_created.log" -Encoding utf8
    Start-Sleep -Seconds 1
    Write-Host "created: $t"
}
Write-Host "done creating"