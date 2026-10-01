# dotfiles

My personal macOS terminal setup.

This repository contains the configuration and installation script I use to keep my terminal environment consistent across multiple Macs.

## Included Tools

- [Starship](https://starship.rs/) — customizable shell prompt
- [zoxide](https://github.com/ajeetdsouza/zoxide) — smarter directory navigation
- [fzf](https://github.com/junegunn/fzf) — fuzzy finder and command history search
- [bat](https://github.com/sharkdp/bat) — improved `cat` with syntax highlighting
- [eza](https://github.com/eza-community/eza) — modern replacement for `ls`
- [ripgrep](https://github.com/BurntSushi/ripgrep) — fast text search
- zsh-autosuggestions — command suggestions based on shell history
- zsh-syntax-highlighting — syntax highlighting for zsh commands

## Files

```text
dotfiles/
├── .zshrc
├── Brewfile
├── setup.sh
└── README.md
```

- `.zshrc` — zsh configuration, aliases, and tool initialization
- `Brewfile` — Homebrew packages used by the terminal setup
- `setup.sh` — installs dependencies and restores the terminal configuration

## Installation

Clone the repository:

```bash
git clone https://github.com/Young0109/dotfiles.git
cd dotfiles
```

Run the setup script:

```bash
chmod +x setup.sh
./setup.sh
```

Then restart the terminal or run:

```bash
source ~/.zshrc
```

## Useful Commands

```bash
z DiskHunter
```

Jump to a frequently used directory with zoxide.

```bash
ll
```

Show a detailed directory listing with Git information.

```bash
bat file.py
```

View a file with syntax highlighting and line numbers.

```bash
rg "search_term"
```

Search text recursively in the current directory.

Press:

```text
Ctrl + R
```

to search command history using fzf.

## Notes

The setup script automatically backs up an existing `.zshrc` before replacing it.

This setup is intended for macOS with zsh and Homebrew.
