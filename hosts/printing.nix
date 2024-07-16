{pkgs, ...}: {
  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;
  };
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      gutenprint
    ];
  };
}
