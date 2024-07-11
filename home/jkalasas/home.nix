{...}: {
  imports = [
    ./programs
  ];

  home = {
    username = "jkalasas";
    homeDirectory = "/home/jkalasas";
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
