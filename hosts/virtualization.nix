{...}: {
  virtualisation = {
    docker.enable = true;
    waydroid.enable = true;
    virtualbox.host.enable = true;
  };

  users.groups.docker.members = ["jkalasas"];
  users.extraGroups.vboxusers.members = ["jkalasas"];
}
