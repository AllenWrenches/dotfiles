# Dotfiles

A fork of [Mathias Bynens' dotfiles](https://mths.be/dotfiles).

This setup is fairly personalized and my first swing at using replicable dotfiles. You'll definitely want to review what will be installed before actually running the scripts.

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
4. Open 1Password, install license, configure vaults
5. System Preferences > Spotlight > Keyboard Shortcuts... > Uncheck Show Spotlight Search (⌘Space)
6. Open Alfred, install license, sync settings, set ⌘ + Space as hotkey
7. Open and close Sublime Text
8. Run ```source sublime.sh``` to point the user profile to Dropbox
9. Re-open Sublime Text to allow Package Control to install all packages, enter license
10. Open Tower, configure accounts, add license
11. Run Little Snitch installer ```/usr/local/Caskroom/little-snitch/```, add license, import rules
12. Run Creative Cloud installer ```/usr/local/Caskroom/adobe-creative-cloud/```, install Photoshop, Illustrator, Acrobat

## Thanks to...

- [Mathias Bynens](https://mathiasbynens.be/) for maintaining an understandable and powerful [collection of dotfiles](https://mths.be/dotfiles) that serves as the basis for this repo.
- [Kevin Deldycke](https://github.com/kdeldycke) for his [macOS install script]((https://github.com/kdeldycke/dotfiles/blob/master/scripts/osx-install.sh)).
