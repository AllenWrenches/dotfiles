#!/usr/bin/env bash
set -x

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

# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName "kitt"
sudo scutil --set HostName "kitt"
sudo scutil --set LocalHostName "kitt"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "kitt"
