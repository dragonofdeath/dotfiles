
if [[ ! "$PATH" == */usr/local/opt/ruby/bin* ]]; then
  export PATH="/usr/local/opt/fzf/bin:${PATH}"
fi

if [[ ! "$PATH" == */usr/local/lib/ruby/gems/2.7.0/bin* ]]; then
  export PATH="/usr/local/lib/ruby/gems/2.7.0/bin:${PATH}"
fi
