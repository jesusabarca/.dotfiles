# .dotfiles
#### Personal dotfiles for various apps

## How to setup a new OS X for dev

### Increase speed on keypress
```
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
```

### Install homebrew
`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

### Install iterm2
`brew cask install iterm2`

### Install Git
`brew install git`

### Install Thoughbot's RCM from https://github.com/thoughtbot/rcm
```
brew tap thoughtbot/formulae
brew install rcm
```

### Clone this repo and run Rcup to install these dotfiles
```
cd ~
git clone https://github.com/jesusabarca/.dotfiles.git
cd .dotfiles
rcup -v
```

### Update your name and email address on:
`gitconfig`

### Install NeoVim
`brew install neovim`

### Install rbenv and ruby-build
```
brew install rbenv
```

### Install a default ruby version and install `rubocop`
```
rbenv install 2.5.1
rbenv global 2.5.1
gem install rubocop
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

### Install vim-plug from https://github.com/junegunn/vim-plug and run inside nvim:
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
:PlugInstall
```

### Install the Meslo powerline fonts and select it in the iterm2 profile config
```
brew tap homebrew/cask-fonts
brew cask install font-meslo-for-powerline
```

### Install Virtualbox (needed for AO)
`brew cask install virtualbox`

### Install vagrant (needed for AO)
`brew cask install vagrant`
