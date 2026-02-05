{
  description = "NixOS Configuration for Louise (Lenovo V110)";

  inputs = {
    # Nixpkgs source - using unstable for latest Hyprland/packages, or change to "nixos-24.11" for stability
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        # Hostname: v110
        v110 = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/v110/configuration.nix
            
            # Integrate Home Manager
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs; };
              # Assume user is 'louise' or generic, will be defined in configuration.nix
              home-manager.users.louise = import ./home-manager/home.nix;
            }
          ];
        };
      };
    };
}
