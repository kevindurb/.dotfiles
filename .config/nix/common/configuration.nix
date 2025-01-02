{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      ansible
      aws-vault
      awscli
      bat
      cargo
      cmatrix
      cowsay
      curl
      delta
      difftastic
      duf
      entr
      eza
      fastfetch
      figlet
      fzf
      gd
      gh
      git
      git-extras
      gitmux
      go-task
      htop
      httpie
      jq
      k9s
      kubectl
      kubeseal
      krew
      kubectl
      kustomize
      lazygit
      litecli
      lolcat
      mariadb
      minijinja
      mycli
      ncdu
      neovim
      nodejs
      noti
      nyancat
      ollama
      openssh
      pgcli
      podman
      prettyping
      pv
      python3
      ripgrep
      starship
      tig
      tldr
      tmux
      tree
      yq
      zoxide
    ];
  };

  services = {
    # syncthing.enable = true;
    # ollama.enable = true;
  };
}
