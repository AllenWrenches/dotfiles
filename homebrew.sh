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
    sublime-text
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

# Set symlink for Sublime Text 3
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl
