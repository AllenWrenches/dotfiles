# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

# Install rvm
curl -L https://get.rvm.io | bash -s stable --ruby --autolibs=enable --auto-dotfiles

source $HOME/.rvm/scripts/rvm

# Check gems are up to date without installing documentation
sudo gem update --system --no-document

# Install gems
sudo gem install bundle
sudo gem install jekyll
sudo gem install github-pages
sudo gem install sass
sudo gem install foundation
sudo gem install compass
sudo gem install scss-lint
