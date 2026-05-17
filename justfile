set positional-arguments

# Show available commands
help:
    @just --list --unsorted

# Build and switch to the specified user environment
@serve:
    marp --server . --watch
