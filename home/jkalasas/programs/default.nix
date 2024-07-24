{pkgs, ...}: {
  imports = [
    ./direnv
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

    cli = with pkgs; [
      btop
      lzip
    ];

    dev = with pkgs; [
      diesel-cli
      lazygit
      poetry
      python3
      nodejs
      sqlite
      rustup
    ];

    fonts = with pkgs; [
      corefonts
      vistafonts
    ];

    allPkgs = apps ++ cli ++ dev ++ fonts;
  in
    allPkgs;
}
