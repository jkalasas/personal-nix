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
	lazygit
    libreoffice
    mpv
    obsidian
    telegram-desktop
  ];
}
