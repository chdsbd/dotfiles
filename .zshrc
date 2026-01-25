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

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=green"
bindkey '^l' autosuggest-accept

alias ls="ls -aG"
alias gpl="git pull"
alias ports="lsof -nP -iTCP -sTCP:LISTEN"


# https://github.com/paulirish/dotfiles/blob/master/.functions
cdf() {  # short for cdfinder
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`" || exit
}

. "$HOME/.cargo/env"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(atuin init zsh)"
zsh-defer eval "$(fnm env --use-on-cd --shell zsh)"
eval "$(zoxide init zsh)"

# Workaround to make vi-mode work with atuin
# https://github.com/jeffreytse/zsh-vi-mode/issues/242#issuecomment-3291716222
function zvm_after_init() {
  zvm_bindkey viins '^R' atuin-search
  zvm_bindkey vicmd '^R' atuin-search
}

# zprof