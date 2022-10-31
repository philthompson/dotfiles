export PATH="$PATH:$HOME/BashScripts/bin"

export CLICOLOR=1

if [[ "$(uname -s)" =~ "[Dd]arwin" ]]
then
    alias rm='rm -i'
else
    # do not delete / or prompt if deleting more than 3 files at a time #
    alias rm='rm -i --preserve-root'
fi

alias ls="ls -p"

# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

function tac() { tail -r -- "$@"; }

