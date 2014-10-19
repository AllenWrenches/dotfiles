# https://rvm.io
# rvm for the rubiess
curl -L https://get.rvm.io | bash -s stable --autolibs=enable

# Check gems are up to date without installing documentation
sudo gem update --system --no-document
# Install jekyll
sudo gem install jekyll

# Set symlink for Sublime Text 2
ln -s "/Applications/Sublime Text 3.app/Contents/SharedSupport/bin/subl" ~/bin/subl

# Run Brewfile
brew tap homebrew/boneyard
brew bundle Brewfile
