#!/usr/bin/env bash

# Determine current OS
if [[ $OSTYPE == darwin* ]]; then
    OS='mac'
elif [[ $OSTYPE == linux-gnu* ]]; then
    OS='linux'
else
    OS='unknown'
fi

# alias ls according to the current os
if [[ $OS == "mac" ]]; then
    alias ls='ls -AGF'
elif [[ $OS == "linux" ]]; then
    alias ls='ls -AF --color=auto'
fi

# Prompt user before taking action
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'

alias ll='ls -l'

alias e='$EDITOR'
alias q='exit'

# Easier movement
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

if hash curl 2>/dev/null; then
    alias header='curl -I'
fi

if hash ccat 2>/dev/null; then
    # better for cat abuse
    alias cat='ccat'
fi

if hash wget 2>/dev/null; then
    alias wget='wget -c'
fi

if hash grep 2>/dev/null; then
    alias grep='grep --color=always'
fi

# Go setup stuff
export GOPATH=$HOME/Dropbox/$USER/projects/go
export PATH=$PATH:$GOPATH/bin

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Use vi bindings in the shell - http://unix.stackexchange.com/a/43005
set -o vi

# Alias vim to nvim if nvim is installed
if hash nvim 2>/dev/null; then
    alias vim='nvim'
    alias vi='nvim'
    alias ni='nvim'
fi

# Git Aliases
if hash git 2>/dev/null; then
    alias ga='git add'
    alias gb='git branch'
    alias gc='git commit'
    alias gca='git commit -a'
    alias gcl='git clone'
    alias gco='git checkout'
    alias gd='git diff'
    alias gl='git log --pretty=oneline --abbrev-commit'
    alias glpretty='git log --graph --decorate --pretty=oneline --abbrev-commit'
    alias gitgraph="git log --graph --oneline --all --decorate --topo-order"
    alias gp='git push'
    alias gps='git push --set-upstream origin $(git symbolic-ref --short HEAD)'
    alias gpl='git pull'
    alias gr='git remote'
    alias grb='git rebase -i origin/master'
    alias grm='git rm'
    alias gs='git status --short'
    alias gst='git stash'
    alias gu='git undo'
fi

# Bash Completion
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    . /usr/local/etc/bash_completion.d/git-completion.bash
    # Git Aliases
    __git_complete ga  _git_add
    __git_complete gb  _git_branch
    __git_complete gc  _git_commit
    __git_complete gco _git_checkout
    __git_complete gd  _git_diff
    __git_complete gl  _git_log
    __git_complete gp  _git_push
    __git_complete gpl _git_pull
    __git_complete gr  _git_remote
    __git_complete grb _git_rebase
    __git_complete grm _git_rm
    __git_complete gst _git_stash
    __git_complete gu  _git_undo
fi

if hash virtualenv 2>/dev/null; then
    function venv() {
    local env="$1"
    if [ -f "$env/bin/activate" ]; then
        . "$env"/bin/activate
    fi
}

fi

# https://github.com/paulirish/dotfiles/blob/master/.functions
cdf() {  # short for cdfinder
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`" || exit
}

# alias python http server if python is installed
if hash python3 2>/dev/null; then
    alias httpserver='python3 -m http.server'
elif hash python2 2>/dev/null; then
    alias httpserver='python2 -m SimpleHTTPServer'
fi

# time stamp history
export HISTTIMEFORMAT="%Y-%m-%d %T "

# General Commands
alias c="clear"

# IP addresses - https://github.com/necolas/dotfiles
if hash dig 2>/dev/null; then
    alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
fi

if [[ $OS == "mac" ]]; then
    #  Flush DNS cache - https://github.com/necolas/dotfiles
    alias flushdns="dscacheutil -flushcache"

    # Empty the Trash on all mounted volumes and the main HDD - https://github.com/necolas/dotfiles
    # Also, clear Apple’s System Logs to improve shell startup speed
    alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

    # Show/hide hidden files in Finder - https://github.com/necolas/dotfiles
    alias showdotfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
    alias hidedotfiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
fi

# Copy public key to clipboard
if [[ $OS == mac ]]; then
    alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'"
fi

## Make new shells get the history lines from all previous - https://github.com/necolas/dotfiles
# shells instead of the default "last window closed" history
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# set default editor
export EDITOR=nvim

# Number of lines of commands loaded & stored during a bash session
HISTSIZE=10000
# Number of lines of commands stored in .bash_history file persistently
HISTFILESIZE=10000
HISTCONTROL=ignoreboth:erasedups

prompt_git() {
    # https://github.com/necolas/dotfiles
    local s=""
    local branchName=""

    # check if the current directory is in a git repository
    if [ "$(git rev-parse --is-inside-work-tree &>/dev/null; printf "%s" $?)" == 0 ]; then

        # check if the current directory is in .git before running git checks
        if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == "false" ]; then

            # ensure index is up to date
            git update-index --really-refresh  -q &>/dev/null

            # check for uncommitted changes in the index
            if ! git diff --quiet --ignore-submodules --cached; then
                s="$s+";
            fi

            # check for unstaged changes
            if ! git diff-files --quiet --ignore-submodules; then
                s="$s!";
            fi

            # check for untracked files
            if [ -n "$(git ls-files --others --exclude-standard)" ]; then
                s="$s?";
            fi

            # check for stashed files
            if git rev-parse --verify refs/stash &>/dev/null; then
                s="$s$";
            fi
            # https://gist.github.com/woods/31967
            # Set arrow icon based on status against remote.
            remote_pattern="# Your branch is (.*) of"
            if [[ $(git status 2> /dev/null) =~ ${remote_pattern} ]]; then
                if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
                    remote=">" # Ahead
                else
                    remote="<" # Behind
                fi
            else
                remote="" # Equal
            fi
            diverge_pattern="# Your branch and (.*) have diverged"
            if [[ $(git status 2> /dev/null) =~ ${diverge_pattern} ]]; then
                remote="<>" # Diverged
            fi

        fi

        # get the short symbolic ref
        # if HEAD isn't a symbolic ref, get the short SHA
        # otherwise, just give up
        branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
            git rev-parse --short HEAD 2> /dev/null || \
            printf "(unknown)")"

        [ -n "$s" ] && s=" [$s]"

        printf "%s" "$1$branchName$s$remote"
    else
        return
    fi
}

#http://stackoverflow.com/questions/10406926/how-to-change-default-virtualenvwrapper-prompt
virtualenv_info(){
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
    fi
    [[ -n "$venv" ]] && echo "$venv"
}

# disable the default virtualenv prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

Color_Off='\e[0m'       # Text Reset

Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan

# show watson status in prompt - https://github.com/TailorDev/Watson
export WATSON_DIR=~/.watson
get_watson_status() {
    if [ -e "${WATSON_DIR}/state" ]; then
        # use jq for speed instead of parse watson output
        test=$(jq -r .project "${WATSON_DIR}/state")
        if [[ $test != "null" ]]; then
            tags=$(jq -r 'reduce .tags[] as $item (""; . + " "  + $item)' $WATSON_DIR/state)
            if [[ $tags != "" ]]; then
                echo "● ${test} -${tags}"
            else
                echo "● ${test}"
            fi
        fi
    fi
}

set_prompts() {
    # set the terminal title to the current working directory
    PS1="\[\033]0;\w\007\]"
    PS1+="\n"
    PS1+="\[$Yellow\]\u"                    # username
    PS1+="\[$Color_Off\]@"
    PS1+="\[$Purple\]\h"                    # host
    PS1+="\[$Blue\] \w"                     # working directory
    PS1+="\[$Green\]\$(prompt_git \" \")"   # git repository details
    PS1+=" \[$Cyan\]\$(virtualenv_info)"    # virtual environment status
    PS1+="\[$Cyan\]\${DOCKER_MACHINE_NAME}" # display docker machine name
    PS1+="\[$Yellow\]\$(get_watson_status)"
    PS1+="\n"
    PS1+="\[$Color_Off\]❯ "                # $ or # depending on user status

    export PS1
}

set_prompts
unset set_prompts

# Functions
# search recessively
# 2nd optional argument for directory. Defaults to $PWD.
findtext() {
    if (( $# < 2 )); then
        local arg2=$PWD
    else
        local arg2="$2"
    fi
    grep -riI --color "$1" "$arg2" 2>/dev/null
}
# Make directory and enter it
md() {
    mkdir -pv "$@" && cd "$@"
}

# http://serverfault.com/a/28649
# move up directories more easily
up() {
    cd "$(eval printf '../'%.s $(seq 1 $1))"
}

if hash youtube-dl 2>/dev/null; then
    # https://github.com/exogen/dotfiles/
    play() {
        youtube-dl --default-search=ytsearch: \
            --youtube-skip-dash-manifest \
            --output="${TMPDIR:-/tmp/}%(title)s-%(id)s.%(ext)s" \
            --restrict-filenames \
            --format="bestaudio[ext!=webm]" \
            --exec=afplay "$*"
    }

    mp3() {
        youtube-dl --default-search=ytsearch: \
            --restrict-filenames \
            --format=bestaudio \
            --extract-audio \
            --audio-format=mp3 \
            --audio-quality=1 "$*"
    }

    mp4() {
        youtube-dl --default-search=ytsearch: \
            --restrict-filenames \
            --format=best "$*"
    }
fi

# https://wiki.archlinux.org/index.php/Man_page#Colored_man_pages
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
        LESS_TERMCAP_md=$'\E[01;38;5;74m' \
        LESS_TERMCAP_me=$'\E[0m' \
        LESS_TERMCAP_se=$'\E[0m' \
        LESS_TERMCAP_so=$'\E[01;33;03;40m' \
        LESS_TERMCAP_ue=$'\E[0m' \
        LESS_TERMCAP_us=$'\E[04;38;5;146m' \
        man "$@"
}

# http://stackoverflow.com/a/13322667
localip() {
    while IFS=$': \t' read -ra line; do
        [ -z "${line%inet}" ] && \
            ip=${line[${#line[1]}>4?1:2]} && \
            [ "${ip#127.0.0.1}" ]
    done< <(LANG=C /sbin/ifconfig)
    echo "$ip"
}

# http://stackoverflow.com/a/19458217/3720597
if [[ $OS == "mac" ]]; then
    function clip() {
    if [[ -p /dev/stdin ]]; then
        # stdin is a pipe
        # stdin -> clipboard
        pbcopy
    else
        # stdin is not a pipe
        # clipboard -> stdout
        pbpaste
    fi
}
fi

# https://wiki.archlinux.org/index.php/Tmux#Autostart_tmux_with_default_tmux_layout
# make Tmux open on terminal startup
# if [[ -z "$TMUX" ]]; then
#     ID="$(tmux ls | grep -vm1 attached | cut -d: -f1)" # get the id of a deattached session
#     if [[ -z "$ID" ]]; then # if not available create a new one
#         tmux new-session
#     else
#         tmux attach-session -t "$ID" # if available attach to it
#     fi
# fi


# LS Colors
export CLICOLOR=1

if [[ $OS == "mac" ]]; then
    # http://www.freebsd.org/cgi/man.cgi?query=ls&apropos=0&sektion=1&format=html
    LSCOLORS='ex'   # dir
    LSCOLORS+='fx'  # symbolic link
    LSCOLORS+='bx'  # socket
    LSCOLORS+='bx'  # pipe
    LSCOLORS+='cx'  # executable
    LSCOLORS+='bx'  # block special
    LSCOLORS+='bx'  # character special
    LSCOLORS+='ab'  # executable with setuid bit set
    LSCOLORS+='ag'  # executable with setgid bit set
    LSCOLORS+='ac'  # directory writable to others, with sticky bit
    LSCOLORS+='ad'  # directory writable to others, without sticky bit

    export LSCOLORS
fi

if [[ $OS == "linux" ]]; then
    # http://linux-sxs.org/housekeeping/lscolors.html
    LS_COLORS='di=34'   # directory
    LS_COLORS+=':fi=0'  # file
    LS_COLORS+=':ln=35' # symbolic link
    LS_COLORS+=':pi=5'  # fifo file
    LS_COLORS+=':so=5'  # socket file
    LS_COLORS+=':bd=5'  # block (buffered) special file
    LS_COLORS+=':cd=5'  # character (unbuffered) special file
    LS_COLORS+=':or=31' # symbolic link pointing to a non-existent file (orphan)
    LS_COLORS+=':mi=0'  # non-existent file pointed to by a symbolic link (visible when you type ls -l)
    LS_COLORS+=':ex=32' # executable permissions set

    export LS_COLORS
fi

# docker
alias drmi='docker rmi $(docker images -a -q)'
alias drm='docker rm $(docker ps -a -q)'
alias drmv='docker volume rm $(docker volume ls -q)'
# alias drmv='docker volume rm $(docker volume ls -qf dangling=true)'

# make * select normal and dot files
shopt -s dotglob

# more extensive pattern matching
shopt -s extglob

# fix minor errors when typing names of dirs
shopt -s cdspell

# append history instead of overwriting history file
shopt -s histappend

export PATH="/usr/local/sbin:$PATH"

if [ -f "$(brew --prefix)"/share/bash-completion/bash_completion ]; then
    . "$(brew --prefix)"/share/bash-completion/bash_completion
fi

# for fzf previous command history search `<CTRL> R`
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# iTerm2 bash integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1

. /usr/local/etc/profile.d/z.sh
