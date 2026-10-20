#!/usr/bin/env bash
# Prepare a fresh codespace / dev container: submodules, JS deps, first build.
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."

git config --global --add safe.directory "$PWD"

forge install
bun install --frozen-lockfile
forge build

echo "ready: run 'F1 > Tasks: Run Test Task' or 'forge test'"
