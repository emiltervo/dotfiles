{
  description = "Emil's macOS + NixOS configuration with Home Manager";

  inputs = {
    # Track latest packages (including `code-cursor`) from unstable.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    # Track Home Manager from its default branch, following unstable nixpkgs.
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, home-manager, nixpkgs, ... }:
    let
      darwinUsername = "emiltervo";
      darwinHostname = "Emils-MacBook-Pro-2";

      nixosUsername = "lovelace";
      # Match the actual machine hostname so `nixos-rebuild --flake .` works.
      nixosHostname = "nixos";
    in
    {
      darwinConfigurations.${darwinHostname} = nix-darwin.lib.darwinSystem {
        specialArgs = {
          username = darwinUsername;
          hostname = darwinHostname;
          inherit self inputs;
        };

        modules = [
          ./hosts/Emils-MacBook-Pro-2
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "pre-home-manager-backup";
            home-manager.extraSpecialArgs = {
              username = darwinUsername;
              hostname = darwinHostname;
            };
            home-manager.users.${darwinUsername} = import ./home/emiltervo.nix;
          }
        ];
      };

      nixosConfigurations.${nixosHostname} = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          username = nixosUsername;
          hostname = nixosHostname;
          inherit self inputs;
        };
        modules = [
          ./hosts/rapidash
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "pre-home-manager-backup";
            home-manager.extraSpecialArgs = {
              username = nixosUsername;
              hostname = nixosHostname;
            };
            home-manager.users.${nixosUsername} = import ./home/lovelace.nix;
          }
        ];
      };
    };
}
