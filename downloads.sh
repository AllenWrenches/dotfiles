#!/usr/bin/env bash

# Clean up sqlite db containing list of all downloads
# http://lifehacker.com/5976042/display-your-entire-download-history-on-a-mac-with-a-terminal-command

sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'select LSQuarantineDataURLString from LSQuarantineEvent'

read -p "Delete download history? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'
    echo "Download history deleted."
  fi;

  unset doIt;
