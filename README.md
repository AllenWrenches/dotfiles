# Dotfiles

A fork of [Jason Morris' dotfiles](https://github.com/jsnmrs/dotfiles).

This setup is fairly personalized and my first swing at using replicable dotfiles. You'll definitely want to review what will be installed before actually running the scripts.

## Pre-install

1. Export SSH Keys
2. Make sure passwords for FTP/RDP are up to date in Evernote

## Clean install of macOS 10.12

My steps for a clean macOS install, using these dotfiles.

### Post-install

1. Sign in with AppleID
2. Configure iCloud, etc
3. Record FileVault Recovery Key in a safe location

### Xcode Command Line Tools

Before you can do much on the command line (like using Git), Xcode Command Line Tools need to be installed and the license agreed to.

1. Open Applications > Utilites > Terminal
2. Install Xcode Command Line Tools ```xcode-select --install```
3. Click install, agree to license

### Dotfiles

Clone dotfiles repo into ```~/Projects/dotfiles``` and copy configuration into user's home directory:

1. ```mkdir ~/Projects && cd Projects```
2. ```git clone https://github.com/jsnmrs/dotfiles.git && cd dotfiles```
3. ```source bootstrap.sh```

### Installing Applications

The [install.sh script](https://github.com/jsnmrs/dotfiles/blob/master/install.sh) takes care of the majority of installations. This script will:

- Check for App Store Updates
- Ask for computer name
- Offer to delete default dock icons
- Install Homebrew, download taps, update/upgrade Homebrew
- Install specific Mac App Store apps (will prompt for AppleID)
- Install utilites, fonts, quick look plugins, and applications via Cask
- Open applications that need to be logged into (Dropbox, Slack)
- Run brew clean up tasks
- Install RVM, specific Ruby gems globally
- Install specific Node libraries globally
- Kill/reload Dock, Finder, etc

Run with ```source install.sh```

### macOS Configuration

The [.macos script](https://github.com/jsnmrs/dotfiles/blob/master/.macos) (a modified version of [Mathias Bynens' .macos script](https://mths.be/macos)) sets some sensible macOS defaults.

Run with ```source .macos```

### More Setup

1. Sign into Dropbox, begin sync
2. Open Caffeine, turn on
3. Copy .extra file into dotfiles directory, run ```source bootstrap.sh```
4. Open and close Sublime Text
5. Run ```source sublime.sh``` to point the user profile to Dropbox
6. Re-open Sublime Text to allow Package Control to install all packages, enter license
7. Open Tower, configure accounts, add license
8. Open Kaleidescope, add license
9. Run Creative Cloud installer ```/usr/local/Caskroom/adobe-creative-cloud/```, install Photoshop, Illustrator, Acrobat
10. Open RDP, import RDP list from Dropbox
11. Install [MDB Access DB Viewer](http://eggerapps.at/mdbviewer/download/) and add license from Dropbox
12. Install [CH VPN](https://communicatehealth.box.com/v/vpn-setup)

## Thanks to...

- [Jason Morris](http://jasonmorris.com) for creating an amazing set of [dotfiles](https://github.com/jsnmrs/dotfiles) that served as my starting point and for always recommending awesome tools for automation and new tech.
- [Mathias Bynens](https://mathiasbynens.be/) for maintaining an understandable and powerful [collection of dotfiles](https://mths.be/dotfiles) that serves as the basis for this repo.
- [Kevin Deldycke](https://github.com/kdeldycke) for his [macOS install script]((https://github.com/kdeldycke/dotfiles/blob/master/scripts/osx-install.sh)).
