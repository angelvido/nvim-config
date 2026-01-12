# Neovim Config Improvement Checklist

## Critical / Startup Stability
- [ ] Fix DAP load order so `require "dap"` cannot run before the plugin is available.
- [ ] Fix Fidget load order so configs using it cannot run before the plugin is loaded.
- [ ] Ensure xcodebuild uses the custom config (`configs/xcodebuild.lua`) instead of the default setup.
- [ ] Remove duplicate Mason setup calls so it only runs once.

## Java (JDTLS, Spring, Maven/Gradle)
- [ ] Rework Java detection to use `root_dir` instead of `cwd` for workspace naming.
- [ ] Use `-data` (and proper workspace dir) when starting `jdtls` to avoid state collisions.
- [ ] Make Java runtime detection configurable and robust across macOS/Linux.
- [ ] Add Maven/Gradle project detection and per-project settings.
- [ ] Add Java test/DAP integration (junit, spring, etc.) via jdtls bundles.
- [ ] Improve Java formatting workflow (install/ensure formatter, better defaults).
- [ ] Add Java linting (checkstyle/spotbugs/sonarlint or alternatives).
- [ ] Document Java setup steps and required tools.

## Debugging (DAP Revamp)
- [ ] Redesign DAP setup into a language-agnostic core plus language-specific modules.
- [ ] Add JS/TS debugger (node, chrome) configs.
- [ ] Add Python DAP config.
- [ ] Add Java DAP config (reuse jdtls bundles if possible).
- [ ] Add Go DAP config cleanup (keep but modernize).
- [ ] Add UI/UX improvements: keymaps, layouts, auto-open/close, and session management.

## LSP / Formatters / Linters (Infra/DevOps)
- [ ] Dockerfile: formatter/linter tooling and proper filetype handling.
- [ ] Docker Compose: LSP + schema validation for compose files.
- [ ] Kubernetes YAML: schema support, validation, and completion.
- [ ] Helm: LSP + template awareness.
- [ ] Terraform: LSP + formatter (terraform fmt) + linting (tflint).
- [ ] Ansible: LSP + linting if relevant.
- [ ] SQL: consider formatter/linting if used frequently.

## JS/TS (React + Backend)
- [ ] Add JS/TS LSP config with sensible defaults for React and Node backends.
- [ ] Add JS/TS formatter setup (prettier or biome) with per-project override support.
- [ ] Add JS/TS linting (eslint/biome) with project-aware config.
- [ ] Add React-specific enhancements (jsx/tsx, tailwind class sorting if used).

## Python (Secondary)
- [ ] Add Python LSP defaults and project root detection.
- [ ] Add Python formatter (black/ruff) and linting (ruff/flake8/mypy).

## General Quality of Life
- [ ] Review clipboard options for cross-platform correctness.
- [ ] Add README section for setup prerequisites and optional tooling.
