# zshrc - zsh settings
# Author: Kevin Durbin
# vim: set fdm=marker expandtab ts=2 sw=2 ft=zsh:

# {{{ Exports
export TERM=xterm-256color
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
source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle git
antigen bundle autojump
antigen bundle colored-man-pages
antigen bundle chrissicool/zsh-256color
antigen bundle supercrabtree/k
antigen bundle lukechilds/zsh-nvm

antigen apply
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

# {{{ Add Starship Prompt
eval "$(starship init zsh)"
# }}}

# {{{ Node Stuff
# yarn bin needs to be added after nvm exists
export PATH="$(yarn global bin):$PATH"
# }}}
