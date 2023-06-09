{ pkgs, ... }: {
  programs.home-manager.enable = true;
  home.packages = [
    pkgs.neovim
    pkgs.slack
  ];
}
