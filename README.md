# Pineapple website

Premium landing + information + downloads + contact page for the
[Pineapple Android app](https://github.com/kiinshuk/pineapple).

## Stack

Static HTML + CSS. Zero build step. Just open `index.html`, or run any static
server:

    python -m http.server 8765   # then open http://127.0.0.1:8765/

## Deploy

- **GitHub Pages**: Settings → Pages → Deploy from branch `master` / root. Serves at `https://kiinshuk.github.io/pineapple-site/`.
- **Vercel / Cloudflare Pages / Netlify**: drop the folder as a static site dist.

## Structure

    index.html         landing page (hero, screenshots, features, CTAs)
    information.html    what it is, InnerTube capabilities, architecture, legal
    download.html       downloads for v1.4 (latest) + v1.0 / v1.2 / v1.3 table
    contact.html        issues, feature requests, discussions, contributing, direct
    assets/style.css    brand tokens (mirrors Android PineappleTheme)
    assets/screen/      drop real Android screenshots here (see index.html `figure` captions)

## Screenshots

Each placeholder tile in `index.html` points at `assets/screen/*.png`. Replace the fake-art
blocks with real screenshots (1080×2340) when captured. Keep sizing 240×430 to preserve layout.

## Brand

- `--bg` PineBackground `#0B0B0D`
- `--surface` `#151518`
- `--accent` `#FF8A24` (PineAccent)
- `--text` `#F5F5F7`
- `--muted` `#9C9CA5`

These match `app/src/main/java/com/torrenttunes/app/ui/theme/PineappleTheme.kt` — touching one
without the other breaks brand consistency.

## Contributing

Keep the website updates in sync with the Android project's releases. The download table
records the SHA-256 and size of each published APK (mirrors the GitHub release assets).
Update `download.html` when a new tag is cut.