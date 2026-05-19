set positional-arguments

# Show available commands
help:
    @just --list --unsorted

# Serve slides
@serve:
    marp --server . --watch

# Build slides
@build:
    ./build.sh

# Format files
@fmt:
    prettier . -w
