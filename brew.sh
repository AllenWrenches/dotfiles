#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install more recent versions of some macOS tools.
brew install homebrew/dupes/openssh

# Install other useful binaries.
brew install git
brew install imagemagick --with-webp
brew install node
brew install pandoc
brew install phantomjs
brew install speedtest_cli
brew install ssh-copy-id

# Install applications with Cask
brew cask install --appdir="/Applications" 1password
brew cask install --appdir="/Applications" adobe-creative-cloud
brew cask install --appdir="/Applications" acquia-dev-desktop
brew cask install --appdir="/Applications" alfred
brew cask install --appdir="/Applications" appcleaner
brew cask install --appdir="/Applications" atom
brew cask install --appdir="/Applications" bartender
brew cask install --appdir="/Applications" caffeine
brew cask install --appdir="/Applications" couleurs
brew cask install --appdir="/Applications" colour-contrast-analyser
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" exifrenamer
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" flux
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" grandperspective
brew cask install --appdir="/Applications" handbrake
brew cask install --appdir="/Applications" handbrakecli
brew cask install --appdir="/Applications" hazel
brew cask install --appdir="/Applications" hipchat
brew cask install --appdir="/Applications" imageoptim
brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="/Applications" java
brew cask install --appdir="/Applications" kaleidoscope
brew cask install --appdir="/Applications" licecap
brew cask install --appdir="/Applications" little-snitch
brew cask install --appdir="/Applications" macdown
brew cask install --appdir="/Applications" malwarebytes-anti-malware
brew cask install --appdir="/Applications" microsoft-office
brew cask install --appdir="/Applications" musicbrainz-picard
brew cask install --appdir="/Applications" namechanger
brew cask install --appdir="/Applications" nvalt
brew cask install --appdir="/Applications" qbserve
brew cask install --appdir="/Applications" ripit
brew cask install --appdir="/Applications" sequel-pro
brew cask install --appdir="/Applications" sitesucker
brew cask install --appdir="/Applications" sketchup
brew cask install --appdir="/Applications" skype
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" slic3r
brew cask install --appdir="/Applications" spotify
brew cask install --appdir="/Applications" sublime-text
brew cask install --appdir="/Applications" superduper
brew cask install --appdir="/Applications" taskpaper
brew cask install --appdir="/Applications" the-unarchiver
brew cask install --appdir="/Applications" tower
brew cask install --appdir="/Applications" transmission
brew cask install --appdir="/Applications" transmit
brew cask install --appdir="/Applications" tunnelbear
brew cask install --appdir="/Applications" vagrant
brew cask install --appdir="/Applications" veracrypt
brew cask install --appdir="/Applications" virtualbox
brew cask install --appdir="/Applications" zoomus

# Install fonts with Cask
brew tap caskroom/fonts
brew cask install font-inconsolata
brew cask install font-source-code-pro
brew cask install font-source-sans-pro
brew cask install font-source-serif-pro

# Install useful QuickLook plugins with Cask
brew cask install qlmarkdown quicklook-json qlimagesize

# Remove outdated versions from the cellar.
brew cleanup
brew cask cleanup
