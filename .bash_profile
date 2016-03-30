bashrc="$HOME/.bashrc"

if [ -f $bashrc ]; then
  source $bashrc
fi

eval "$(rbenv init -)"

UTILS_PREFIX=".bash_utils"
source "$UTILS_PREFIX/.vars"
source "$UTILS_PREFIX/.colors"
source "$UTILS_PREFIX/.functions"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PS1="\[${Yellow}\]\u\[${Reset}\]@\[${Cyan}\]\h\[${Reset}\][\w]\[${Green}\]\$(git_branch)\[${Reset}\]\$ "
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

alias 'cd..'='cd ..'
alias '..'='cd ..'
alias '...'='cd ../..'

alias grep='grep --color=auto'

export JAVA_HOME=$(/usr/libexec/java_home)

export TERM=xterm-256color
export CLICOLOR=1
