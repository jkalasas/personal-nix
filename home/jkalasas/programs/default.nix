{
  pkgs,
  lib,
  ...
}: {
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
      beekeeper-studio
	  bottles
      discord
      chromium
      dolphin-emu
      drawio
      gimp
      hoppscotch
      inkscape
      libreoffice
      lutris
      motrix
      mpv
	  ngrok
      postman
      ppsspp
	  obs-studio
      obsidian
      telegram-desktop
      tradingview
      webcord-vencord
    ];

    cli = with pkgs; [
      btop
      cloudflared
      lzip
      xclip
      wl-clipboard
    ];

    pythonLibs = lib.makeLibraryPath (with pkgs; [
      stdenv.cc.cc
    ]);

    python = let
      packageOverrides = self: super: {
        opencv4 = super.opencv4.override {
          enableGtk2 = true;
          gtk2 = pkgs.gtk2;
          #enableFfmpeg = true; #here is how to add ffmpeg and other compilation flags
          #ffmpeg_3 = pkgs.ffmpeg-full;
        };
      };
    in
      pkgs.python3.override {
        inherit packageOverrides;
        self = python;
      };

    patchedpython = python.overrideAttrs (
      previousAttrs: {
        # Add the nix-ld libraries to the LD_LIBRARY_PATH.
        # creating a new library path from all desired libraries
        postInstall =
          previousAttrs.postInstall
          + ''
            mv  "$out/bin/python3.11" "$out/bin/unpatched_python3.11"
            cat << EOF >> "$out/bin/python3.11"
            #!/run/current-system/sw/bin/bash
            export LD_LIBRARY_PATH="${pythonLibs}"
            exec "$out/bin/unpatched_python3.11" "\$@"
            EOF
            chmod +x "$out/bin/python3.11"
          '';
      }
    );

    dev =
      (with pkgs; [
        diesel-cli
        lazygit
        poetry
        nodejs
        sqlite
        rustup

        nodePackages.live-server
        phpPackages.composer
      ])
      ++ [
        (pkgs.php.buildEnv {
          extensions = {
            enabled,
            all,
          }:
            enabled
            ++ (with all; [
              mysqli
              pdo
            ]);
        })
      ]
      ++ [
        (patchedpython.withPackages (python-pkgs:
          with python-pkgs; [
            pillow
            opencv4
            tensorflow
            tkinter
          ]))
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
