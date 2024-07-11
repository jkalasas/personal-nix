{pkgs, ...}: {
  imports = [
    ./gnome
    ./nvim
    ./tmux
    ./zsh
  ];

  home.packages = with pkgs; [
    discord
    inkscape
    libreoffice
    mpv
    obsidian
    telegram-desktop
  ];
}
