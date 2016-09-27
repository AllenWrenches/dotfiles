#!/usr/bin/env bash

# Inspired by:
# https://mths.be/macos
# https://github.com/kdeldycke/dotfiles/blob/master/scripts/osx-install.sh

# Install command line tools.
xcode-select --install

# A full installation of Xcode.app is required to compile some formulas like
# macvim. Installing the Command Line Tools only is not enough.
# Also, if Xcode is installed but the license is not accepted then brew will
# fail.
xcodebuild -version
# Accept Xcode license
if [[ $? -ne 0 ]]; then
    sudo xcodebuild -license
fi

# Update all OSX packages
sudo softwareupdate -i -a

# Install Homebrew if not found
brew --version 2>&1 >/dev/null
if [[ $? -ne 0 ]]; then
    # Clean-up failed Homebrew install
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew update
brew upgrade --all

# Include duplicates packages
brew tap homebrew/dupes

# Install or upgrade Cask
brew tap caskroom/cask

# Install Mac App Store CLI and upgrade all apps.
brew install mas
mas upgrade

# Install binary apps from the Mac App Store.
mas install 715768417  # Microsoft Remote Desktop
mas install 494803304 # WiFi Explorer
mas install 867299399 # OmniFocus
mas install 880001334 # Reeder
mas install 690375005 # Unbound
mas install 439697913 # Icon Slate
mas install 410628904 # Wunderlist
mas install 463362050 # PhotoSweeper
mas install 557168941 # Tweetbot
mas install 413857545 # Divvy
mas install 407963104 # Pixelmator

# Open apps so I'll not forget to login
open -a Dropbox

# Set computer name (with prompt) (as done via System Preferences → Sharing)
read -p "Computer name? " CompName
if [ "$CompName" == "" ]
  then
    CompName=MacbookPro
fi
sudo scutil --set ComputerName "$CompName"
sudo scutil --set HostName "$CompName"
sudo scutil --set LocalHostName "$CompName"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$CompName"

# Clear out dock (with prompt)
read -p "Clear dock? " DockClear
if [ "$DockClear" == "y" ]
  then
    # Wipe all (default) app icons from the Dock
    # This is only really useful when setting up a new Mac, or if you don’t use
    # the Dock to launch apps.
    defaults write com.apple.dock persistent-apps -array
fi

# Kill affected applications
for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
  "Dock" "Finder" "Google Chrome" "Google Chrome Canary" "Mail" "Messages" \
  "Opera" "Photos" "Safari" "SizeUp" "Spectacle" "SystemUIServer" "Terminal" \
  "Transmission" "Tweetbot" "Twitter" "iCal"; do
  killall "${app}" &> /dev/null
done

# Clean things up.
brew linkapps
brew cleanup
brew prune
brew cask cleanup
