# ============================================
# Antigravity & Gemini Optimized .bashrc
# ============================================

# ----- Basic Settings -----
export LANG=C
export LC_ALL=C

# ----- History Settings -----
HISTSIZE=50000
HISTFILESIZE=50000
HISTCONTROL=ignoredups:erasedups
shopt -s histappend

# ----- Prompt -----
# シンプルで見やすいプロンプト
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# ----- Homebrew -----
if [[ -f "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -f "/usr/local/bin/brew" ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

# ----- Environment Variables -----
export EDITOR="vim"
export GIT_EDITOR="vim"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

# ----- Aliases -----
alias ll='ls -lGh'
alias la='ls -lAGh'
alias l='ls -CFG'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Git aliases
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
alias gb='git branch'
alias gco='git checkout'
alias gcb='git checkout -b'

# Development
alias py='python3'
alias pip='pip3'
alias grep='grep --color=auto'
alias m='make'

# ----- Functions -----
qcommit() {
    if [ -z "$1" ]; then
        echo "Usage: qcommit <message>"
        return 1
    fi
    git add -A
    git commit -m "$1"
    echo "✓ Committed: $1"
}

git-info() {
    echo "=== Git Repository Info ==="
    echo "Branch: $(git branch --show-current)"
    echo "Remote: $(git remote get-url origin 2>/dev/null || echo 'No remote')"
    echo "Last commit: $(git log -1 --pretty=format:'%h - %an: %s (%ar)')"
    echo ""
    echo "Status:"
    git status -s
}

# ----- Node.js (nvm) -----
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ----- Python (pyenv) -----
if command -v pyenv &> /dev/null; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# ----- Local Customizations -----
[ -f ~/.bashrc.local ] && source ~/.bashrc.local

# ----- Welcome Message -----
echo "🚀 AI Coding Environment Ready!"
