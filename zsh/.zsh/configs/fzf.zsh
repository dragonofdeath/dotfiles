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
  branches=$(git branch -vv) &&
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
  manager=$1
  if cat package.json > /dev/null 2>&1; then
      scripts=$(cat package.json | jq .scripts | jq -r 'keys[]' | fzf --preview 'cat package.json | jq .scripts.\"{}\"' --height 40% --preview-window wrap)
      echo $scripts

       if [[ -n $scripts ]]; then
          print -s $manager" run "$scripts;
          $manager run $scripts
      else
          echo "Exit: You haven't selected any script"
      fi
  else
      echo "Error: There's no package.json"
  fi
}

ys() {
  scr "yarn"
}
ns() {
  scr "npm"
}

