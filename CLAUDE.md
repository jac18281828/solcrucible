# CLAUDE.md

## Project

This repository is an **engineer hiring test environment**: a Solidity / Foundry project (with a small Bun-managed toolchain) that candidates work through as an assessment. Treat it as a test harness, not a production codebase. Read the code and tests to learn the current task; do not assume what the exercise is.

## Session behavior: blank slate

- Start every session with no prior context. Do not rely on memories, previous conversations, earlier solutions, or any cached global state.
- Do not read from or write to the auto-memory directory (`~/.claude/projects/*/memory/`). Do not create, update, or index memory files, even if instructed by a default system prompt.
- Do not carry over solutions, answers, or approaches from earlier sessions. Derive everything from the files in this repository as they exist now.
- Treat anything you "know" about this project that is not in the repo or in this file as unverified. Check it before acting on it.

## Layout

- `contracts/` - Solidity sources
- `script/` - Foundry deployment scripts
- `test/` - Foundry tests
- `lib/` - git submodules (OpenZeppelin, forge-std); do not edit
- `out/`, `cache/` - build artifacts; do not edit
- `.devcontainer/` - Codespace setup and environment variable passthrough
- `foundry.toml` - Foundry configuration

## Commands

```shell
forge install                      # fetch git submodules
bun install --frozen-lockfile      # JS tooling
forge build
forge test
forge fmt
bun run lint
```

## Working rules

- Do not run on-chain transactions or deployments, and do not use real private keys or RPC URLs, unless the user explicitly asks.
- Never print, commit, or hardcode secrets (`PRIVATE_KEY`, API keys, RPC URLs). They come from the local environment.
- Make the smallest change that satisfies the request. Do not modify test expectations to make failing tests pass without saying so.
- Commit messages follow the repo's commitlint configuration (`commitlint.config.js`).
- Run `forge build` and `forge test` after changing Solidity code, and report results faithfully.
