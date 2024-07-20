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
    cli = with pkgs; [
      btop
    ];

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
      diesel-cli
      lazygit
      poetry
      python3
      nodejs
      sqlite
      rustup
    ];
    allPkgs = dev ++ apps ++ cli;
  in
    allPkgs;
}
