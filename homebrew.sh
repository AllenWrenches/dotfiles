# Cloned from http://github.com/ahmedelgabri/dotfiles/
# Homebrew taps
TAPS=(
    homebrew/dupes
    homebrew/versions
    caskroom/cask
    caskroom/fonts
    caskroom/versions
)

# Homebrew Formulas
FORMULAS=(
    coreutils
    moreutils
    findutils
    gnu-sed --default-names
    bash
    bash-completion
    wget --enable-iri
    install vim --override-system-vi
    homebrew/dupes/grep
    homebrew/dupes/screen
    install git
    install node
    install tree
    caskroom/cask/brew-cask
)

# Homebrew casks
CASKS=(
    alfred
    appcleaner
    caffeine
    diffmerge
    dropbox
    filezilla
    firefox
    flux
    google-chrome
    google-chrome-canary
    grandperspective
    handbrake
    imagealpha
    imageoptim
    integrity
    iterm2
    licecap
    mamp
    mp4tools
    onepassword
    rdio
    scansnap-manager
    sequel-pro
    sketchup
    skype
    spectacle
    sublime-text3
    superduper
    the-unarchiver
    tower
    transmit
    tunnelbear
    utorrent
    virtualbox
    vlc
)

#================================================================================

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

brew tap ${TAPS[@]} && brew install ${FORMULAS[@]}

echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."

brew cask install --appdir="/Applications" ${CASKS[@]}

echo "Put your license in Alfred, Sublime, SuperDuper, Tower, Transmit"
echo "Install 1Password, Reeder, Wunderlist, and Tweetbot"

brew cleanup
