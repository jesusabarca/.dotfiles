alias jsc='/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Resources/jsc'

__GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export EDITOR=nvim
export NVIM_TUI_ENABLE_TRUE_COLOR=1

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
