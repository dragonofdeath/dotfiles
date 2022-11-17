# https://stackoverflow.com/a/23471915

if [[ ! $UID -eq 0 ]]; then
  ## http://www.zsh.org/mla/users/2010/msg00769.html
  function rationalise-dot() {
    local MATCH # keep the regex match from leaking to the environment
    if [[ $LBUFFER =~ '(^|/| |      |'$'\n''|\||;|&)\.\.$' && ! $LBUFFER = p4* ]]; then
        #if [[ ! $LBUFFER = p4* && $LBUFFER = *.. ]]; then
        LBUFFER+=/..
    else
        zle self-insert
    fi
  }
zle -N rationalise-dot
bindkey . rationalise-dot
bindkey -M isearch . self-insert
fi
