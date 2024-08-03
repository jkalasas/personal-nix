{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowAliases = false;
        allowUnfree = true;
      };
      overlays = [
        (final: prev: {
          gnome = prev.gnome.overrideScope (gnomeFinal: gnomePrev: {
            mutter = gnomePrev.mutter.overrideAttrs (old: {
              src = pkgs.fetchFromGitLab {
                domain = "gitlab.gnome.org";
                owner = "vanvugt";
                repo = "mutter";
                rev = "triple-buffering-v4-46";
                hash = "sha256-fkPjB/5DPBX06t7yj0Rb3UEuu5b9mu3aS+jhH18+lpI=";
              };
            });
          });
        })
      ];
    };
    lib = nixpkgs.lib;
  in {
    nixosConfigurations.lappy = lib.nixosSystem rec {
      inherit system;
      modules = [
        {
          nixpkgs.config = {
            permittedInsecurePackages = [
              "freeimage-unstable-2021-11-01"
            ];
          };
        }
        ./nixos/configuration.nix
        ./hosts
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.jkalasas = import ./home/jkalasas/home.nix;
        }
      ];
    };
  };
}
