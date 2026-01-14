# Neovim Config Checklist

## Critical / Startup Stability
- [X] Fixing double workspace loading on lua project.

## Reset Areas (Pending Rebuild)
- [ ] Rebuild DAP/debugging from scratch (core + language configs).

## LSP / Formatters / Linters (Infra/DevOps)
- [ ] Dockerfile: formatter tooling (linter already wired).
- [x] Docker Compose: LSP + schema validation for compose files.
- [x] Kubernetes YAML: schema support, validation, and completion.
- [x] Helm: LSP + template awareness.
- [x] Terraform: LSP + formatter (terraform fmt) + linting (tflint).
- [ ] Ansible: LSP + linting if relevant.
- [x] SQL: formatter/linting wired.

## General Quality of Life
- [ ] Review clipboard options for cross-platform correctness.
- [x] Add README section for setup prerequisites and optional tooling.

## Java
- [ ] Verify Java tests/debugging workflow (jdtls, formatting, linting are already wired).

## Roadmap / Ideas
- [ ] Configure development environments for each language (mappings + framework workflows).
- [ ] Unified DAP + mappings for as many languages as possible.
