# Jason's dotfiles

A fork of Mathias’s amazing dotfiles: https://mths.be/dotfiles

This setup is fairly personalized and my first swing at using replicable dotfiles. You'll definitely want to review what will be installed before actually running the scripts.

## Installation

You can clone the repository wherever you want (I keep it in `~/Projects/dotfiles`). The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/jsnmrs/dotfiles.git
```

On a fresh OSX install, running git will prompt to download and install XCode Command Line Tools.

After XCode Command Line Tools are installed, re-run the git clone command.

To copy the dotfiles to your home directory, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

To complete the installation of all applications, dependencies, etc run the follow commands from the `dotfiles` directory: 

```bash
source ruby.sh
```

```bash
source brew.sh
```

```bash
source node.sh
```

```bash
source .macos
```

```bash
source sublime.sh
```

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing takes place.

Here’s an example `~/.path` file that adds `~/utils` to the `$PATH`:

```bash
export PATH="$HOME/utils:$PATH"
```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

```bash
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="My Name"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="myemail@example.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

## Thanks to...

[Mathias Bynens](https://mathiasbynens.be/) for maintaining an understandable and powerful [collection of dotfiles](https://mths.be/dotfiles) that serves as the basis for this repo.
