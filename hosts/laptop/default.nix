{pkgs, ...}: {
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
  services.gnome.gnome-remote-desktop.enable = true;
  networking.firewall.allowedTCPPorts = [3389];
  networking.firewall.allowedTCPPortRanges = [
    {
      from = 32100;
      to = 33000;
    }
  ];

  environment.systemPackages = with pkgs; [
    gnome-extension-manager
    gparted
  ];

  environment.gnome.excludePackages = with pkgs.gnome; [
    epiphany
    geary
    totem
    tali
    iagno
    hitori
    atomix
  ];

  hardware.opengl = {
    enable = true;
    driSupport = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-compute-runtime
    ];
  };

  systemd.sleep.extraConfig = ''
    AllowSuspend=yes
    AllowHibernation=yes
    AllowHybridSleep=no
    AllowSuspendThenHibernate=yes
  '';

  xdg.portal = {
    enable = true;
    configPackages = with pkgs; [
      xdg-desktop-portal-gnome
    ];
  };

  programs.weylus = {
    enable = true;
    openFirewall = true;
    users = ["jkalasas"];
  };
}
