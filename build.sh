#!/usr/bin/env bash

# Cleanup
rm -rf out/
mkdir out/

# Copy global assets and landing page
cp -r assets/ out/
cp index.html out/index.html

for dir in slides/*/; do
    name="${dir#slides/}"
    name="${name%/}"
    marp -I "$dir" --output "out/$name"
    cp -r "${dir}assets" "out/$name/assets" 2>/dev/null || true
    sed -Ei 's|([^.])/assets|\1../assets|g; s|^/assets|../assets|g' "out/$name/slides.html"
    mv "out/$name/slides.html" "out/$name/index.html"
done
