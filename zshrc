# zshrc - zsh settings
# Author: Kevin Durbin
# vim: set fdm=marker expandtab ts=2 sw=2 ft=zsh:

# {{{ Exports
export TERM=xterm-256color-italic
export ZSH_HOME=$HOME/dotfiles/zsh
export ZPLUG_HOME=$HOME/.zplug
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export EDITOR='vim'
export SKIP_RESOURCES=1
export APP_NO_CHECKOUT_HOOK=1
export FZF_DEFAULT_COMMAND='rg --files'
export LESS="-SRXF"
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
zplug "plugins/shrink-path",  from:oh-my-zsh

zplug "supercrabtree/k"
zplug "sharat87/zsh-vim-mode"
zplug "chrissicool/zsh-256color"

# zplug "mafredri/zsh-async"
# zplug "sindresorhus/pure", use:pure.zsh, as:theme

# if ! zplug check; then
#   zplug install
# fi
zplug load
# }}}

# {{{ Prompt
setopt prompt_subst
function __git_prompt {
  local DIRTY="%{$fg[yellow]%}*"
  local CLEAN="%{$fg[green]%}✔"
  local UNMERGED="%{$fg[red]%}✘"
  local RESET="%{$terminfo[sgr0]%}"
  git rev-parse --git-dir >& /dev/null
  if [[ $? == 0 ]]
  then
    echo -n " "
    if [[ `git ls-files -u >& /dev/null` == '' ]]
    then
      git diff --quiet >& /dev/null
      if [[ $? == 1 ]]
      then
        echo -n $DIRTY
      else
        git diff --cached --quiet >& /dev/null
        if [[ $? == 1 ]]
        then
          echo -n $DIRTY
        else
          echo -n $CLEAN
        fi
      fi
    else
      echo -n $UNMERGED
    fi
    echo -n $RESET
  fi
}

RPROMPT=''
PROMPT='
$(__git_prompt) $(shrink_path -f) ► '
# }}}

# {{{ Aliases
alias c="clear"
alias maketags="ctags --exclude=@.gitignore -R ."
alias weather="curl wttr.in"
alias unmerged="git diff --name-only --diff-filter=U"
alias cat="bat"
alias ping="prettyping"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias ll="ls -lahF"
alias vim="nvim"
alias tasks='grep --exclude-dir=.git -rEI "TODO|FIXME" . 2>/dev/null'
alias mysqlccb='mysql -u ccb_app -p ccb_dev -h 127.0.0.1'
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
FZF="$HOME/.fzf.zsh"

[ -f "$FZF" ] && source "$FZF"
# }}}
