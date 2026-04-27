{ self, pkgs, hostname, ... }:
{
  imports = [
    ../../modules/base.nix
    ../../modules/languages.nix
    ../../modules/packages.nix
    ../../modules/homebrew.nix
  ];

  networking.hostName = hostname;
  system.primaryUser = "emiltervo";

  system.configurationRevision = self.rev or self.dirtyRev or null;
  system.stateVersion = 6;

  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.emiltervo = {
    home = "/Users/emiltervo";
    shell = pkgs.zsh;
  };
}
