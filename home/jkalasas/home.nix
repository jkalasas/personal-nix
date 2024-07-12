{...}: {
  imports = [
    ./programs
  ];

  home = {
    username = "jkalasas";
    homeDirectory = "/home/jkalasas";
    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
