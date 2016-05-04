# Color bash prompt
export PS1="\[\e[1;30;47m\]\h:\W \u\$\[\e[0m\] "

# this is slow
# Add homebrew bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Turn off homebrew analytics
export HOMEBREW_NO_ANALYTICS=1

# Color bash prompt
PS1_PWD_MAX=15
__pwd_ps1() { echo -n $PWD | sed -e "s|${HOME}|~|" -e "s|\(/[^/]*/\).*\(/.\{${PS1_PWD_MAX}\}\)|\1...\2|"; }

GIT_PS1_SHOWDIRTYSTATE=1
PS1='\[\033[01;34m\]$(__pwd_ps1)$(__git_ps1 " \[\033[01;31m\](%s)")$\[\033[00m\] '

# Add cabal install
#export PATH=$HOME/.cabal/bin:$PATH

# Add go path
export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOPATH/bin


# ansible inventory file
export ANSIBLE_INVENTORY=~/dev/ansible/ansible_inventory

# ignore duplicates in history
export HISTCONTROL=ignoredups

# why yes I do use Go
export GO15VENDOREXPERIMENT=1

###
# aliases
###

# Add shortened tmux new command
alias tmn='tmux new -s $1'

# Add tmux bash completion
alias tma='tmux attach -t $1'
if [ -f /usr/local/etc/bash_completion.d/tma ]; then
  . /usr/local/etc/bash_completion.d/tma
fi

# Alias ll
alias ll="ls -alGh"

# cd lists directory contents
function cd {
  builtin cd "$@" && ll
}

# Color grep
alias grep='grep --color=auto'

# Go aliases
alias gb="go build"
alias gt="go test"
alias gtv="go test -v"
alias gtvr="go test -v -race"
