{pkgs, ...}: 
let
	extensions = with pkgs.gnomeExtensions; [
		appindicator
		dash-to-dock
	];
in
{
  home.packages = extensions;

  dconf.settings = {
    "org/gnome/desktop/file-chooser" = {
      clock-format = "12h";
    };

    "org/gnome/desktop/interface" = {
      clock-format = "12h";
      color-scheme = "prefer-dark";
    };

    "org/gnome/desktop/wm/keybindings" = {
      switch-applications = [];
      switch-applications-backward = [];
      switch-windows = ["<Alt>Tab"];
      switch-windows-backward = ["<Shift><Alt>Tab"];
    };

    "org/gnome/mutter".dynamic-workspaces = true;

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Terminal";
      command = "kgx";
      binding = "<Control><Alt>t";
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
	  enabled-extensions = map (ext: ext.extensionUuid) extensions;
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      multi-monitor = true;
      dash-max-icon-size = 32;
    };
  };
}
