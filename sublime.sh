# Setup for Sublime Text 3

# Set symlink for Sublime Text 3
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl

# Remove Sublime Text user folder and symlink to Dropbox version
cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
rm -r User
ln -s ~/Dropbox/Apps/SublimeText/User

echo " "
echo "Now open Sublime Text and install Package Control using the code from:"
echo "https://sublime.wbond.net/installation"
