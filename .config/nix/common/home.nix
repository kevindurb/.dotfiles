{ pkgs, ... }:

{
  home = {
    stateVersion = "24.11";
    packages = with pkgs; [
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
      krew
      kubectl
      kustomize
      lazygit
      litecli
      lolcat
      mariadb
      mycli
      ncdu
      neovim
      nodejs
      noti
      nyancat
      ollama
      openssh
      pgcli
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
    file = {};
    sessionVariables = {};
  };

  services = {
    syncthing.enable = true;
    # ollama.enable = true;
  };

  programs.home-manager.enable = true;
}
