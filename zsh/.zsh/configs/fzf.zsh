# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.zsh"

FZF_CTRL_T_COMMAND='fd -H -E .git'

# fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git branch -vv --sort=-committerdate) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fbr - checkout git branch (including remote branches)
fbrr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

scr() {
  manager=${1:-"npm"}

  if [[ -f package.json ]]; then
    jq '.scripts | keys[]' -r package.json \
      | fzf --preview 'jq .scripts.\"{}\" package.json' --height 40% --preview-window wrap --bind "enter:accept-non-empty" \
      | xargs $manager run
  else
    echo "Error: There's no package.json"
  fi
}

ys() {
  scr "yarn"
}

_fzf-npm-script-widget() {
  if [[ -f package.json ]]; then
    jq '.scripts | keys[]' -r package.json \
      | fzf --preview 'jq .scripts.\"{}\" package.json' --height 40% --preview-window wrap --bind "enter:accept-non-empty"
  else
    echo "Error: There's no package.json"
  fi
}

fzf-npm-script-widget() {
  LBUFFER="${LBUFFER}$(_fzf-npm-script-widget)"
  local ret=$?
  zle reset-prompt
  return $ret
}

zle     -N    fzf-npm-script-widget
bindkey '^B' fzf-npm-script-widget
