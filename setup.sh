#!/bin/bash

set -euo pipefail

echo "======================================"
echo "  Young's Terminal Setup"
echo "======================================"
echo

# Get the directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --------------------------------------------------
# 1. Check Homebrew
# --------------------------------------------------

echo "Checking Homebrew..."

if command -v brew >/dev/null 2>&1; then
    echo "✓ Homebrew is already installed."
else
    echo "Homebrew is not installed."
    echo "Installing Homebrew..."

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for the rest of this script
    if [ -x "/opt/homebrew/bin/brew" ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [ -x "/usr/local/bin/brew" ]; then
        eval "$(/usr/local/bin/brew shellenv)"
    else
        echo "Error: Homebrew installation could not be found."
        exit 1
    fi

    echo "✓ Homebrew installed."
fi

echo

# --------------------------------------------------
# 2. Install packages from Brewfile
# --------------------------------------------------

if [ -f "$DOTFILES_DIR/Brewfile" ]; then
    echo "Installing packages from Brewfile..."

    brew bundle --file="$DOTFILES_DIR/Brewfile"

    echo "✓ Homebrew packages installed."
else
    echo "Error: Brewfile not found."
    exit 1
fi

echo

# --------------------------------------------------
# 3. Back up existing .zshrc
# --------------------------------------------------

TIMESTAMP="$(date +%Y%m%d-%H%M%S)"

if [ -f "$HOME/.zshrc" ]; then
    BACKUP="$HOME/.zshrc.backup-$TIMESTAMP"

    echo "Backing up existing .zshrc..."
    cp "$HOME/.zshrc" "$BACKUP"

    echo "✓ Backup created:"
    echo "  $BACKUP"
fi

echo

# --------------------------------------------------
# 4. Install .zshrc
# --------------------------------------------------

if [ -f "$DOTFILES_DIR/.zshrc" ]; then
    echo "Installing .zshrc..."

    cp "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

    echo "✓ .zshrc installed."
else
    echo "Error: .zshrc not found in dotfiles repository."
    exit 1
fi

echo

# --------------------------------------------------
# 5. Install Starship config if present
# --------------------------------------------------

if [ -f "$DOTFILES_DIR/starship.toml" ]; then
    mkdir -p "$HOME/.config"

    if [ -f "$HOME/.config/starship.toml" ]; then
        STARSHIP_BACKUP="$HOME/.config/starship.toml.backup-$TIMESTAMP"

        echo "Backing up existing Starship config..."
        cp "$HOME/.config/starship.toml" "$STARSHIP_BACKUP"

        echo "✓ Backup created:"
        echo "  $STARSHIP_BACKUP"
    fi

    echo "Installing Starship config..."

    cp "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"

    echo "✓ Starship config installed."
else
    echo "No custom starship.toml found. Skipping."
fi

echo

# --------------------------------------------------
# Done
# --------------------------------------------------

echo "======================================"
echo "  Setup complete!"
echo "======================================"
echo
echo "Restart Terminal or run:"
echo
echo "    source ~/.zshrc"
echo
