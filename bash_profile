stty -ixon
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=vim
export GOPATH=/Users/phucngo/workspace/go
export PATH=$PATH:/Users/phucngo/workspace/go/bin
export PATH=/Users/phucngo/.config/yarn/global/node_modules/.bin:$PATH
export PATH=/usr/local/php5/bin:$PATH
export PATH=/usr/local/bin:$PATH
alias w="cd ~/workspace"
alias g="cd /Users/phucngo/workspace/go/src/github.com/phuc-ngo"
alias gl="git log --graph"
alias gs="git status"
alias gf="git diff"
alias gb="git branch"
alias ll="ls -al"

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
alias python="python3.6"
export PATH=/usr/local/Cellar/mariadb/10.2.6/bin:$PATH

function _update_ps1() {
    PS1="$(~/.powerline-shell.py --cwd-max-depth=1 $? 2> /dev/null)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

