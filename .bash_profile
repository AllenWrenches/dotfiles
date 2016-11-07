# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

export PATH="/usr/local/sbin:$PATH";

# Set up RVM
source $HOME/.rvm/scripts/rvm;

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Shortcuts
alias home="cd ~/"
alias desktop="cd ~/Desktop"
alias dropbox="cd ~/Dropbox"
alias box-sync="cd ~/Box\ Sync"
alias projects='cd ~/projects'
alias themes='cd sites/all/themes/'
alias dotfiles="cd ~/Projects/dotfiles"
alias jksrv="bundle exec jekyll serve --watch"
alias phpsrv="php -S localhost:8000"
alias emoji="open http://www.emoji-cheat-sheet.com/"
alias myip='curl ipecho.net/plain ; echo'
alias myip-from-jason='curl ip.appspot.com'

# Show/Hide hidden files
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Git diff from HEAD to commit hash,
# send to file on desktop, open in sublime text
function gitdiff() {
  local timestamp=$(date +%Y%m%d%H%M%S);
  git diff --name-status HEAD $1 > ~/Desktop/diff$timestamp.txt && subl ~/Desktop/diff$timestamp.txt;
}

# Launch Zoom meeting (defaults to personal meeting ID unless new meeting ID is provided)
function zoom() {
  if [ $# -eq 0 ]; then
    open https://zoom.us/j/2124442079;
  else
    open https://zoom.us/j/"$@";
  fi;
}

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; mas upgrade; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update'

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;
