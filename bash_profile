if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
export PS1="\[\033[1;34m\]\!\[\033[0m\] \[\033[1;35m\]\u\[\033[0m\]:\[\033[1;35m\]\W\[\033[0m\]$"": "

alias ll='ls -l'
alias la='ls -Al'
alias l='ls -CF'
alias ni='node-inspector --web-port 8001 --preload=false'
alias nid='node-inspector --web-port 8001 --preload=false --debug-brk'

