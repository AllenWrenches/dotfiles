#!/usr/bin/env bash

if test ! "$(brew --version)"
  then
  echo -e "\\n⬇️  Installing Homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo -e "\\n🔁 Updating installed Homebrew"
  brew update
  brew upgrade
fi

echo -e "\\n⬇️  Installing Homebrew formulae"

brew install ack --HEAD
brew install cmake
brew install composer
brew install coreutils
brew install git
brew install git-lfs
brew install libyaml
brew install mas
brew install mysql
brew install openssh
brew install openssl@1.1
brew install shellcheck
brew install trash
brew install tree

echo -e "\\n⬇️  Installing fonts via Homebrew Cask"

brew cask install font-inconsolata
brew cask install font-lato
brew cask install font-open-sans
brew cask install font-source-code-pro
brew cask install font-source-sans-pro
brew cask install font-source-serif-pro

echo -e "\\n⬇️  Installing Mac App Store applications via MAS"

mas install 937984704 # Amphetamine
mas install 408981434 # iMovie
mas install 926036361 # Lastpass
mas install 1091189122 # Bear notes
mas install 1295203466 # Microsoft Remote Desktop 10
mas install 497799835 # Xcode

https://apps.apple.com/us/app/xcode/id497799835?mt=12

echo -e "\\n⬇️  Installing applications via Homebrew Cask"

brew tap homebrew/cask-versions

brew cask install --appdir="/Applications" adobe-creative-cloud
brew cask install --appdir="/Applications" aerial
brew cask install --appdir="/Applications" android-studio
brew cask install --appdir="/Applications" atom
brew cask install --appdir="/Applications" bartender
brew cask install --appdir="/Applications" brave-browser
brew cask install --appdir="/Applications" calibre
brew cask install --appdir="/Applications" colour-contrast-analyser
brew cask install --appdir="/Applications" couleurs
brew cask install --appdir="/Applications" dash
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" firefox-developer-edition # homebrew/cask-versions
brew cask install --appdir="/Applications" gitkraken
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" handbrake
brew cask install --appdir="/Applications" imageoptim
brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="/Applications" kaleidoscope
brew cask install --appdir="/Applications" kap
brew cask install --appdir="/Applications" knockknock
brew cask install --appdir="/Applications" licecap
brew cask install --appdir="/Applications" microsoft-office
brew cask install --appdir="/Applications" moom
brew cask install --appdir="/Applications" namechanger
brew cask install --appdir="/Applications" omnidisksweeper
brew cask install --appdir="/Applications" sequel-pro
brew cask install --appdir="/Applications" sketch
brew cask install --appdir="/Applications" sketchup
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" spotify
brew cask install --appdir="/Applications" sublime-text
brew cask install --appdir="/Applications" superduper
brew cask install --appdir="/Applications" taskpaper
brew cask install --appdir="/Applications" the-unarchiver
brew cask install --appdir="/Applications" ticktick
brew cask install --appdir="/Applications" toggl
brew cask install --appdir="/Applications" tower
brew cask install --appdir="/Applications" transmission
brew cask install --appdir="/Applications" transmit4 # homebrew/cask-versions
brew cask install --appdir="/Applications" virtualbox
brew cask install --appdir="/Applications" virtualbox-extension-pack
brew cask install --appdir="/Applications" visual-studio-code
brew cask install --appdir="/Applications" zoomus
