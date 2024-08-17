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
      audacity
      discord
	  chromium
      dolphin-emu
      gimp
      inkscape
      libreoffice
	  lutris
	  motrix
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
	  xclip
	  wl-clipboard
    ];

    dev = with pkgs; [
      diesel-cli
      lazygit
	  php
      poetry
      python3
      nodejs
      sqlite
      rustup

	  nodePackages.live-server
	  phpPackages.composer
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
		  fbneo
          flycast
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
