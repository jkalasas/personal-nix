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
      dolphin-emu
      gimp
      inkscape
      libreoffice
      mpv
      ppsspp
      obsidian
      steam
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

    retroarch-emu = with pkgs; [
      (retroarch.override {
        cores = with libretro; [
          dolphin
          quicknes
          snes9x
          ppsspp
        ];
      })
    ];

    allPkgs = apps ++ cli ++ dev ++ fonts ++ retroarch-emu;
  in
    allPkgs;
}
