{ ... }:
{
  imports = [
    ./git.nix
    ./packages.nix
    ./shell.nix
  ];

  programs.home-manager.enable = true;
}
