# Neovim config (personal)

This is my personal Neovim config, based on **NvChad**. The goal is to have LSP, formatting, and linting ready for multiple languages with minimal setup.

## Supported languages (current)
- Go
- JavaScript / TypeScript (incl. React)
- HTML / CSS
- JSON / YAML (incl. Kubernetes, Helm, and Docker Compose)
- Dockerfile
- Terraform / HCL
- SQL
- Python
- Java
- Swift
- Bash / Shell

## Requirements
- Neovim **0.11+**
- Language runtimes/CLIs installed externally (see below)

## Install Neovim (Homebrew)
```bash
brew install neovim
```

## Install language runtimes/CLIs (Homebrew)
```bash
brew install node go python openjdk swift-format terraform
```

Optional tools (install as needed):
```bash
brew install sqlfluff shellcheck tflint
```

## Quick setup
1) Clone this config into `~/.config/nvim`.
2) Open Neovim and run `:MasonInstallAll`.
3) Make sure the external runtimes/CLIs you need are installed.

## Notes
- NvChad is used as the base, and its modules are imported (e.g. `require "nvchad.options"` and `require "nvchad.mappings"`).
- If you clone this repo, you can remove the `.git` folder to use it as your own base.

## Credits
1) Lazyvim starter https://github.com/LazyVim/starter (inspiration for the NvChad starter).
