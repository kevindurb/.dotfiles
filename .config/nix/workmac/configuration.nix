_:

{
  system.stateVersion = 5;
  services.nix-daemon.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.kevindurbin = {
    home = "/Users/kevindurbin";
  };
}
