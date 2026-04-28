{ ... }:
{
  imports = [
    ./vscode.nix
    ./common.nix
    ./linux.nix
  ];

  home.stateVersion = "25.11";
}
