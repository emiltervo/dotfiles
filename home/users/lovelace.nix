{ ... }:
{
  imports = [
    ../common
    ../platforms/linux.nix
    ../programs/vscode.nix
  ];

  home.stateVersion = "25.11";
}
