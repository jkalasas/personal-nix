{pkgs, ...}: {
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      gutenprint
	  epson-201401w
    ];
  };
}
