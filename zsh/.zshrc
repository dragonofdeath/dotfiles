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
export ASTRA_OPENAI_API_KEY=eyJhbGciOiJSUzUxMiIsInR5cCI6IkpXVCIsImtpZCI6ImRlZmF1bHQta2lkIn0.eyJuYW1lIjoiVmFpZGFzIEt1YmxpbnNrYXMiLCJkZXNjcmlwdGlvbiI6IlBlcnNvbmFsIGtleSBmb3IgdmFpZGFza0B3aXguY29tIiwiZW1haWwiOiJ2YWlkYXNrQHdpeC5jb20iLCJhenAiOiJlcm8tcHJveHkiLCJzY29wZSI6IkVSTyIsImFsbG93IjpbXSwiaWF0IjoxNzMxMzE4MjE1LCJleHAiOjE3NjI4NTQyMTUsImlzcyI6Imh0dHBzOi8vZXJvLndld2l4Lm5ldCJ9.RG0SlQztMPqqw_bClC2Q_rJ2OIvw1KRIYDczxwqnNS-pFX3auuWlt2qgJfINZ1IgSnX8fkTmWEq6luSf_VEljFqfWf1DJTOwPVeCUtJbsSQQFDhaf_XzMwqYK439L29FZS-RvSNOhqlIac3tuyFsNhb-K8QPVZ2LVhZH7IaZVZXdyJczU-Hm1keEm4aPdkzbjJKHJhfrJHu-uLCSWvxE6fhrS-fSZm6-5KPPXP2iKPjJIFjU37woXn9agB7CBdIzAgHPMg-ZyrpBqWK1ibYei40UVMRZ-X7jlKkUutYmdfaw8COpc1KDK6ZLa5a28Zr9MFCXeb9Ac1cX5CWSwscBuRg20DQGqQIvQ5PEp4lnwRxYr7PIXguVi5e-wCyDSpCyZKWfHECWipXQOpe4Nilntl3Ed2r5fxHVDdmvocsenaJYAS3_YVlWytaE9qpv374io5yQOBVtsn4QxuzWKxjocy_c9jS3EH7b15R6ACFczG8rMNqZ7lB2HkWXpD8G807PDTdYn3Ty5CTTc4_icX8xqb2K06_KlCAziDr4EjJ5Y-HGt__5SyLGar2BbcZPxjn0Mb2Qu-TRFv4oeIqOeI_v43IFZINQjK_2oJhQw0vF6_H2RSLQrzxGs3ZkAL22VXnXOESD7bBka1DVA6-4-bRpxMWj0xXaK5mDMw_iRJdPEvKzgFgnAHKcKHRYsamMi32Z534MD2OFRrs6Y6iuk3dO-o86Xm_e5c4HJrLbtyWO1K9MAWhIlj3pI8hwl1DnHwe1j5kuRcGC_qb9HpV3s35u1Bmh0Or5-wI4oS0LVao5wuElvdzROvoZLAPI1k_5OhQk6WSUaoGB1jKiRSEGbS9k3A
export ASTRA_AZURE_HOST=https://ero.wewix.net/proxy/azure-ai/openai/deployments/
export ELASTIC_HOST=http://127.0.0.1:9200
alias npmpublic="npm config --global set registry https://registry.npmjs.org/ && npm config --global get registry && yarn config set registry https://registry.npmjs.org/ || yarn config set npmRegistryServer https://registry.npmjs.org/"
alias npmprivate="npm config --global set registry https://npm.dev.wixpress.com && npm config --global get registry && yarn config set registry https://npm.dev.wixpress.com || yarn config set npmRegistryServer https://npm.dev.wixpress.com"
source "/Users/vaidask/.astra/astra.sh"
