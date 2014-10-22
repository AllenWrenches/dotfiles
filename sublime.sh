# Setup for Sublime Text 3

# Set symlink for Sublime Text 3
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl

# Remove Sublime Text user folder and symlink to Dropbox version
cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
rm -r User
ln -s ~/Dropbox/Apps/SublimeText/User

# Download and install Package Control
curl http://sublime.wbond.net/Package%20Control.sublime-package \
  > ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Package\ Control.sublime-package

echo " "
echo "Now open Sublime Text to allow Package Control"
echo "to install packages specified in Dropbox."
echo " "
