# n8n with Puppeteer (Custom Railway Worker)

This is a custom Docker image based on `n8nio/n8n` with added support for Puppeteer and Chromium.

## Usage

1. Push this repo to GitHub
2. In Railway:
   - Go to your Worker service
   - Click “Deploy from GitHub Repo”
   - Point to this repo
3. Done! Your n8n instance can now run headless browser scraping with Puppeteer.

## What's Inside

- Base: n8n official Docker image
- Added:
  - Puppeteer (Node.js package)
  - Chromium dependencies

Perfect for scraping dynamic JS-heavy sites like PrizePicks.
