{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment = {
    systemPackages = with pkgs; [
      ansible
      aws-vault
      awscli
      bat
      cargo
      claude-code
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
      krew
      kubectl
      kubectl
      kubeseal
      kustomize
      lazygit
      litecli
      lolcat
      mariadb
      minijinja
      mycli
      ncdu
      neovim
      nodejs_22
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
      sesh
      starship
      tig
      tldr
      tmux
      tree
      (yarn.override { nodejs = nodejs_22; })
      yq
      zoxide
    ];
  };

  services = {
    # syncthing.enable = true;
    # ollama.enable = true;
  };
}
