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

  abbr --add clock tty-clock -ct
  abbr --add k kubectl
  abbr --add t todo.sh
  abbr --add c clear
  alias dadjoke='curl -H "Accept: text/plain" https://icanhazdadjoke.com/'

  if type -q kubecolor
    function kubectl
      kubecolor $argv
    end
  end

  set fish_greeting

  if test "$(uname)" = "Darwin"
    set -Ux GCM_CREDENTIAL_STORE keychain
  else
    set -Ux GCM_CREDENTIAL_STORE secretservice
  end

  fish_vi_key_bindings

  # Ensure node is always available
  nvm use node > /dev/null 2>&1

  fish_add_path ~/.local/bin
end

starship init fish | source
