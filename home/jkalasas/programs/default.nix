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
      telegram-desktop
      tradingview
    ];

    cli = with pkgs; [
      btop
      cloudflared
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
      emulationstation
      gamemode
      (retroarch.override {
        cores = with libretro; [
          dolphin
          mupen64plus
          ppsspp
          quicknes
          snes9x
        ];
      })
    ];

    allPkgs = apps ++ cli ++ dev ++ fonts ++ retroarch-emu;
  in
    allPkgs;
}
