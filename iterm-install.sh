#!/usr/bin/env bash

# This sets iTerm to use this dotfiles directory for saving preferences
# http://apple.stackexchange.com/a/111559

defaults delete com.googlecode.iterm2
defaults write com.googlecode.iterm2 PrefsCustomFolder "$DOTFILES_DIRECTORY/iterm"
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
defaults read com.googlecode.iterm2 > /dev/null
