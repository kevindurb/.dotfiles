{ pkgs, ... }:

{
  home = {
    stateVersion = "24.11";
    packages = with pkgs; [
      aws-vault
      awscli
      bat
      cmatrix
      cowsay
      curl
      duf
      difftastic
      entr
      eza
      fastfetch
      figlet
      fzf
      gd
      gh
      git
      delta
      git-extras
      gitmux
      go-task
      htop
      httpie
      jq
      k9s
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
      noti
      nyancat
      ollama
      openssh
      pgcli
      prettyping
      pv
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
