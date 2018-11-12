# .dotfiles
#### Personal dotfiles for various apps

## How to setup a new OS X for dev

### Increase speed on keypress
```bash
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
```

### Install homebrew
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Install iterm2
```bash
brew cask install iterm2
```

### Install Git
```bash
brew install git
```

### Install Thoughbot's RCM from https://github.com/thoughtbot/rcm
```bash
brew tap thoughtbot/formulae
brew install rcm
```

### Clone this repo and run Rcup to install these dotfiles
```bash
cd ~
git clone https://github.com/jesusabarca/.dotfiles.git
cd .dotfiles
rcup -v
```

### Update your name and email address on:
`gitconfig`

### Install NeoVim
```bash
brew install neovim
````

### Install rbenv and ruby-build
```bash
brew install rbenv
```

### Install a default ruby version and install `rubocop`
```bash
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

### Install excuberant Ctags
`brew install ctags`

### Install diff-so-fancy
`brew install diff-so-fancy`

### Install bash-git-prompt
`brew install bash-git-prompt`

### Install vim-plug from https://github.com/junegunn/vim-plug and run inside nvim:
```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
:PlugInstall
```

### Install the ligaturized version of Meslo LGMDZ https://github.com/lemeb/a-better-ligaturizer

### Install Virtualbox (needed for AO)
`brew cask install virtualbox`

### Install vagrant (needed for AO)
`brew cask install vagrant`

### Install GPG for creating a Key to upload in Github
`brew install gpg`

### Setup GPG keys for signing commits
https://help.github.com/articles/signing-commits-with-gpg/

### Install python2 and python3 support for vim
```bash
brew install python2
pip2 install virtualenv

brew install python3
pip3 install virtualenv
```
```vim
:PythonSupportInitPython2
:PythonSupportInitPython3
```

### Install GPG tools to store the key frase for signing commits in macOS's keychain
https://gpgtools.org
