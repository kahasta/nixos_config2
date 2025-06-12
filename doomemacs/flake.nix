outputs = inputs @ { nixpkgs, home-manager, ... }: {
  homeConfigurations."kahasta" = home-manager.lib.homeManagerConfiguration {
    modules = [
      inputs.nix-doom-emacs-unstraightened.homeModule
      ./home.nix
    ];
    extraSpecialArgs = { inherit inputs; };
  };
};
