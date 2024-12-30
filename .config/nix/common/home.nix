_:

{
  home = {
    stateVersion = "24.11";
    packages = [];
    file = {};
    sessionVariables = {};
  };

  services = {
    syncthing.enable = true;
    # ollama.enable = true;
  };

  programs.home-manager.enable = true;
}
