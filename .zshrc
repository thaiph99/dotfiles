export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="pixegami-agnoster"

plugins=(
    git
    docker
    docker-compose
    history
    rsync
    safe-paste
    kubectl
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"

setopt HIST_FIND_NO_DUPS
set -o vi

export EDITOR='nvim'
export VISUAL='nvim'
export LANG=en_US.UTF-8

# Golang
export PATH="$PATH:/usr/local/go/bin"

[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# Conda (lazy-loaded)
export PATH="$HOME/anaconda3/condabin:$PATH"
conda() {
    unset -f conda
    __conda_setup="$("$HOME/anaconda3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
            . "$HOME/anaconda3/etc/profile.d/conda.sh"
        else
            export PATH="$HOME/anaconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    conda "$@"
}

# NVM (lazy-loaded)
export NVM_DIR="$HOME/.nvm"
_load_nvm() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}
nvm()  { _load_nvm; nvm "$@"; }
node() { _load_nvm; node "$@"; }
npm()  { _load_nvm; npm "$@"; }
npx()  { _load_nvm; npx "$@"; }

# Cached kubectl completion
if command -v kubectl >/dev/null 2>&1; then
    KUBECTL_CACHE="$ZSH_CACHE_DIR/kubectl_completion"
    if [ ! -f "$KUBECTL_CACHE" ] || [ "$(command -v kubectl)" -nt "$KUBECTL_CACHE" ]; then
        kubectl completion zsh > "$KUBECTL_CACHE" 2>/dev/null
    fi
    [ -f "$KUBECTL_CACHE" ] && source "$KUBECTL_CACHE"
fi
alias k="kubectl"

# fzf command search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

gnvim() {
    gnome-terminal --full-screen -- zsh -c "cd \"$PWD\"; nvim ${*:-.}; exec zsh"
}
nnvim() {
    kitty --detach=yes --start-as=fullscreen -- zsh -c "cd \"$PWD\"; nvim ${*:-.}; exec zsh"
}

# SDKMAN (JAVA) must stay at the end
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
