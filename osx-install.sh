#!/bin/sh

# Xcode command-line tools
xcode-select --install

# Hombrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brew files
brew install bash
brew install ccat
brew install curl
brew install diff-so-fancy
brew install djvu2pdf
brew install docker
brew install ffmpeg
brew install fish
brew install git
brew install git-extras
brew install golang
brew install heroku
brew install httpie
brew install mosh
brew install neovim/neovim/neovim
brew install nmap
brew install npm
brew install nyancat
brew install pandoc
brew install postgresql
brew install python
brew install python3
brew install rbenv
brew install redis
brew install ruby
brew install scala
brew install shellcheck
brew install sqlite
brew install ssh-copy-id
brew install sshuttle
brew install the_silver_searcher
brew install tig
brew install uncrustify
brew install wakeonlan
brew install wget
brew install youtube-dl
brew install z

# completions
brew install homebrew/versions/bash-completion2
brew tap homebrew/completions
brew install apm-bash-completion
brew install brew-cask-completion
brew install pip-completion

# cask files
brew cask install 1password
brew cask install arduino
brew cask install atom
brew cask install calibre
brew cask install coolterm
brew cask install cyberduck
brew cask install discord
brew cask install disk-inventory-x
brew cask install docker
brew cask install dropbox
brew cask install eagle
brew cask install exa
brew cask install exifrenamer
brew cask install firefox
brew cask install flux
brew cask install gitup
brew cask install gmail-notifier
brew cask install google-chrome
brew cask install intellij-idea
brew cask install java
brew cask install keepingyouawake
brew cask install kitematic
brew cask install limechat
brew cask install microsoft-office
brew cask install minikube
brew cask install mobile-mouse-server
brew cask install pg-commander
brew cask install plex-media-server
brew cask install postman
brew cask install psequel
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package quicklookase qlvideo
brew cask install sdformatter
brew cask install sketchup
brew cask install skype
brew cask install slack
brew cask install sourcetree
brew cask install spectacle
brew cask install sqlitebrowser
brew cask install steam
brew cask install sublime-text
brew cask install the-unarchiver
brew cask install transmission
brew cask install virtualbox
brew cask install vlc
brew cask install xbox360-controller-driver

brew tap caskroom/versions
brew cask install iterm2-beta

brew tap chdsbd/homebrew-port-map
brew cask install port-map

brew tap caskroom/fonts
brew cask install font-latin-modern

# misc
bash atom-install.sh
bash iterm-install.sh
bash js-install.sh
bash osx-defaults.sh
bash py-install.sh
bash rb-install.sh

# http://clubmate.fi/upgrade-to-bash-4-in-mac-os-x/
# Add the new shell to the list of allowed shells
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell
chsh -s /usr/local/bin/bash
