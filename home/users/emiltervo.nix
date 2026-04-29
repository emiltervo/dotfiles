{ pkgs, ... }:
{
  imports = [
    ../common
    ../platforms/darwin.nix
    ../programs/vscode.nix
  ];

  home.stateVersion = "25.05";

  # macOS-only extras
  home.packages = with pkgs; [
    gh
    htop
  ];
}
