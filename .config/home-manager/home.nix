{ config, pkgs, ... }:

let
  isMacos = pkgs.stdenv.isDarwin;
in {
  home = {
    username = if isMacos then "kevindurbin" else "kevindurb";
    homeDirectory = if isMacos then "/Users/kevindurbin" else "/home/kevindurb";

    stateVersion = "24.11"; # Please read the comment before changing.
    packages = with pkgs; [
      cowsay
    ];
    file = {};
    sessionVariables = {};
  };

  programs.home-manager.enable = true;
}
