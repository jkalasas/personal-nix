{pkgs, ...}: {
  imports = [
    ./gnome
    ./nvim
    ./tmux
    ./zsh
  ];

  home.packages = let
    apps = with pkgs; [
      discord
      gimp
      inkscape
      libreoffice
      mpv
      obsidian
      telegram-desktop
    ];

    dev = with pkgs; [
      lazygit
      poetry
      python3
      nodejs
    ];
    allPkgs = dev ++ apps;
  in
    allPkgs;
}
