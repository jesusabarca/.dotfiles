# .dotfiles
#### Personal dotfiles for various apps

To use this dotfiles, please install Thoughbot's RCM from https://github.com/thoughtbot/rcm

## How to setup a new OS X for dev
### Update your name and email address on `gitconfig`

### Increase speed on keypress
```
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
```

### Install homebrew
`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

### Install Coreutils
`brew install coreutils`

### Install NeoVim
`brew install neovim`

### Install rbenv and ruby-build
```
brew install rbenv
```

### Install a default ruby version and install `rubocop`
```
rbenv install 2.4.1
rbenv global 2.4.1
gem install rubocop
```

### Install dotfiles.
```
cd ~
git clone https://github.com/jesusabarca/.dotfiles.git
cd .dotfiles
rcup -v
```

### To import config, create a `~/.config/nvim/init.vim` file with:
```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
```

### Install the incredibly fast Silver Searcher
`brew install the_silver_searcher`

### Install diff-so-fancy
`brew install diff-so-fancy`

### Install bash-git-prompt
`brew install bash-git-prompt`

### Install ack
`brew install ack`

### Install vim-plug from https://github.com/junegunn/vim-plug and run inside nvim:
`:PlugInstall`


### Install powerline fonts and select one in the bash profile config
https://github.com/powerline/fonts
