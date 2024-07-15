{pkgs, ...}: {
  imports = [
    ./gnome
    ./nvim
    ./tmux
    ./vscode
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
      tradingview
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
