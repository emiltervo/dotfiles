{
  description = "Emil's macOS configuration with nix-darwin and Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, home-manager, ... }:
    let
      username = "emiltervo";
      hostname = "Emils-MacBook-Pro-2";
    in
    {
      darwinConfigurations.${hostname} = nix-darwin.lib.darwinSystem {
        specialArgs = {
          inherit self inputs username hostname;
        };

        modules = [
          ./hosts/Emils-MacBook-Pro-2
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "pre-home-manager-backup";
            home-manager.extraSpecialArgs = {
              inherit username hostname;
            };
            home-manager.users.${username} = import ./home/emiltervo.nix;
          }
        ];
      };
    };
}
