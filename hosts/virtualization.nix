{...}: {
  virtualisation = {
    docker.enable = true;
	waydroid.enable = true;
  };

  users.groups.docker.members = ["jkalasas"];
}
