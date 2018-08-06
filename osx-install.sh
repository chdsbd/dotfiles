#!/bin/sh

# Xcode command-line tools
xcode-select --install

# Hombrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brew files
brew install bash
brew install git
brew install golang
brew install heroku
brew install mas
brew install npm
brew install python
brew install python3
brew install ruby
brew install sqlite
brew install z

# utilities
brew install aria2
brew install ccat
brew install chainsawbaby/formula/bash-snippets
brew install cloc
brew install curl
brew install djvu2pdf
brew install dropbox-uploader
brew install ffmpeg
brew install fping
brew install fzf
brew install gistit
brew install gnupg
brew install graphviz
brew install homebrew/dupes/less
brew install htop
brew install httpie
brew install ical-buddy
brew install jq
brew install librsync
brew install lynx
brew install moreutils
brew install mosh
brew install nmap
brew install osquery
brew install pandoc
brew install pstree
brew install rename
brew install ripgrep
brew install rockymadden/rockymadden/github-crypt
brew install ssh-copy-id
brew install sshuttle
brew install telnet
brew install tig
brew install tmate # share terminal session
brew install tmux
brew install trash
brew install tree
brew install unp
brew install utf8proc
brew install wakeonlan
brew install watchman
brew install watson
brew install wget
brew install youtube-dl

# software development
brew install cmake
brew install cscope
brew install diff-so-fancy
brew install ghi
brew install git-cal
brew install git-extras
brew install git-recent
brew install github-release
brew install go
brew install hub
brew install icarus-verilog
brew install kubernetes-helm
brew install mitmproxy
brew install neovim/neovim/neovim
brew install pgcli
brew install rbenv
brew install s3cmd
brew install shellcheck
brew install uncrustify
brew install watchexec

# completions
brew install homebrew/versions/bash-completion2
brew tap homebrew/completions
brew install apm-bash-completion
brew install brew-cask-completion
brew install pip-completion

# fun
brew install asciiquarium
brew install cmatrix
brew install cowsay
brew install nyancat


# brew cask files
brew cask install 1password
brew cask install discord
brew cask install dropbox
brew cask install limechat
brew cask install microsoft-office
brew cask install mobile-mouse-server
brew cask install plex-media-server
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package quicklookase qlvideo
brew cask install sketchup
brew cask install skype
brew cask install slack
brew cask install soulseek
brew cask install steam
brew cask install texpad
brew cask install torbrowser
brew cask install transmission
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install vlc
brew cask install xbox360-controller-driver

# browsers
brew cask install firefox
brew cask install firefoxnightly
brew cask install google-chrome

# utilities
brew cask install bitbar
brew cask install calibre
brew cask install corelocationcli
brew cask install cyberduck
brew cask install disk-inventory-x
brew cask install exifrenamer
brew cask install flux
brew cask install gpg-suite
brew cask install grandperspective
brew cask install imageoptim
brew cask install keepingyouawake
brew cask install mediainfo
brew cask install ngrok
brew cask install softu2f
brew cask install spectacle
brew cask install the-unarchiver
brew cask install yo

brew tap chdsbd/homebrew-port-map
brew cask install port-map

# software development
brew cask install clion
brew cask install docker
brew cask install fsmonitor
brew cask install git-open
brew cask install gitup
brew cask install insomnia
brew cask install intellij-idea
brew cask install java
brew cask install minikube
brew cask install sourcetree
brew cask install sublime-text
brew cask install tableplus
brew cask install tower
brew cask install visual-studio-code
brew cask isntall wireshark

brew tap caskroom/versions
brew cask install iterm2-beta

# embedded development
brew cask install arduino
brew cask install coolterm
brew cask install crosspack-avr
brew cask install eagle
brew cask install etcher
brew cask install qtspim
brew cask install scansion
brew cask install sdformatter

## fun
brew cask install minecraft
brew cask install pocket-tanks
brew cask install tickeys

# fonts
brew tap caskroom/fonts
brew cask install font-fira-code
brew cask install font-latin-modern
brew cask install font-lato
brew cask install font-lobster
brew cask install font-merriweather
brew cask install font-monoid
brew cask install font-open-sans
brew cask install font-pacifico
brew cask install font-roboto
brew cask install font-source-code-pro

mas install 1017470484 # Next Meeting
mas install 1176895641 # Spark

# misc
bash iterm-install.sh
bash osx-defaults.sh

# http://clubmate.fi/upgrade-to-bash-4-in-mac-os-x/
# Add the new shell to the list of allowed shells
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell
chsh -s /usr/local/bin/bash

# Install rust
curl https://sh.rustup.rs -sSf | sh

# Cargo binaries
cargo install doug
cargo install imdb-rename

# Python tools
pip install awscli

# Ruby
gem install jekyll
gem install lolcat
gem install ruby-beautify
gem install github
gem install bundler
