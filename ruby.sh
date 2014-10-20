# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

# Install rvm
curl -L https://get.rvm.io | bash -s stable --autolibs=enable

# Check gems are up to date without installing documentation
sudo gem update --system --no-document

# Install gems
sudo gem install jekyll
sudo gem install github-pages
sudo gem install sass

# Set symlink for Sublime Text 2
ln -s "/Applications/Sublime Text 3.app/Contents/SharedSupport/bin/subl" ~/bin/subl
