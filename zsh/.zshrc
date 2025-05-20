# load our own completion functions
fpath=(~/.zsh/completion $fpath)
zmodload zsh/zprof

eval "$(/opt/homebrew/bin/brew shellenv)"

for function in ~/.zsh/functions/*; do
  source $function
done

# extra files in ~/.zsh/configs/pre , ~/.zsh/configs , and ~/.zsh/configs/post
# these are loaded first, second, and third, respectively.
_load_settings() {
  _dir="$1"
  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*; do
        . $config
      done
    fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/(pre|post)/*|*.zwc)
          :
          ;;
        *)
          . $config
          ;;
      esac
    done

    if [ -d "$_dir/post" ]; then
      for config in "$_dir"/post/**/*; do
        . $config
      done
    fi
  fi
}
_load_settings "$HOME/.zsh/configs"

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases
export PATH="$PATH:$HOME/.local/bin"

export PNPM_HOME="/Users/vaidask/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

eval "$(/opt/homebrew/bin/brew shellenv)"


# pnpm
export PNPM_HOME="/Users/vaidask/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# export JAVA_HOME=`/usr/libexec/java_home -v 11`
# export ANDROID_HOME=/Users/vaidask/Library/Android/sdk
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/tools/bin
# export PATH=$PATH:$ANDROID_HOME/platform-tools

export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`

# bun completions
[ -s "/Users/vaidask/.bun/_bun" ] && source "/Users/vaidask/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# source /Users/vaidask/.config/broot/launcher/bash/br

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/vaidask/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# source "$HOME/.bazelenv"
export JAVA_HOME=`/usr/libexec/java_home -v 17`
export ANDROID_HOME=/Users/vaidask/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export ELASTIC_HOST=http://127.0.0.1:9200
alias npmpublic="npm config --global set registry https://registry.npmjs.org/ && npm config --global get registry && yarn config set registry https://registry.npmjs.org/ || yarn config set npmRegistryServer https://registry.npmjs.org/"
alias npmprivate="npm config --global set registry https://npm.dev.wixpress.com && npm config --global get registry && yarn config set registry https://npm.dev.wixpress.com || yarn config set npmRegistryServer https://npm.dev.wixpress.com"
source "/Users/vaidask/.astra/astra.sh"

# opencode
export PATH=/Users/vaidask/.opencode/bin:$PATH
