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

### Install the following vim plugins in `~/.janus`:
- https://github.com/jiangmiao/auto-pairs
- https://github.com/othree/html5.vim
- https://github.com/vim-airline/vim-airline
- https://github.com/vim-airline/vim-airline-themes
- https://github.com/nathanaelkane/vim-indent-guides
- https://github.com/diepm/vim-rest-console
- https://github.com/ngmy/vim-rubocop
- https://github.com/christoomey/vim-tmux-navigator
- https://github.com/janko-m/vim-test
- https://github.com/troydm/zoomwintab.vim
- https://github.com/kshenoy/vim-signature
- https://github.com/AndrewRadev/switch.vim
- https://github.com/AndrewRadev/sideways.vim

### Install the incredibly fast Silver Searcher
`brew install the_silver_searcher`

### Install diff-so-fancy
`brew install diff-so-fancy`

### Install bash-git-prompt
`brew install bash-git-prompt`

### Install ack
`brew install ack`
