set -Ux PAGER less
set -Ux EDITOR nvim
set -Ux VISUAL nvim

if status is-interactive
  if type -q bat
    alias cat="bat"
  end
  if type -q batcat
    alias cat="batcat"
  end
  if type -q prettyping
    alias ping="prettyping"
  end
  if type -q ncdu
    alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
  end
  if type -q nvim
    alias vim="nvim"
  end

  if type -q eza
    alias ll="eza -laF"
  else
    alias ll="ls -lahF"
  end

  alias t="todo.sh"
  alias b="buku --suggest"
  alias c="clear"
  alias maketags="ctags -R ."
  alias weather="curl 'wttr.in?0Q'"
  alias forecast="curl wttr.in"
  alias httpserver='python -m http.server 8080'
  alias dadjoke='curl -H "Accept: text/plain" https://icanhazdadjoke.com/'
  alias wtf="clear;cal;date;echo;pwd;echo;git branch"

  function kubectl
    kubecolor $argv
  end

  set fish_greeting

  if test "$(uname)" = "Darwin"
    set -Ux GCM_CREDENTIAL_STORE keychain
  else
    set -Ux GCM_CREDENTIAL_STORE secretservice
  end
end

starship init fish | source
