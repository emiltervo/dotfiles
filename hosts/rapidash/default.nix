{ self, ... }:
{
  imports = [
    ./configuration.nix
    ../../modules/nixos/apps-from-mac.nix
  ];

  system.configurationRevision = self.rev or self.dirtyRev or null;
}
