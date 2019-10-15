# How to up a Ruby on Rails dev environment on NeoVim for macOS Catalina.

## Utilities

### Homebrew
#### Package manager for macOS https://brew.sh
```zsh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Git and other command line tools
#### Trying to execute `git` for the first time will trigger the install wizzard. This will install git and other command line tools necessary for compiling some gems.
```zsh
git
```

### Thoughbot's RCM
#### Helps with keeping configuration files in a single directory https://github.com/thoughtbot/rcm
```zsh
brew tap thoughtbot/formulae
brew install rcm
```

### GNU's coreutils
#### Various useful GNU utilities.
```zsh
brew install coreutils
```

### Silver Searcher
#### Grep on steroids
```zsh
brew install the_silver_searcher
```

### Tags
#### Global tags and Ctags
```zsh
brew install global
```

### diff-so-fancy
#### Nice looking `git diff` formater
```zsh
brew install diff-so-fancy
```

### Yarn
#### JS package manager. Also installs Node.js as a dependency.
```zsh
brew install yarn
```

### import-js
#### Random JS dependency for javascript development on SpaceVim
```zsh
npm install -g import-js
```

## Terminal setup

### Keypress responsiveness
#### Increase speed on keypress.
```zsh
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
```

### Iterm2
#### Awesome terminal emulator https://iterm2.com
```zsh
brew cask install iterm2
```

### Nord color scheme (optional).
#### Awesome color scheme. Follow instructions on https://github.com/arcticicestudio/nord-iterm2 to install Nord on iterm2.
#### Colors for directories and files in the terminal.
```zsh
curl -fLo ~/.dircolors https://raw.githubusercontent.com/arcticicestudio/nord-dircolors/develop/src/dir_colors
```

### Nerd hack font.
#### Patched version of the hack font https://www.nerdfonts.com with extra icons and glyphs.
```zsh
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font
```
#### Select hack as the default font on your iterm2 profile.

### Oh My Zsh
#### Fancy shell prompt and extra plugins for the Zsh shell.
```zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## Config files

### Dotfiles
#### Clone this repo and run Rcup to install these configuration files.
```zsh
cd ~
git clone https://github.com/jesusabarca/.dotfiles.git
cd .dotfiles
rcup -v
```
#### Update your name and email address on `~/.gitconfig`

## Ruby on Rails

### Rbenv with ruby-build
#### Ruby version manager.
```zsh
brew install rbenv
```

### Ruby
#### Exit terminal and open again to initialize Rbenv properly
#### Check the latest available versions of Ruby
```zsh
rbenv install --list | egrep "[^-.]2\.\d{1,2}\.\d{1,2}$" | tail
```
#### Install the latest Ruby version (ie 2.6.5), set it up as the default versionand install `rubocop`
```zsh
rbenv install 2.6.5
rbenv global 2.6.5
gem install rubocop
```
#### Verify Rbenv works properly
```zsh
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
```

### PostgreSQL
#### SQL database system
```zsh
brew install postgresql
brew services start postgresql
```

### Redis
#### In-memory DB. Necessary for using Sidekiq and other cool gems.
```zsh
brew install redis
brew services start redis
```

### Rails
#### MVC awesomeness
```zsh
gem install rails
```

## NeoVim + SpaceVim

### NeoVim
#### Awesome Vim fork
```zsh
brew install neovim
````

### Spacevim
#### Vim distribution with feature layers https://spacevim.org
```zsh
curl -sLf https://spacevim.org/install.sh | bash
```
#### Run NeoVim after installing SpaceVim.
#### If asked, use "j" and "k" keys to select "Dark power mode" and press enter.
```zsh
nvim
```
#### Close with ":qa" and run NeoVim again a couple of times to allow all the plugins to install.
