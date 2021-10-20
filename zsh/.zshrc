# zshrc - zsh settings
# Author: Kevin Durbin
# vim: set fdm=marker expandtab ts=2 sw=2 ft=zsh:

# {{{ Plugins
source $HOME/antigen.zsh

antigen use oh-my-zsh

antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle git-auto-fetch
antigen bundle ssh-agent
antigen bundle git
antigen bundle tmux
antigen bundle autojump
antigen bundle fzf
antigen bundle kubectl
antigen bundle colored-man-pages
antigen bundle chrissicool/zsh-256color

antigen apply
# }}}

# {{{ Aliases
if [ -x "$(command -v bat)" ]; then
  alias cat="bat"
fi
if [ -x "$(command -v batcat)" ]; then
  alias cat="batcat"
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

if [ -x "$(command -v exa)" ]; then
  alias ll="exa -laF"
else
  alias ll="ls -lahF"
fi

alias c="clear"
alias maketags="ctags -R ."
alias weather="curl wttr.in"
alias unmerged="git diff --name-only --diff-filter=U"
alias httpserver='python -m http.server 8080'
alias dadjoke='curl -H "Accept: text/plain" https://icanhazdadjoke.com/'
alias t='todo.sh -d ~/.config/todotxt/todo.cfg'
alias icat="kitty +kitten icat"

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

# {{{ Add Starship Prompt
eval "$(starship init zsh)"
# }}}

# Keep this here to prevent fzf from adding
# unneeded line
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# begin ccbmenu completion
. <(ccbmenu --completion)
# end ccbmenu completion
