# zshrc - zsh settings
# Author: Kevin Durbin
# vim: set fdm=marker expandtab ts=2 sw=2 ft=zsh:

# {{{ Antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load
# }}}

# {{{ Aliases
alias dot="git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME"
compdef dot="git"

[ -x "$(command -v bat)" ] && alias cat="bat"
[ -x "$(command -v batcat)" ] && alias cat="batcat"
[ -x "$(command -v prettyping)" ] && alias ping="prettyping"
[ -x "$(command -v ncdu)" ] && alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
[ -x "$(command -v nvim)" ] && alias vim="nvim"

if [ -x "$(command -v eza)" ]; then
  alias ll="eza -laF"
else
  alias ll="ls -lahF"
fi

alias g="git"
compdef g="git"
alias c="clear"
alias weather="curl 'wttr.in?0Q'"
alias forecast="curl wttr.in"
alias dadjoke='curl -H "Accept: text/plain" https://icanhazdadjoke.com/'

if ! type pbcopy > /dev/null; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi

setopt complete_aliases
# }}}

# {{{ Config
setopt autocd
setopt completealiases
# }}}

# {{{ History
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=50000
export SAVEHIST=50000
# Immediately append to history file:
setopt INC_APPEND_HISTORY
# Record timestamp in history:
setopt EXTENDED_HISTORY
# Expire duplicate entries first when trimming history:
setopt HIST_EXPIRE_DUPS_FIRST
# Dont record an entry that was just recorded again:
setopt HIST_IGNORE_DUPS
# Delete old recorded entry if new entry is a duplicate:
setopt HIST_IGNORE_ALL_DUPS
# Do not display a line previously found:
setopt HIST_FIND_NO_DUPS
# Dont record an entry starting with a space:
setopt HIST_IGNORE_SPACE
# Dont write duplicate entries in the history file:
setopt HIST_SAVE_NO_DUPS
# Share history between all sessions:
setopt SHARE_HISTORY
# }}}

# {{{ Add Starship Prompt
eval "$(starship init zsh)"
# }}}
