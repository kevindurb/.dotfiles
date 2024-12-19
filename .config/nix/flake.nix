
{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, darwin, ... }: {
    darwinConfigurations = {
      "Kevin-LWNFHQYQ5K" = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./workmac/configuration.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.kevindurbin = import ./common/home.nix;
          }
        ];
      };
    };
    nixosConfigurations = {
      tablet = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./tablet/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.kevindurb = import ./common/home.nix;
          }
        ];
      };
    };
  };
}
