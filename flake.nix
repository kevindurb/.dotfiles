{
  description = "My Dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: {
    defaultPackage.x86_64-linux = inputs.home-manager.defaultPackage.x86_64-linux;
    defaultPackage.aarch64-darwin = inputs.home-manager.defaultPackage.aarch64-darwin;

    homeConfigurations = {
      "kevindurbin" = inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = import inputs.nixpkgs { system = "aarch64-darwin"; config.allowUnfree = true; };
          modules = [
            {
              home = {
                stateVersion = "23.05";
                homeDirectory = "/Users/kevindurbin";
                username = "kevindurbin";
              };
              imports = [ ./home.nix ];
            }
          ];
      };
      "kevindurb" = inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = import inputs.nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
          modules = [
            {
              home = {
                stateVersion = "23.05";
                homeDirectory = "/home/kevindurb";
                username = "kevindurb";
              };
              imports = [ ./home.nix ];
            }
          ];
      };
    };
  };
}
