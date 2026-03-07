. "$HOME/.cargo/env"
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(fnm env --use-on-cd --corepack-enabled --shell zsh)"

PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
PATH="/Applications/Sublime Merge.app/Contents/SharedSupport/bin:$PATH"