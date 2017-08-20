#!/usr/bin/env bash

# Parts taken from https://github.com/necolas/dotfiles

#http://stackoverflow.com/a/4774063
DOTFILES_DIRECTORY="$(cd "$( dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"

link() {
    # Force create/replace the symlink.
    ln -fs "$DOTFILES_DIRECTORY/$1" "$HOME/$2"
}

# Link .dotfiles to $HOME
mkdir "$HOME/.atom"

link "bash_profile" ".bash_profile"
link "bashrc" ".bashrc"
link "gitattributes" ".gitattributes"
link "gitconfig" ".gitconfig"
link "gitignore" ".gitignore"
link "inputrc" ".inputrc"
link "uncrustify.cfg" ".uncrustify.cfg"
link "pylintrc" ".pylintrc"
link "remarkrc" ".remarkrc"
link "sublime-text/User" "Library/Application Support/Sublime Text 3/Packages"
echo "dotfiles link complete!"

bash itunes-install.sh

echo "iTunes linking done!"
