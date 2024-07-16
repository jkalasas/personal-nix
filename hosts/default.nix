{...}: {
  imports = [
    ./laptop
	./printing.nix
    ./virtualization.nix
  ];

  programs.dconf.enable = true;

  services.gvfs.enable = true;
  services.udisks2.enable = true;
}
