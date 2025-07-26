#!/usr/bin/env bash

set -e

# Check if running on macOS
if [[ $(uname -s) != "Darwin" ]]; then
    echo "This script is for macOS only"
    exit 1
fi

# Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Installing packages..."

# Formulas
brew install stow git neovim starship zoxide

# Casks
brew install --cask ghostty font-fira-code-nerd-font

# Stow dotfiles
echo "Stowing dotfiles..."
stow -t ~ git zsh starship nvim macos

echo "Setup complete!"