# .dotfiles
#### Personal dotfiles for various apps

To use this dotfiles, please install Thoughbot's RCM from https://github.com/thoughtbot/rcm

## How to setup a new OS X for dev
### Install homebrew
`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

### Install NeoVim
`brew install neovim/neovim/neovim`

### Install Janus
`curl -L https://bit.ly/janus-bootstrap | bash`

### Install rbenv
```
brew update
brew install rbenv
```
### Install dotfiles. Clone this repo and run:
`rcup -v`

### Install reattach-to-user-namespace for integration the system's clipboard to tmux and vim
`brew install reattach-to-user-namespace`

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
- https://github.com/slashmili/alchemist.vim (maybe?)
- https://github.com/troydm/zoomwintab.vim

### Fix vim-tmux-navigator for NeoVIM
```
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
tic $TERM.ti
```

### Install the incredibly fast Silver Searcher
`brew install the_silver_searcher`
