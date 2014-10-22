# Cloned from http://github.com/ahmedelgabri/dotfiles/
# Homebrew taps
TAPS=(
    homebrew/dupes
    homebrew/versions
    caskroom/cask
    caskroom/fonts
    caskroom/homebrew-versions
)

# Homebrew Formulas
FORMULAS=(
    caskroom/cask/brew-cask
    gcc
    coreutils
    moreutils
    findutils
    gnu-sed --default-names
    bash
    bash-completion
    wget --with-iri
    vim --override-system-vi
    homebrew/dupes/grep
    homebrew/dupes/screen
    git
    node
    tree
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
    font-inconsolata
    font-lato
    font-source-code-pro
    font-source-sans-pro
    font-source-serif-pro
    google-chrome
    grandperspective
    imagealpha
    imageoptim
    integrity
    iterm2
    licecap
    mamp
    mp4tools
    onepassword
    rdio
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

echo "Put your license in 1Password, Alfred, Sublime, SuperDuper, Tower, Transmit"
echo "Install Reeder, Wunderlist, and Tweetbot"

brew cleanup

brew cask alfred link
