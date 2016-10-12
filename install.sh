#!/usr/bin/env bash

# Inspired by:
# https://mths.be/macos
# https://github.com/kdeldycke/dotfiles/blob/master/scripts/osx-install.sh

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Update all OSX packages
sudo softwareupdate -i -a

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

# Install Homebrew if not found
brew --version 2>&1 >/dev/null
if [[ $? -ne 0 ]]; then
    # Clean-up failed Homebrew install
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew update
brew upgrade

# Include duplicates packages
brew tap homebrew/dupes

# Install or upgrade Cask
brew tap caskroom/cask

# Include Cask fonts
brew tap caskroom/fonts

# Install Mac App Store CLI and upgrade all apps.
brew install mas
mas upgrade

# Install binary apps from the Mac App Store.
mas install 715768417 # Microsoft Remote Desktop
mas install 494803304 # WiFi Explorer
mas install 867299399 # OmniFocus
mas install 880001334 # Reeder
mas install 439697913 # Icon Slate
mas install 410628904 # Wunderlist
mas install 463362050 # PhotoSweeper
mas install 557168941 # Tweetbot
mas install 413857545 # Divvy
mas install 407963104 # Pixelmator
mas install 408981434 # iMovie

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

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
brew cask install --appdir="/Applications" acquia-dev-desktop
brew cask install --appdir="/Applications" adobe-creative-cloud
brew cask install --appdir="/Applications" alfred
brew cask install --appdir="/Applications" appcleaner
brew cask install --appdir="/Applications" applepi-baker
brew cask install --appdir="/Applications" atom
brew cask install --appdir="/Applications" bartender
brew cask install --appdir="/Applications" caffeine
brew cask install --appdir="/Applications" calibre
brew cask install --appdir="/Applications" colour-contrast-analyser
brew cask install --appdir="/Applications" couleurs
brew cask install --appdir="/Applications" cura
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
brew cask install --appdir="/Applications" kindle
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
brew cask install --appdir="/Applications" virtualbox
brew cask install --appdir="/Applications" zoomus

# Install fonts with Cask
brew cask install font-inconsolata
brew cask install font-source-code-pro
brew cask install font-source-sans-pro
brew cask install font-source-serif-pro

# Install useful QuickLook plugins with Cask
brew cask install qlmarkdown quicklook-json qlimagesize

# Open apps so I'll not forget to login
open -a Dropbox
open -a Slack
open -a Divvy
open -a "1Password 6"

# Install Divvy shortcuts
open -a Safari divvy://import/YnBsaXN0MDDUAQIDBAUIfn9UJHRvcFgkb2JqZWN0c1gkdmVyc2lvblkkYXJjaGl2ZXLRBgdUcm9vdIABrxAUCQoXLzA3QUJLTFVWXl9naHBxeXpVJG51bGzSCwwNDlYkY2xhc3NaTlMub2JqZWN0c4ATqA8QERITFBUWgAKABYAHgAmAC4ANgA+AEd0YGRobHB0eHyAhIiMLJCUmJygpKissJyQqLl8QEnNlbGVjdGlvbkVuZENvbHVtbl8QEXNlbGVjdGlvblN0YXJ0Um93XGtleUNvbWJvQ29kZVdlbmFibGVkXWtleUNvbWJvRmxhZ3NfEBRzZWxlY3Rpb25TdGFydENvbHVtbltzaXplQ29sdW1uc1pzdWJkaXZpZGVkV25hbWVLZXlWZ2xvYmFsXxAPc2VsZWN0aW9uRW5kUm93WHNpemVSb3dzEAcQARB9CRIAlAAAEAIQCgiAAwmABFZDZW50ZXLSMTIzNlgkY2xhc3Nlc1okY2xhc3NuYW1lojQ1WFNob3J0Y3V0WE5TT2JqZWN0WFNob3J0Y3V03RgZGhscHR4fICEiIws4OTonPDkqKz4nOCouEAkQABB+CRIAlAAACIAGCYAEVEZ1bGzdGBkaGxwdHh8gISIjC0M5RCdGOSorSCc4Ki4QBBB7CRIAlAAACIAICYAEVExlZnTdGBkaGxwdHh8gISIjCzg5TSdPUCorUic4Ki4QfAkSAJQAABAFCIAKCYAEVVJpZ2h03RgZGhscHR4fICEiIwtDOVcnWTkqK1snQyouEBIJEgAUAAAIgAwJgARYVG9wIExlZnTdGBkaGxwdHh8gISIjCzg5YCdiUCorZCdDKi4QEwkSABQAAAiADgmABFlUb3AgUmlnaHTdGBkaGxwdHh8gISIjC0NQaSdrOSorbSc4Ki4QFAkSABQAAAiAEAmABFtCb3R0b20gTGVmdN0YGRobHB0eHyAhIiMLOFByJ3RQKit2JzgqLhAVCRIAFAAACIASCYAEXEJvdHRvbSBSaWdodNIxMnt8o3x9NV5OU011dGFibGVBcnJheVdOU0FycmF5EgABhqBfEA9OU0tleWVkQXJjaGl2ZXIACAARABYAHwAoADIANQA6ADwAUwBZAF4AZQBwAHIAewB9AH8AgQCDAIUAhwCJAIsApgC7AM8A3ADkAPIBCQEVASABKAEvAUEBSgFMAU4BUAFRAVYBWAFaAVsBXQFeAWABZwFsAXUBgAGDAYwBlQGeAbkBuwG9Ab8BwAHFAcYByAHJAcsB0AHrAe0B7wHwAfUB9gH4AfkB+wIAAhsCHQIeAiMCJQImAigCKQIrAjECTAJOAk8CVAJVAlcCWAJaAmMCfgKAAoEChgKHAokCigKMApYCsQKzArQCuQK6ArwCvQK/AssC5gLoAukC7gLvAvEC8gL0AwEDBgMKAxkDIQMmAAAAAAAAAgEAAAAAAAAAgAAAAAAAAAAAAAAAAAAAAzg=

# Clean things up.
brew linkapps
brew cleanup
brew prune
brew cask cleanup

# Install rvm
curl -L https://get.rvm.io | bash -s stable --ruby --autolibs=enable --auto-dotfiles

source $HOME/.rvm/scripts/rvm

# Install gems
sudo gem install bundler
sudo gem install jekyll
sudo gem install github-pages
sudo gem install sass
sudo gem install compass
sudo gem install scss_lint
sudo gem install html-proofer

# Check gems are up to date without installing documentation
sudo gem update --system --no-document

# Install Node libraries globally
npm install -g a11y
npm install -g bower
npm install -g caniuse-cmd
npm install -g git-recent
npm install -g grunt-cli
npm install -g jshint
npm install -g pa11y
npm install -g parker
npm install -g sass-lint

# Kill affected applications
for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
  "Dock" "Finder" "Google Chrome" "Google Chrome Canary" "Mail" "Messages" \
  "Opera" "Photos" "Safari" "SizeUp" "Spectacle" "SystemUIServer" "Terminal" \
  "Transmission" "Tweetbot" "Twitter" "iCal"; do
  killall "${app}" &> /dev/null
done

