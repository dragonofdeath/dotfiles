eval "$(/opt/homebrew/bin/brew shellenv)"
fpath=($(brew --prefix zsh-autosuggestions)/share/zsh-completions $fpath)
