{ self, ... }:
{
  imports = [
    ./configuration.nix
    ../../systems/nixos
  ];

  system.configurationRevision = self.rev or self.dirtyRev or null;
}
