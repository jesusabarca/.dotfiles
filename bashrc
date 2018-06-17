alias ls='ls -GFh'
alias vim='nvim'
alias oldvim='vim'
alias jsc='/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Resources/jsc'

if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export EDITOR=nvim

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
