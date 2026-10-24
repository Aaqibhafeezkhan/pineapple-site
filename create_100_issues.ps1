$repo = "kiinshuk/pineapple-site"
$titles = Get-Content "D:\pineapple-site\issues_100.txt"
$labels = "good first issue","ui/ux","design"
foreach ($t in $titles) {
    $lab = $labels -join ","
    switch -Regex ($t) {
        "HTML|markup|navigation bar|skip"        { $lab += ",html" }
        "CSS|spacing|padding|radius|font|theme|color" { $lab += ",css" }
        "JavaScript|JS|keyboard|clipboard"       { $lab += ",javascript" }
        "accessibility|a11y|focus|contrast"      { $lab += ",accessibility" }
    }
    $body = "Good-first-issue placeholder for the Pineapple website (HTML/CSS/JS/UI).`n`n`nScope: $t`n`nAcceptance criteria:`n- Works from 320px to 1440px+ widths`n- Keeps brand tokens (`#0B0B0D`, #FF8A24) and avoids introducing new arbitrary values`n- Verifiable via \"python -m http.server 8765\" and Lighthouse mobile