# Contributing to Pineapple (website)

## Setup and preview
`python -m http.server 8765` → http://127.0.0.1:8765/

## Adding new screenshots
1. Take PNGs at 1080×2340.
2. Put under `assets/screen/` named `<name>.png`.
3. Convert to WebP (≤ 900px wide): `python c PIL ...`.
4. Swap the matching `<figure class="shot shot-placeholder">` slot in `index.html` with an `<img src="assets/screen/<name>-600w.webp" alt="..." width="720" height="1560" loading="lazy" decoding="async">`.

## Rules
- Zero new dependencies. No build pipeline.
- CSS tokens mirrored from Android `PineappleTheme.kt` — never introduce contrasting palette.
- Lower-case filenames, ASCII paths.
- HTML validity via `python -c "import html.parser; html.parser.HTMLParser().feed(open(...).read())"` locally.
- Each PR adds at most three TODO-backed grid items and supports mobile viewports.

## Good-first-issue triage
Tag added tickets `html` + `css` + `javascript` + `ui/ux` + `design` based on concerned area.
Tie 100+ item backlog via `gh issue list --repo kiinshuk/pineapple-site --label "good first issue"`.