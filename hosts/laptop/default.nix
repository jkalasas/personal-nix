{pkgs, ...}: {
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
  services.gnome.gnome-remote-desktop.enable = true;
  networking.firewall.allowedTCPPorts = [3389 139 445 5984];
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

  hardware.bluetooth.enable = true;
  hardware.bluetooth.settings = {
    General = {
      Experimental = true;
    };
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

  programs.gamescope.enable = true;

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  programs.weylus = {
    enable = true;
    openFirewall = true;
    users = ["jkalasas"];
  };

  services.sunshine = {
    enable = true;
    capSysAdmin = true;
    openFirewall = true;
  };
}
