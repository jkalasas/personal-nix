{...}: {
  imports = [
    ./laptop
    ./printing.nix
    ./virtualization.nix
  ];

  programs.dconf.enable = true;
  programs.adb.enable = true;
  programs.nix-ld.enable = true;

  services.flatpak.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  users.users.jkalasas.extraGroups = ["adbusers"];
}
