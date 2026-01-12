# Neovim Config Improvement Checklist

## Critical / Startup Stability
- [x] Fix DAP load order so `require "dap"` cannot run before the plugin is available.
- [x] Fix Fidget load order so configs using it cannot run before the plugin is loaded.
- [x] Ensure xcodebuild uses the custom config (`configs/xcodebuild.lua`) instead of the default setup.
- [x] Remove duplicate Mason setup calls so it only runs once.

## Reset Areas (Pending Rebuild)
- [ ] Rebuild Java support from scratch (LSP, formatting, linting, tests).
- [ ] Rebuild DAP/debugging from scratch (core + language configs).

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
