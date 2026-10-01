# -----------------------------
# Young's Terminal Setup
# -----------------------------

# Command history
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000

setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Better cd
eval "$(zoxide init zsh)"

# Fuzzy finder
eval "$(fzf --zsh)"

# Prompt
eval "$(starship init zsh)"

# Autosuggestions
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Syntax highlighting
# Keep this near the end of .zshrc
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Useful aliases
alias ll="eza -lah --git"
alias la="eza -a"
alias tree="eza --tree"
alias gs="git status"
alias ..="cd .."
alias ...="cd ../.."
