# Homebrew

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew
brew update --all

# Upgrade any already-installed formulae
brew upgrade

brew tap homebrew/dupes
brew tap homebrew/versions
brew tap caskroom/cask
brew tap caskroom/fonts
brew tap caskroom/homebrew-versions

brew install caskroom/cask/brew-cask
brew install gcc
brew install coreutils
brew install moreutils
brew install findutils
brew install libidn
brew install gnu-sed --with-default-names
brew install bash
brew install bash-completion
brew install wget --with-iri
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install git
brew install git-lfs
brew install node
brew install tree
brew install ssh-copy-id
brew install speedtest_cli
brew install dark-mode

brew cask install --appdir="/Applications" 1password
brew cask install --appdir="/Applications" 4k-video-downloader
brew cask install --appdir="/Applications" adobe-creative-cloud
brew cask install --appdir="/Applications" alfred
brew cask install --appdir="/Applications" appcleaner
brew cask install --appdir="/Applications" bartender
brew cask install --appdir="/Applications" caffeine
brew cask install --appdir="/Applications" calibre
brew cask install --appdir="/Applications" cura
brew cask install --appdir="/Applications" diffmerge
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" filezilla
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" flux
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" grandperspective
brew cask install --appdir="/Applications" handbrake
brew cask install --appdir="/Applications" hipchat
brew cask install --appdir="/Applications" imagealpha
brew cask install --appdir="/Applications" imageoptim
brew cask install --appdir="/Applications" integrity
brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="/Applications" java
brew cask install --appdir="/Applications" kaleidoscope
brew cask install --appdir="/Applications" libreoffice
brew cask install --appdir="/Applications" licecap
brew cask install --appdir="/Applications" little-snitch
brew cask install --appdir="/Applications" mapbox-studio
brew cask install --appdir="/Applications" mp4tools
brew cask install --appdir="/Applications" openscad
brew cask install --appdir="/Applications" opera
brew cask install --appdir="/Applications" rdio
brew cask install --appdir="/Applications" ripit
brew cask install --appdir="/Applications" sequel-pro
brew cask install --appdir="/Applications" sitesucker
brew cask install --appdir="/Applications" sketchup
brew cask install --appdir="/Applications" skype
brew cask install --appdir="/Applications" slic3r
brew cask install --appdir="/Applications" sublime-text3
brew cask install --appdir="/Applications" superduper
brew cask install --appdir="/Applications" the-unarchiver
brew cask install --appdir="/Applications" tomahawk
brew cask install --appdir="/Applications" tower
brew cask install --appdir="/Applications" transmission
brew cask install --appdir="/Applications" transmit
brew cask install --appdir="/Applications" tunnelbear
brew cask install --appdir="/Applications" vagrant
brew cask install --appdir="/Applications" virtualbox
brew cask install --appdir="/Applications" vlc
brew cask install --appdir="/Applications" zoomus

brew cask install font-inconsolata
brew cask install font-source-code-pro
brew cask install font-source-sans-pro
brew cask install font-source-serif-pro

# Some useful QuickLook plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package

brew cleanup

brew cask cleanup
