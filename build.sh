#!/usr/bin/env bash

# Cleanup
rm -r out/
mkdir out/

# Copy global assets
cp -r assets/ out/

for dir in slides/*/; do
    name="${dir#slides/}"
    name="${name%/}"
    marp -I "$dir" --output "out/$name"
    cp -r "${dir}assets" "out/$name/assets" 2>/dev/null || true
    sed -Ei 's|([^.])/assets|\1../assets|g; s|^/assets|../assets|g' "out/$name/slides.html"
done
