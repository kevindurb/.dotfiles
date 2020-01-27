# zshrc - zsh settings
# Author: Kevin Durbin
# vim: set fdm=marker expandtab ts=2 sw=2 ft=zsh:

# {{{ Exports
export TERM=xterm-256color
export ZSH_HOME=$HOME/dotfiles/zsh
export ZPLUG_HOME=$HOME/.zplug
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export EDITOR='nvim'
export SKIP_RESOURCES=1
export APP_NO_CHECKOUT_HOOK=1
export FZF_DEFAULT_COMMAND='rg --files'
export LESS="-SRXF"
export HISTFILE=$HOME/.zhistory
# }}}

# {{{ Plugins
source $ZPLUG_HOME/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "zsh-users/zsh-syntax-highlighting", defer:3

zplug "modules/completion",   from:prezto
zplug "modules/history",      from:prezto
zplug "plugins/autoenv",      from:oh-my-zsh
zplug "plugins/autojump",     from:oh-my-zsh
zplug "plugins/git",          from:oh-my-zsh
zplug "plugins/nvm",          from:oh-my-zsh
zplug "plugins/tmux",         from:oh-my-zsh
zplug "plugins/yarn",         from:oh-my-zsh
zplug "plugins/ansible",      from:oh-my-zsh

zplug "chrissicool/zsh-256color"

# if ! zplug check; then
#   zplug install
# fi
zplug load
# }}}

# {{{ Aliases
if [ -x "$(command -v bat)" ]; then
  alias cat="bat"
fi
if [ -x "$(command -v prettyping)" ]; then
  alias ping="prettyping"
fi
if [ -x "$(command -v ncdu)" ]; then
  alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
fi
if [ -x "$(command -v nvim)" ]; then
  alias vim="nvim"
fi

alias c="clear"
alias maketags="ctags --exclude=@.gitignore -R ."
alias weather="curl wttr.in"
alias unmerged="git diff --name-only --diff-filter=U"
alias ll="ls -lahF"
alias mysqlccb='mysql -u ccb_app -p ccb_dev -h 127.0.0.1'

if ! type pbcopy > /dev/null; then
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output'
fi
# }}}

# {{{ Config
setopt autocd
# }}}

# {{{ History Search
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
# }}}

# {{{ Add FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# }}}

eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# yarn bin needs to be added after nvm exists
export PATH="$(yarn global bin):$PATH"
