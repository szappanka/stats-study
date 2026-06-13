#!/usr/bin/env bash
# Lokális preview a GitHub Pages oldalhoz, Dockerrel.
# Használat:  ./serve.sh
# Leállítás:  Ctrl+C
#
# A _config.yml változásai NEM töltődnek újra futás közben — olyankor
# állítsd le (Ctrl+C) és futtasd ezt újra. Tartalom/CSS/layout: elég a böngésző-frissítés.

set -e
cd "$(dirname "$0")"

echo "▶  Jekyll preview indítása…  →  http://localhost:4000/stats-study/"
echo "   (leállítás: Ctrl+C)"
echo

docker run --rm \
  --name stats-jekyll \
  -v "$PWD":/srv/jekyll \
  -p 4000:4000 \
  jekyll/jekyll:4.2.2 \
  sh -c "bundle install && jekyll serve --host 0.0.0.0 --watch --baseurl /stats-study"
