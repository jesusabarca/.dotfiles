# export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
# export CLICOLOR=1
# export LSCOLORS=GxFxCxDxBxegedabagaced
alias ls='ls -GFh'
alias vim='nvim'
alias oldvim='vim'
alias jsc='/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Resources/jsc'

##
# Your previous /Users/jesus/.bash_profile file was backed up as /Users/jesus/.bash_profile.macports-saved_2015-04-14_at_11:58:44
##

export PATH="/opt/nginx/sbin:/opt/passenger/passenger-4.0.59/bin:$PATH"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Allows you to move "up" any number of levels. $up 2 will translate to $cd ../..
function up() {
  i=${1:-1}
  while [ $i -gt 0 ]
    do
      cd ..
      i=$(($i - 1))
    done
}

# Stores the bash history from every bash terminal open
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Starts tmux by default
if [[ ! $TERM =~ screen ]]; then
  tmux
fi

# Starts the git prompt automaticly
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Vim as default editor
export EDITOR=nvim
