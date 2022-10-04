#!/usr/bin/zsh
# Ubuntu hoohaa .zshrc
source ~/bin/antigen.zsh

# zsh new user 
setopt sharehistory
HISTSIZE=100000
SAVEHIST=1000000
HISTFILE=~/.history/histfile 
setopt autocd beep extendedglob nomatch 

# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=0
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Set up the prompt
fpath+=($HOME/bin/pure)
autoload -Uz promptinit
promptinit
prompt pure

# antigen stuff to use
antigen bundle jeffreytse/zsh-vi-mode
source ~/.antigen/bundles/jeffreytse/zsh-vi-mode/zsh-vi-mode.plugin.zsh
antigen bundle zsh-users/zsh-autosuggestions
eval "$(dircolors -b)"

# background notify plugin
#source $HOME/bin/bgnotify.plugin.zsh

# export MOZ_ENABLE_WAYLAND="1"
# export EDITOR="$HOME/.cargo/bin/hx"
# export EDITOR="/usr/bin/nvim"
export EDITOR="vim"
export GIT_EDITOR="$EDITOR"
# export BAT_PAGER="always"
export RANGER_LOAD_DEFAULT_RC=FALSE
source $HOME/.bash_aliases

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# fast and intelligent cd replacement
eval "$(zoxide init zsh)"
#neofetch --ascii_distro Ubuntu

# setup rust
#. "$HOME/.cargo/env"

bindkey -v
set -o noclobber
export COLORTERM=truecolor

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
# else
#     if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
#        . "$HOME/miniconda3/etc/profile.d/conda.sh"
#     else
#        export PATH="$HOME/miniconda3/bin:$PATH"
#    fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

# fast and simple node manager
# eval "$(fnm env)"

#export QT_QPA_PLATFORM=wayland

# Use lf to switch directories and bind it to ctrl-o
# lfcd () {
#     tmp="$(mktemp)"
#     trap 'rm -f $tmp >/dev/null 2>&1' HUP INT QUIT TERM PWR EXIT
#     lf -last-dir-path="$tmp" "$@"
#     if [ -f "$tmp" ]; then
#         dir="$(cat "$tmp")"
#        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
#    fi
# }
#bindkey -s '^o' 'lfcd\n'

# rust smart neural net context aware cmdline command completer from history
# # Ctrl-r
# eval "$(mcfly init zsh)"

# setup go
#export GOPATH=$HOME/go
#export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# system fzf command and feature scripts
#export FZF_DEFAULT_COMMAND='fdfind -E "/home/hoohaa/nv/games/steamapps/compatdata/*" --ignore-file "$HOME/.config/.fd_ignore"'
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND . /"
#export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND -t d . /"
#export FZF_DEFAULT_OPTS='-e -i +x --no-mouse --no-hscroll'
#source /usr/share/doc/fzf/examples/completion.zsh
#source /usr/share/doc/fzf/examples/key-bindings.zsh

# process antigen
antigen apply
# Generated for envman. Do not edit.
#[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

