BW_SOCKS=(
  "$HOME/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock"
  "$HOME/.bitwarden-ssh-agent.sock"
  "$HOME/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock"
  "/run/user/$(id -u)/bitwarden-ssh-agent.sock"
  "/tmp/bitwarden-ssh-agent.sock"
)

for sock in "${BW_SOCKS[@]}"; do
  if [ -S "$sock" ]; then
    export SSH_AUTH_SOCK="$sock"
    echo "Using Bitwarden SSH agent socket at: $SSH_AUTH_SOCK"
    break;
  fi
done
