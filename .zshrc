# zmodload zsh/zprof
export FPATH=/opt/homebrew/share/zsh/site-functions:$FPATH
autoload -Uz compinit && compinit -C
# Lazy-load antidote and generate the static load file only when needed
zsh_plugins=${ZDOTDIR:-$HOME}/.zsh_plugins
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  (
    source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
    antidote bundle <${zsh_plugins}.txt >${zsh_plugins}.zsh
  )
fi

source ${zsh_plugins}.zsh

# enable vi mode.
bindkey -v

alias ls="ls -aG"
alias gpl="git pull"
alias ports="lsof -nP -iTCP -sTCP:LISTEN"


# https://github.com/paulirish/dotfiles/blob/master/.functions
cdf() {  # short for cdfinder
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`" || exit
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"
eval "$(frum init)"

# auto accept suggestion with ctrl-l instead of just right-arrow.
bindkey '^l' autosuggest-accept

# zprof