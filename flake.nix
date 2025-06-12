{
  description = "Моя конфигурация NixOS (deepos)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations.deepos = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";

      modules = [
        ./hosts/deepos.nix
        ./hardware-configuration.nix

        home-manager.nixosModules.home-manager

        {
          nix.settings.experimental-features = [ "nix-command" "flakes" ];

          home-manager.useUserPackages = true;
          home-manager.useGlobalPkgs = true;

          home-manager.users.kahasta = import ./home.nix;
        }
      ];
    };
  };
}
