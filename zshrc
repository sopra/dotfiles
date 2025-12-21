# ============================================
# Antigravity & Gemini Optimized .zshrc
# ============================================

# ----- Basic Settings -----
export LANG=ja_JP.UTF-8

# ----- History Settings -----
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups      # 重複したコマンドを無視
setopt hist_ignore_space     # スペースで始まるコマンドを履歴に保存しない
setopt share_history         # 履歴を共有
setopt append_history        # 履歴を追記

# ----- Prompt -----
# Git branch表示
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%b'
PROMPT='%F{cyan}%~%f %F{yellow}${vcs_info_msg_0_}%f
%F{green}❯%f '

# ----- Completion -----
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # 大文字小文字を区別しない

# ----- Homebrew -----
if [[ -f "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -f "/usr/local/bin/brew" ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

# ----- Environment Variables -----
# AI Coding Tools
export EDITOR="vim"
export GIT_EDITOR="vim"

# Path
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

# ----- Aliases for Efficient Development -----

# Basic aliases
alias ll='ls -lGh'
alias la='ls -lAGh'
alias l='ls -CFG'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Git aliases (Antigravity/Gemini friendly)
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git log --oneline --graph --decorate -20'
alias gll='git log --oneline --graph --decorate'
alias gb='git branch'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gm='git merge'
alias gr='git rebase'
alias gst='git stash'
alias gstp='git stash pop'

# AI Coding Workflow aliases
alias ai-commit='git add -A && git commit -m "$(date +"%Y-%m-%d %H:%M") - AI-assisted changes"'
alias ai-diff='git diff | head -100'
alias ai-status='git status && echo "\n--- Recent commits ---" && git log -5 --oneline'

# Project Navigation
alias projects='cd ~/Devel/github.com'
alias dotfiles='cd ~/Devel/github.com/sopra/dotfiles'

# Development tools
alias py='python3'
alias pip='pip3'

# Grep with color
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Make
alias m='make'

# Safe operations
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# ----- Functions for AI Coding -----

# Quick commit with AI-friendly message
qcommit() {
    if [ -z "$1" ]; then
        echo "Usage: qcommit <message>"
        return 1
    fi
    git add -A
    git commit -m "$1"
    echo "\n✓ Committed: $1"
}

# Show file tree structure (useful for AI context)
tree-context() {
    local depth=${1:-3}
    if command -v tree &> /dev/null; then
        tree -L $depth -I 'node_modules|.git|dist|build|.next|__pycache__|*.pyc|.venv'
    else
        find . -maxdepth $depth -not -path '*/\.*' -not -path '*/node_modules/*' -type f | head -50
    fi
}

# Show recent file changes (useful for AI to understand context)
recent-changes() {
    local days=${1:-7}
    echo "Files modified in the last $days days:"
    find . -type f -mtime -$days -not -path '*/\.*' | head -20
}

# Create a new project directory with git init
new-project() {
    if [ -z "$1" ]; then
        echo "Usage: new-project <project-name>"
        return 1
    fi
    mkdir -p "$1"
    cd "$1"
    git init
    echo "# $1" > README.md
    echo "✓ Created new project: $1"
}

# Show git branch with description
git-info() {
    echo "=== Git Repository Info ==="
    echo "Branch: $(git branch --show-current)"
    echo "Remote: $(git remote get-url origin 2>/dev/null || echo 'No remote')"
    echo "Last commit: $(git log -1 --pretty=format:'%h - %an: %s (%ar)')"
    echo "\nStatus:"
    git status -s
}

# ----- Node.js (if using nvm) -----
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ----- Python (if using pyenv) -----
if command -v pyenv &> /dev/null; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# ----- Additional Tools -----
# fzf (fuzzy finder) - 非常に便利
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ----- Local Customizations -----
# ローカル専用の設定は ~/.zshrc.local に記述
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# ----- Welcome Message -----
echo "🚀 AI Coding Environment Ready!"
echo "Type 'git-info' for repository info"
echo "Type 'tree-context' for project structure"
