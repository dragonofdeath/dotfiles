# completion
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# automatically enter directories without cd
setopt auto_cd

# use vim as the visual editor
export TERM=alacritty
export PATH="/usr/local/opt/ruby/bin:/usr/local/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin:/bin:$HOME/bin/:/Applications/ARM/bin"
export VISUAL='nvim -u ~/.config/nvim/minit.vim'
export EDITOR='nvim -u ~/.config/nvim/minit.vim'
export PAGER=less
export MANPAGER="nvim -u ~/.config/nvim/minit.vim -c MANPAGER -"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export HISTFILE=$HOME/.zhistory       # enable history saving on shell exit
setopt APPEND_HISTORY          # append rather than overwrite history file.
export HISTSIZE=10000                  # lines of history to maintain memory
export SAVEHIST=5000                  # lines of history to maintain in history file.
setopt HIST_EXPIRE_DUPS_FIRST  # allow dups, but expire old ones when I hit HISTSIZE
setopt EXTENDED_HISTORY        # save timestamp and runtime information

alias vim=nvim
alias vi=nvim
alias v=nvim
alias n=nvim
alias mn="nvim -u ~/.config/nvim/minit.vim"
alias mmn="nvim -u ~/.config/nvim/minit.vim -c 'set syntax=off'"
alias kurwa="killall -9 {node,nvim} && watchman watch-del-all"
alias ag=rg
alias ll="exa --icons --group-directories-first -la"
# alias yarn=midgard-yarn
alias y=yarn
alias s="source ~/.zshrc"
alias g="git"
alias p="pnpm"
alias pr="pnpm -r"

autoload -U promptinit && promptinit
prompt redhat

bindkey -e

bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^F" edit-command-line

# use bash wordchars
autoload -U select-word-style
select-word-style bash

#setopt prompt_subst

# automatically pushd
setopt auto_pushd
export dirstacksize=5

# awesome cd movements from zshkit
setopt AUTOCD
setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
setopt cdablevars

# export CLICOLOR=1
# export LSCOLORS=ExFxBxDxCxegedabagacad

# Enable extended globbing
setopt EXTENDED_GLOB

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' max-errors 1 numeric
zstyle ':completion:*' menu select=2
setopt GLOB_COMPLETE

setopt HIST_IGNORE_SPACE

alias oras="curl http://wttr.in/Vilnius"

function cheat() { curl "http://cheat.sh/$1" }

function gitstats {
    git log --shortstat --author="$1" | grep -E "fil(e|es) changed" | awk '{files+=$1; inserted+=$4; deleted+=$6; delta+=$4-$6; ratio=deleted/inserted} END {printf "Commit stats:\n- Files changed (total)..  %s\n- Lines added (total)....  %s\n- Lines deleted (total)..  %s\n- Total lines (delta)....  %s\n- Add./Del. ratio (1:n)..  1 : %s\n", files, inserted, deleted, delta, ratio }' -
}

# COPYFILE_DISABLE to prevent several of the system-supplied programs (including tar) from giving special meaning to ._* archive members.
# https://superuser.com/questions/259703/get-mac-tar-to-stop-putting-filenames-in-tar-archives
export COPYFILE_DISABLE=1

md ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

zmodload zsh/mapfile
