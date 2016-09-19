# .dotfiles
#### Personal dotfiles for various apps

To use this dotfiles, please install Thoughbot's RCM from https://github.com/thoughtbot/rcm

## How to setup a new OS X for dev
### Install homebrew
`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

### Install Tmux
`brew install tmux`

### Install NeoVim
`brew install neovim/neovim/neovim`

### Install Janus
`curl -L https://bit.ly/janus-bootstrap | bash`

### Install rbenv and ruby-build
```
brew install rbenv
```

### Install a default ruby version and install `rubocop`
```
rbenv install 2.3.1
rbenv global 2.3.1
gem install rubocop
```

### Install dotfiles.
```
cd ~
git clone https://github.com/jesusabarca/.dotfiles.git
cd .dotfiles
rcup -v
```

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
- https://github.com/simnalamburt/vim-mundo

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

### Install Python and neovim package for python2 so vim-mundo can run.
```
brew install python
sudo pip2 install --upgrade neovim
```

### Install bash-git-prompt
`brew install bash-git-prompt`
