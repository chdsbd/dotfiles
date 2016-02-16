#!/bin/sh

# Xcode command-line tools
xcode-select --install

# Hombrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brew files
brew install bash
brew install curl
brew install git
brew install git-extras
brew install golang
brew install nmap
brew install python
brew install python3
brew install shellcheck
brew install sqlite
brew install ssh-copy-id
brew install sshuttle
brew install wakeonlan
brew install wget

# cask files
brew cask install 1password
brew cask install adobe-illustrator-cc
brew cask install adobe-photoshop-cc
brew cask install arduino
brew cask install atom
brew cask install cyberduck
brew cask install discord
brew cask install disk-inventory-x
brew cask install dropbox
brew cask install firefox
brew cask install flux
brew cask install github-desktop
brew cask install gmail-notifier
brew cask install google-chrome
brew cask install intellij-ieda
brew cask install iterm2
brew cask install keepingyouawake
brew cask install limechat
brew cask install microsoft-office
brew cask install mobile-mouse-server
brew cask install plex-media-server
brew cask install sdformatter
brew cask install sketchup
brew cask install slack
brew cask install spectacle
brew cask install sqlitebrowser
brew cask install steam
brew cask install the-unarchiver
brew cask install transmission
brew cask install virtualbox
brew cask install vlc

# taps
brew tap chdsbd/homebrew-port-map
brew cask install port-map
