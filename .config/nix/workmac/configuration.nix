_:

{
  system.stateVersion = 5;
  nix.enable = false;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.kevindurbin = {
    home = "/Users/kevindurbin";
  };
}
