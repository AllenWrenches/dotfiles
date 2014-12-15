# Homebrew

# Make sure we’re using the latest Homebrew
brew update

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
brew install homebrew/dupes/screen
brew install git
brew install node
brew install tree

brew cask install --appdir="/Applications" alfred
brew cask install --appdir="/Applications" appcleaner
brew cask install --appdir="/Applications" caffeine
brew cask install --appdir="/Applications" calibre
brew cask install --appdir="/Applications" diffmerge
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" filezilla
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" flux
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" grandperspective
brew cask install --appdir="/Applications" handbrake
brew cask install --appdir="/Applications" imagealpha
brew cask install --appdir="/Applications" imageoptim
brew cask install --appdir="/Applications" integrity
brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="/Applications" licecap
brew cask install --appdir="/Applications" little-snitch
brew cask install --appdir="/Applications" mapbox-studio
brew cask install --appdir="/Applications" mp4tools
brew cask install --appdir="/Applications" onepassword
brew cask install --appdir="/Applications" rdio
brew cask install --appdir="/Applications" repetier-host
brew cask install --appdir="/Applications" ripit
brew cask install --appdir="/Applications" sequel-pro
brew cask install --appdir="/Applications" sketchup
brew cask install --appdir="/Applications" skype
brew cask install --appdir="/Applications" slic3r
brew cask install --appdir="/Applications" spectacle
brew cask install --appdir="/Applications" sublime-text3
brew cask install --appdir="/Applications" superduper
brew cask install --appdir="/Applications" the-unarchiver
brew cask install --appdir="/Applications" things
brew cask install --appdir="/Applications" torbrowser
brew cask install --appdir="/Applications" tower
brew cask install --appdir="/Applications" transmission
brew cask install --appdir="/Applications" transmit
brew cask install --appdir="/Applications" tunnelbear
brew cask install --appdir="/Applications" vagrant
brew cask install --appdir="/Applications" vagrant-manager
brew cask install --appdir="/Applications" virtualbox
brew cask install --appdir="/Applications" vlc

brew cask install font-inconsolata
brew cask install font-source-code-pro
brew cask install font-source-sans-pro
brew cask install font-source-serif-pro

brew cleanup

brew cask alfred link
