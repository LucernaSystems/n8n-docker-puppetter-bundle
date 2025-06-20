# Use Debian-based n8n for Puppeteer compatibility
FROM n8nio/n8n:latest-debian

# Install Puppeteer dependencies
RUN apt-get update && apt-get install -y \
  wget \
  ca-certificates \
  fonts-liberation \
  libappindicator3-1 \
  libasound2 \
  libatk-bridge2.0-0 \
  libatk1.0-0 \
  libcups2 \
  libdbus-1-3 \
  libgdk-pixbuf2.0-0 \
  libnspr4 \
  libnss3 \
  libx11-xcb1 \
  libxcomposite1 \
  libxdamage1 \
  libxrandr2 \
  xdg-utils \
  libgbm1 \
  libgtk-3-0 \
  libpango-1.0-0 \
  libxss1 \
  lsb-release

# Install Puppeteer
RUN npm install puppeteer

# Copy Puppeteer script
COPY ./data/scrapers/lol-scraper.js /usr/local/bin/lol-scraper.js

# Debug marker
RUN echo "✅ Custom Dockerfile has been used!" > /dockerfile-used.txt
