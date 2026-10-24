# Contributing to Pineapple — website

The site is static HTML + CSS (zero build step). Design tokens are taken verbatim from the Android app (`PineappleTheme.kt`) so the site and app share a brand.

## Setup
```bash
python -m http.server 8765
# => http://127.0.0.1:8765
```

## Adding screenshots
1. Take PNGs at 1080 × 2340.
2. Put them under `assets/screen/` as `<name>.png`.
3. Convert to WebP (max 900 px wide) e.g.:
   ```bash
   python -c "from PIL import Image as i; im=i.open('assets/screen/<name>.png'); im=im.resize((720,int(2340*720/1080)),i.LANCZOS); im.save('assets/screen/<name>-600w.webp','WEBP',quality=82,method=6)"
   ```
4. In `index.html` replace the matching `<figure class="shot shot-placeholder">...</figure>` with an `<img src="assets/screen/<name>-600w.webp" width="720" height="1560" alt="..." loading="lazy" decoding="async">`.

## Code style
- Zero new dependencies. Branded tokens from `assets/style.css`.
- Mobile-first; validate at 320, 390, 768, 1200 px.
- Tags should be html, css, javascript, accessibility, ui/ux, design, or documentation.
- Title case headings, body copy lean.

## Backlog
- 100 open good-first-issue tickets covering mobile nav, typography, a11y, design consistency, screenshots, copy, SEO/perf.
- Browse via `gh issue list --repo kiinshuk/pineapple-site`.
- Please search existing issues before opening a new one.

## Issue quality guardrails (good-first-friendly)
- Scope should be ≤ 1–2 hours for a contributor with a working web editor.
- Acceptance criteria always include viewport widths (320/480/768/1200).
- Never invent color literals outside the variable set in `assets/style.css`.
- Do not alter `--accent`, `--bg`, or other brand tokens unless proposing a global change.

## Pull requests
- Keep commits small and scoped.
- Run `python -c` HTML parser check locally: `python -c "import html.parser; html.parser.HTMLParser().feed(open('index.html').read())"`.
- CI is manual (static site, no build step); preview via `python -m http.server 8765`.
- Link the PR to an issue when applicable.

## Legal
See [LICENSE](./LICENSE) — MIT. Contributing implies you agree your work ships under MIT (matching the Android project).