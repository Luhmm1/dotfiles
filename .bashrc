#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias bat='bat --theme=OneHalfDark'
alias cat='bat --paging=never'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip --color=auto'
alias la='ls --all'
alias ll='exa --all --classify --git --grid --group --group-directories-first --header --icons --long --time-style=long-iso'
alias ls='exa --across --classify --group-directories-first --icons'
alias nvim='nvim -i NONE'
alias tree='exa --icons --tree'
alias vi='nvim'
alias vim='nvim'
alias vps='ssh debian@51.38.227.239'
alias yo='yay -Qtdq'

# bash
export PS1="[\[$(tput sgr0)\]\[$(tput setaf 11)\]\u@\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput setaf 10)\]\W\[$(tput sgr0)\]]\\$ \[$(tput sgr0)\]"

unset HISTFILE

set -o vi

# fzf
[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
[ -f /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --exclude=".git/" --exclude=".Private/"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

_fzf_compgen_path() {
  fd --hidden --follow --exclude='.git/' --exclude='.Private/' . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude='.git/' --exclude='.Private/' . "$1"
}

# Generic Colouriser
export GRC_ALIASES=true

# KDE Wallet
export SSH_ASKPASS=/usr/bin/ksshaskpass
export SSH_ASKPASS_REQUIRE=prefer

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi

if [ ! -f "$SSH_AUTH_SOCK" ]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" > /dev/null
fi

# less
export LESS='-R --use-color -Dd+r$Du+b'
export LESSHISTFILE=-

# Mozilla
export MOZ_ENABLE_WAYLAND=1

# MySQL
export MYSQL_HISTFILE=/dev/null

# Neovim
export EDITOR=nvim

# nnn
export NNN_OPTS=H

[ -f /usr/share/nnn/quitcd/quitcd.bash_zsh ] && source /usr/share/nnn/quitcd/quitcd.bash_zsh

# nvm
[ -f /usr/share/nvm/init-nvm.sh ] && source /usr/share/nvm/init-nvm.sh

# PHPBrew
[ -f "$HOME/.phpbrew/bashrc" ] && source "$HOME/.phpbrew/bashrc"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv > /dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Python
export PYTHONSTARTUP="$HOME/.pythonrc"

# QT
export QT_PLUGIN_PATH="$HOME/.local/lib/qt/plugins/:"

# Starship
eval "$(starship init bash)"

# tmux
if [ -x /usr/bin/tmux ] && [ -n "$DISPLAY" ] && [ -z "$TMUX" ]; then
    tmux attach || tmux > /dev/null 2>&1
fi
