# CLAUDE.md

## Repository Overview

Personal dotfiles repository for macOS, managed with [GNU Stow](https://www.gnu.org/software/stow/). Configures Neovim, Zsh, Git, Starship prompt, and Ghostty terminal.

## Directory Structure

```
dotfiles/
├── git/                  # Git config (~/.gitconfig, ~/.config/git/ignore)
├── macos/                # Ghostty terminal config (~/.config/ghostty/config)
├── nvim/                 # Neovim config (~/.config/nvim/)
│   └── .config/nvim/
│       ├── init.lua              # Entry point: leader key, core keymaps, options
│       ├── lua/config/lazy.lua   # Lazy.nvim plugin manager bootstrap
│       ├── lua/plugins/*.lua     # One file per plugin (12 plugin files)
│       └── after/ftplugin/       # Filetype-specific overrides (lua.lua)
├── starship/             # Starship prompt config (~/.config/starship.toml)
├── zsh/                  # Zsh shell config (~/.zshrc)
├── setup.sh              # macOS bootstrap script (Homebrew + stow)
└── .stylua.toml          # Lua formatter settings (project-wide)
```

Each top-level directory is a stow package. The internal paths mirror where symlinks land relative to `~`.

## Installation

`setup.sh` is macOS-only. It installs Homebrew, packages (`stow`, `git`, `neovim`, `starship`, `zoxide`, `fzf`, `uv`, `ghostty`, `font-fira-code-nerd-font`), then runs:

```bash
stow -t ~ git zsh starship nvim macos
```

## Key Conventions

### Code Style
- **Lua**: 2-space indent, single quotes preferred, 80-char line width (enforced by `.stylua.toml`)
- **Default (non-Lua)**: 4-space indent, spaces not tabs
- **Format on save** is enabled via conform.nvim (stylua for Lua, LSP fallback for others)

### Neovim
- **Leader key**: `,` (comma)
- **Plugin manager**: Lazy.nvim with specs auto-imported from `lua/plugins/`
- **LSP tools**: Mason auto-installs `lua_ls`, `pyright`, `ruff`, `stylua`
- **Key mappings**: `jk` = Escape, `<CR>` = clear search, `gl` = line diagnostics, `<leader>ff` = find files, `<leader>fb` = find buffers, `<leader>fo` = format buffer
- **Theme**: base16 Tomorrow Night Eighties (shared with Ghostty)
- Each plugin gets its own file in `lua/plugins/`

### Shell (Zsh)
- **Plugin manager**: Zinit (auto-installed on first shell launch)
- **Plugins**: zsh-syntax-highlighting, zsh-completions, zsh-autosuggestions
- **Tools initialized**: starship, zoxide (aliased to `cd`), fzf
- **Aliases**: `vim` → `nvim`, `ls` → `ls --color`, `ll` → `ls --color -al`
- Machine-local secrets loaded from `~/.secrets.zsh` (not committed)

### Git Commit Style
- Lowercase, imperative mood, no conventional-commit prefixes
- Short single-line messages describing the change
- Examples: `add autopairs plugin`, `update starship prompt`, `remove legacy dotfiles`

## Adding a New Tool Configuration

1. Create a directory at the repo root named after the tool (e.g., `mytool/`)
2. Inside it, mirror the path from `~` (e.g., `mytool/.config/mytool/config`)
3. Add the directory name to the `stow` command in `setup.sh`
4. If it needs Homebrew, add it to the `brew install` line in `setup.sh`

## Adding a New Neovim Plugin

1. Create a new file in `nvim/.config/nvim/lua/plugins/<plugin-name>.lua`
2. Return a Lazy.nvim plugin spec table
3. Lazy.nvim auto-discovers files in the `plugins/` directory

## No Build/Test/Lint Pipeline

This repo has no CI, tests, or automated linting. Changes are validated manually. The only formatter is stylua for Lua files (runs on save in Neovim and can be run standalone).
